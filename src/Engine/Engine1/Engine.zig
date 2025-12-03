const std = @import("std");
const Extensions = @import("Extensions.zig");
const QFI = @import("QueueFamilyIndices.zig");
const SSD = @import("SwapchainSupportDetails.zig");
const Vertex = @import("Vertex.zig");
const Window = @import("Window.zig");
const vk = @import("../../vulkan/vulkan.zig");
const MAX_U64 = std.math.maxInt(u64);
const MAX_FRAMES_IN_FLIGHT: u32 = 2;
const vertices = [_]Vertex{
    .{ .pos = [_]f32{ 0.0, -0.5 }, .color = [_]f32{ 1, 0, 1 } },
    .{ .pos = [_]f32{ 0.5, 0.5 }, .color = [_]f32{ 1, 1, 0 } },
    .{ .pos = [_]f32{ -0.5, 0.5 }, .color = [_]f32{ 0, 1, 1 } },
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
swapchain_format: vk.Format = .b8g8r8_srgb,
swapchain_extent: vk.Extent2D = .{ .width = 800, .height = 600 },
swapchain_n_images: u32 = 0,
swapchain_images: [3]vk.Image = [_]vk.Image{.null} ** 3,
swapchain_image_views: [3]vk.ImageView = [_]vk.ImageView{.null} ** 3,
swapchain_framebuffers: [3]vk.Framebuffer = [_]vk.Framebuffer{.null} ** 3,
// pipeline
render_pass: vk.RenderPass = .null,
pipeline_layout: vk.PipelineLayout = .null,
pipeline: vk.Pipeline = .null,
// commands
command_pool: vk.CommandPool = .null,
command_buffers: [MAX_FRAMES_IN_FLIGHT]vk.CommandBuffer = [_]vk.CommandBuffer{.null} ** MAX_FRAMES_IN_FLIGHT,
vertex_buffer: vk.Buffer = .null,
vertex_buffer_memory: vk.DeviceMemory = .null,
index_buffer: vk.Buffer = .null,
index_buffer_memory: vk.DeviceMemory = .null,
// sync objects
image_available_semaphores: [MAX_FRAMES_IN_FLIGHT]vk.Semaphore = [_]vk.Semaphore{.null} ** MAX_FRAMES_IN_FLIGHT,
render_finished_semaphores: [MAX_FRAMES_IN_FLIGHT]vk.Semaphore = [_]vk.Semaphore{.null} ** MAX_FRAMES_IN_FLIGHT,
in_flight_fences: [MAX_FRAMES_IN_FLIGHT]vk.Fence = [_]vk.Fence{.null} ** MAX_FRAMES_IN_FLIGHT,
// flags
current_frame: u32 = 0,
framebuffer_resized: bool = false,

pub fn init(
    allo: std.mem.Allocator,
    comptime name: [*:0]const u8,
    comptime title: [*:0]const u8,
    extent: vk.Extent2D,
) !Engine {
    // _ = allo;
    var self: Engine = .{};

    // required extensions
    const ries = [_][*:0]const u8{
        vk.ExtensionName.surface,
        vk.ExtensionName.win32_surface,
    };
    const rdes = [_][*:0]const u8{vk.ExtensionName.swapchain};

    // device
    self.window = try createWindow(name, title, extent);
    self.instance = try createInstance(&ries);
    self.surface = try self.createSurface();
    self.physical_device = try self.pickPhysicalDevice();
    self.device = try self.createLogicalDevice(&rdes);
    const qfi = try QFI.init(self.surface, self.physical_device);
    self.graphics_queue = self.getQueue(qfi.graphics_family.?);
    self.present_queue = self.getQueue(qfi.present_family.?);

    // swapchain
    self.swapchain = try self.createSwapchain();
    const ssd = try SSD.init(self.surface, self.physical_device);
    self.swapchain_extent = ssd.chooseExtent(&self.window);
    self.swapchain_format = ssd.chooseSurfaceFormat().format;
    self.swapchain_n_images = try self.getNumSwapchainImages();
    try self.getSwapchainImages();
    for (0..self.swapchain_n_images) |i|
        self.swapchain_image_views[i] = try self.createSwapchainImageView(i);

    self.render_pass = try self.createRenderPass();
    for (0..self.swapchain_n_images) |i|
        self.swapchain_framebuffers[i] = try self.createSwapchainFramebuffer(i);

    self.pipeline_layout = try self.createPipelineLayout();
    self.pipeline = try self.createGraphicsPipeline(allo);

    self.command_pool = try self.createCommandPool();
    try self.allocCommandBuffers();

    self.vertex_buffer = try self.createBuffer(&vertices);
    self.vertex_buffer_memory = try self.createBufferMemory(self.vertex_buffer);
    try self.bindBufferMemory(self.vertex_buffer, self.vertex_buffer_memory, 0);
    try self.mapMemory(self.vertex_buffer_memory, &vertices);

    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        self.image_available_semaphores[i] = try self.createSemaphore();
        self.render_finished_semaphores[i] = try self.createSemaphore();
        self.in_flight_fences[i] = try self.createFence();
    }

    self.window.show();

    return self;
}

