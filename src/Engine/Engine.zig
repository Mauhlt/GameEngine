const std = @import("std");
const WindowHandle = @import("WindowHandle.zig");
const vk = @import("..\\vulkan\\vulkan.zig");
const QFI = @import("QueueFamilyIndices.zig");
const SSD = @import("SwapchainSupportDetails.zig");
const required_instance_extensions = [_][*:0]const u8{
    vk.ExtensionName.win32_surface,
    vk.ExtensionName.surface,
};
const required_device_extensions = [_][*:0]const u8{
    vk.ExtensionName.swapchain,
};
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
format: vk.SurfaceFormatKHR = undefined,
extent: vk.Extent2D = .{ .width = 0, .height = 0 },
images: []vk.Image = undefined,
image_views: []vk.ImageView = undefined,
framebuffers: []vk.Framebuffer = undefined,
// pipeline
render_pass: vk.RenderPass = .null,
pipeline_layout: vk.PipelineLayout = .null,
pipeline: vk.Pipeline = .null,
// commands
command_pool: vk.CommandPool = .null,
command_buffer: vk.CommandBuffer = .null,
// sync objects
image_available_semaphore: vk.Semaphore = .null,
render_finished_semaphore: vk.Semaphore = .null,
in_flight_fence: vk.Fence = .null,

pub fn init(
    allo: std.mem.Allocator,
    comptime app_name: [*:0]const u8,
    comptime window_title: [*:0]const u8,
    engine_name: [*:0]const u8,
    width: u32,
    height: u32,
) !Engine {
    var self: Engine = .{};
    // base
    self.window = try WindowHandle.init(
        std.mem.span(app_name),
        std.mem.span(window_title),
        width,
        height,
    );
    errdefer self.window.deinit();

    self.instance = try createInstance(app_name, engine_name);
    errdefer vk.destroyInstance(self.instance, null);

    self.surface = try createSurface(&self.window, self.instance);
    errdefer vk.destroySurfaceKHR(self.instance, self.surface, null);

    self.physical_device = try pickPhysicalDevice(self.instance, self.surface);
    self.device = try createLogicalDevice(self.surface, self.physical_device);
    errdefer vk.destroyDevice(self.device, null);

    // queues
    const indices = QFI.init(self.surface, self.physical_device) catch unreachable;
    self.graphics_queue = getDeviceQueue(self.device, indices.graphics_family);
    self.present_queue = getDeviceQueue(self.device, indices.present_family);

    // swapchain
    const ssd = try SSD.init(self.surface, self.physical_device);
    self.swapchain = try createSwapchain(&self.window, self.surface, self.physical_device, self.device, &ssd);
    errdefer vk.destroySwapchainKHR(self.device, self.swapchain, null);

    self.images = try createImages(allo, self.device, self.swapchain);
    errdefer allo.free(self.images);

    self.format = ssd.chooseFormat();
    self.extent = ssd.chooseExtent(&self.window);
    self.image_views = try createImageViews(allo, self.device, self.format.format, self.images);
    errdefer {
        for (self.image_views) |*image_view| {
            vk.destroyImageView(self.device, image_view.*, null);
        }
    }
    errdefer allo.free(self.image_views);

    self.render_pass = try createRenderPass(self.device, self.format.format);
    errdefer vk.destroyRenderPass(self.device, self.render_pass, null);

    self.framebuffers = try createFramebuffers(allo, self.device, self.extent, self.image_views, self.render_pass);
    errdefer {
        for (self.framebuffers) |*framebuffer| {
            vk.destroyFramebuffer(self.device, framebuffer.*, null);
        }
    }
    errdefer allo.free(self.framebuffers);

    // pipeline
    self.pipeline_layout = try createGraphicsPipelineLayout(self.device);
    errdefer vk.destroyPipelineLayout(self.device, self.pipeline_layout, null);

    self.pipeline = try createGraphicsPipeline(allo, self.device, self.extent, self.render_pass, self.pipeline_layout);
    errdefer vk.destroyPipeline(self.device, self.pipeline, null);

    // commands
    self.command_pool = try createCommandPool(self.surface, self.physical_device, self.device);
    errdefer vk.destroyCommandPool(self.device, self.command_pool, null);
    self.command_buffer = try createCommandBuffer(self.device, self.command_pool);

    // sync objects
    self.image_available_semaphore = try createSemaphore(self.device);
    self.render_finished_semaphore = try createSemaphore(self.device);
    self.in_flight_fence = try createFence(self.device);

    // show window
    self.window.show();

    return self;
}

