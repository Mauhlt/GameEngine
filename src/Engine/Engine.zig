// TODO:
// Switch window handler based on os
// embed shader files
// use window handle as interface to windows
const std = @import("std");
const print = std.debug.print;
const Allocator = std.mem.Allocator;
// window
const win = @import("..\\windows\\windows.zig");
const WindowHandle = @import("WindowHandle.zig");
const WindowSize = @import("WindowSize.zig");
// vulkan
const vk = @import("..\\vulkan\\vulkan.zig");
// custom data structs
const Vertices = @import("Vertices.zig");
const Instance = @import("Instance.zig");
const Surface = @import("Surface.zig");
const PhysicalDevice = @import("PhysicalDevice.zig");
const Device = @import("Device.zig");
const Swapchain = @import("Swapchain.zig");
const RenderPass = @import("RenderPass.zig");
const Pipeline = @import("GraphicsPipeline.zig");
const CommandPool = @import("CommandPool.zig");
const VertexBuffer = @import("VertexBuffer.zig");
const SyncObjects = @import("SyncObjects.zig");
// Extensions
const MAX_FRAMES_IN_FLIGHT: u32 = 2;
// Vertices
const triangle_vertices = [_]Vertices{
    .{ .pos = [_]f32{ 0.0, -0.5 }, .color = [_]f32{ 1.0, 0.0, 0.0 } },
    .{ .pos = [_]f32{ 0.5, 0.5 }, .color = [_]f32{ 0.0, 1.0, 0.0 } },
    .{ .pos = [_]f32{ -0.5, 0.5 }, .color = [_]f32{ 0.0, 0.0, 1.0 } },
};
const Engine = @This();
// Fields
window: WindowHandle = undefined,
instance: vk.Instance = .null,
surface: vk.SurfaceKHR = .null,
physical_device: vk.PhysicalDevice = .null,
device: Device = .{},
swapchain: Swapchain = .{},
render_pass: vk.RenderPass = .null,
pipeline: Pipeline = .{},
command_pool: CommandPool = .{},
vertex_buffer: VertexBuffer = .{},
sync_objects: SyncObjects = .{},
// flags
current_frame: u32 = 0,
was_framebuffer_resized: bool = false,

pub fn init(allo: Allocator) !Engine {
    var self: Engine = .{};
    self.window = try WindowHandle.init(
        "ZigWindowClass",
        "Zig Unicode Window",
        800,
        600,
    );
    self.instance = try Instance.init();
    self.surface = try Surface.init(&self.window, self.instance);
    self.physical_device = try PhysicalDevice.init(
        self.instance,
        self.surface,
    );
    self.device = try Device.init(self.surface, self.physical_device);
    self.swapchain = try Swapchain.init1(
        self.surface,
        self.physical_device,
        self.device.handle,
    );
    self.render_pass = try RenderPass.init(self.device.handle, self.swapchain.format);
    try self.swapchain.createSwapchainFramebuffers(
        self.device.handle,
        self.render_pass,
    );
    self.pipeline = try Pipeline.init(allo, self.device.handle, self.render_pass);
    self.command_pool = try CommandPool.init(
        self.surface,
        self.physical_device,
        self.device.handle,
    );
    self.vertex_buffer = try VertexBuffer.init(
        self.physical_device,
        self.device.handle,
        &triangle_vertices,
    );
    self.sync_objects = try SyncObjects.init(self.device.handle);
    return self;
}

pub fn deinit(self: *Engine) void {
    self.sync_objects.deinit(self.device.handle);
    self.vertex_buffer.deinit(self.device.handle);
    self.command_pool.deinit(self.device.handle);
    self.pipeline.deinit(self.device.handle);
    RenderPass.deinit(self.device.handle, self.render_pass);
    self.swapchain.deinit(self.device.handle);
    self.device.deinit();
    Surface.deinit(self.surface, self.instance);
    Instance.deinit(self.instance);
    self.window.deinit();
}