pub fn deinit(self: *Engine) void {
    self.destroySwapchain();

    vk.destroyBuffer(self.device, self.vertex_buffer, null);
    vk.freeMemory(self.device, self.vertex_buffer_memory, null);

    vk.destroyPipeline(self.device, self.pipeline, null);
    vk.destroyPipelineLayout(self.device, self.pipeline_layout, null);

    vk.destroyRenderPass(self.device, self.render_pass, null);

    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        vk.destroyFence(self.device, self.in_flight_fences[i], null);
        vk.destroySemaphore(self.device, self.render_finished_semaphores[i], null);
        vk.destroySemaphore(self.device, self.image_available_semaphores[i], null);
    }

    vk.destroyCommandPool(self.device, self.command_pool, null);

    vk.destroyDevice(self.device, null);
    vk.destroySurfaceKHR(self.instance, self.surface, null);
    vk.destroyInstance(self.instance, null);
    self.window.deinit();
}

pub fn run(self: *Engine) !void {
    while (!self.window.shouldClose()) {
        try self.drawFrame();
        self.window.poll();
    }

    try switch (vk.deviceWaitIdle(self.device)) {
        .success => {},
        else => error.FailedToIdleDevice,
    };
}

fn createWindow(
    comptime name: [*:0]const u8,
    comptime title: [*:0]const u8,
    extent: vk.Extent2D,
) !Window {
    return try Window.init(std.mem.span(name), std.mem.span(title), extent.width, extent.height);
}

fn createInstance(ries: []const [*:0]const u8) !vk.Instance {
    const app_info = vk.ApplicationInfo{
        .application_version = vk.makeApiVersion(0, 1, 0, 0),
        .p_application_name = "HelloTriangle",
        .engine_version = vk.makeApiVersion(0, 1, 0, 0),
        .p_engine_name = "HelloEngine",
        .api_version = vk.makeApiVersion(0, 1, 0, 0),
    };

    var n_exts: u32 = 0;
    try switch (vk.enumerateInstanceExtensionProperties(null, &n_exts, null)) {
        .success => {},
        else => error.FailedToEnumerateInstanceExtensionProperties,
    };
    if (n_exts == 0) return error.FoundNoInstanceExtensionProperties;

    var exts: [128]vk.ExtensionProperties = undefined;
    try switch (vk.enumerateInstanceExtensionProperties(null, &n_exts, &exts)) {
        .success => {},
        else => error.FailedToEnumerateInstanceExtensionProperties,
    };

    if (!hasRequiredExtensions(ries, exts[0..n_exts])) return error.MissingRequiredInstanceExtensions;

    const create_info = vk.InstanceCreateInfo{
        .flags = switch (@import("builtin").os.tag) {
            .macos => .init(.enumerate_portability_bit_khr),
            else => .initEmpty(),
        },
        .p_application_info = &app_info,
        .enabled_extension_count = @truncate(ries.len),
        .pp_enabled_extension_names = @ptrCast(ries),
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
    };

    var instance: vk.Instance = .null;
    return switch (vk.createInstance(&create_info, null, &instance)) {
        .success => instance,
        else => error.FailedToCreateInstance,
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
        else => error.FailedToCreateWin32Surface,
    };
}

fn pickPhysicalDevice(self: *const Engine) !vk.PhysicalDevice {
    var n_candidates: u32 = 0;
    try switch (vk.enumeratePhysicalDevices(self.instance, &n_candidates, null)) {
        .success => {},
        else => error.FailedToEnumeratePhysicalDevices,
    };
    if (n_candidates == 0) return error.NoGPUsSupportVulkan;

    var candidates: [64]vk.PhysicalDevice = undefined;
    try switch (vk.enumeratePhysicalDevices(self.instance, &n_candidates, &candidates)) {
        .success => {},
        else => error.FailedToEnumeratePhysicalDevices,
    };

    for (candidates) |candidate| {
        if (isCandidateDeviceSuitable(self.surface, candidate)) return candidate;
    }

    return error.FailedToFindSuitableCandidate;
}

