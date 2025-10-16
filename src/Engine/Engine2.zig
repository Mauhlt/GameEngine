const std = @import("std");
const WindowHandle = @import("WindowHandle.zig");
const vk = @import("..\\vulkan\\vulkan.zig");
const QFI = @import("QueueFamilyIndices.zig");
const SSD = @import("SwapchainSupportDetails.zig");
const UBO = @import("UniformBufferObject.zig");
const Chrono = @import("Chrono.zig");
// Math
const Matrix = @import("../math/Matrix.zig");
const Vector = @import("../math/Vector.zig");
const degreesToRadians = std.math.degreesToRadians;
// Model
const Vertex = @import("Vertex.zig");
// right = +x, down = +y, in = +z
// tl tr br br bl tl
const vertices = [4]Vertex{
    .{ .pos = [2]f32{ -0.5, -0.5 }, .color = [3]f32{ 1, 0, 0 } }, // TL
    .{ .pos = [2]f32{ 0.5, -0.5 }, .color = [3]f32{ 0, 1, 0 } }, // TR
    .{ .pos = [2]f32{ 0.5, 0.5 }, .color = [3]f32{ 0, 0, 1 } }, // BR
    .{ .pos = [2]f32{ -0.5, 0.5 }, .color = [3]f32{ 1, 1, 1 } }, // BL
};
const indices = [6]u16{ 0, 1, 2, 2, 3, 0 };
// extensions
const required_instance_extensions = [_][*:0]const u8{
    vk.ExtensionName.win32_surface,
    vk.ExtensionName.surface,
};
const required_device_extensions = [_][*:0]const u8{
    vk.ExtensionName.swapchain,
};
// constants
const MAX_U64 = std.math.maxInt(u64);
const MAX_FRAMES_IN_FLIGHT: u32 = 2;
const Engine = @This();
// base
window: WindowHandle = undefined,
instance: vk.Instance = .null,
surface: vk.SurfaceKHR = .null,
physical_device: vk.PhysicalDevice = .null,
device: vk.Device = .null,
// queues
graphics_queue: vk.Queue = .null,
present_queue: vk.Queue = .null,
// Swapchain
swapchain: vk.SwapchainKHR = .null,
format: vk.SurfaceFormatKHR = .{
    .color_space = .srgb_nonlinear,
    .format = .b8g8r8_srgb,
},
extent: vk.Extent2D = .{ .width = 0, .height = 0 },
n_images: u32,
images: [3]vk.Image = [_]vk.Image{.null} ** 3,
image_views: [3]vk.ImageView = [_]vk.ImageView{.null} ** 3,
render_pass: vk.RenderPass = .null,
framebuffers: [3]vk.Framebuffer = [_]vk.Framebuffer{.null} ** 3,
// pipeline
descriptor_set_layout: vk.DescriptorSetLayout = .null,
pipeline_layout: vk.PipelineLayout = .null,
pipeline: vk.Pipeline = .null,
// commands
command_pool: vk.CommandPool = .null,
command_buffers: [3]vk.CommandBuffer = [_]vk.CommandBuffer{.null} ** 3,
// buffers
vertex_buffer: vk.Buffer = .null,
vertex_buffer_memory: vk.DeviceMemory = .null,
index_buffer: vk.Buffer = .null,
index_buffer_memory: vk.DeviceMemory = .null,
// uniform buffers
uniform_buffers: [MAX_FRAMES_IN_FLIGHT]vk.Buffer = [_]vk.Buffer{.null} ** MAX_FRAMES_IN_FLIGHT,
uniform_buffer_memories: [MAX_FRAMES_IN_FLIGHT]vk.DeviceMemory = [_]vk.DeviceMemory{.null} ** MAX_FRAMES_IN_FLIGHT,
uniform_buffer_maps: [MAX_FRAMES_IN_FLIGHT]?*anyopaque = [_]?*anyopaque{null} ** MAX_FRAMES_IN_FLIGHT,
// sync objects
image_available_semaphores: [MAX_FRAMES_IN_FLIGHT]vk.Semaphore = [_]vk.Semaphore{.null} ** MAX_FRAMES_IN_FLIGHT,
render_finished_semaphores: [MAX_FRAMES_IN_FLIGHT]vk.Semaphore = [_]vk.Semaphore{.null} ** MAX_FRAMES_IN_FLIGHT,
in_flight_fences: [MAX_FRAMES_IN_FLIGHT]vk.Fence = [_]vk.Fence{.null} ** MAX_FRAMES_IN_FLIGHT,
// flags
current_frame: u32 = 0,
framebuffer_resized: bool = false,
chrono: Chrono = undefined,