pub fn deinit(self: *Engine, allo: std.mem.Allocator) void {
    // sync objects
    vk.destroySemaphore(self.device, self.image_available_semaphore, null);
    vk.destroySemaphore(self.device, self.render_finished_semaphore, null);
    vk.destroyFence(self.device, self.in_flight_fence, null);

    // commands
    vk.destroyCommandPool(self.device, self.command_pool, null);

    // swapchain
    for (self.framebuffers) |framebuffer| //
        vk.destroyFramebuffer(self.device, framebuffer, null);
    allo.free(self.framebuffers);

    vk.destroyPipeline(self.device, self.pipeline, null);
    vk.destroyPipelineLayout(self.device, self.pipeline_layout, null);
    vk.destroyRenderPass(self.device, self.render_pass, null);
    for (self.image_views) |image_view| //
        vk.destroyImageView(self.device, image_view, null);
    allo.free(self.image_views);
    allo.free(self.images);
    vk.destroySwapchainKHR(self.device, self.swapchain, null);

    // base
    vk.destroyDevice(self.device, null);
    vk.destroySurfaceKHR(self.instance, self.surface, null);
    vk.destroyInstance(self.instance, null);
    self.window.deinit();
}

pub fn run(self: *Engine) !void {
    while (!self.window.shouldClose()) {
        try self.drawFrame();
    }

    switch (vk.deviceWaitIdle(self.device)) {
        .success => {},
        else => return error.FailedToIdleDevice,
    }
}

fn createInstance(app_name: [*:0]const u8, engine_name: [*:0]const u8) !vk.Instance {
    const app_info = vk.ApplicationInfo{
        .api_version = vk.makeApiVersion(0, 1, 0, 0),
        .application_version = vk.makeApiVersion(0, 1, 0, 0),
        .p_application_name = app_name,
        .engine_version = vk.makeApiVersion(0, 1, 0, 0),
        .p_engine_name = engine_name,
    };

    var n_props: u32 = 0;
    var props: [64]vk.ExtensionProperties = undefined;
    try getInstanceExtensionProperties(&n_props, &props);
    printExtensionProperties("Instance", props[0..n_props]);

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
        const len = std.mem.indexOfScalar(u8, &prop.extension_name, 0) //
            orelse prop.extension_name.len;
        const name = prop.extension_name[0..len];
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
    if (n_devices > 32) return error.TooManyPhysicalDevicesFound;

    var physical_devices: [32]vk.PhysicalDevice = [_]vk.PhysicalDevice{.null} ** 32;
    switch (vk.enumeratePhysicalDevices(instance, &n_devices, &physical_devices)) {
        .success => {},
        else => return error.FailedToEnumeratePhysicalDevices,
    }

    for (physical_devices[0..n_devices]) |physical_device| {
        if (isDeviceSuitable(surface, physical_device)) return physical_device;
    }
    return error.FailedToFindPhysicalDevice;
}

fn isDeviceSuitable(surface: vk.SurfaceKHR, device: vk.PhysicalDevice) bool {
    _ = QFI.init(surface, device) catch return false;
    if (!areDeviceExtensionSupported(device)) return false;
    const ssd = SSD.init(surface, device) catch return false;
    if (ssd.n_formats == 0 or ssd.n_present_modes == 0) return false;
    return true;
}

fn areDeviceExtensionSupported(device: vk.PhysicalDevice) bool {
    var n_props: u32 = 0;
    var props: [256]vk.ExtensionProperties = undefined;
    getDeviceExtensionProperties(device, &n_props, &props) catch return false;

    outer: for (required_device_extensions) |rde| {
        const name1 = std.mem.span(rde);
        for (props[0..n_props]) |prop| {
            const len = std.mem.indexOfScalar(u8, &prop.extension_name, 0).?;
            const name2 = prop.extension_name[0..len];
            if (std.mem.eql(u8, name1, name2)) continue :outer;
        }
        return false;
    }
    return true;
}