fn rateCandidateDevice(candidate: vk.PhysicalDevice) isize {
    var props: vk.PhysicalDeviceProperties = undefined;
    vk.getPhysicalDeviceProperties(candidate, &props);
    var feats: vk.PhysicalDeviceFeatures = undefined;
    vk.getPhysicalDeviceFeatures(candidate, &feats);

    var score: isize = 0;
    switch (props.device_type) {
        .discrete_gpu => score += 1000,
        .virtual_gpu => score += 200,
        .integrated_gpu, .cpu => score += 100,
        else => {},
    }

    score += @intCast(props.limits.max_image_dimension_2d);
    score += @intCast(props.limits.max_image_dimension_3d);

    switch (feats.geometry_shader) {
        .false => return 0,
        else => {},
    }

    return score;
}

fn isCandidateDeviceSuitable(surface: vk.SurfaceKHR, candidate: vk.PhysicalDevice) bool {
    const rating = rateCandidateDevice(candidate);
    const qfi = QFI.init(surface, candidate) catch return false;
    const ssd = SSD.init(surface, candidate) catch return false;
    const is_swapchain_adequate = (ssd.n_formats > 0 and ssd.n_present_modes > 0);
    return rating > 1000 and qfi.isComplete() and is_swapchain_adequate;
}

fn createLogicalDevice(self: *const Engine, rdes: []const [*:0]const u8) !vk.Device {
    const qfi = try QFI.init(self.surface, self.physical_device);

    const queue_priority = [_]f32{1.0};
    const qcis = [_]vk.DeviceQueueCreateInfo{
        .{
            .p_queue_priorities = &queue_priority,
            .queue_family_index = qfi.graphics_family.?,
            .queue_count = 1,
        },
        .{
            .p_queue_priorities = &queue_priority,
            .queue_family_index = qfi.present_family.?,
            .queue_count = 1,
        },
    };

    var feats: vk.PhysicalDeviceFeatures = .{};

    var n_exts: u32 = 0;
    try switch (vk.enumerateDeviceExtensionProperties(self.physical_device, null, &n_exts, null)) {
        .success => {},
        else => error.FailedToEnumerateDeviceExtensionProperties,
    };
    if (n_exts == 0) return error.FailedToFindAnyDeviceExtensionProperties;
    if (n_exts > 255) return error.FoundTooManyDeviceExtensionProperties;
    var exts: [255]vk.ExtensionProperties = undefined;
    try switch (vk.enumerateDeviceExtensionProperties(self.physical_device, null, &n_exts, &exts)) {
        .success => {},
        else => error.FailedToEnumerateDeviceExtensionProperties,
    };

    if (!hasRequiredExtensions(rdes, exts[0..n_exts])) return error.MissingRequiredDeviceExtensions;

    const create_info = vk.DeviceCreateInfo{
        .flags = 0,
        .queue_create_info_count = if (qfi.isSameFamily()) 1 else @truncate(qcis.len),
        .p_queue_create_infos = &qcis,
        .enabled_extension_count = @truncate(rdes.len),
        .pp_enabled_extension_names = @ptrCast(rdes),
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
        .p_enabled_features = &feats,
    };

    var device: vk.Device = .null;
    return switch (vk.createDevice(self.physical_device, &create_info, null, &device)) {
        .success => device,
        else => error.FailedToCreateLogicalDevice,
    };
}

fn hasRequiredExtensions(req_exts: []const [*:0]const u8, has_exts: []const vk.ExtensionProperties) bool {
    var none_missing: bool = true;
    outer: for (req_exts) |req_ext| {
        const name1 = std.mem.span(req_ext);
        for (has_exts) |has_ext| {
            const name2 = std.mem.sliceTo(&has_ext.extension_name, 0);
            if (std.mem.eql(u8, name1, name2)) continue :outer;
        }
        std.debug.print("Missing: {s}\n", .{name1});
        none_missing = true;
    }
    return none_missing;
}

fn getQueue(self: *const Engine, value: u32) vk.Queue {
    var queue: vk.Queue = .null;
    vk.getDeviceQueue(self.device, value, 0, &queue);
    return queue;
}