pub fn init(
    allo: std.mem.Allocator,
    comptime app_name: [*:0]const u8,
    comptime window_title: [*:0]const u8,
    engine_name: [*:0]const u8,
    window_size: vk.Extent2D,
) !Engine {
    // base
    var window = try WindowHandle.init(
        std.mem.sliceTo(app_name, 0),
        std.mem.sliceTo(window_title, 0),
        window_size.width,
        window_size.height,
    );
    errdefer window.deinit();
    const instance = try createInstance(app_name, engine_name);
    errdefer vk.destroyInstance(instance, null);
    const surface = try createSurface(&window, instance);
    errdefer vk.destroySurfaceKHR(instance, surface, null);
    const physical_device = try pickPhysicalDevice(instance, surface);
    const device = try createLogicalDevice(surface, physical_device);
    errdefer vk.destroyDevice(device, null);
    // queues
    const qfi = QFI.init(surface, physical_device) catch unreachable;
    const graphics_queue = getDeviceQueue(device, qfi.graphics_family.?);
    const present_queue = getDeviceQueue(device, qfi.present_family.?);
    // swapchain
    const ssd = try SSD.init(surface, physical_device);
    const swapchain = try createSwapchain(&window, surface, physical_device, device, &ssd);
    errdefer vk.destroySwapchainKHR(device, swapchain, null);
    var n_images = try getNumImages(device, swapchain);
    var images = [_]vk.Image{.null} ** 3;
    try createImages(device, swapchain, &n_images, &images);
    const format = ssd.chooseFormat();
    const extent = ssd.chooseExtent(&window);
    var image_views = [_]vk.ImageView{.null} ** 3;
    for (0..n_images) |i| image_views[i] = try createImageView(device, format.format, images[i]);
    errdefer for (image_views[0..n_images]) |image_view| vk.destroyImageView(device, image_view, null);
    const render_pass = try createRenderPass(device, format.format);
    errdefer vk.destroyRenderPass(device, render_pass, null);
    var framebuffers = [_]vk.Framebuffer{.null} ** 3;
    for (0..n_images) |i| framebuffers[i] = try createFramebuffer(device, extent, image_views[i], render_pass);
    errdefer for (framebuffers[0..n_images]) |framebuffer| vk.destroyFramebuffer(device, framebuffer, null);
    // pipeline
    var descriptor_set_layout = try createDescriptorSetLayout(device);
    const pipeline_layout = try createGraphicsPipelineLayout(device, &descriptor_set_layout);
    errdefer vk.destroyPipelineLayout(device, pipeline_layout, null);
    const pipeline = try createGraphicsPipeline(allo, device, render_pass, pipeline_layout);
    errdefer vk.destroyPipeline(device, pipeline, null);
    // commands
    const command_pool = try createCommandPool(surface, physical_device, device);
    errdefer vk.destroyCommandPool(device, command_pool, null);
    // stage -> vertex -> stage -> index
    var vertex_buffer: vk.Buffer = .null;
    var vertex_buffer_memory: vk.DeviceMemory = .null;
    try createBufferAndMemory(
        Vertex,
        physical_device,
        device,
        graphics_queue,
        command_pool,
        &vertex_buffer,
        &vertex_buffer_memory,
        .vertex_buffer_bit,
        &vertices,
    );
    var index_buffer: vk.Buffer = .null;
    var index_buffer_memory: vk.DeviceMemory = .null;
    try createBufferAndMemory(
        u16,
        physical_device,
        device,
        graphics_queue,
        command_pool,
        &index_buffer,
        &index_buffer_memory,
        .index_buffer_bit,
        &indices,
    );
    var uniform_buffers = [_]vk.Buffer{.null} ** MAX_FRAMES_IN_FLIGHT;
    var uniform_buffer_memories = [_]vk.DeviceMemory{.null} ** MAX_FRAMES_IN_FLIGHT;
    var uniform_buffer_maps = [_]?*anyopaque{null} ** MAX_FRAMES_IN_FLIGHT;
    try createUniformBuffers(
        physical_device,
        device,
        &uniform_buffers,
        &uniform_buffer_memories,
        &uniform_buffer_maps,
    );
    var command_buffers = [_]vk.CommandBuffer{.null} ** 3;
    try createCommandBuffers(device, command_pool, &command_buffers);
    // sync objects
    var image_available_semaphores = [_]vk.Semaphore{.null} ** MAX_FRAMES_IN_FLIGHT;
    var render_finished_semaphores = [_]vk.Semaphore{.null} ** MAX_FRAMES_IN_FLIGHT;
    var in_flight_fences = [_]vk.Fence{.null} ** MAX_FRAMES_IN_FLIGHT;
    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        // semaphores
        image_available_semaphores[i] = try createSemaphore(device);
        errdefer vk.destroySemaphore(device, image_available_semaphores[i], null);
        render_finished_semaphores[i] = try createSemaphore(device);
        errdefer vk.destroySemaphore(device, render_finished_semaphores[i], null);
        // fences
        in_flight_fences[i] = try createFence(device);
    }
    const chrono = Chrono.init();
    // show window
    window.show();

    return .{
        // base
        .window = window,
        .instance = instance,
        .surface = surface,
        .physical_device = physical_device,
        .device = device,
        // queues
        .graphics_queue = graphics_queue,
        .present_queue = present_queue,
        // swapchain
        .swapchain = swapchain,
        .extent = extent,
        .format = format,
        .n_images = n_images,
        .images = images,
        .image_views = image_views,
        .framebuffers = framebuffers,
        // pipeline
        .render_pass = render_pass,
        .descriptor_set_layout = descriptor_set_layout,
        .pipeline_layout = pipeline_layout,
        .pipeline = pipeline,
        // commands
        .command_pool = command_pool,
        .vertex_buffer = vertex_buffer,
        .vertex_buffer_memory = vertex_buffer_memory,
        .index_buffer = index_buffer,
        .index_buffer_memory = index_buffer_memory,
        .uniform_buffers = uniform_buffers,
        .uniform_buffer_memories = uniform_buffer_memories,
        .uniform_buffer_maps = uniform_buffer_maps,
        .command_buffers = command_buffers,
        // sync objects
        .image_available_semaphores = image_available_semaphores,
        .render_finished_semaphores = render_finished_semaphores,
        .in_flight_fences = in_flight_fences,
        // extra
        .chrono = chrono,
    };
}

pub fn deinit(self: *Engine) void {
    // swapchain
    self.deinitSwapchain();
    // buffers
    vk.destroyBuffer(self.device, self.index_buffer, null);
    vk.freeMemory(self.device, self.index_buffer_memory, null);
    vk.destroyBuffer(self.device, self.vertex_buffer, null);
    vk.freeMemory(self.device, self.vertex_buffer_memory, null);
    // pipeline
    vk.destroyPipeline(self.device, self.pipeline, null);
    vk.destroyPipelineLayout(self.device, self.pipeline_layout, null);
    // sync objects
    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        vk.destroySemaphore(self.device, self.image_available_semaphores[i], null);
        vk.destroySemaphore(self.device, self.render_finished_semaphores[i], null);
        vk.destroyFence(self.device, self.in_flight_fences[i], null);
    }
    // commands
    vk.destroyCommandPool(self.device, self.command_pool, null);
    // uniform buffers
    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        vk.destroyBuffer(self.device, self.uniform_buffers[i], null);
        vk.freeMemory(self.device, self.uniform_buffer_memories[i], null);
    }
    // descriptor set layout
    vk.destroyDescriptorSetLayout(self.device, self.descriptor_set_layout, null);
    // render pass
    vk.destroyRenderPass(self.device, self.render_pass, null);
    // base
    vk.destroyDevice(self.device, null);
    vk.destroySurfaceKHR(self.instance, self.surface, null);
    vk.destroyInstance(self.instance, null);
    self.window.deinit();
}