fn createLogicalDevice(
    surface: vk.SurfaceKHR,
    physical_device: vk.PhysicalDevice,
) !vk.Device {
    const indices = QFI.init(surface, physical_device) catch unreachable;
    const queue_priority = [1]f32{1};
    const queue_create_infos = [_]vk.DeviceQueueCreateInfo{
        .{
            .queue_family_index = indices.graphics_family,
            .p_queue_priorities = &queue_priority,
            .queue_count = 1,
        },
        .{
            .queue_family_index = indices.present_family,
            .p_queue_priorities = &queue_priority,
            .queue_count = 1,
        },
    };
    const feats: vk.PhysicalDeviceFeatures = .{};

    var n_props: u32 = 0;
    var props: [256]vk.ExtensionProperties = undefined;
    try getDeviceExtensionProperties(physical_device, &n_props, &props);
    printExtensionProperties("Device", props[0..n_props]);

    const create_info = vk.DeviceCreateInfo{
        .p_enabled_features = &feats,
        .queue_create_info_count = if (indices.present_family != indices.graphics_family) //
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
        ssd.capabilities.min_image_count;

    const indices = try QFI.init(surface, physical_device);
    const qfis = [_]u32{ indices.graphics_family, indices.present_family };
    const is_same_family = indices.graphics_family == indices.present_family;
    const create_info = vk.SwapchainCreateInfoKHR{
        .surface = surface,
        .min_image_count = n_images,
        .image_format = format.format,
        .image_color_space = format.color_space,
        .image_extent = extent,
        .image_array_layers = 1,
        .image_usage = .init(.color_attachment_bit),
        .image_sharing_mode = if (is_same_family) .exclusive else .concurrent,
        .queue_family_index_count = if (is_same_family) 0 else 2,
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

fn createImages(
    allo: std.mem.Allocator,
    device: vk.Device,
    swapchain: vk.SwapchainKHR,
) ![]vk.Image {
    var n_images: u32 = 0;
    switch (vk.getSwapchainImagesKHR(device, swapchain, &n_images, null)) {
        .success => {},
        else => return error.FailedToGetSwapchainImages,
    }
    if (n_images == 0) return error.FoundZeroImages;
    std.debug.print("# of Images: {}\n", .{n_images});

    const images: []vk.Image = try allo.alloc(vk.Image, n_images);
    return switch (vk.getSwapchainImagesKHR(device, swapchain, &n_images, images.ptr)) {
        .success => images,
        else => return error.FailedToGetSwapchainImages,
    };
}

fn createImageViews(
    allo: std.mem.Allocator,
    device: vk.Device,
    format: vk.Format,
    images: []vk.Image,
) ![]vk.ImageView {
    const image_views = try allo.alloc(vk.ImageView, images.len);
    for (0..images.len) |i| {
        const create_info = vk.ImageViewCreateInfo{
            .image = images[i],
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

        switch (vk.createImageView(device, &create_info, null, &image_views[i])) {
            .success => {},
            else => return error.FailedToCreateImageView,
        }
    }
    return image_views;
}

fn createFramebuffers(
    allo: std.mem.Allocator,
    device: vk.Device,
    extent: vk.Extent2D,
    image_views: []vk.ImageView,
    render_pass: vk.RenderPass,
) ![]vk.Framebuffer {
    const framebuffers: []vk.Framebuffer = try allo.alloc(vk.Framebuffer, image_views.len);
    for (0..image_views.len) |i| {
        const attachments = [_]vk.ImageView{image_views[i]};

        const create_info = vk.FramebufferCreateInfo{
            .render_pass = render_pass,
            .attachment_count = 1,
            .p_attachments = &attachments,
            .width = extent.width,
            .height = extent.height,
        };

        switch (vk.createFramebuffer(device, &create_info, null, &framebuffers[i])) {
            .success => {},
            else => return error.FailedToCreateFramebuffer,
        }
    }
    return framebuffers;
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

fn createGraphicsPipelineLayout(device: vk.Device) !vk.PipelineLayout {
    const create_info = vk.PipelineLayoutCreateInfo{
        .set_layout_count = 0,
        .p_set_layouts = null,
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
    extent: vk.Extent2D,
    render_pass: vk.RenderPass,
    pipeline_layout: vk.PipelineLayout,
) !vk.Pipeline {
    const vert_code = try readFile(allo, "tri.vert.spv");
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

    const vertex_input_info = vk.PipelineVertexInputStateCreateInfo{
        .vertex_binding_description_count = 0,
        .p_vertex_binding_descriptions = null,
        .vertex_attribute_description_count = 0,
        .p_vertex_attribute_descriptions = null,
    };

    const input_assembly = vk.PipelineInputAssemblyStateCreateInfo{
        .topology = .triangle_list,
        .primitive_restart_enable = .false,
    };

    const viewport = vk.Viewport{
        .x = 0,
        .y = 0,
        .width = @floatFromInt(extent.width),
        .height = @floatFromInt(extent.height),
        .min_depth = 0,
        .max_depth = 1,
    };

    const scissor = vk.Rect2D{
        .offset = .{ .x = 0, .y = 0 },
        .extent = extent,
    };

    const dynamic_states = [_]vk.DynamicState{
        .viewport,
        .scissor,
    };
    const dynamic_state = vk.PipelineDynamicStateCreateInfo{
        .dynamic_state_count = @truncate(dynamic_states.len),
        .p_dynamic_states = &dynamic_states,
    };

    const viewport_state = vk.PipelineViewportStateCreateInfo{
        .viewport_count = 1,
        .p_viewports = &viewport,
        .scissor_count = 1,
        .p_scissors = &scissor,
    };

    const rasterizer = vk.PipelineRasterizationStateCreateInfo{
        .depth_clamp_enable = .false,
        .rasterizer_discard_enable = .false,
        .polygon_mode = .fill,
        .line_width = 1,
        .cull_mode = .init(.back_bit),
        .front_face = .clockwise,
        .depth_bias_enable = .false,
        .depth_bias_constant_factor = 0,
        .depth_bias_clamp = 0,
        .depth_bias_slope_factor = 0,
    };

    const multisampling = vk.PipelineMultisampleStateCreateInfo{
        .sample_shading_enable = .false,
        .rasterization_samples = .@"1_bit",
        .min_sample_shading = 1,
        .p_sample_mask = null,
        .alpha_to_coverage_enable = .false,
        .alpha_to_one_enable = .false,
    };

    const color_blend_attachment = vk.PipelineColorBlendAttachmentState{
        .color_write_mask = .initMany(&.{ .r_bit, .g_bit, .b_bit, .a_bit }),
        .blend_enable = .true,
        .src_color_blend_factor = .src_alpha,
        .dst_color_blend_factor = .one_minus_src_alpha,
        .color_blend_op = .add,
        .src_alpha_blend_factor = .one,
        .dst_alpha_blend_factor = .zero,
        .alpha_blend_op = .add,
    };

    const color_blending = vk.PipelineColorBlendStateCreateInfo{
        .logic_op_enable = .false,
        .logic_op = .copy,
        .attachment_count = 1,
        .p_attachments = &color_blend_attachment,
        .blend_constants = [4]f32{ 0, 0, 0, 0 },
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
        .base_pipeline_index = -1,
    };

    var pipeline: vk.Pipeline = .null;
    return switch (vk.createGraphicsPipelines(device, .null, 1, &create_info, null, &pipeline)) {
        .success => pipeline,
        else => return error.FailedToCreateGraphicsPipeline,
    };
}

fn readFile(allo: std.mem.Allocator, filename: []const u8) ![]const u8 {
    // std.debug.print("Filename: {s}\n", .{@src().file});
    const path = try std.fs.path.join(allo, &.{ "src", "Shaders", filename });
    defer allo.free(path);
    // std.debug.print("Path: {s}\n", .{path});

    var file = try std.fs.cwd().openFile(path, .{ .mode = .read_only });
    defer file.close();

    const code = try file.readToEndAlloc(allo, 1024 * 1024);
    return code;
}

fn createShaderModule(device: vk.Device, code: []const u8) !vk.ShaderModule {
    const create_info = vk.ShaderModuleCreateInfo{
        .code_size = @truncate(code.len),
        .p_code = @ptrCast(@alignCast(code)),
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
    const indices = QFI.init(surface, physical_device) catch unreachable;

    const create_info = vk.CommandPoolCreateInfo{
        .flags = .init(.reset_command_buffer_bit),
        .queue_family_index = indices.graphics_family,
    };

    var command_pool: vk.CommandPool = .null;
    return switch (vk.createCommandPool(device, &create_info, null, &command_pool)) {
        .success => command_pool,
        else => return error.FailedToCreateCommandPool,
    };
}

fn createCommandBuffer(
    device: vk.Device,
    command_pool: vk.CommandPool,
) !vk.CommandBuffer {
    const alloc_info = vk.CommandBufferAllocateInfo{
        .command_pool = command_pool,
        .level = .primary,
        .command_buffer_count = 1,
    };

    var command_buffer: vk.CommandBuffer = .null;
    return switch (vk.allocateCommandBuffers(device, &alloc_info, &command_buffer)) {
        .success => command_buffer,
        else => error.FailedToCreateCommandBuffer,
    };
}

fn recordCommandBuffer(self: *const Engine, image_index: u32) !void {
    // command buffer begin info
    const cb_begin_info = vk.CommandBufferBeginInfo{};
    switch (vk.beginCommandBuffer(self.command_buffer, &cb_begin_info)) {
        .success => {},
        else => return error.FailedToBeginCommandBuffer,
    }
    // render pass begin info
    const clear_values = vk.ClearValue{ .color = .{ .float32 = [4]f32{ 0, 0, 0, 0 } } };
    const rp_begin_info = vk.RenderPassBeginInfo{
        .render_pass = self.render_pass,
        .framebuffer = self.framebuffers[image_index],
        .render_area = .{
            .offset = .{ .x = 0, .y = 0 },
            .extent = self.extent,
        },
        .clear_value_count = 1,
        .p_clear_values = &clear_values,
    };

    vk.cmdBeginRenderPass(self.command_buffer, &rp_begin_info, .@"inline");
    vk.cmdBindPipeline(self.command_buffer, .graphics, self.pipeline);

    const viewport = vk.Viewport{
        .x = 0,
        .y = 0,
        .width = @floatFromInt(self.extent.width),
        .height = @floatFromInt(self.extent.height),
        .min_depth = 0,
        .max_depth = 1,
    };
    vk.cmdSetViewport(self.command_buffer, 0, 1, &viewport);

    const scissor = vk.Rect2D{
        .offset = .{ .x = 0, .y = 0 },
        .extent = self.extent,
    };
    vk.cmdSetScissor(self.command_buffer, 0, 1, &scissor);

    vk.cmdDraw(self.command_buffer, 3, 1, 0, 0);

    vk.cmdEndRenderPass(self.command_buffer);

    switch (vk.endCommandBuffer(self.command_buffer)) {
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
    switch (vk.waitForFences(self.device, 1, &self.in_flight_fence, .true, std.math.maxInt(u64))) {
        .success => {},
        else => return error.FailedToWaitForFences,
    }

    switch (vk.resetFences(self.device, 1, &self.in_flight_fence)) {
        .success => {},
        else => return error.FailedToResetFences,
    }

    var image_index: u32 = 0;
    switch (vk.acquireNextImageKHR(self.device, self.swapchain, std.math.maxInt(u64), self.image_available_semaphore, .null, &image_index)) {
        .success => {},
        else => return error.FailedToAcquireNextImage,
    }

    switch (vk.resetCommandBuffer(self.command_buffer, .initEmpty())) {
        .success => {},
        else => return error.FailedToResetCommandBuffer,
    }

    try self.recordCommandBuffer(image_index);

    const wait_semaphores = [_]vk.Semaphore{self.image_available_semaphore};
    const wait_stages = [_]vk.PipelineStageFlags{.init(.color_attachment_output_bit)};
    const signal_semaphores = [_]vk.Semaphore{self.render_finished_semaphore};

    const submit_info = vk.SubmitInfo{
        .wait_semaphore_count = @truncate(wait_semaphores.len),
        .p_wait_semaphores = &wait_semaphores,
        .p_wait_dst_stage_mask = &wait_stages,
        .command_buffer_count = 1,
        .p_command_buffers = &self.command_buffer,
        .signal_semaphore_count = @truncate(signal_semaphores.len),
        .p_signal_semaphores = &signal_semaphores,
    };

    switch (vk.queueSubmit(self.graphics_queue, 1, &submit_info, self.in_flight_fence)) {
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
        else => return error.FailedToPresentQueue,
    }
}
