const std = @import("std");
const Extensions = @import("Extensions.zig");
const QFI = @import("QueueFamilyIndices.zig");
const SSD = @import("SwapchainSupportDetails.zig");
const Vertex = @import("Vertex.zig");
const Window = @import("Window.zig");
const vk = @import("../../vulkan/vulkan.zig");

const MAX_FRAMES_IN_FLIGHT: usize = 2;
const vertices = [_]Vertex{
    .{ .pos = [2]f32{ 0, -0.5 } },
    .{ .pos = [2]f32{ 0.5, 0.5 } },
    .{ .pos = [2]f32{ -0.5, 0.5 } },
};
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
swapchain_format: vk.Format = .b8g8r8a8_unorm,
swapchain_extent: vk.Extent2D = .{ .width = 640, .height = 480 },
swapchain_n_images: u32 = 0,
swapchain_images: [3]vk.Image = [_]vk.Image{.null} ** 3,
swapchain_image_views: [3]vk.ImageView = [_]vk.ImageView{.null} ** 3,

// depth
depth_format: vk.Format = .d32_sfloat,
depth_images: [3]vk.Image = [_]vk.Image{.null} ** 3,
depth_image_memories: [3]vk.DeviceMemory = [_]vk.DeviceMemory{.null} ** 3,
depth_image_views: [3]vk.ImageView = [_]vk.ImageView{.null} ** 3,

// renders
render_pass: vk.RenderPass = .null,
framebuffers: [3]vk.Framebuffer = [_]vk.Framebuffer{.null} ** 3,

// commands
command_pool: vk.CommandPool = .null,
command_buffers: [3]vk.CommandBuffer = [_]vk.CommandBuffer{.null} ** 3,

// model
vertex_buffer: vk.Buffer = .null,
vertex_buffer_memory: vk.DeviceMemory = .null,
// index_buffer: vk.Buffer = .null,
// index_buffer_memory: vk.DeviceMemory = .null,

// pipeline
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
    try self.createSwapchainImages();
    std.debug.assert(self.swapchain_n_images <= 3); // if assertion fails, the rest fails too
    const ssd = try SSD.init(self.surface, self.physical_device);
    self.swapchain_extent = ssd.chooseExtent(&self.window);
    self.swapchain_format = ssd.chooseSurfaceFormat().format;
    for (0..self.swapchain_n_images) |i| self.swapchain_image_views[i] = try self.createSwapchainImageView(i);

    // depth
    self.depth_format = try self.findDepthFormat();
    for (0..self.swapchain_n_images) |i| {
        self.depth_images[i] = try self.createDepthImage();
        self.depth_image_memories[i] = try self.allocDepthImage(i, .init(.device_local_bit));
        self.depth_image_views[i] = try self.createDepthImageView(i);
    }

    self.render_pass = try self.createRenderPass();
    for (0..self.swapchain_n_images) |i| self.framebuffers[i] = try self.createFramebuffer(i);

    // commands
    self.command_pool = try self.createCommandPool();
    try self.allocCommandBuffers();

    //// model
    const size: u64 = vertices.len * @sizeOf(Vertex);
    self.vertex_buffer = try self.createBuffer(size, .init(.vertex_bit));
    self.vertex_buffer_memory = try self.createBufferMemory(self.vertex_buffer);
    try self.bindBufferMemory(self.vertex_buffer, self.vertex_buffer_memory, 0);
    // self.index_buffer = try self.createBuffer(size, .init(.vertex_bit));
    // self.index_buffer_memory = try self.createBufferMemory(self.index_buffer);

    // pipeline
    self.pipeline_layout = try self.createPipelineLayout();
    // self.pipeline = try self.createPipeline();

    // sync objects
    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        self.image_available_semaphores[i] = try self.createSemaphore();
        self.render_finished_semaphores[i] = try self.createSemaphore();
        self.in_flight_fences[i] = try self.createFence();
    }

    return self;
}