fn createSwapchain(self: *const Engine) !vk.SwapchainKHR {
    const ssd = try SSD.init(self.surface, self.physical_device);
    const extent = ssd.chooseExtent(&self.window);
    const surface_format = ssd.chooseSurfaceFormat();
    const present_mode = ssd.choosePresentMode();

    const qfi = try QFI.init(self.surface, self.physical_device);
    const qfis = [_]u32{ qfi.graphics_family.?, qfi.present_family.? };

    const n_images = if (ssd.capabilities.max_image_count > 0 and ssd.capabilities.max_image_count < ssd.capabilities.min_image_count + 1) ssd.capabilities.max_image_count else ssd.capabilities.min_image_count + 1;

    const create_info = vk.SwapchainCreateInfoKHR{
        .surface = self.surface,
        .min_image_count = n_images,
        .image_format = surface_format.format,
        .image_color_space = surface_format.color_space,
        .image_extent = extent,
        .image_array_layers = 1,
        .image_usage = .init(.color_attachment_bit),
        .image_sharing_mode = if (qfi.isSameFamily()) .exclusive else .concurrent,
        .queue_family_index_count = if (qfi.isSameFamily()) 0 else 2,
        .p_queue_family_indices = if (qfi.isSameFamily()) null else &qfis,
        .pre_transform = ssd.capabilities.current_transform,
        .composite_alpha = .opaque_bit,
        .present_mode = present_mode,
        .clipped = .true,
        .old_swapchain = .null,
    };

    var swapchain: vk.SwapchainKHR = .null;
    return switch (vk.createSwapchainKHR(self.device, &create_info, null, &swapchain)) {
        .success => swapchain,
        else => error.FailedToCreateSwapchain,
    };
}

fn recreateSwapchain(self: *Engine) !void {
    // handle minimization - might be better to handle this at window level instead
    var size = self.window.clientSize();
    while (size.w == 0 or size.h == 0) {
        size = self.window.clientSize();
        self.window.poll();
    }

    try switch (vk.deviceWaitIdle(self.device)) {
        .success => {},
        else => error.FailedToIdleDevice,
    };

    self.destroySwapchain();

    self.swapchain = try self.createSwapchain();
    const ssd = try SSD.init(self.surface, self.physical_device);
    self.swapchain_format = ssd.chooseSurfaceFormat().format;
    self.swapchain_extent = ssd.chooseExtent(&self.window);
    self.swapchain_n_images = try self.getNumSwapchainImages();
    try self.getSwapchainImages();
    for (0..self.swapchain_n_images) |i| {
        self.swapchain_image_views[i] = try self.createSwapchainImageView(i);
        self.swapchain_framebuffers[i] = try self.createSwapchainFramebuffer(i);
    }
}

fn destroySwapchain(self: *Engine) void {
    for (0..self.swapchain_n_images) |i| {
        vk.destroyFramebuffer(self.device, self.swapchain_framebuffers[i], null);
        vk.destroyImageView(self.device, self.swapchain_image_views[i], null);
    }
    self.swapchain_n_images = 0;
    self.swapchain_images = [_]vk.Image{.null} ** 3;
    vk.destroySwapchainKHR(self.device, self.swapchain, null);
}

fn getNumSwapchainImages(self: *const Engine) !u32 {
    var n_images: u32 = 0;
    return switch (vk.getSwapchainImagesKHR(self.device, self.swapchain, &n_images, null)) {
        .success => blk: {
            if (n_images == 0) return error.FailedToFindSwapchainImages;
            break :blk n_images;
        },
        else => error.FailedToGetSwapchainImages,
    };
}

fn getSwapchainImages(self: *Engine) !void {
    try switch (vk.getSwapchainImagesKHR(self.device, self.swapchain, &self.swapchain_n_images, &self.swapchain_images)) {
        .success => {},
        else => error.FailedToGetSwapchainImages,
    };
}

fn createSwapchainImageView(self: *const Engine, i: usize) !vk.ImageView {
    const create_info = vk.ImageViewCreateInfo{
        .image = self.swapchain_images[i],
        .view_type = .@"2d",
        .format = self.swapchain_format,
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
        else => error.FailedToCreateImageView,
    };
}