pub fn run(self: *Engine) !void {
    while (!self.window.shouldClose()) {
        // poll events here
        try self.drawFrame(); // draw frame
        self.window.poll(); // update window here - not exiting properly
    }

    switch (vk.deviceWaitIdle(self.device)) {
        .success => {},
        else => return error.FailedToIdleDevice,
    }
}

fn createInstance(app_name: [*:0]const u8, engine_name: [*:0]const u8) !vk.Instance {
    const app_info = vk.ApplicationInfo{
        .p_application_name = app_name,
        .application_version = vk.makeApiVersion(0, 1, 0, 0),
        .p_engine_name = engine_name,
        .engine_version = vk.makeApiVersion(0, 1, 0, 0),
        .api_version = vk.makeApiVersion(0, 1, 0, 0),
    };

    var n_props: u32 = 0;
    var props: [64]vk.ExtensionProperties = undefined;
    try getInstanceExtensionProperties(&n_props, &props);
    // printExtensionProperties("Instance", props[0..n_props]),

    // switch based on os type
    const create_info = vk.InstanceCreateInfo{
        .p_application_info = &app_info,
        .flags = switch (@import("builtin").os.tag) {
            .macos => .init(.enumerate_portability_bit_khr),
            else => .initEmpty(),
        },
        .enabled_extension_count = @truncate(required_instance_extensions.len),
        .pp_enabled_extension_names = &required_instance_extensions,
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
    };

    var instance: vk.Instance = .null;
    return switch (vk.createInstance(&create_info, null, &instance)) {
        .success => instance,
        else => error.FailedToCreateInstance,
    };
}

fn getInstanceExtensionProperties(n_props: *u32, props: *[64]vk.ExtensionProperties) !void {
    switch (vk.enumerateInstanceExtensionProperties(null, n_props, null)) {
        .success => {},
        else => return error.FailedToEnumerateInstanceExtensionProperties,
    }
    if (n_props.* > props.len) return error.ToManyInstanceExtensionProperties;
    switch (vk.enumerateInstanceExtensionProperties(null, n_props, props)) {
        .success => {},
        else => return error.FailedToEnumerateInstanceExtensionProperties,
    }
}

fn printExtensionProperties(
    title: []const u8,
    props: []vk.ExtensionProperties,
) void {
    std.debug.print("{s} Extensions:\n", .{title});
    std.debug.print("# of Extensions: {}\n", .{props.len});
    for (props) |prop| {
        // const len = std.mem.indexOfScalar(u8, &prop.extension_name, 0) //
        //     orelse prop.extension_name.len;
        // const name = prop.extension_name[0..len];
        const name: []const u8 = std.mem.sliceTo(&prop.extension_name, 0);
        std.debug.print("{s}\n", .{name});
    }
    std.debug.print("\n", .{});
}

fn createSurface(
    window: *const WindowHandle,
    instance: vk.Instance,
) !vk.SurfaceKHR {
    const create_info = vk.Win32SurfaceCreateInfoKHR{
        .flags = 0,
        .hinstance = window.instance,
        .hwnd = window.hwnd,
    };
    var surface: vk.SurfaceKHR = .null;
    return switch (vk.createWin32SurfaceKHR(instance, &create_info, null, &surface)) {
        .success => surface,
        else => return error.FailedToCreateSurface,
    };
}

fn pickPhysicalDevice(
    instance: vk.Instance,
    surface: vk.SurfaceKHR,
) !vk.PhysicalDevice {
    var n_devices: u32 = 0;
    switch (vk.enumeratePhysicalDevices(instance, &n_devices, null)) {
        .success => {},
        else => return error.FailedToEnumeratePhysicalDevices,
    }
    if (n_devices == 0) return error.NoGPUsSupportVulkan;
    if (n_devices > 32) return error.TooManyPhysicalDevicesFound;
    var devices: [32]vk.PhysicalDevice = [_]vk.PhysicalDevice{.null} ** 32;
    switch (vk.enumeratePhysicalDevices(instance, &n_devices, &devices)) {
        .success => {},
        else => return error.FailedToEnumeratePhysicalDevices,
    }
    // printDevices(n_devices, &physical_devices);
    for (devices[0..n_devices]) |device| {
        if (isDeviceSuitable(surface, device)) return device;
    } else return error.FailedToFindSuitableGPU;
}

fn printDevices(n_devices: u32, devices: *[32]vk.PhysicalDevice) void {
    std.debug.print("List Of Physical Devices:\n", .{});
    for (devices[0..n_devices]) |device| {
        var props: vk.PhysicalDeviceProperties = undefined;
        vk.getPhysicalDeviceProperties(device, &props);
        // const len = std.mem.indexOfScalar(u8, &props.device_name, 0).?;
        // const name = props.device_name[0..len];
        const name: []const u8 = std.mem.sliceTo(&props.device_name, 0);
        std.debug.print("{s}: {s}\n", .{ name, @tagName(props.device_type) });
    }
    std.debug.print("\n", .{});
}

fn isDeviceSuitable(surface: vk.SurfaceKHR, device: vk.PhysicalDevice) bool {
    const qfi = QFI.init(surface, device) catch return false;
    if (!areDeviceExtensionsSupported(device)) return false;
    const ssd = SSD.init(surface, device) catch return false;
    const is_swapchain_adequate = ssd.n_formats > 0 and ssd.n_present_modes > 0;
    return qfi.isComplete() and is_swapchain_adequate;
}