pub fn deinit(self: *Engine) void {
    // sync objects
    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        vk.destroySemaphore(self.device, self.image_available_semaphores[i], null);
        vk.destroySemaphore(self.device, self.render_finished_semaphores[i], null);
        vk.destroyFence(self.device, self.in_flight_fences[i], null);
    }

    // pipeline
    // vk.destroyPipeline(self.device, self.pipeline, null);
    vk.destroyPipelineLayout(self.device, self.pipeline_layout, null);

    // model
    // vk.destroyBuffer(self.device, self.index_buffer, null);
    // vk.freeMemory(self.device, self.index_buffer_memory, null);
    vk.destroyBuffer(self.device, self.vertex_buffer, null);
    vk.freeMemory(self.device, self.vertex_buffer_memory, null);

    // commands
    vk.destroyCommandPool(self.device, self.command_pool, null);

    for (0..self.swapchain_n_images) |i| vk.destroyFramebuffer(self.device, self.framebuffers[i], null);
    vk.destroyRenderPass(self.device, self.render_pass, null);

    // depth
    for (0..self.swapchain_n_images) |i| {
        vk.destroyImageView(self.device, self.depth_image_views[i], null);
        vk.freeMemory(self.device, self.depth_image_memories[i], null);
        vk.destroyImage(self.device, self.depth_images[i], null);
    }

    // swapchain
    for (0..self.swapchain_n_images) |i| vk.destroyImageView(self.device, self.swapchain_image_views[i], null);
    vk.destroySwapchainKHR(self.device, self.swapchain, null);

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

fn createSwapchain(self: *const Engine) !vk.SwapchainKHR {
    const ssd = try SSD.init(self.surface, self.physical_device);
    const surface_format = ssd.chooseSurfaceFormat();
    const present_mode = ssd.choosePresentMode();
    const extent = ssd.chooseExtent(&self.window);

    var image_count = ssd.capabilities.min_image_count + 1;
    if (ssd.capabilities.max_image_count > 0 and image_count > ssd.capabilities.max_image_count) {
        image_count = ssd.capabilities.max_image_count;
    }

    const qfi = try QFI.init(self.surface, self.physical_device);
    const indices = [_]u32{ qfi.graphics_family.?, qfi.present_family.? };

    const create_info = vk.SwapchainCreateInfoKHR{
        .surface = self.surface,

        .min_image_count = image_count,
        .image_format = surface_format.format,
        .image_color_space = surface_format.color_space,
        .image_extent = extent,
        .image_array_layers = 1,
        .image_usage = .init(.color_attachment_bit),

        .image_sharing_mode = if (!qfi.isSameFamily()) .concurrent else .exclusive,
        .queue_family_index_count = if (!qfi.isSameFamily()) 2 else 1,
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
    try switch (vk.getSwapchainImagesKHR(self.device, self.swapchain, &self.swapchain_n_images, null)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToGetNumOfSwapchainImages;
        },
    };

    try switch (vk.getSwapchainImagesKHR(self.device, self.swapchain, &self.swapchain_n_images, &self.swapchain_images)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToGetSwapchainImages;
        },
    };
}

fn createSwapchainImageView(self: *const Engine, i: usize) !vk.ImageView {
    const create_info = vk.ImageViewCreateInfo{
        .image = self.swapchain_images[i],
        .view_type = .@"2d",
        .format = self.swapchain_format,
        .subresource_range = .{
            .aspect_mask = .init(.color_bit),
            .base_mip_level = 0,
            .level_count = 1,
            .base_array_layer = 0,
            .layer_count = 1,
        },
    };

    var image_view: vk.ImageView = .null;
    return switch (vk.createImageView(self.device, &create_info, null, &image_view)) {
        .success => image_view,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateSwapchainImageView;
        },
    };
}

fn createDepthImage(self: *const Engine) !vk.Image {
    const create_info = vk.ImageCreateInfo{
        .image_type = .@"2d",
        .extent = .{
            .width = self.swapchain_extent.width,
            .height = self.swapchain_extent.height,
            .depth = 1,
        },
        .mip_levels = 1,
        .array_layers = 1,
        .format = self.depth_format,
        .tiling = .init(.optimal),
        .initial_layout = .undefined,
        .usage = .init(.depth_stencil_attachment_bit),
        .samples = .@"1_bit",
        .sharing_mode = .exclusive,
    };

    var image: vk.Image = .null;
    return switch (vk.createImage(self.device, &create_info, null, &image)) {
        .success => image,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateDepthImage;
        },
    };
}

