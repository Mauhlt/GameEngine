const std = @import("std");
const Extensions = @import("Extensions.zig");
const QFI = @import("QueueFamilyIndices.zig");
const SSD = @import("SwapchainSupportDetails.zig");
const Window = @import("Window.zig");
const vk = @import("../../vulkan/vulkan.zig");
const MAX_FRAMES_IN_FLIGHT: usize = 2;
const Engine = @This();

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
swapchain_extent: vk.Extent2D = .{ .width = 800, .height = 600 },
swapchain_format: vk.Format = .r8g8b8_srgb,
n_images: u32 = 0, // prob 2 or 3
swapchain_images: [3]vk.Image = [_]vk.Image{.null} ** 3,
swapchain_image_views: [3]vk.ImageView = [_]vk.ImageView{.null} ** 3,
render_pass: vk.RenderPass = .null,
swapchain_framebuffers: [3]vk.Framebuffer = [_]vk.Framebuffer{.null} ** 3,
// depth
depth_images: [3]vk.Image = [_]vk.Image{.null} ** 3,
depth_image_memories: [3]vk.DeviceMemory = [_]vk.DeviceMemory{.null} ** 3,
depth_image_views: [3]vk.ImageView = [_]vk.ImageView{.null} ** 3,
// commands
command_pool: vk.CommandPool = .null,
command_buffers: [3]vk.CommandBuffer = [_]vk.CommandBuffer{.null} ** 3,
// vertex buffers
vertex_buffers: [3]vk.Buffer = [_]vk.Buffer{.null} ** 3,
vertex_buffer_memories: [3]vk.DeviceMemory = [_]vk.DeviceMemory{.null} ** 3,
// index buffers
index_buffers: [3]vk.Buffer = [_]vk.Buffer{.null} ** 3,
index_buffer_memories: [3]vk.Buffer = [_]vk.Buffer{.null} ** 3,
// uniform buffers
uniform_buffers: [3]vk.Buffer = [_]vk.Buffer{.null} ** 3,
uniform_buffer_memories: [3]vk.DeviceMemory = [_]vk.DeviceMemory{.null} ** 3,
uniform_buffer_maps: [3]?*anyopaque = [_]?*anyopaque{null} ** 3,
// pipeline
descriptor_set_layout: vk.DescriptorSetLayout = .null,
pipeline_layout: vk.PipelineLayout = .null,
pipeline: vk.Pipeline = .null,
// sync objects
image_available_semaphores: [MAX_FRAMES_IN_FLIGHT]vk.Semaphore = [_]vk.Semaphore{.null} ** MAX_FRAMES_IN_FLIGHT,
render_finished_semaphores: [MAX_FRAMES_IN_FLIGHT]vk.Semaphore = [_]vk.Semaphore{.null} ** MAX_FRAMES_IN_FLIGHT,
in_flight_fences: [MAX_FRAMES_IN_FLIGHT]vk.Fence = [_]vk.Fence{.null} ** MAX_FRAMES_IN_FLIGHT,
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
    self.swapchain = try self.createSwapchain();
    const ssd = try SSD.init(self.surface, self.physical_device);
    self.swapchain_extent = ssd.chooseExtent(&self.window);
    self.swapchain_format = ssd.chooseSurfaceFormat().format;
    try self.createSwapchainImages();
    self.render_pass = try self.createRenderPass();
    for (0..self.n_images) |i| {
        self.swapchain_image_views[i] = try self.createSwapchainImageView(self.swapchain_images[i], self.swapchain_format);
        self.swapchain_framebuffers[i] = try self.createSwapchainFramebuffer(self.swapchain_image_views[i]);
    }

    // pipeline
    self.descriptor_set_layout = try self.createDecriptorSetLayout();
    self.pipeline_layout = try self.createPipelineLayout();
    self.pipeline = try self.createPipeline(allo);
    //
    // // commands
    // self.command_pool = try self.createCommandPool();
    // for (0..2) |i| {
    //     // vertex
    //     self.vertex_buffers[i] = try self.createVertexBuffers(i);
    //     self.vertex_buffer_memories[i] = try self.createVertexBufferMemory(i);
    //     // index
    //     self.index_buffers[i] = try self.createIndexBuffers(i);
    //     self.index_buffer_memories[i] = try self.createIndexBufferMemory(i);
    // }
    // // try self.allocCommandBuffers();
    //
    // // sync objects
    // for (0..2) |i| {
    //     self.image_available_semaphores[i] = try self.createSemaphore();
    //     self.render_finished_semaphores[i] = try self.createSemaphore();
    //     self.in_flight_fences[i] = try self.createFence();
    // }

    return self;
}