fn recordCommandBuffer(
    self: *Engine,
    command_buffer: vk.CommandBuffer,
    image_index: u32,
) !void {
    // begin command buffer
    const cb_begin_info = vk.CommandBufferBeginInfo{};
    switch (vk.beginCommandBuffer(command_buffer, &cb_begin_info)) {
        .success => {},
        else => return error.FailedToRecordCommandBuffer,
    }
    // render pass
    const clear_color: vk.ClearValue = .{ .color = .{
        .float32 = [4]f32{ 0, 0, 0, 1 },
    } };
    const rp_begin_info = vk.RenderPassBeginInfo{
        .render_pass = self.render_pass,
        .framebuffer = self.framebuffers[image_index],
        .render_area = .{
            .offset = .{ .x = 0, .y = 0 },
            .extent = self.extent,
        },
        .clear_value_count = 1,
        .p_clear_values = &clear_color,
    };
    vk.cmdBeginRenderPass(command_buffer, &rp_begin_info, .@"inline");
    {
        // bind
        vk.cmdBindPipeline(command_buffer, .graphics, self.pipeline);
        // fixed functions
        const viewport = vk.Viewport{
            .x = 0,
            .y = 0,
            .width = @floatFromInt(self.extent.width),
            .height = @floatFromInt(self.extent.height),
            .min_depth = 0,
            .max_depth = 1,
        };
        vk.cmdSetViewport(command_buffer, 0, 1, &viewport);

        const scissor = vk.Rect2D{
            .offset = .{ .x = 0, .y = 0 },
            .extent = self.extent,
        };
        vk.cmdSetScissor(command_buffer, 0, 1, &scissor);
        // draw
        vk.cmdDraw(command_buffer, 3, 1, 0, 0);
    }
    // cleanup
    vk.cmdEndRenderPass(command_buffer);
    switch (vk.endCommandBuffer(command_buffer)) {
        .success => {},
        else => return error.FailedToRecordCommandBuffer,
    }
}

fn drawFrame(self: *Engine) !void {
    // handle fences
    switch (vk.waitForFences(
        self.logical_device,
        1,
        &self.in_flight_fences[self.current_frame],
        .true,
        std.math.maxInt(u64),
    )) {
        .success => {},
        else => return error.FailedToWaitForFences,
    }
    var image_index: u32 = 0;
    switch (vk.acquireNextImageKHR(
        self.logical_device,
        self.swapchain,
        std.math.maxInt(u64),
        self.image_available_semaphores[self.current_frame],
        .null,
        &image_index,
    )) {
        .success => {},
        .error_out_of_date_khr => {
            try self.initSwapchain();
            return;
        },
        else => return error.FailedToAcquireNextImage,
    }
    switch (vk.resetFences(
        self.logical_device,
        1,
        &self.in_flight_fences[self.current_frame],
    )) {
        .success => {},
        else => return error.FailedToResetFences,
    }
    //
    switch (vk.resetCommandBuffer(
        self.command_buffers[self.current_frame],
        .initEmpty(),
    )) {
        .success => {},
        else => return error.FailedToResetCommandBuffer,
    }
    try self.recordCommandBuffer(
        self.command_buffers[self.current_frame],
        image_index,
    );
    // submit command buffer
    const wait_semaphores = [_]vk.Semaphore{
        self.image_available_semaphores[self.current_frame],
    };
    const wait_stages = [_]vk.PipelineStageFlags{
        .init(.color_attachment_output_bit),
    };
    const signal_semaphores = [_]vk.Semaphore{
        self.render_finished_semaphores[self.current_frame],
    };
    const submit_info = vk.SubmitInfo{
        .wait_semaphore_count = @truncate(wait_stages.len),
        .p_wait_semaphores = &wait_semaphores,
        .p_wait_dst_stage_mask = &wait_stages,
        .command_buffer_count = 1,
        .p_command_buffers = &self.command_buffers[self.current_frame],
        .signal_semaphore_count = @truncate(signal_semaphores.len),
        .p_signal_semaphores = &signal_semaphores,
    };
    switch (vk.queueSubmit(
        self.graphics_queue,
        1,
        &submit_info,
        self.in_flight_fences[self.current_frame],
    )) {
        .success => {},
        else => return error.FailedToSubmitDrawCommandBuffer,
    }
    // present info
    var swapchains = [_]vk.SwapchainKHR{self.swapchain};
    const present_info = vk.PresentInfoKHR{
        .wait_semaphore_count = @truncate(signal_semaphores.len),
        .p_wait_semaphores = &signal_semaphores,
        .swapchain_count = @truncate(swapchains.len),
        .p_swapchains = &swapchains,
        .p_image_indices = &image_index,
        // .p_results = null,
    };
    switch (vk.queuePresentKHR(self.present_queue, &present_info)) {
        .success => {},
        .error_out_of_date_khr, .suboptimal_khr => {
            try self.initSwapchain();
        },
        else => return error.FailedToPresentQueue,
    }
    if (self.is_framebuffer_resized) {
        try self.initSwapchain();
    }
    // update current frame
    self.current_frame = @mod(self.current_frame + 1, MAX_FRAMES_IN_FLIGHT);
}

pub fn run(self: *Engine) !void {
    self.window.show();
    // var i: usize = 0;
    // for (0..10_000_000_000) |_| {
    //     i += 1;
    // }

    //
    // switch (vk.deviceWaitIdle(self.logical_device)) {
    //     .success => {},
    //     else => return error.FailedToIdleDevice,
    // }

    // while (!glfwWindowShouldClose(window)) {
    //     glfwPollEvents();
    //     self.drawFrame();
    // }
}