fn allocDepthImage(self: *const Engine, i: usize, props: vk.MemoryPropertyFlags) !vk.DeviceMemory {
    var mem_reqs: vk.MemoryRequirements = undefined;
    vk.getImageMemoryRequirements(self.device, self.depth_images[i], &mem_reqs);

    const alloc_info = vk.MemoryAllocateInfo{
        .allocation_size = mem_reqs.size,
        .memory_type_index = try self.findMemoryType(mem_reqs.memory_type_bits, props),
    };

    var memory: vk.DeviceMemory = .null;
    return switch (vk.allocateMemory(self.device, &alloc_info, null, &memory)) {
        .success => memory,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToAllocateMemory;
        },
    };
}

fn bindDepthImage(self: *const Engine, i: usize) !void {
    try switch (vk.bindImageMemory(self.device, self.depth_images[i], self.depth_image_memories[i], 0)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToBindImageMemory;
        },
    };
}

fn createDepthImageView(self: *const Engine, i: usize) !vk.ImageView {
    const create_info = vk.ImageViewCreateInfo{
        .image = self.depth_images[i],
        .view_type = .@"2d",
        .format = self.depth_format,
        .subresource_range = .{
            .aspect_mask = .init(.depth_bit),
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
            break :blk error.FailedToCreateDepthImageView;
        },
    };
}

fn findDepthFormat(self: *const Engine) !vk.Format {
    for ([_]vk.Format{ .d32_sfloat, .d32_sfloat_s8_uint, .d24_unorm_s8_uint }) |candidate| {
        var props: vk.FormatProperties = undefined;
        vk.getPhysicalDeviceFormatProperties(self.physical_device, candidate, &props);
        if (props.optimal_tiling_features.contains(.depth_stencil_attachment_bit)) {
            return candidate;
        }
    }
    return error.FailedToFindSupportedFormat;
}