pub fn deinit(self: *Engine) void {
    // // sync objects
    // for (0..2) |i| {
    //     vk.destroySemaphore(self.device, self.image_available_semaphores[i], null);
    //     vk.destroySemaphore(self.device, self.render_finished_semaphores[i], null);
    //     vk.destroyFence(self.device, self.in_flight_fences[i], null);
    // }
    //
    // for (0..2) |i| {
    //     // index buffer
    //     vk.freeMemory(self.device, self.index_buffer_memories[i], null);
    //     vk.destroyBuffer(self.device, self.index_buffers[i], null);
    //     // vertex buffer
    //     vk.freeMemory(self.device, self.vertex_buffer_memories[i], null);
    //     vk.destroyBuffer(self.device, self.vertex_buffers[i], null);
    // }
    // // command
    // vk.destroyCommandPool(self.device, self.command_pool, null);
    //
    // // pipeline
    // vk.destroyPipeline(self.device, self.pipeline, null);
    // vk.destroyPipelineLayout(self.device, self.pipeline_layout, null);

    // swapchain
    self.destroySwapchain();

    // device
    vk.destroyDevice(self.device, null);
    vk.destroySurfaceKHR(self.instance, self.surface, null);
    vk.destroyInstance(self.instance, null);
    self.window.deinit();
}

pub fn run(self: *const Engine) !void {
    while (self.window.poll()) {
        self.drawFrame();
    }

    try switch (vk.deviceWaitIdle(self.device)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToIdleDevice;
        },
    };
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

fn createSwapchain(self: *const Engine) !vk.SwapchainKHR {
    const ssd = SSD.init(self.surface, self.physical_device) catch unreachable;
    const extent = ssd.chooseExtent(&self.window);
    const surface_format = ssd.chooseSurfaceFormat();
    const present_mode = ssd.choosePresentMode();

    var n_images = ssd.capabilities.min_image_count + 1;
    if (ssd.capabilities.max_image_count > 0 and n_images > ssd.capabilities.max_image_count) {
        n_images = ssd.capabilities.max_image_count;
    }

    const qfi = QFI.init(self.surface, self.physical_device) catch unreachable;
    const indices = [_]u32{ qfi.graphics_family.?, qfi.present_family.? };

    const create_info = vk.SwapchainCreateInfoKHR{
        .surface = self.surface,

        .min_image_count = n_images,
        .image_format = surface_format.format,
        .image_color_space = surface_format.color_space,
        .image_extent = extent,
        .image_array_layers = 1,
        .image_usage = .init(.color_attachment_bit),

        .image_sharing_mode = if (qfi.isSameFamily()) .exclusive else .concurrent,
        .queue_family_index_count = if (qfi.isSameFamily()) 1 else 2,
        .p_queue_family_indices = &indices,

        .pre_transform = ssd.capabilities.current_transform,
        .composite_alpha = .opaque_bit,
        .present_mode = present_mode,
        .clipped = .true,

        .old_swapchain = .null,
    };

    var swapchain: vk.SwapchainKHR = .null;
    return switch (vk.createSwapchainKHR(self.device, &create_info, null, &swapchain)) {
        .success => swapchain,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateSwapchain;
        },
    };
}

fn createSwapchainImages(self: *Engine) !void {
    try switch (vk.getSwapchainImagesKHR(self.device, self.swapchain, &self.n_images, null)) {
        .success => {},
        else => error.FailedToGetImages,
    };

    try switch (vk.getSwapchainImagesKHR(self.device, self.swapchain, &self.n_images, &self.swapchain_images)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateSwapchainImages;
        },
    };
}

fn createSwapchainImageView(
    self: *const Engine,
    image: vk.Image,
    format: vk.Format,
) !vk.ImageView {
    const create_info = vk.ImageViewCreateInfo{
        .image = image,
        .view_type = .@"2d",
        .format = format,
        .components = .{
            .r = .identity,
            .g = .identity,
            .b = .identity,
            .a = .identity,
        },
        .subresource_range = .{
            .aspect_mask = .init(.color_bit),
            .base_mip_level = 0,
            .level_count = 1,
            .base_array_layer = 0,
            .layer_count = 1,
        },
    };

    var view: vk.ImageView = .null;
    return switch (vk.createImageView(self.device, &create_info, null, &view)) {
        .success => view,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateImageView;
        },
    };
}

