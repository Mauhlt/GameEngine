const std = @import("std");
const Extensions = @import("Extensions.zig");
const QFI = @import("QueueFamilyIndices.zig");
const SSD = @import("SwapchainSupportDetails.zig");
const Vertex = @import("Vertex.zig");
const Window = @import("Window.zig");
const vk = @import("../../vulkan/vulkan.zig");
const MAX_FRAMES_IN_FLIGHT: usize = 2;
const Engine = @This();

// models
model: [3]Vertex,

// device
window: Window = undefined,
instance: vk.Instance = .null,
surface: vk.SurfaceKHR = .null,
physical_device: vk.PhysicalDevice = .null,
device: vk.Device = .null,
graphics_queue: vk.Queue = .null,
present_queue: vk.Queue = .null,

// swapchain
swapchain: vk.SwapchainKHR = .null,
format: vk.Format,
extent: vk.Extent2D,
n_images: u32 = 0,
images: [3]vk.Image = [_]vk.Image{.null} ** 3,
image_views: [3]vk.ImageView = [_]vk.ImageView{.null} ** 3,
render_pass: vk.RenderPass = .null,
framebuffers: [3]vk.Framebuffer = [_]vk.Framebuffer{.null} ** 3,

// pipeline
pipeline_layout: vk.PipelineLayout = .null,
pipeline: vk.Pipeline = .null,

// sync objects
image_available_semaphores: [3]vk.Semaphore = [_]vk.Semaphore{.null} ** 3,
render_finished_semaphores: [3]vk.Semaphore = [_]vk.Semaphore{.null} ** 3,
in_flight_fences: [3]vk.Fence = [_]vk.Fence{.null} ** 3,

// constants
current_frame: u32 = 0,
framebuffer_resized: bool = false,

pub fn init(
    allo: std.mem.Allocator,
    comptime name: [*:0]const u8,
    comptime title: [*:0]const u8,
    extent: vk.Extent2D,
) !Engine {
    _ = allo;
    var self: Engine = .{};

    self.model = [_]Vertex{
        .{ .pos = [2]f32{ 0, -0.5 } },
        .{ .pos = [2]f32{ 0.5, 0.5 } },
        .{ .pos = [2]f32{ -0.5, 0.5 } },
    };

    // device
    self.window = try createWindow(name, title, extent);
    self.instance = try createInstance(name);
    self.surface = try self.createSurface();
    const rdes = [_][*:0]const u8{vk.ExtensionName.swapchain};
    self.physical_device = try self.pickPhysicalDevice(&rdes);
    self.device = try self.createLogicalDevice(&rdes);
    const qfis = QFI.init(self.surface, self.physical_device) catch unreachable;
    self.graphics_queue = try self.createQueue(qfis.graphics_family.?);
    self.present_queue = try self.createQueue(qfis.present_family.?);

    // swapchain

    return self;
}

pub fn deinit(self: *Engine) void {
    vk.destroyPipeline(self.device, self.pipeline, null);
    vk.destroyPipelineLayout(self.device, self.pipeline_layout, null);

    // device
    vk.destroyDevice(self.device, null);
    vk.destroySurfaceKHR(self.instance, self.surface, null);
    vk.destroyInstance(self.instance, null);
    self.window.deinit();
}

fn createWindow(
    comptime name: [*:0]const u8,
    comptime title: [*:0]const u8,
    extent: vk.Extent2D,
) !Window {
    return try Window.init(std.mem.span(name), std.mem.span(title), extent.width, extent.height);
}

fn createInstance(name: [*:0]const u8) !vk.Instance {
    const app_info = vk.ApplicationInfo{
        .api_version = vk.makeApiVersion(0, 1, 0, 0),
        .p_application_name = name,
        .application_version = vk.makeApiVersion(0, 1, 0, 0),
        .p_engine_name = "EurekaEngine",
        .engine_version = vk.makeApiVersion(0, 1, 0, 0),
    };

    const ries = switch (@import("builtin").os.tag) {
        .windows => [_][*:0]const u8{
            vk.ExtensionName.surface,
            vk.ExtensionName.win32_surface,
        },
        .macos => [_][*:0]const u8{},
        .linux => [_][*:0]const u8{},
        else => unreachable,
    };

    const exts = try Extensions.getInstanceExtensions();
    // exts.print();
    if (!exts.hasRequiredExtensions(&ries)) //
        return error.FoundNoSuitableVulkanInstance;

    const create_info = vk.InstanceCreateInfo{
        .p_application_info = &app_info,
        .flags = switch (@import("builtin").os.tag) {
            .macos => .init(.enumerate_portability_bit_khr),
            else => .initEmpty(),
        },
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
        .enabled_extension_count = @truncate(ries.len),
        .pp_enabled_extension_names = &ries,
    };

    var instance: vk.Instance = .null;
    return switch (vk.createInstance(&create_info, null, &instance)) {
        .success => instance,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateInstance;
        },
    };
}

fn createSurface(self: *const Engine) !vk.SurfaceKHR {
    const create_info = vk.Win32SurfaceCreateInfoKHR{
        .hinstance = self.window.instance,
        .hwnd = self.window.hwnd,
    };

    var surface: vk.SurfaceKHR = .null;
    return switch (vk.createWin32SurfaceKHR(self.instance, &create_info, null, &surface)) {
        .success => surface,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateSurface;
        },
    };
}