fn areDeviceExtensionsSupported(device: vk.PhysicalDevice) bool {
    var n_props: u32 = 0;
    var props: [256]vk.ExtensionProperties = undefined;
    getDeviceExtensionProperties(device, &n_props, &props) catch return false;

    outer: for (required_device_extensions) |rde| {
        const name1: []const u8 = std.mem.span(rde);
        for (props[0..n_props]) |prop| {
            const name2: []const u8 = std.mem.sliceTo(&prop.extension_name, 0);
            if (std.mem.eql(u8, name1, name2)) continue :outer;
        } else return false;
    } else return true;
}

fn createLogicalDevice(
    surface: vk.SurfaceKHR,
    physical_device: vk.PhysicalDevice,
) !vk.Device {
    const qfi = QFI.init(surface, physical_device) catch unreachable;
    const queue_priority = [_]f32{1};
    const queue_create_infos = [_]vk.DeviceQueueCreateInfo{
        .{
            .queue_family_index = qfi.graphics_family.?,
            .p_queue_priorities = &queue_priority,
            .queue_count = 1,
        },
        .{
            .queue_family_index = qfi.present_family.?,
            .p_queue_priorities = &queue_priority,
            .queue_count = 1,
        },
    };
    const feats: vk.PhysicalDeviceFeatures = .{};

    var n_props: u32 = 0;
    var props: [256]vk.ExtensionProperties = undefined;
    try getDeviceExtensionProperties(physical_device, &n_props, &props);
    // printExtensionProperties("Device", props[0..n_props]);

    const create_info = vk.DeviceCreateInfo{
        .p_enabled_features = &feats,
        .queue_create_info_count = if (qfi.present_family.? != qfi.graphics_family.?) //
            @truncate(queue_create_infos.len)
        else
            1,
        .p_queue_create_infos = &queue_create_infos,
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
        .enabled_extension_count = @truncate(required_device_extensions.len),
        .pp_enabled_extension_names = &required_device_extensions,
    };
    var device: vk.Device = .null;
    return switch (vk.createDevice(physical_device, &create_info, null, &device)) {
        .success => device,
        else => error.FailedToCreateLogicalDevice,
    };
}

fn getDeviceQueue(device: vk.Device, family: u32) vk.Queue {
    var queue: vk.Queue = .null;
    vk.getDeviceQueue(device, family, 0, &queue);
    return queue;
}

fn getDeviceExtensionProperties(
    physical_device: vk.PhysicalDevice,
    n_props: *u32,
    props: *[256]vk.ExtensionProperties,
) !void {
    switch (vk.enumerateDeviceExtensionProperties(physical_device, null, n_props, null)) {
        .success => {},
        else => return error.FailedToEnumerateDeviceExtensionProperties,
    }
    if (n_props.* > props.len) return error.ToManyInstanceExtensionProperties;
    switch (vk.enumerateDeviceExtensionProperties(physical_device, null, n_props, props)) {
        .success => {},
        else => return error.FailedToEnumerateDeviceExtensionProperties,
    }
}

fn createSwapchain(
    window: *const WindowHandle,
    surface: vk.SurfaceKHR,
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    ssd: *const SSD,
) !vk.SwapchainKHR {
    const format = ssd.chooseFormat();
    const present_mode = ssd.choosePresentMode();
    const extent = ssd.chooseExtent(window);
    const n_images = if (ssd.capabilities.max_image_count > 0 //
    and ssd.capabilities.max_image_count < ssd.capabilities.min_image_count + 1) //
        ssd.capabilities.max_image_count
    else
        ssd.capabilities.min_image_count + 1;

    const qfi = try QFI.init(surface, physical_device);
    const qfis = [_]u32{ qfi.graphics_family.?, qfi.present_family.? };
    const is_same_family = qfi.graphics_family.? == qfi.present_family.?;

    const create_info = vk.SwapchainCreateInfoKHR{
        .surface = surface,
        .min_image_count = n_images,
        .image_format = format.format,
        .image_color_space = format.color_space,
        .image_extent = extent,
        .image_array_layers = 1,
        .image_usage = .init(.color_attachment_bit),
        .image_sharing_mode = if (is_same_family) .exclusive else .concurrent,
        .queue_family_index_count = if (is_same_family) 0 else @truncate(qfis.len),
        .p_queue_family_indices = if (is_same_family) null else &qfis,
        .pre_transform = ssd.capabilities.current_transform,
        .composite_alpha = .opaque_bit,
        .present_mode = present_mode,
        .clipped = .true,
        .old_swapchain = .null,
    };

    var swapchain: vk.SwapchainKHR = .null;
    return switch (vk.createSwapchainKHR(device, &create_info, null, &swapchain)) {
        .success => swapchain,
        else => error.FailedToCreateSwapchain,
    };
}

fn getNumImages(device: vk.Device, swapchain: vk.SwapchainKHR) !u32 {
    var n_images: u32 = 0;
    return switch (vk.getSwapchainImagesKHR(device, swapchain, &n_images, null)) {
        .success => n_images,
        else => return error.FailedToGetSwapchainImages,
    };
}

fn createImages(
    device: vk.Device,
    swapchain: vk.SwapchainKHR,
    n_images: *u32,
    images: *[3]vk.Image,
) !void {
    return switch (vk.getSwapchainImagesKHR(device, swapchain, n_images, images)) {
        .success => {},
        else => return error.FailedToGetSwapchainImages,
    };
}

fn createImageView(
    device: vk.Device,
    format: vk.Format,
    image: vk.Image,
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
    return switch (vk.createImageView(device, &create_info, null, &view)) {
        .success => view,
        else => return error.FailedToCreateImageView,
    };
}