fn createRenderPass(self: *const Engine) !vk.RenderPass {
    const color_attachment = vk.AttachmentDescription{
        .format = self.swapchain_format,
        .samples = .@"1_bit",
        .load_op = .clear,
        .store_op = .store,
        .stencil_load_op = .dont_care,
        .stencil_store_op = .dont_care,
        .initial_layout = .undefined,
        .final_layout = .present_src_khr,
    };

    const color_attachment_ref = [_]vk.AttachmentReference{
        .{
            .attachment = 0,
            .layout = .color_attachment_optimal,
        },
    };

    const subpass = vk.SubpassDescription{
        .pipeline_bind_point = .graphics,
        .color_attachment_count = @truncate(color_attachment_ref.len),
        .p_color_attachments = &color_attachment_ref,
    };

    const dependency = vk.SubpassDependency{
        .src_subpass = vk.SubpassExternal,
        .dst_subpass = 0,
        .src_stage_mask = .init(.color_attachment_output_bit),
        .src_access_mask = .initEmpty(),
        .dst_stage_mask = .init(.color_attachment_output_bit),
        .dst_access_mask = .init(.color_attachment_write_bit),
    };

    const create_info = vk.RenderPassCreateInfo{
        .attachment_count = 1,
        .p_attachments = &color_attachment,
        .subpass_count = 1,
        .p_subpasses = &subpass,
        .dependency_count = 1,
        .p_dependencies = &dependency,
    };

    var render_pass: vk.RenderPass = .null;
    return switch (vk.createRenderPass(self.device, &create_info, null, &render_pass)) {
        .success => render_pass,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateRenderPass;
        },
    };
}

fn createSwapchainFramebuffer(self: *const Engine, image_view: vk.ImageView) !vk.Framebuffer {
    const attachments = [_]vk.ImageView{image_view};
    const create_info = vk.FramebufferCreateInfo{
        .render_pass = self.render_pass,
        .attachment_count = @truncate(attachments.len),
        .p_attachments = &attachments,
        .width = self.swapchain_extent.width,
        .height = self.swapchain_extent.height,
        .layers = 1,
    };

    var framebuffer: vk.Framebuffer = .null;
    return switch (vk.createFramebuffer(self.device, &create_info, null, &framebuffer)) {
        .success => framebuffer,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateFramebuffer;
        },
    };
}

fn destroySwapchain(self: *Engine) void {
    for (0..self.n_images) |i| {
        vk.destroyFramebuffer(self.device, self.swapchain_framebuffers[i], null);
        vk.destroyImageView(self.device, self.swapchain_image_views[i], null);
    }
    vk.destroyRenderPass(self.device, self.render_pass, null);
    vk.destroySwapchainKHR(self.device, self.swapchain, null);
}

fn recreateSwapchain(self: *Engine) void {
    // get new size
    // wait for events
    // idle device
    destroySwapchain();

    self.swapchain = try self.createSwapchain();
    const ssd = try SSD.init(self.surface, self.physical_device);
    self.swapchain_extent = ssd.chooseExtent();
    self.swapchain_format = ssd.chooseSurfaceFormat().format;
    try self.createSwapchainImages();
    for (0..self.n_images) |i| {
        self.image_views[i] = try self.createSwapchainImageView(self.images[i], self.swapchain_format);
        self.framebuffers[i] = try self.createSwapchainFramebuffer(self.swapchain_image_views[i]);
    }
}

fn createDecriptorSetLayout(self: *const Engine) !vk.DescriptorSetLayout {
    const ubo_layout_binding = [_]vk.DescriptorSetLayoutBinding{
        .{
            .binding = 0,
            .descriptor_count = 1,
            .descriptor_type = .uniform_buffer,
            .p_immutable_samplers = null,
            .stage_flags = .init(.vertex_bit),
        },
    };

    const create_info = vk.DescriptorSetLayoutCreateInfo{
        .binding_count = @truncate(ubo_layout_binding.len),
        .p_bindings = &ubo_layout_binding,
    };

    var descriptor_set_layout: vk.DescriptorSetLayout = .null;
    return switch (vk.createDescriptorSetLayout(self.device, &create_info, null, &descriptor_set_layout)) {
        .success => descriptor_set_layout,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateDescriptorSetLayout;
        },
    };
}

fn createPipelineLayout(self: *const Engine) !vk.PipelineLayout {
    const create_info = vk.PipelineLayoutCreateInfo{
        .push_constant_range_count = 0,
        .p_push_constant_ranges = null,
        .set_layout_count = 1,
        .p_set_layouts = &self.descriptor_set_layout,
    };

    var layout: vk.PipelineLayout = .null;
    return switch (vk.createPipelineLayout(self.device, &create_info, null, &layout)) {
        .success => layout,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreatePipelineLayout;
        },
    };
}