fn createRenderPass(self: *const Engine) !vk.RenderPass {
    const depth_attachment = vk.AttachmentDescription{
        .format = self.depth_format,
        .samples = .@"1_bit",
        .load_op = .clear,
        .store_op = .dont_care,
        .stencil_load_op = .dont_care,
        .stencil_store_op = .dont_care,
        .initial_layout = .undefined,
        .final_layout = .stencil_attachment_optimal,
    };

    const depth_attachment_ref = vk.AttachmentReference{
        .attachment = 1,
        .layout = .depth_stencil_attachment_optimal,
    };

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

    const color_attachment_ref = vk.AttachmentReference{
        .attachment = 0,
        .layout = .color_attachment_optimal,
    };

    const subpass = vk.SubpassDescription{
        .pipeline_bind_point = .graphics,
        .color_attachment_count = 1,
        .p_color_attachments = &color_attachment_ref,
        .p_depth_stencil_attachment = &depth_attachment_ref,
    };

    const dependency = vk.SubpassDependency{
        .dst_subpass = 0,
        .dst_access_mask = .init(.color_attachment_write_bit),
        .dst_stage_mask = .init(.color_attachment_output_bit),
        .src_subpass = vk.SubpassExternal,
        .src_access_mask = .initEmpty(),
        .src_stage_mask = .init(.color_attachment_output_bit),
    };

    const attachments = [_]vk.AttachmentDescription{ color_attachment, depth_attachment };

    const create_info = vk.RenderPassCreateInfo{
        .attachment_count = @truncate(attachments.len),
        .p_attachments = &attachments,
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

fn createFramebuffer(self: *const Engine, i: usize) !vk.Framebuffer {
    const attachments = [_]vk.ImageView{ self.swapchain_image_views[i], self.depth_image_views[i] };

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

fn createCommandPool(self: *const Engine) !vk.CommandPool {
    const qfis = try QFI.init(self.surface, self.physical_device);

    const create_info = vk.CommandPoolCreateInfo{
        .queue_family_index = qfis.graphics_family.?,
        .flags = .initMany(&.{ .transient_bit, .reset_command_buffer_bit }),
    };

    var pool: vk.CommandPool = .null;
    return switch (vk.createCommandPool(self.device, &create_info, null, &pool)) {
        .success => pool,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateCommandPool;
        },
    };
}

fn allocCommandBuffers(self: *Engine) !void {
    const alloc_info = vk.CommandBufferAllocateInfo{
        .level = .primary,
        .command_pool = self.command_pool,
        .command_buffer_count = @truncate(self.swapchain_n_images),
    };

    return switch (vk.allocateCommandBuffers(self.device, &alloc_info, &self.command_buffers)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToAllocateCommandBuffers;
        },
    };
}

fn createPipelineLayout(self: *const Engine) !vk.PipelineLayout {
    const create_info = vk.PipelineLayoutCreateInfo{
        .set_layout_count = 0,
        .p_set_layouts = null,
        .push_constant_range_count = 0,
        .p_push_constant_ranges = null,
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

fn readFile(shader_filename: []const u8) ![]const u8 {
    const allo = std.heap.page_allocator;
    var exe_path_buf: [1024]u8 = undefined;
    var exe_path = std.fs.selfExePath(&exe_path_buf) catch unreachable;
    const idx = std.mem.indexOf(u8, exe_path, ".zig-cache").?;
    const basepath = exe_path[0..idx];

    const filepath = try std.fs.path.join(allo, &.{
        basepath,
        "src",
        "Engine",
        "Engine2",
        "Shaders",
        shader_filename,
    });
    defer allo.free(filepath);

    var file = try std.fs.openFileAbsolute(filepath, .{ .mode = .read_only });
    defer file.close();

    const code = try file.readToEndAlloc(allo, 2048);
    return code;
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

fn createGraphicsPipeline(self: *const Engine, allo: std.mem.Allocator) !vk.Pipeline {
    const vert_code = try readFile();
    defer allo.free(vert_code);

    const frag_code = try readFile();
    defer allo.free(frag_code);

    const vert_sm = try self.createShaderModule(vert_code);
    defer vk.destroyShaderModule(self.device, vert_sm, null);

    const frag_sm = try self.createShaderModule(frag_code);
    defer vk.destroyShaderModule(self.device, frag_sm, null);

    const stages = [_]vk.PipelineShaderStageCreateInfo{
        .{
            .stage = .vertex_bit,
            .p_name = "main",
            .module = vert_sm,
        },
        .{
            .stage = .fragment_bit,
            .p_name = "main",
            .module = frag_sm,
        },
    };

    var bind_descs: [1]vk.VertexInputBindingDescription = undefined;
    var attr_descs: [1]vk.VertexInputAttributeDescription = undefined;
    Vertex.getBindingDescriptions(@ptrCast(&bind_descs));
    Vertex.getAttributeDescriptions(@ptrCast(&attr_descs));

    const input_assembly_state = vk.PipelineInputAssemblyStateCreateInfo{
        .topology = .triangle_list,
        .primitive_restart_enable = .false,
    };

    const viewport = vk.Viewport{
        .x = 0,
        .y = 0,
        .width = self.extent.width,
        .height = self.extent.height,
        .min_depth = 0,
        .max_depth = 1,
    };

    const scissor = vk.Rect2D{
        .offset = [2]vk.Offset2D{ 0, 0 },
        .extent = self.extent,
    };

    const viewport_state = vk.PipelineViewportStateCreateInfo{
        .viewport_count = 1,
        .p_viewports = &viewport,
        .scissor_count = 1,
        .p_scissors = &scissor,
    };

    const rasterization_state = vk.PipelineRasterizationStateCreateInfo{
        .depth_clamp_enable = .false,
        .rasterizer_discard_enable = .false,
        .polygon_mode = .fill,
        .line_width = 1,
        .cull_mode = .none,
        .front_face = .clockwise,
        .depth_bias_enable = .false,
        .depth_bias_constant_factor = 0,
        .depth_bias_clamp = 0,
        .depth_bias_slope_factor = 0,
    };

    const multisample_state = vk.PipelineMultisampleStateCreateInfo{
        .sample_shading_enable = .false,
        .rasterization_samples = .@"1_bit",
        .min_sample_shading = 1,
        .p_sample_mask = null,
        .alpha_to_coverage_enable = .false,
        .alpha_to_one_enable = .false,
    };

    const color_blend_attachment = vk.PipelineColorBlendAttachmentState{
        .color_write_mask = .initMany(&.{ .r_bit, .g_bit, .b_bit, .a_bit }),
        .blend_enable = .false,
        .src_color_blend_factor = .one,
        .dst_color_blend_factor = .zero,
        .color_blend_op = .add,
        .src_alpha_blend_factor = .one,
        .dst_alpha_blend_factor = .zero,
        .alpha_blend_op = .add,
    };

    const color_blend_state = vk.PipelineColorBlendStateCreateInfo{
        .logic_op_enable = .false,
        .logic_of = .copy,
        .attachment_count = 1,
        .p_attachments = &color_blend_attachment,
        .blend_constants = [4]f32{ 0, 0, 0, 0 },
    };

    const depth_stencil_state = vk.PipelineDepthStencilStateCreateInfo{
        .depth_test_enable = .true,
        .depth_write_enable = .true,
        .depth_compare_op = .less,
        .depth_bounds_test_enable = .false,
        .min_depth_bounds = 0,
        .max_depth_bounds = 1,
        .stencil_test_enable = .false,
        .front = .{},
        .back = .{},
    };

    const create_info = vk.GraphicsPipelineCreateInfo{
        .stage_count = @truncate(stages.len),
        .p_stages = &stages,
        .p_input_assembly_state = &input_assembly_state,
        .p_viewport_state = &viewport_state,
        .p_rasterization_state = &rasterization_state,
        .p_multisample_state = &multisample_state,
        .p_color_blend_state = &color_blend_state,
        .p_depth_stencil_state = &depth_stencil_state,

        .render_pass = self.render_pass,
        .layout = self.pipeline_layout,
        .subpass = 0,

        .base_pipeline_handle = .null,
        .base_pipeline_index = -1,
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

fn createBuffer(
    self: *const Engine,
    size: vk.DeviceSize,
    usage: vk.BufferUsageFlags,
) !vk.Buffer {
    const create_info = vk.BufferCreateInfo{
        .size = size,
        .usage = usage,
        .sharing_mode = .exclusive,
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

fn findMemoryType(self: *const Engine, type_filter: u32, props: vk.MemoryPropertyFlags) !u32 {
    var mem_props: vk.PhysicalDeviceMemoryProperties = undefined;
    vk.getPhysicalDeviceMemoryProperties(self.physical_device, &mem_props);
    for (0..mem_props.memory_type_count) |i| {
        if ((type_filter & (@as(@TypeOf(type_filter), 1) << @truncate(i))) == 0) continue;
        if (!mem_props.memory_types[i].property_flags.supersetOf(props)) continue;
        return @truncate(i);
    }
    return error.FailedToFindSuitableMemoryType;
}

fn createBufferMemory(
    self: *const Engine,
    buffer: vk.Buffer,
    props: vk.MemoryPropertyFlags,
) !vk.DeviceMemory {
    var mem_reqs: vk.MemoryRequirements = undefined;
    vk.getBufferMemoryRequirements(self.device, buffer, &mem_reqs);

    const alloc_info = vk.MemoryAllocateInfo{
        .allocation_size = mem_reqs.size,
        .memory_type_index = try findMemoryType(mem_reqs.memory_type_bits, props),
    };

    var memory: vk.DeviceMemory = .null;
    return switch (vk.allocateMemory(self.device, &alloc_info, null, &memory)) {
        .success => memory,
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToCreateBufferMemory;
        },
    };
}

fn bindBufferMemory(self: *const Engine, buffer: vk.Buffer, memory: vk.DeviceMemory, offset: u64) !void {
    try switch (vk.bindBufferMemory(self.device, buffer, memory, offset)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToBindBufferMemory;
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