fn createRenderPass(device: vk.Device, format: vk.Format) !vk.RenderPass {
    const color_attachment = vk.AttachmentDescription{
        .format = format,
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
        .layout = .attachment_optimal,
    };

    const subpass = vk.SubpassDescription{
        .pipeline_bind_point = .graphics,
        .color_attachment_count = 1,
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
    return switch (vk.createRenderPass(device, &create_info, null, &render_pass)) {
        .success => render_pass,
        else => error.FailedToCreateRenderPass,
    };
}

fn createFramebuffer(
    device: vk.Device,
    extent: vk.Extent2D,
    view: vk.ImageView,
    render_pass: vk.RenderPass,
) !vk.Framebuffer {
    const attachments = [_]vk.ImageView{view};
    const create_info = vk.FramebufferCreateInfo{
        .render_pass = render_pass,
        .attachment_count = 1,
        .p_attachments = &attachments,
        .width = extent.width,
        .height = extent.height,
        .layers = 1,
    };

    var framebuffer: vk.Framebuffer = .null;
    return switch (vk.createFramebuffer(device, &create_info, null, &framebuffer)) {
        .success => framebuffer,
        else => error.FailedToCreateFramebuffer,
    };
}

fn createDescriptorSetLayout(device: vk.Device) !vk.DescriptorSetLayout {
    const ubo_layout_binding = vk.DescriptorSetLayoutBinding{
        .binding = 0,
        .descriptor_type = .uniform_buffer,
        .descriptor_count = 1,
        .stage_flags = .init(.vertex_bit),
        .p_immutable_samplers = null,
    };

    const create_info = vk.DescriptorSetLayoutCreateInfo{
        .binding_count = 1,
        .p_bindings = &ubo_layout_binding,
    };

    var descriptor_set_layout: vk.DescriptorSetLayout = .null;
    return switch (vk.createDescriptorSetLayout(
        device,
        &create_info,
        null,
        &descriptor_set_layout,
    )) {
        .success => descriptor_set_layout,
        else => error.FailedToCreateDescriptorSetLayout,
    };
}

fn createGraphicsPipelineLayout(
    device: vk.Device,
    descriptor_set_layout: *vk.DescriptorSetLayout,
) !vk.PipelineLayout {
    const create_info = vk.PipelineLayoutCreateInfo{
        .set_layout_count = 1,
        .p_set_layouts = descriptor_set_layout,
        .push_constant_range_count = 0,
        .p_push_constant_ranges = null,
    };

    var pipeline_layout: vk.PipelineLayout = .null;
    return switch (vk.createPipelineLayout(device, &create_info, null, &pipeline_layout)) {
        .success => pipeline_layout,
        else => return error.FailedToCreatePipelineLayout,
    };
}

fn createGraphicsPipeline(
    allo: std.mem.Allocator,
    device: vk.Device,
    render_pass: vk.RenderPass,
    pipeline_layout: vk.PipelineLayout,
) !vk.Pipeline {
    const vert_code = try readFile(allo, "tri1.vert.spv");
    defer allo.free(vert_code);

    const frag_code = try readFile(allo, "tri.frag.spv");
    defer allo.free(frag_code);

    const vert_sm = try createShaderModule(device, vert_code);
    defer vk.destroyShaderModule(device, vert_sm, null);

    const frag_sm = try createShaderModule(device, frag_code);
    defer vk.destroyShaderModule(device, frag_sm, null);

    const vert_create_info = vk.PipelineShaderStageCreateInfo{
        .stage = .vertex_bit,
        .module = vert_sm,
        .p_name = "main",
    };

    const frag_create_info = vk.PipelineShaderStageCreateInfo{
        .stage = .fragment_bit,
        .module = frag_sm,
        .p_name = "main",
    };

    const shader_stages = [_]vk.PipelineShaderStageCreateInfo{
        vert_create_info,
        frag_create_info,
    };

    var viad: [2]vk.VertexInputAttributeDescription = undefined;
    Vertex.getAttributeDescriptions(&viad);
    var vibd: [1]vk.VertexInputBindingDescription = undefined;
    vibd[0] = Vertex.getBindingDescription();

    const vertex_input_info = vk.PipelineVertexInputStateCreateInfo{
        .vertex_attribute_description_count = @truncate(viad.len),
        .p_vertex_attribute_descriptions = &viad,
        .vertex_binding_description_count = @truncate(vibd.len),
        .p_vertex_binding_descriptions = &vibd,
    };

    const input_assembly = vk.PipelineInputAssemblyStateCreateInfo{
        .topology = .triangle_list,
        .primitive_restart_enable = .false,
    };

    const viewport_state = vk.PipelineViewportStateCreateInfo{
        .viewport_count = 1,
        .scissor_count = 1,
    };

    const rasterizer = vk.PipelineRasterizationStateCreateInfo{
        .depth_clamp_enable = .false,
        .rasterizer_discard_enable = .false,
        .polygon_mode = .fill,
        .line_width = 1,
        .cull_mode = .init(.back_bit),
        .front_face = .clockwise,
        .depth_bias_enable = .false,
        // .depth_bias_constant_factor = 0,
        // .depth_bias_clamp = 0,
        // .depth_bias_slope_factor = 0,
    };

    const multisampling = vk.PipelineMultisampleStateCreateInfo{
        .sample_shading_enable = .false,
        .rasterization_samples = .@"1_bit",
        // .min_sample_shading = 1,
        // .p_sample_mask = null,
        // .alpha_to_coverage_enable = .false,
        // .alpha_to_one_enable = .false,
    };

    const color_blend_attachment = vk.PipelineColorBlendAttachmentState{
        .color_write_mask = .initMany(&.{ .r_bit, .g_bit, .b_bit, .a_bit }),
        .blend_enable = .false,
        // .src_color_blend_factor = .src_alpha,
        // .dst_color_blend_factor = .one_minus_src_alpha,
        // .color_blend_op = .add,
        // .src_alpha_blend_factor = .one,
        // .dst_alpha_blend_factor = .zero,
        // .alpha_blend_op = .add,
    };

    const color_blending = vk.PipelineColorBlendStateCreateInfo{
        .logic_op_enable = .false,
        .logic_op = .copy,
        .attachment_count = 1,
        .p_attachments = &color_blend_attachment,
        .blend_constants = [4]f32{ 0, 0, 0, 0 },
    };

    const dynamic_states = [_]vk.DynamicState{
        .viewport,
        .scissor,
    };
    const dynamic_state = vk.PipelineDynamicStateCreateInfo{
        .dynamic_state_count = @truncate(dynamic_states.len),
        .p_dynamic_states = &dynamic_states,
    };

    const create_info = vk.GraphicsPipelineCreateInfo{
        .stage_count = @truncate(shader_stages.len),
        .p_stages = &shader_stages,
        .p_vertex_input_state = &vertex_input_info,
        .p_input_assembly_state = &input_assembly,
        .p_viewport_state = &viewport_state,
        .p_rasterization_state = &rasterizer,
        .p_multisample_state = &multisampling,
        .p_depth_stencil_state = null,
        .p_color_blend_state = &color_blending,
        .p_dynamic_state = &dynamic_state,
        .layout = pipeline_layout,
        .render_pass = render_pass,
        .subpass = 0,
        .base_pipeline_handle = .null,
        // .base_pipeline_index = -1,
    };

    var pipeline: vk.Pipeline = .null;
    return switch (vk.createGraphicsPipelines(device, .null, 1, &create_info, null, &pipeline)) {
        .success => pipeline,
        else => return error.FailedToCreateGraphicsPipeline,
    };
}

fn readFile(allo: std.mem.Allocator, filename: []const u8) ![]const u8 {
    var exe_path_buf: [1024]u8 = undefined;
    const exe_path = try std.fs.selfExePath(&exe_path_buf);
    const idx = std.mem.indexOf(u8, exe_path, "zig-out").?;
    const basepath = exe_path[0..idx];
    const path = try std.fs.path.join(allo, &.{ basepath, "src", "Shaders", filename });
    defer allo.free(path);
    var file = try std.fs.openFileAbsolute(path, .{ .mode = .read_only });
    defer file.close();
    const code = try file.readToEndAlloc(allo, 1024 * 1024);
    return code;
}

fn createShaderModule(device: vk.Device, code: []const u8) !vk.ShaderModule {
    const create_info = vk.ShaderModuleCreateInfo{
        .code_size = @truncate(code.len),
        .p_code = @ptrCast(@alignCast(code.ptr)),
    };

    var shader_module: vk.ShaderModule = .null;
    return switch (vk.createShaderModule(
        device,
        &create_info,
        null,
        &shader_module,
    )) {
        .success => shader_module,
        else => error.FailedToCreateShaderModule,
    };
}

fn createCommandPool(
    surface: vk.SurfaceKHR,
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
) !vk.CommandPool {
    const qfi = QFI.init(surface, physical_device) catch unreachable;

    const create_info = vk.CommandPoolCreateInfo{
        .flags = .init(.reset_command_buffer_bit),
        .queue_family_index = qfi.graphics_family.?,
    };

    var command_pool: vk.CommandPool = .null;
    return switch (vk.createCommandPool(device, &create_info, null, &command_pool)) {
        .success => command_pool,
        else => return error.FailedToCreateCommandPool,
    };
}

fn createBufferAndMemory(
    comptime T: type,
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    graphics_queue: vk.Queue,
    command_pool: vk.CommandPool,
    buffer: *vk.Buffer,
    buffer_memory: *vk.DeviceMemory,
    bit_type: vk.BufferUsageFlagBits,
    data: []const T,
) !void {
    const buffer_size = @sizeOf(T) * data.len;
    const staging_buffer = try createBuffer(
        device,
        buffer_size,
        .init(.transfer_src_bit),
    );
    defer vk.destroyBuffer(device, staging_buffer, null);

    const staging_buffer_memory = try createBufferMemory(
        physical_device,
        device,
        staging_buffer,
        .initMany(&.{ .host_visible_bit, .host_coherent_bit }),
    );
    defer vk.freeMemory(device, staging_buffer_memory, null);

    {
        var gpu_ptr: ?*anyopaque = null;
        switch (vk.mapMemory(
            device,
            staging_buffer_memory,
            0,
            buffer_size,
            .initEmpty(),
            &gpu_ptr,
        )) {
            .success => {},
            else => return error.FailedToMapMemory,
        }
        defer vk.unmapMemory(device, staging_buffer_memory);
        var gpu_data: [*]T = @ptrCast(@alignCast(gpu_ptr));
        @memcpy(gpu_data[0..data.len], data);
    }

    buffer.* = try createBuffer(
        device,
        buffer_size,
        .initMany(&.{ .transfer_dst_bit, bit_type }),
    );
    buffer_memory.* = try createBufferMemory(
        physical_device,
        device,
        buffer.*,
        .initMany(&.{.device_local_bit}),
    );

    try copyBuffer(
        device,
        command_pool,
        graphics_queue,
        staging_buffer,
        buffer.*,
        buffer_size,
    );
}

fn createBuffer(
    device: vk.Device,
    size: vk.DeviceSize,
    usage: vk.BufferUsageFlags,
) !vk.Buffer {
    const create_info = vk.BufferCreateInfo{
        .size = size,
        .usage = usage,
        .sharing_mode = .exclusive,
    };

    var buffer: vk.Buffer = .null;
    return switch (vk.createBuffer(device, &create_info, null, &buffer)) {
        .success => buffer,
        else => error.FailedToCreateBuffer,
    };
}

fn createBufferMemory(
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    buffer: vk.Buffer,
    props: vk.MemoryPropertyFlags,
) !vk.DeviceMemory {
    var mem_reqs: vk.MemoryRequirements = .{};
    vk.getBufferMemoryRequirements(device, buffer, &mem_reqs);

    const alloc_info = vk.MemoryAllocateInfo{
        .allocation_size = mem_reqs.size,
        .memory_type_index = try findMemoryType(
            physical_device,
            mem_reqs.memory_type_bits,
            props,
        ),
    };

    var memory: vk.DeviceMemory = .null;
    switch (vk.allocateMemory(device, &alloc_info, null, &memory)) {
        .success => {},
        else => return error.FailedToAllocateMemory,
    }

    return switch (vk.bindBufferMemory(device, buffer, memory, 0)) {
        .success => memory,
        else => error.FailedToBindBufferMemory,
    };
}

fn copyBuffer(
    device: vk.Device,
    command_pool: vk.CommandPool,
    graphics_queue: vk.Queue,
    src: vk.Buffer,
    dst: vk.Buffer,
    size: vk.DeviceSize,
) !void {
    // allocate command buffers
    const alloc_info = vk.CommandBufferAllocateInfo{
        .level = .primary,
        .command_pool = command_pool,
        .command_buffer_count = 1,
    };
    var command_buffer: vk.CommandBuffer = .null;
    switch (vk.allocateCommandBuffers(device, &alloc_info, &command_buffer)) {
        .success => {},
        else => return error.FailedToAllocateCommandBuffer,
    }
    defer vk.freeCommandBuffers(device, command_pool, 1, &command_buffer);
    // begin + end command buffer
    const begin_info = vk.CommandBufferBeginInfo{
        .flags = .init(.one_time_submit_bit),
    };
    switch (vk.beginCommandBuffer(command_buffer, &begin_info)) {
        .success => {},
        else => return error.FailedToBeginCommandBuffer,
    }
    var copy_region = vk.BufferCopy{
        .size = size,
    };
    vk.cmdCopyBuffer(command_buffer, src, dst, 1, &copy_region);
    switch (vk.endCommandBuffer(command_buffer)) {
        .success => {},
        else => return error.FailedToEndCommandBuffer,
    }

    // submit
    const submit_info = vk.SubmitInfo{
        .command_buffer_count = 1,
        .p_command_buffers = &command_buffer,
    };

    switch (vk.queueSubmit(graphics_queue, 1, &submit_info, .null)) {
        .success => {},
        else => return error.FailedToSubmitQueue,
    }

    switch (vk.queueWaitIdle(graphics_queue)) {
        .success => {},
        else => return error.FailedToIdleQueue,
    }
}

fn findMemoryType(
    physical_device: vk.PhysicalDevice,
    type_filter: u32,
    props: vk.MemoryPropertyFlags,
) !u32 {
    var mem_props: vk.PhysicalDeviceMemoryProperties = .{};
    vk.getPhysicalDeviceMemoryProperties(physical_device, &mem_props);

    for (0..mem_props.memory_type_count) |i| {
        const tf = @as(u32, 1) << @truncate(i);
        if ((type_filter & tf) == 0) continue;
        if (mem_props.memory_types[i].property_flags.eql(props)) {
            return @truncate(i);
        }
    } else return error.FailedToFindSuitableMemoryType;
}

fn createUniformBuffers(
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    p_uniform_buffers: *[MAX_FRAMES_IN_FLIGHT]vk.Buffer,
    p_uniform_buffer_memories: *[MAX_FRAMES_IN_FLIGHT]vk.DeviceMemory,
    p_uniform_buffer_maps: *[MAX_FRAMES_IN_FLIGHT]?*anyopaque,
) !void {
    const buffer_size = @sizeOf(UBO);
    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        p_uniform_buffers[i] = try createBuffer(device, buffer_size, .init(.uniform_buffer_bit));
        p_uniform_buffer_memories[i] = try createBufferMemory(
            physical_device,
            device,
            p_uniform_buffers[i],
            .initMany(&.{ .host_visible_bit, .host_coherent_bit }),
        );
        switch (vk.mapMemory(
            device,
            p_uniform_buffer_memories[i],
            0,
            buffer_size,
            .initEmpty(),
            &p_uniform_buffer_maps[i],
        )) {
            .success => {},
            else => return error.FailedToMapMemory,
        }
    }
}