fn createDescriptorPool(self: *const Engine) !vk.DescriptorPool {
    const pool_sizes = [_]vk.DescriptorPoolSize{
        .{
            .type = .uniform_buffer,
            .descriptor_count = 2, // max frames in flight
        },
    };

    const create_info = vk.DescriptorPoolCreateInfo{
        .pool_size_count = @truncate(pool_sizes.len),
        .p_pool_sizes = &pool_sizes,
        .max_sets = 2,
    };

    var descriptor_pool: vk.DescriptorPool = .null;
    return switch (vk.createDescriptorPool(self.device, &create_info, null, &descriptor_pool)) {
        .success => descriptor_pool,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateDescriptorPool;
        },
    };
}

fn createBuffer(self: *const Engine) !vk.Buffer {
    const create_info = vk.BufferCreateInfo{
        .queue_family_index_count = 1,
        .p_queue_family_indices = &self.graphics_queue,
    };

    var buffer: vk.Buffer = .null;
    return switch (vk.createBuffer(self.device, &create_info, null, &buffer)) {
        .success => buffer,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateBuffer;
        },
    };
}

fn createBufferMemory(self: *const Engine, size: u64, props: vk.MemoryPropertyFlags) vk.DeviceMemory {
    const alloc_info = vk.MemoryAllocateInfo{
        .allocation_size = size,
        .memory_type_index = props,
    };

    var memory: vk.DeviceMemory = .null;
    return switch (vk.allocateMemory(self.device, &alloc_info, null, &memory)) {
        .success => memory,
        else => |tag| blk: {
            std.debug.print("Error {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateBufferMemory;
        },
    };
}

fn bindBufferMemory(self: *const Engine, buffer: vk.Buffer, memory: vk.DeviceMemory) !void {
    try switch (vk.bindBufferMemory(self.device, buffer, memory, 0)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToBindBufferMemory;
        },
    };
}

fn readFile(allo: std.mem.Allocator, name: []const u8) ![]const u8 {
    var exe_path_buf: [1024]u8 = undefined;
    var exe_path = std.fs.selfExePath(&exe_path_buf) catch unreachable;
    const idx = std.mem.indexOf(u8, exe_path, ".zig-cache").?;
    const basepath = exe_path[0..idx];
    const path = std.fs.path.join(allo, &.{
        basepath,
        "src",
        "Engine",
        "Engine1",
        "Shaders",
        name,
    }) catch unreachable;
    defer allo.free(path);

    // code decoupled from concurrency model
    // intrusive interfaces:
    // IntrusiveInterface - struct containing vtable
    // ConcreteType - has field of IntrusiveInterface + fns inside vtable
    // To get fields of concrete type, use @fieldParentPtr
    // fns inside concrete type have first args which are the intrusive interface

    var buf: [1024]u8 = undefined;
    var file = try std.fs.openFileAbsolute(path, .{ .mode = .read_only });
    var reader: std.fs.File.Reader = file.reader(&buf);
    // const ioreader =  &reader.interface;
    const stat = try reader.file.stat();
    var data = try allo.alloc(u8, stat.size);
    _ = try reader.read(&data);
    return data;
}