fn createRenderPass(self: *const Engine) !vk.RenderPass {
    const color_attachment = [_]vk.AttachmentDescription{
        .{
            .format = self.swapchain_format,
            .samples = .@"1_bit",
            .load_op = .clear,
            .store_op = .store,
            .stencil_load_op = .dont_care,
            .stencil_store_op = .dont_care,
            .initial_layout = .undefined,
            .final_layout = .present_src_khr,
        },
    };

    const color_attachment_ref = [_]vk.AttachmentReference{
        .{
            .attachment = 0,
            .layout = .attachment_optimal,
        },
    };

    const subpass = [_]vk.SubpassDescription{
        .{
            .pipeline_bind_point = .graphics,
            .color_attachment_count = @truncate(color_attachment_ref.len),
            .p_color_attachments = &color_attachment_ref,
        },
    };

    const dependencies = [_]vk.SubpassDependency{
        .{
            .src_subpass = vk.SubpassExternal,
            .dst_subpass = 0,
            .src_stage_mask = .init(.color_attachment_output_bit),
            .src_access_mask = .initEmpty(),
            .dst_stage_mask = .init(.color_attachment_output_bit),
            .dst_access_mask = .init(.color_attachment_write_bit),
        },
    };

    const create_info = vk.RenderPassCreateInfo{
        .attachment_count = @truncate(color_attachment.len),
        .p_attachments = &color_attachment,
        .dependency_count = @truncate(dependencies.len),
        .p_dependencies = &dependencies,
        .subpass_count = @truncate(subpass.len),
        .p_subpasses = &subpass,
    };

    var render_pass: vk.RenderPass = .null;
    return switch (vk.createRenderPass(self.device, &create_info, null, &render_pass)) {
        .success => render_pass,
        else => error.FailedToCreateRenderPass,
    };
}

fn createSwapchainFramebuffer(self: *const Engine, i: usize) !vk.Framebuffer {
    const attachments = [_]vk.ImageView{self.swapchain_image_views[i]};

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
        else => error.FailedToCreateFramebuffer,
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
        else => error.FailedToCreatePipelineLayout,
    };
}