fn createCommandBuffers(
    device: vk.Device,
    command_pool: vk.CommandPool,
    command_buffers: *[3]vk.CommandBuffer,
) !void {
    // primary = can be submitted for to gpu as fn calls but not referenced
    // secondary = can be referenced by other command buffers but not submitted
    const alloc_info = vk.CommandBufferAllocateInfo{
        .command_pool = command_pool,
        .level = .primary,
        .command_buffer_count = MAX_FRAMES_IN_FLIGHT,
    };
    switch (vk.allocateCommandBuffers(device, &alloc_info, command_buffers)) {
        .success => {},
        else => return error.FailedToCreateCommandBuffer,
    }
    // he writes begin info here - like whaaaat?
}

fn recordCommandBuffer(self: *Engine, image_index: u32) !void {
    const command_buffer = self.command_buffers[self.current_frame];
    // command buffer begin info
    const cb_begin_info = vk.CommandBufferBeginInfo{};
    switch (vk.beginCommandBuffer(
        command_buffer,
        &cb_begin_info,
    )) {
        .success => {},
        else => return error.FailedToBeginCommandBuffer,
    }
    // render pass begin info
    // index 0 = color, index 1 = depth
    const clear_values = [_]vk.ClearValue{
        .{
            .color = .{ .float32 = [4]f32{ 0, 0, 0, 0 } },
        },
        .{
            .depth_stencil = .{ .depth = 1, .stencil = 0 },
        },
    };
    const rp_begin_info = vk.RenderPassBeginInfo{
        .render_pass = self.render_pass,
        .framebuffer = self.framebuffers[image_index],
        .render_area = .{
            .offset = .{ .x = 0, .y = 0 },
            .extent = self.extent, // for high density displays - extent > window size
        },
        .clear_value_count = @truncate(clear_values.len),
        .p_clear_values = &clear_values,
    };

    vk.cmdBeginRenderPass(command_buffer, &rp_begin_info, .@"inline");
    // inline = subsequent calls will be directly embedded in primary command buffer
    // no secondary command buffers will be used
    // other option = secondary = allows secondary command buffers
    // cannot use both at same time
    {
        vk.cmdBindPipeline(command_buffer, .graphics, self.pipeline);
        // .bind_point_graphics - graphhics pipeline
        // other options = compute or raytracing

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

        const vertex_buffers = [_]vk.Buffer{self.vertex_buffer};
        const offsets = [_]vk.DeviceSize{0};
        vk.cmdBindVertexBuffers(command_buffer, 0, 1, &vertex_buffers, &offsets);
        vk.cmdBindIndexBuffer(command_buffer, self.index_buffer, 0, .uint16);
        vk.cmdDrawIndexed(command_buffer, indices.len, 1, 0, 0, 0);

        vk.cmdDraw(command_buffer, @as(u32, @truncate(vertices.len)), 1, 0, 0);
        // 3 1 0 0 = 3 vertices but only 1 instance
        // instance = for particles or to show many objects
    }
    vk.cmdEndRenderPass(command_buffer);

    switch (vk.endCommandBuffer(command_buffer)) {
        .success => {},
        else => return error.FailedToRecordCommandBuffer,
    }
}