fn createShaderModule(self: *const Engine, code: []const u8) !vk.ShaderModule {
    const create_info = vk.ShaderModuleCreateInfo{
        .code_size = @truncate(code.len),
        .p_code = @ptrCast(@alignCast(code.ptr)),
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

fn createPipeline(self: *const Engine, allo: std.mem.Allocator) !vk.Pipeline {
    const vert_code = try readFile(allo, "tri.vert.spv");
    defer allo.free(vert_code);
    const frag_code = try readFile(allo, "tri.frag.spv");
    defer allo.free(frag_code);

    const vert_sm = try createShaderModule(vert_code);
    defer vk.destroyShaderModule(self.device, vert_sm, null);
    const frag_sm = try createShaderModule(frag_code);
    defer vk.destroyShaderModule(self.device, frag_sm, null);

    const stages = [_]vk.PipelineShaderStageCreateInfo{
        .{
            .stage = .vertex_bit,
            .module = vert_sm,
            .p_name = "main",
        },
        .{
            .stage = .fragment_bit,
            .module = frag_sm,
            .p_name = "main",
        },
    };

    var bind_descs: [1]vk.VertexInputBindingDescription = undefined;
    var attr_descs: [2]vk.VertexInputAttributeDescription = undefined;
    const vertex_input_state = vk.PipelineVertexInputStateCreateInfo{
        .vertex_binding_description_count = @truncate(bind_descs.len),
        .p_vertex_binding_descriptions = &bind_descs,
        .vertex_attribute_description_count = @truncate(attr_descs.len),
        .p_vertex_attribute_descriptions = &attr_descs,
    };

    const input_assembly_state = vk.PipelineInputAssemblyStateCreateInfo{
        .topology = .triangle_list,
        .primitive_restart_enable = .false,
    };

    const viewport_state = vk.PipelineViewportStateCreateInfo{
        .scissor_count = 1,
        .viewport_count = 1,
    };

    const rasterization_state = vk.PipelineRasterizationStateCreateInfo{
        .depth_clamp_enable = .false,
        .rasterizer_discard_enable = .false,
        .polygon_mode = .fill,
        .line_width = 1,
        .cull_mode = .back_bit,
        .front_face = .clockwise,
        .depth_biase_enable = .false,
    };

    const multisample_state = vk.PipelineMultisampleStateCreateInfo{
        .sample_shading_enable = .false,
        .rasterization_samples = .@"1_bit",
    };

    const tesselation_state = vk.PipelineTessellationStateCreateInfo{};

    const color_blend_attachment = vk.PipelineColorBlendAttachmentState{
        .color_write_mask = .initMany(&.{ .r_bit, .g_bit, .b_bit, .a_bit }),
        .blend_enable = .false,
    };

    const color_blend_state = vk.PipelineColorBlendStateCreateInfo{
        .logic_op_enable = .false,
        .logic_op = .copy,
        .attachment_count = 1,
        .p_attachments = &color_blend_attachment,
        .blend_constants = [4]f32{ 0, 0, 0, 0 },
    };

    const depth_stencil_state = vk.PipelineDepthStencilStateCreateInfo{};

    const dynamic_states = [_]vk.DynamicState{
        .viewport,
        .scissor,
    };

    const dynamic_state = vk.PipelineDynamicStateCreateInfo{
        .dynamic_state_count = @truncate(dynamic_states.len),
        .p_dynamic_states = &dynamic_states,
    };

    const create_info = vk.GraphicsPipelineCreateInfo{
        .stage_count = 2,
        .p_stages = &stages,
        .p_vertex_input_state = &vertex_input_state,
        .p_input_assembly_state = &input_assembly_state,
        .p_viewport_state = &viewport_state,
        .p_tessellation_state = &tesselation_state,
        .p_multisample_state = &multisample_state,
        .p_rasterization_state = &rasterization_state,
        .p_color_blend_state = &color_blend_state,
        .p_depth_stencil_state = &depth_stencil_state,
        .p_dynamic_state = &dynamic_state,
        .layout = self.pipeline_layout,
        .render_pass = self.render_pass,
        .subpass = 0,
        .base_pipeline_handle = .null,
    };

    var pipeline: vk.Pipeline = .null;
    return switch (vk.createGraphicsPipelines(self.device, null, 1, &create_info, null, &pipeline)) {
        .success => pipeline,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreatePipeline;
        },
    };
}

fn createCommandPool(self: *const Engine) !vk.CommandPool {
    const qfi = try QFI.init(self.surface, self.physical_device);
    const create_info = vk.CommandPoolCreateInfo{
        .flags = .init(.reset_command_buffer_bit),
        .queue_family_index = qfi.graphics_family.?,
    };

    var command_pool: vk.CommandPool = .null;
    return switch (vk.createCommandPool(self.device, &create_info, null, &command_pool)) {
        .success => command_pool,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateCommandPool;
        },
    };
}

fn allocCommandBuffers(self: *const Engine) !void {
    const alloc_info = vk.CommandBufferAllocateInfo{
        .command_buffer_count = 1,
        .command_pool = self.command_pool,
        .level = .primary,
    };

    try switch (vk.allocateCommandBuffers(self.device, &alloc_info, &self.command_ubuffers)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToAllocateCommandBuffers;
        },
    };
}

fn createSemaphore(self: *const Engine) !vk.Semaphore {
    const create_info = vk.SemaphoreCreateInfo{};
    var semaphore: vk.Semaphore = .null;
    return switch (vk.createSemaphore(self.device, &create_info, null, &semaphore)) {
        .success => semaphore,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateSemaphore;
        },
    };
}

fn createFence(self: *const Engine) !vk.Fence {
    const create_info = vk.FenceCreateInfo{
        .flags = .init(.signaled_bit),
    };
    var fence: vk.Fence = .null;
    return switch (vk.createFence(self.device, &create_info, null, &fence)) {
        .success => fence,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateFence;
        },
    };
}

//