fn createGraphicsPipeline(self: *const Engine, allo: std.mem.Allocator) !vk.Pipeline {
    const vert_shader_code = try readFile(allo, "tri.vert.spv");
    defer allo.free(vert_shader_code);

    const frag_shader_code = try readFile(allo, "tri.frag.spv");
    defer allo.free(frag_shader_code);

    const vert_shader_module = try self.createShaderModule(vert_shader_code);
    defer vk.destroyShaderModule(self.device, vert_shader_module, null);

    const frag_shader_module = try self.createShaderModule(frag_shader_code);
    defer vk.destroyShaderModule(self.device, frag_shader_module, null);

    const vss_create_info = vk.PipelineShaderStageCreateInfo{
        .stage = .vertex_bit,
        .module = vert_shader_module,
        .p_name = "main",
    };

    const fss_create_info = vk.PipelineShaderStageCreateInfo{
        .stage = .fragment_bit,
        .module = frag_shader_module,
        .p_name = "main",
    };

    const ss_create_info = [_]vk.PipelineShaderStageCreateInfo{ vss_create_info, fss_create_info };

    var bind_descs: [1]vk.VertexInputBindingDescription = undefined;
    Vertex.getBindingDescription(&bind_descs);

    var attr_descs: [2]vk.VertexInputAttributeDescription = undefined;
    Vertex.getAttributeDescriptions(&attr_descs);

    const vis_create_info = vk.PipelineVertexInputStateCreateInfo{
        .vertex_binding_description_count = @truncate(bind_descs.len),
        .p_vertex_binding_descriptions = &bind_descs,
        .vertex_attribute_description_count = @truncate(attr_descs.len),
        .p_vertex_attribute_descriptions = &attr_descs,
    };

    const ias_create_info = vk.PipelineInputAssemblyStateCreateInfo{
        .topology = .triangle_list,
        .primitive_restart_enable = .false,
    };

    const dynamic_states = [_]vk.DynamicState{
        .viewport,
        .scissor,
    };

    const ds_create_info = vk.PipelineDynamicStateCreateInfo{
        .dynamic_state_count = @truncate(dynamic_states.len),
        .p_dynamic_states = &dynamic_states,
    };

    const vs_create_info = vk.PipelineViewportStateCreateInfo{
        .viewport_count = 1,
        .scissor_count = 1,
    };

    const rs_create_info = vk.PipelineRasterizationStateCreateInfo{
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

    const ms_create_info = vk.PipelineMultisampleStateCreateInfo{
        .sample_shading_enable = .false,
        .rasterization_samples = .@"1_bit",
        .min_sample_shading = 1,
        .p_sample_mask = null,
        .alpha_to_coverage_enable = .false,
        .alpha_to_one_enable = .false,
    };

    const cba = vk.PipelineColorBlendAttachmentState{
        .color_write_mask = .initMany(&.{ .r_bit, .g_bit, .b_bit, .a_bit }),
        .blend_enable = .false,
        .src_color_blend_factor = .one,
        .dst_color_blend_factor = .zero,
        .color_blend_op = .add,
        .src_alpha_blend_factor = .one,
        .dst_alpha_blend_factor = .zero,
        .alpha_blend_op = .add,
    };

    const cbs_create_info = vk.PipelineColorBlendStateCreateInfo{
        .logic_op_enable = .false,
        .logic_op = .copy,
        .attachment_count = 1,
        .p_attachments = &cba,
        .blend_constants = [_]f32{0} ** 4,
    };

    const create_info = vk.GraphicsPipelineCreateInfo{
        .stage_count = @truncate(ss_create_info.len),
        .p_stages = &ss_create_info,
        .p_vertex_input_state = &vis_create_info,
        .p_input_assembly_state = &ias_create_info,
        .p_viewport_state = &vs_create_info,
        .p_rasterization_state = &rs_create_info,
        .p_multisample_state = &ms_create_info,
        .p_depth_stencil_state = null,
        .p_color_blend_state = &cbs_create_info,
        .p_dynamic_state = &ds_create_info,
        .render_pass = self.render_pass,
        .layout = self.pipeline_layout,
        .subpass = 0,
        .base_pipeline_handle = .null,
        .base_pipeline_index = -1,
    };

    var pipeline: vk.Pipeline = .null;
    return switch (vk.createGraphicsPipelines(self.device, .null, 1, &create_info, null, &pipeline)) {
        .success => pipeline,
        else => error.FailedToCreateGraphicsPipeline,
    };
}

fn readFile(allo: std.mem.Allocator, filename: []const u8) ![]const u8 {
    var exe_path_buf: [1024]u8 = undefined;
    var exe_path = std.fs.selfExePath(&exe_path_buf) catch unreachable;
    const idx = std.mem.indexOf(u8, exe_path, "zig-out").?;
    const basepath = exe_path[0..idx];

    const engine_version: []const u8 = "Engine1";
    const path = std.fs.path.join(allo, &.{
        basepath,
        "src",
        "Engine",
        engine_version,
        "Shaders",
        filename,
    }) catch unreachable;
    defer allo.free(path);

    const file = try std.fs.openFileAbsolute(path, .{ .mode = .read_only });
    defer file.close();

    const stat = try file.stat();
    const file_buffer = try allo.alloc(u8, stat.size);
    _ = try file.read(file_buffer);

    return file_buffer;
}

fn isShader(name: []const u8) bool {
    for ([_][]const u8{ "vert", "frag" }) |ext| {
        if (std.mem.endsWith(u8, name, ext)) return true;
    } else return false;
}

fn createShaderModule(self: *const Engine, code: []const u8) !vk.ShaderModule {
    const create_info = vk.ShaderModuleCreateInfo{
        .code_size = @truncate(code.len),
        .p_code = @ptrCast(@alignCast(code)),
    };

    var shader_module: vk.ShaderModule = .null;
    return switch (vk.createShaderModule(self.device, &create_info, null, &shader_module)) {
        .success => shader_module,
        else => error.FailedToCreateShaderModule,
    };
}

fn createCommandPool(self: *const Engine) !vk.CommandPool {
    const qfi = try QFI.init(self.surface, self.physical_device);

    const create_info = vk.CommandPoolCreateInfo{
        .queue_family_index = qfi.graphics_family.?,
        .flags = .initEmpty(),
    };

    var pool: vk.CommandPool = .null;
    return switch (vk.createCommandPool(self.device, &create_info, null, &pool)) {
        .success => pool,
        else => error.FailedToCreateCommandPool,
    };
}

fn allocCommandBuffer(self: *const Engine) !vk.CommandBuffer {
    const alloc_info = vk.CommandBufferAllocateInfo{
        .command_pool = self.command_pool,
        .level = .primary,
        .command_buffer_count = 1,
    };

    var command_buffer: vk.CommandBuffer = .null;
    return switch (vk.allocateCommandBuffers(self.device, &alloc_info, &command_buffer)) {
        .success => command_buffer,
        else => error.FailedToAllocateCommandBuffer,
    };
}

fn createVertexBuffer() vk.Buffer {}
fn createVertexBufferMemory() vk.DeviceMemory {}
fn createIndexBuffer() vk.Buffer {}
fn createIndexBufferMemory() vk.DeviceMemory {}

fn createBuffer(self: *const Engine, data: []const Vertex) !vk.Buffer {
    const create_info = vk.BufferCreateInfo{
        .size = @sizeOf(Vertex) * data.len,
        .usage = .init(.vertex_buffer_bit),
        .sharing_mode = .exclusive,
    };

    var buffer: vk.Buffer = .null;
    return switch (vk.createBuffer(self.device, &create_info, null, &buffer)) {
        .success => buffer,
        else => error.FailedToCreateVertexBuffer,
    };
}

fn createBufferMemory(self: *const Engine, buffer: vk.Buffer) !vk.DeviceMemory {
    var mem_reqs: vk.MemoryRequirements = undefined;
    vk.getBufferMemoryRequirements(self.device, buffer, &mem_reqs);

    const alloc_info = vk.MemoryAllocateInfo{
        .allocation_size = mem_reqs.size,
        .memory_type_index = try self.findMemoryType(mem_reqs.memory_type_bits, .initMany(&.{ .host_visible_bit, .host_coherent_bit })),
    };

    var memory: vk.DeviceMemory = .null;
    return switch (vk.allocateMemory(self.device, &alloc_info, null, &memory)) {
        .success => memory,
        else => error.FailedToAllocateDeviceMemory,
    };
}

fn findMemoryType(self: *const Engine, type_filter: u32, props: vk.MemoryPropertyFlags) !u32 {
    var mem_props: vk.PhysicalDeviceMemoryProperties = undefined;
    vk.getPhysicalDeviceMemoryProperties(self.physical_device, &mem_props);

    for (0..mem_props.memory_type_count) |i| {
        if (((type_filter & (@as(@TypeOf(type_filter), 1) << @truncate(i))) > 0) and (mem_props.memory_types[i].property_flags.bits == props.bits)) {
            return @truncate(i);
        }
    }

    return error.FailedToFindSuitableMemoryType;
}

inline fn bindBufferMemory(self: *const Engine, buffer: vk.Buffer, memory: vk.DeviceMemory, offset: u64) !void {
    try switch (vk.bindBufferMemory(self.device, buffer, memory, offset)) {
        .success => {},
        else => error.FailedToBindBufferMemory,
    };
}

fn mapMemory(self: *const Engine, memory: vk.DeviceMemory, data: []const Vertex) !void {
    var gpu_ptr: ?*anyopaque = null;
    try switch (vk.mapMemory(self.device, memory, 0, @sizeOf(Vertex) * data.len, .initEmpty(), &gpu_ptr)) {
        .success => {},
        else => error.FailedToMapMemory,
    };
    defer vk.unmapMemory(self.device, memory);

    var gpu_data: [*]@TypeOf(data[0]) = @ptrCast(@alignCast(gpu_ptr));
    @memcpy(gpu_data[0..data.len], data);
}

fn allocCommandBuffers(self: *Engine) !void {
    const alloc_info = vk.CommandBufferAllocateInfo{
        .command_pool = self.command_pool,
        .level = .primary,
        .command_buffer_count = MAX_FRAMES_IN_FLIGHT,
    };

    return switch (vk.allocateCommandBuffers(self.device, &alloc_info, &self.command_buffers)) {
        .success => {},
        else => error.FailedToAllocateCommandBuffers,
    };
}

fn recordCommandBuffer(self: *const Engine, command_buffer: vk.CommandBuffer, image_index: u32) !void {
    const cb_begin_info = vk.CommandBufferBeginInfo{
        .flags = .initEmpty(),
        .p_inheritance_info = null,
    };

    try switch (vk.beginCommandBuffer(command_buffer, &cb_begin_info)) {
        .success => {},
        else => error.FailedToBeginRecordingCommandBuffer,
    };

    const clear_color = vk.ClearValue{ .color = .{ .float32 = [4]f32{ 0, 0, 0, 1 } } };
    const rp_begin_info = vk.RenderPassBeginInfo{
        .render_pass = self.render_pass,
        .framebuffer = self.swapchain_framebuffers[image_index],
        .render_area = .{
            .offset = .{ .x = 0, .y = 0 },
            .extent = self.swapchain_extent,
        },
        .clear_value_count = 1,
        .p_clear_values = &clear_color,
    };

    vk.cmdBeginRenderPass(command_buffer, &rp_begin_info, .@"inline");

    vk.cmdBindPipeline(command_buffer, .graphics, self.pipeline);

    const viewport = vk.Viewport{
        .x = 0,
        .y = 0,
        .width = @floatFromInt(self.swapchain_extent.width),
        .height = @floatFromInt(self.swapchain_extent.height),
        .min_depth = 0,
        .max_depth = 1,
    };
    vk.cmdSetViewport(command_buffer, 0, 1, &viewport);

    const scissor = vk.Rect2D{
        .offset = .{ .x = 0, .y = 0 },
        .extent = self.swapchain_extent,
    };
    vk.cmdSetScissor(command_buffer, 0, 1, &scissor);

    vk.cmdBindPipeline(command_buffer, .graphics, self.pipeline);

    const vertex_buffers = [_]vk.Buffer{self.vertex_buffer};
    const offsets = [_]vk.DeviceSize{0};
    vk.cmdBindVertexBuffers(command_buffer, 0, 1, &vertex_buffers, &offsets);

    vk.cmdDraw(command_buffer, @truncate(vertices.len), 1, 0, 0);

    vk.cmdEndRenderPass(command_buffer);

    try switch (vk.endCommandBuffer(command_buffer)) {
        .success => {},
        else => error.FailedToRecordCommandBuffer,
    };
}

fn createSemaphore(self: *const Engine) !vk.Semaphore {
    const create_info = vk.SemaphoreCreateInfo{};

    var semaphore: vk.Semaphore = .null;
    return switch (vk.createSemaphore(self.device, &create_info, null, &semaphore)) {
        .success => semaphore,
        else => error.FailedToCreateSemaphore,
    };
}

fn createFence(self: *const Engine) !vk.Fence {
    const create_info = vk.FenceCreateInfo{
        .flags = .init(.signaled_bit),
    };

    var fence: vk.Fence = .null;
    return switch (vk.createFence(self.device, &create_info, null, &fence)) {
        .success => fence,
        else => error.FailedToCreateFence,
    };
}

fn drawFrame(self: *Engine) !void {
    try switch (vk.waitForFences(self.device, 1, &self.in_flight_fences[self.current_frame], .true, MAX_U64)) {
        .success => {},
        else => error.FailedToWaitForFence,
    };

    var image_index: u32 = undefined;
    try switch (vk.acquireNextImageKHR(self.device, self.swapchain, MAX_U64, self.image_available_semaphores[self.current_frame], .null, &image_index)) {
        .success => {},
        .error_out_of_date_khr => {
            try self.recreateSwapchain();
            return;
        },
        else => error.FailedToAcquireNextImage,
    };

    try switch (vk.resetFences(self.device, 1, &self.in_flight_fences[self.current_frame])) {
        .success => {},
        else => error.FailedToResetFences,
    };

    try switch (vk.resetCommandBuffer(self.command_buffers[self.current_frame], .initEmpty())) {
        .success => {},
        else => error.FailedToResetCommandBuffer,
    };

    try self.recordCommandBuffer(self.command_buffers[self.current_frame], image_index);

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

    try switch (vk.queueSubmit(self.graphics_queue, 1, &submit_info, self.in_flight_fences[self.current_frame])) {
        .success => {},
        else => error.FailedToSubmitDrawCommandBuffer,
    };

    const swapchains = [_]vk.SwapchainKHR{self.swapchain};
    const present_info = vk.PresentInfoKHR{
        .wait_semaphore_count = @truncate(signal_semaphores.len),
        .p_wait_semaphores = &signal_semaphores,
        .swapchain_count = @truncate(swapchains.len),
        .p_swapchains = &swapchains,
        .p_image_indices = &image_index,
        .p_results = null,
    };

    try switch (vk.queuePresentKHR(self.present_queue, &present_info)) {
        .success => {},
        .error_out_of_date_khr, .suboptimal_khr => {
            self.framebuffer_resized = false;
            try self.recreateSwapchain();
        },
        else => error.FailedToPresentQueue,
    };

    self.current_frame = @mod(self.current_frame + 1, MAX_FRAMES_IN_FLIGHT);
}