fn createSemaphore(device: vk.Device) !vk.Semaphore {
    const create_info = vk.SemaphoreCreateInfo{};
    var semaphore: vk.Semaphore = .null;
    return switch (vk.createSemaphore(device, &create_info, null, &semaphore)) {
        .success => semaphore,
        else => error.FailedToCreateSemaphore,
    };
}

fn createFence(device: vk.Device) !vk.Fence {
    const create_info = vk.FenceCreateInfo{
        .flags = .init(.signaled_bit),
    };
    var fence: vk.Fence = .null;
    return switch (vk.createFence(device, &create_info, null, &fence)) {
        .success => fence,
        else => error.FailedToCreateFence,
    };
}

fn drawFrame(self: *Engine) !void {
    _ = vk.waitForFences(
        self.device,
        1,
        &self.in_flight_fences[self.current_frame],
        .true,
        MAX_U64,
    );

    var image_index: u32 = 0; // fixes deadlock
    switch (vk.acquireNextImageKHR(
        self.device,
        self.swapchain,
        MAX_U64,
        self.image_available_semaphores[self.current_frame],
        .null,
        &image_index,
    )) {
        .success, .suboptimal_khr => {},
        .error_out_of_date_khr => {
            try self.recreateSwapchain();
            return;
        },
        else => return error.FailedToAcquireSwapchainImage,
    }

    self.updateUniformBuffer(self.current_frame);

    _ = vk.resetFences(
        self.device,
        1,
        &self.in_flight_fences[self.current_frame],
    );

    // .release_resources_bit
    _ = vk.resetCommandBuffer(
        self.command_buffers[self.current_frame],
        .init(.release_resources_bit),
    );
    try self.recordCommandBuffer(image_index);

    const wait_semaphores = [_]vk.Semaphore{self.image_available_semaphores[self.current_frame]};
    const wait_stages = [_]vk.PipelineStageFlags{.init(.color_attachment_output_bit)};
    const signal_semaphores = [_]vk.Semaphore{self.render_finished_semaphores[self.current_frame]};

    const submit_info = vk.SubmitInfo{
        .wait_semaphore_count = @truncate(wait_semaphores.len),
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

    const swapchains = [_]vk.SwapchainKHR{self.swapchain};
    const present_info = vk.PresentInfoKHR{
        .wait_semaphore_count = 1,
        .p_wait_semaphores = &signal_semaphores,
        .swapchain_count = 1,
        .p_swapchains = &swapchains,
        .p_image_indices = &image_index,
        .p_results = null,
    };

    switch (vk.queuePresentKHR(self.present_queue, &present_info)) {
        .success => {},
        .error_out_of_date_khr, .suboptimal_khr => {
            try self.recreateSwapchain();
        },
        else => return error.FailedToPresentQueue,
    }

    self.current_frame = @mod(self.current_frame + 1, MAX_FRAMES_IN_FLIGHT);
}

fn recreateSwapchain(self: *Engine) !void {
    // wait for window to resize before running - otherwise stall here
    var size = self.window.clientSize();
    while (size.w == 0 or size.h == 0) {
        size = self.window.clientSize();
        std.Thread.sleep(1_000_000); // sleep for 1ms
    }

    switch (vk.deviceWaitIdle(self.device)) {
        .success => {},
        else => return error.FailedToIdle,
    }

    // deinit old swapchain
    self.deinitSwapchain();

    // recreate swapchain
    const ssd = try SSD.init(self.surface, self.physical_device);
    self.swapchain = try createSwapchain(
        &self.window,
        self.surface,
        self.physical_device,
        self.device,
        &ssd,
    );
    self.format = ssd.chooseFormat();
    self.extent = ssd.chooseExtent(&self.window);
    self.n_images = try getNumImages(self.device, self.swapchain);
    try createImages(self.device, self.swapchain, &self.n_images, &self.images);
    for (0..self.n_images) |i| {
        self.image_views[i] = try createImageView(self.device, self.format.format, self.images[i]);
        self.framebuffers[i] = try createFramebuffer(self.device, self.extent, self.image_views[i], self.render_pass);
    }
}

fn deinitSwapchain(self: *Engine) void {
    for (self.framebuffers) |framebuffer| //
        vk.destroyFramebuffer(self.device, framebuffer, null);
    for (self.image_views) |image_view| //
        vk.destroyImageView(self.device, image_view, null);
    vk.destroySwapchainKHR(self.device, self.swapchain, null);
}

fn updateUniformBuffer(self: *Engine, current_image: u32) void {
    const diff: f32 = self.chrono.diff();
    _ = diff;
    var ubo = [_]UBO{
        .{
            .model = Matrix.ones(),
            .view = Matrix.ones(),
            .proj = Matrix.ones(),
        },
    };
    // ubo[0].proj.data[1][1] *= -1;

    var gpu_data: [*]UBO = @ptrCast(@alignCast(self.uniform_buffer_maps[current_image]));
    @memcpy(gpu_data[0..1], &ubo);
}

fn deg2rad(deg: f32) f32 {
    return degreesToRadians(deg);
}