fn pickPhysicalDevice(
    self: *const Engine,
    rdes: []const [*:0]const u8,
) !vk.PhysicalDevice {
    var n_devices: u32 = 0;
    try switch (vk.enumeratePhysicalDevices(self.instance, &n_devices, null)) {
        .success => if (n_devices == 0) error.FoundNoDeviceSupportingVulkan else {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToEnumeratePhysicalDevices;
        },
    };
    var devices: [255]vk.PhysicalDevice = undefined;
    try switch (vk.enumeratePhysicalDevices(self.instance, &n_devices, &devices)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToEnumeratePhysicalDevices;
        },
    };

    for (0..n_devices) |i| {
        const candidate = devices[i];
        if (isDeviceSuitable(self.surface, candidate, rdes)) //
            return candidate;
    }

    return error.FailedToFindSuitableGPU;
}

fn isDeviceSuitable(
    surface: vk.SurfaceKHR,
    device: vk.PhysicalDevice,
    rdes: []const [*:0]const u8,
) bool {
    const exts = Extensions.getDeviceExtensions(device) catch return false;
    if (!exts.hasRequiredExtensions(rdes)) return false;
    const qfis = QFI.init(surface, device) catch return false;
    const ssd = SSD.init(surface, device) catch return false;
    return qfis.isComplete() and ssd.hasItems();
}

fn checkDeviceExtensionSupport() bool {
    return true;
}

fn createLogicalDevice(
    self: *const Engine,
    rdes: []const [*:0]const u8,
) !vk.Device {
    const qfi = try QFI.init(self.surface, self.physical_device);

    const queue_priorities = [_]f32{1};
    const qcis = [_]vk.DeviceQueueCreateInfo{
        .{
            .queue_family_index = qfi.graphics_family.?,
            .p_queue_priorities = &queue_priorities,
            .queue_count = 1,
        },
        .{
            .queue_family_index = qfi.present_family.?,
            .p_queue_priorities = &queue_priorities,
            .queue_count = 1,
        },
    };

    const feats: vk.PhysicalDeviceFeatures = .{};
    const create_info = vk.DeviceCreateInfo{
        .queue_create_info_count = if (qfi.isSameFamily()) 1 else @truncate(qcis.len),
        .p_queue_create_infos = &qcis,
        .p_enabled_features = &feats,
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
        .enabled_extension_count = @truncate(rdes.len),
        .pp_enabled_extension_names = rdes.ptr,
    };

    var device: vk.Device = .null;
    return switch (vk.createDevice(self.physical_device, &create_info, null, &device)) {
        .success => device,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateLogicalDevice;
        },
    };
}

fn createQueue(self: *const Engine, queue_family_index: u32) !vk.Queue {
    var queue: vk.Queue = .null;
    vk.getDeviceQueue(self.device, queue_family_index, 0, &queue);
    return queue;
}

fn createPipelineLayout(self: *const Engine) !vk.PipelineLayout {
    const create_info = vk.PipelineLayoutCreateInfoKHR{
        .set_layout_count = 0,
        .p_set_layouts = null,
        .push_constant_range_count = 0,
        .push_constant_ranges = null,
    };

    var pipeline_layout: vk.PipelineLayout = .null;
    return switch (vk.createPipelineLayout(self.device, &create_info, null, &pipeline_layout)) {
        .success => pipeline_layout,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreatePipelineLayout;
        },
    };
}

fn createShaderModule(self: *const Engine, code: []const u8) !vk.ShaderModule {
    const create_info = vk.ShaderModuleCreateInfo{
        .code_size = @truncate(code.len),
        .p_code = @ptrCast(@alignCast(code)),
    };

    var shader_module: vk.ShaderModule = .null;
    return switch (vk.createShaderModule(self.device, &create_info, null, &shader_module)) {
        .success => shader_module,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateShaderModule;
        },
    };
}

fn createPipeline(self: *const Engine) !vk.Pipeline {
    const create_info = vk.PipelineCreateInfoKHR{
        .input_assembly = 
};

    var pipeline: vk.Pipeline = .null;
    return switch (vk.createGraphicsPipelines(self.device, .null, 1, &create_info, null, &pipeline)) {
        .success => pipeline,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreatePipeline;
        },
    };
}

fn allocCommandBuffers(self: *Engine) !void {
    const alloc_info = vk.CommandBufferAllocateInfo{
        .command_buffer_count = self.n_images,
        .command_pool = self.command_pool,
        .level = .primary,
    };

    try switch (vk.allocateCommandBuffers(self.device, &alloc_info, &self.command_buffers)) {
        .success => {},
        else => error.FailedToAllocateCommandBuffers,
    };
}

fn beginCommandBuffer(self: *const Engine, i: usize) !void {
    const cb_begin_info = vk.CommandBufferBeginInfo{};

    try switch (vk.beginCommandBuffer(self.command_buffers[i], &cb_begin_info)) {
        .success => {},
        else => error.FailedToBeginCommandBuffer,
    };
}

fn beginRenderPass(self: *const Engine, i: usize) !void {
    const clear_values = [_]vk.ClearValue{
        .{
            .color = [_]f32{0.1} ** 4,
        },
        .{
            .depth_stencil = [_]f32{ 1, 0 },
        },
    };
    const rp_begin_info = vk.RenderPassBeginInfo{
        .render_pass = self.render_pass,
        .framebuffer = self.framebuffers[i],
        .render_area = .{
            .offset = .{ .x = 0, .y = 0 },
            .extent = self.extent,
        },
        .clear_value_count = @truncate(clear_values.len),
        .p_clear_values = &clear_values,
    };
    try switch (vk.cmdBeginRenderPass(self.command_buffers[i], &rp_begin_info, .@"inline")) {
        .success => {},
        else => error.FailedToBeginRenderPass,
    };
}

fn endRenderPass(self: *Engine, i: usize) !void {
    try switch (vk.cmdEndRenderPass(self.command_buffers[i])) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToEndRenderPass;
        },
    };
}

fn endCommandBuffer(self: *Engine, i: usize) !void {
    try switch (vk.endCommandBuffer(self.command_buffers[i])) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToEndCommandBuffer;
        },
    };
}
