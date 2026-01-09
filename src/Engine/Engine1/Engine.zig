const std = @import("std");
const Extensions = @import("Extensions.zig");
const QFI = @import("QueueFamilyIndices.zig");
const SSD = @import("SwapchainSupportDetails.zig");
const Vertex2D = @import("Vertex/Vertex2D.zig");
const Vertex3D = @import("Vertex/Vertex3D.zig");
const Window = @import("Window.zig");
const UBO = @import("UniformBufferObject.zig");
// Math
const Vector = @import("Math/Vec.zig").Vector;
const Matrix = @import("Math/Mat.zig").Matrix;
const V3 = Vector(f32, 3);
const V4 = Vector(f32, 4);
const M4 = Matrix(f32, 4);
const persp = @import("Math/Mat.zig").persp2;
// Model
// const Tri = @import("Models/Triangle.zig");
// const Rect = @import("Models/Rectangle.zig");
const Cube = @import("Models/Cube.zig");
// Vulkan
const vk = @import("../../vulkan/vulkan.zig");
// Zstbi
const zstbi = @import("zstbi");
const zigimg = @import("zigimg");
// Abstract the engine its own file/dir
// Abstract tho app into its own file/dir
const MAX_U64 = std.math.maxInt(u64);
const MAX_FRAMES_IN_FLIGHT: u32 = 2;
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
descriptor_set_layout: vk.DescriptorSetLayout = .null,
pipeline_layout: vk.PipelineLayout = .null,
pipeline: vk.Pipeline = .null,
// commands
command_pool: vk.CommandPool = .null,
// depth
depth_image: vk.Image = .null,
depth_image_memory: vk.DeviceMemory = .null,
depth_image_view: vk.ImageView = .null,
// textures
texture_image: vk.Image = .null,
texture_image_memory: vk.DeviceMemory = .null,
texture_image_view: vk.ImageView = .null,
texture_sampler: vk.Sampler = .null,
// vertex buffers
vertex_buffer: vk.Buffer = .null,
vertex_buffer_memory: vk.DeviceMemory = .null,
// index buffers
index_buffer: vk.Buffer = .null,
index_buffer_memory: vk.DeviceMemory = .null,
// uniform buffers
uniform_buffers: [MAX_FRAMES_IN_FLIGHT]vk.Buffer = [_]vk.Buffer{.null} ** MAX_FRAMES_IN_FLIGHT,
uniform_buffer_memories: [MAX_FRAMES_IN_FLIGHT]vk.DeviceMemory = [_]vk.DeviceMemory{.null} ** MAX_FRAMES_IN_FLIGHT,
uniform_buffer_maps: [MAX_FRAMES_IN_FLIGHT]?*anyopaque = [_]?*anyopaque{null} ** MAX_FRAMES_IN_FLIGHT,
// descriptors
descriptor_pool: vk.DescriptorPool = .null,
descriptor_sets: [MAX_FRAMES_IN_FLIGHT]vk.DescriptorSet = [_]vk.DescriptorSet{.null} ** MAX_FRAMES_IN_FLIGHT,
// command buffers
command_buffers: [MAX_FRAMES_IN_FLIGHT]vk.CommandBuffer = [_]vk.CommandBuffer{.null} ** MAX_FRAMES_IN_FLIGHT,
// sync objects
image_available_semaphores: [MAX_FRAMES_IN_FLIGHT]vk.Semaphore = [_]vk.Semaphore{.null} ** MAX_FRAMES_IN_FLIGHT,
render_finished_semaphores: [MAX_FRAMES_IN_FLIGHT]vk.Semaphore = [_]vk.Semaphore{.null} ** MAX_FRAMES_IN_FLIGHT,
in_flight_fences: [MAX_FRAMES_IN_FLIGHT]vk.Fence = [_]vk.Fence{.null} ** MAX_FRAMES_IN_FLIGHT,
// misc
current_frame: u32 = 0,
framebuffer_resized: bool = false,
// time
start: i128 = 0,
current: i128 = 0,
// models = auto-loaded for now
vertices: @TypeOf(Cube.vertices) = Cube.vertices,
// vertices: [4]Vertex2D = Rect.vertices,
indices: @TypeOf(Cube.indices) = Cube.indices,

pub fn init(
    allo: std.mem.Allocator,
    comptime name: [*:0]const u8,
    comptime title: [*:0]const u8,
    extent: vk.Extent2D,
) !Engine {
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
    // pipeline
    self.descriptor_set_layout = try self.createDescriptorSetLayout();
    self.pipeline_layout = try self.createPipelineLayout();
    self.pipeline = try self.createGraphicsPipeline(allo);
    // command pool
    self.command_pool = try self.createCommandPool();
    try self.allocCommandBuffers();
    // buffers: Depth, Framebuffer, Texture, Vertex, Index, Uniform
    // depth
    try self.createDepthResources();
    // framebuffer
    for (0..self.swapchain_n_images) |i|
        self.swapchain_framebuffers[i] = try self.createSwapchainFramebuffer(i);
    // texture
    try self.createTextureImage(allo); // need to split
    self.texture_image_view = try self.createTextureImageView();
    self.texture_sampler = try self.createTextureSampler();
    // vertex
    try self.createVertexBuffer(&self.vertices); // need to split
    // index
    try self.createIndexBuffer(&self.indices); // need to split
    // uniform
    try self.createUniformBuffers(); // need to split
    // descriptor pool
    self.descriptor_pool = try self.createDescriptorPool();
    try self.allocDescriptorSets(); // must be after uniform buffers + textures
    // sync objects
    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        self.image_available_semaphores[i] = try self.createSemaphore();
        self.render_finished_semaphores[i] = try self.createSemaphore();
        self.in_flight_fences[i] = try self.createFence();
    }
    // update variables
    self.start = std.time.nanoTimestamp();
    // show window
    self.window.show();
    // return
    return self;
}

pub fn deinit(self: *Engine, allo: std.mem.Allocator) void {
    _ = allo;
    // swapchain
    self.destroySwapchain();
    // depth
    // texture
    vk.destroySampler(self.device, self.texture_sampler, null);
    vk.destroyImageView(self.device, self.texture_image_view, null);
    vk.destroyImage(self.device, self.texture_image, null);
    vk.freeMemory(self.device, self.texture_image_memory, null);
    // descriptors
    vk.destroyDescriptorPool(self.device, self.descriptor_pool, null);
    vk.destroyDescriptorSetLayout(self.device, self.descriptor_set_layout, null);
    // uniform buffers
    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        vk.destroyBuffer(self.device, self.uniform_buffers[i], null);
        vk.freeMemory(self.device, self.uniform_buffer_memories[i], null);
    }
    // descriptor set layouts
    vk.destroyDescriptorSetLayout(self.device, self.descriptor_set_layout, null);
    // index buffers
    vk.destroyBuffer(self.device, self.index_buffer, null);
    vk.freeMemory(self.device, self.index_buffer_memory, null);
    // vertex buffers
    vk.destroyBuffer(self.device, self.vertex_buffer, null);
    vk.freeMemory(self.device, self.vertex_buffer_memory, null);
    // pipeline
    vk.destroyPipeline(self.device, self.pipeline, null);
    vk.destroyPipelineLayout(self.device, self.pipeline_layout, null);
    vk.destroyRenderPass(self.device, self.render_pass, null);
    // sync objects
    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        vk.destroyFence(self.device, self.in_flight_fences[i], null);
        vk.destroySemaphore(self.device, self.render_finished_semaphores[i], null);
        vk.destroySemaphore(self.device, self.image_available_semaphores[i], null);
    }
    // command pool
    vk.destroyCommandPool(self.device, self.command_pool, null);
    // base
    vk.destroyDevice(self.device, null);
    vk.destroySurfaceKHR(self.instance, self.surface, null);
    vk.destroyInstance(self.instance, null);
    self.window.deinit();
}

pub fn run(self: *Engine) !void {
    while (!self.window.shouldClose()) {
        try self.drawFrame();
        self.window.poll(); // blocking i/o
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
    return try Window.init(
        std.mem.span(name),
        std.mem.span(title),
        extent.width,
        extent.height,
    );
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

    if (!hasRequiredExtensions(ries, exts[0..n_exts]))
        return error.MissingRequiredInstanceExtensions;

    const instance_state = vk.InstanceCreateInfo{
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
    return switch (vk.createInstance(&instance_state, null, &instance)) {
        .success => instance,
        else => error.FailedToCreateInstance,
    };
}

fn createSurface(self: *const Engine) !vk.SurfaceKHR {
    const surface_state = vk.Win32SurfaceCreateInfoKHR{
        .hinstance = self.window.instance,
        .hwnd = self.window.hwnd,
    };

    var surface: vk.SurfaceKHR = .null;
    return switch (vk.createWin32SurfaceKHR(
        self.instance,
        &surface_state,
        null,
        &surface,
    )) {
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
    for (candidates) |candidate|
        if (isCandidateDeviceSuitable(self.surface, candidate)) return candidate;
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
    // rating
    const has_rating = rateCandidateDevice(candidate) > 1000;
    // qfi
    const qfi = QFI.init(surface, candidate) catch return false;
    // ssd
    const ssd = SSD.init(surface, candidate) catch return false;
    const is_swapchain_adequate = (ssd.n_formats > 0 and ssd.n_present_modes > 0);
    // feats
    var feats: vk.PhysicalDeviceFeatures = .{};
    vk.getPhysicalDeviceFeatures(candidate, &feats);
    // return combo
    return has_rating and qfi.isComplete() and is_swapchain_adequate and feats.sampler_anisotropy == .true;
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
    var feats: vk.PhysicalDeviceFeatures = .{
        .sampler_anisotropy = .true,
    };
    var n_exts: u32 = 0;
    try switch (vk.enumerateDeviceExtensionProperties(
        self.physical_device,
        null,
        &n_exts,
        null,
    )) {
        .success => {},
        else => error.FailedToEnumerateDeviceExtensionProperties,
    };
    if (n_exts == 0) return error.FailedToFindAnyDeviceExtensionProperties;
    if (n_exts > 255) return error.FoundTooManyDeviceExtensionProperties;
    var exts: [255]vk.ExtensionProperties = undefined;
    try switch (vk.enumerateDeviceExtensionProperties(
        self.physical_device,
        null,
        &n_exts,
        &exts,
    )) {
        .success => {},
        else => error.FailedToEnumerateDeviceExtensionProperties,
    };
    if (!hasRequiredExtensions(rdes, exts[0..n_exts]))
        return error.MissingRequiredDeviceExtensions;
    const device_state = vk.DeviceCreateInfo{
        .flags = 0,
        .queue_create_info_count = if (qfi.isSameFamily()) 1 else @truncate(qcis.len),
        .p_queue_create_infos = &qcis,
        .p_enabled_features = &feats,
        .enabled_extension_count = @truncate(rdes.len),
        .pp_enabled_extension_names = @ptrCast(rdes),
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
    };
    var device: vk.Device = .null;
    return switch (vk.createDevice(
        self.physical_device,
        &device_state,
        null,
        &device,
    )) {
        .success => device,
        else => error.FailedToCreateLogicalDevice,
    };
}

fn hasRequiredExtensions(
    req_exts: []const [*:0]const u8,
    has_exts: []const vk.ExtensionProperties,
) bool {
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

    const n_images = if (ssd.capabilities.max_image_count > 0 and
        ssd.capabilities.max_image_count < ssd.capabilities.min_image_count + 1)
        ssd.capabilities.max_image_count
    else
        ssd.capabilities.min_image_count + 1;

    const swapchain_state = vk.SwapchainCreateInfoKHR{
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
    return switch (vk.createSwapchainKHR(self.device, &swapchain_state, null, &swapchain)) {
        .success => swapchain,
        else => error.FailedToCreateSwapchain,
    };
}

fn recreateSwapchain(self: *Engine) !void {
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
    // depth
    vk.destroyImageView(self.device, self.depth_image_view, null);
    vk.destroyImage(self.device, self.depth_image, null);
    vk.freeMemory(self.device, self.depth_image_memory, null);
    // swapchain
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
    return switch (vk.getSwapchainImagesKHR(
        self.device,
        self.swapchain,
        &n_images,
        null,
    )) {
        .success => blk: {
            if (n_images == 0) return error.FailedToFindSwapchainImages;
            break :blk n_images;
        },
        else => error.FailedToGetSwapchainImages,
    };
}

fn getSwapchainImages(self: *Engine) !void {
    try switch (vk.getSwapchainImagesKHR(
        self.device,
        self.swapchain,
        &self.swapchain_n_images,
        &self.swapchain_images,
    )) {
        .success => {},
        else => error.FailedToGetSwapchainImages,
    };
}

fn createSwapchainImageView(self: *const Engine, i: usize) !vk.ImageView {
    return self.createImageView(self.swapchain_images[i], self.swapchain_format);
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

    const depth_attachment = vk.AttachmentDescription{
        .format = try self.findDepthFormat(),
        .samples = .@"1_bit",
        .load_op = .clear,
        .store_op = .dont_care,
        .stencil_load_op = .dont_care,
        .stencil_store_op = .dont_care,
        .initial_layout = .undefined,
        .final_layout = .depth_stencil_attachment_optimal,
    };

    const color_attachment_ref = vk.AttachmentReference{
        .attachment = 0,
        .layout = .attachment_optimal,
    };

    const depth_attachment_ref = vk.AttachmentReference{
        .attachment = 1,
        .layout = .depth_stencil_attachment_optimal,
    };

    const subpass = [_]vk.SubpassDescription{
        .{
            .pipeline_bind_point = .graphics,
            .color_attachment_count = 1,
            .p_color_attachments = @ptrCast(&color_attachment_ref),
            .p_depth_stencil_attachment = @ptrCast(&depth_attachment_ref),
        },
    };

    const dependencies = [_]vk.SubpassDependency{
        .{
            .src_subpass = vk.SubpassExternal,
            .dst_subpass = 0,
            .src_stage_mask = .initMany(&.{
                .color_attachment_output_bit,
                .late_fragment_tests_bit,
            }),
            .src_access_mask = .init(.depth_stencil_attachment_write_bit),
            .dst_stage_mask = .initMany(&.{
                .color_attachment_output_bit,
                .early_fragment_tests_bit,
            }),
            .dst_access_mask = .initMany(&.{
                .color_attachment_write_bit,
                .depth_stencil_attachment_write_bit,
            }),
        },
    };

    const attachments = [_]vk.AttachmentDescription{
        color_attachment,
        depth_attachment,
    };

    const render_pass_state = vk.RenderPassCreateInfo{
        .attachment_count = @truncate(attachments.len),
        .p_attachments = &attachments,
        .subpass_count = @truncate(subpass.len),
        .p_subpasses = &subpass,
        .dependency_count = @truncate(dependencies.len),
        .p_dependencies = &dependencies,
    };

    var render_pass: vk.RenderPass = .null;
    return switch (vk.createRenderPass(
        self.device,
        &render_pass_state,
        null,
        &render_pass,
    )) {
        .success => render_pass,
        else => error.FailedToCreateRenderPass,
    };
}

fn createSwapchainFramebuffer(self: *const Engine, i: usize) !vk.Framebuffer {
    const attachments = [_]vk.ImageView{
        self.swapchain_image_views[i],
        self.depth_image_view,
    };

    const framebuffer_state = vk.FramebufferCreateInfo{
        .render_pass = self.render_pass,
        .attachment_count = @truncate(attachments.len),
        .p_attachments = &attachments,
        .width = self.swapchain_extent.width,
        .height = self.swapchain_extent.height,
        .layers = 1,
    };

    var framebuffer: vk.Framebuffer = .null;
    return switch (vk.createFramebuffer(
        self.device,
        &framebuffer_state,
        null,
        &framebuffer,
    )) {
        .success => framebuffer,
        else => error.FailedToCreateFramebuffer,
    };
}

fn createDescriptorSetLayout(self: *const Engine) !vk.DescriptorSetLayout {
    const ubo_layout_binding = vk.DescriptorSetLayoutBinding{
        .binding = 0,
        .descriptor_count = 1,
        .descriptor_type = .uniform_buffer,
        .p_immutable_samplers = null,
        .stage_flags = .init(.vertex_bit),
    };
    const sampler_layout_binding = vk.DescriptorSetLayoutBinding{
        .binding = 1,
        .descriptor_count = 1,
        .descriptor_type = .combined_image_sampler,
        .p_immutable_samplers = null,
        .stage_flags = .init(.fragment_bit),
    };
    const bindings = [_]vk.DescriptorSetLayoutBinding{
        ubo_layout_binding,
        sampler_layout_binding,
    };
    const descriptor_set_state = vk.DescriptorSetLayoutCreateInfo{
        .binding_count = @truncate(bindings.len),
        .p_bindings = &bindings,
    };
    var descriptor_set_layout: vk.DescriptorSetLayout = .null;
    return switch (vk.createDescriptorSetLayout(
        self.device,
        &descriptor_set_state,
        null,
        &descriptor_set_layout,
    )) {
        .success => descriptor_set_layout,
        else => error.FailedToCreateDescriptorSetLayout,
    };
}

fn createPipelineLayout(self: *const Engine) !vk.PipelineLayout {
    const pipeline_layout_state = vk.PipelineLayoutCreateInfo{
        .set_layout_count = 1,
        .p_set_layouts = &self.descriptor_set_layout,
        .push_constant_range_count = 0,
        .p_push_constant_ranges = null,
    };

    var layout: vk.PipelineLayout = .null;
    return switch (vk.createPipelineLayout(
        self.device,
        &pipeline_layout_state,
        null,
        &layout,
    )) {
        .success => layout,
        else => error.FailedToCreatePipelineLayout,
    };
}

fn createGraphicsPipeline(self: *const Engine, allo: std.mem.Allocator) !vk.Pipeline {
    // const vert_shader_code = try readFile(allo, "tri.vert.spv");
    const vert_shader_code = try readFile(allo, "sqr.vert.spv");
    defer allo.free(vert_shader_code);
    // const frag_shader_code = try readFile(allo, "tri.frag.spv");
    const frag_shader_code = try readFile(allo, "sqr.frag.spv");
    defer allo.free(frag_shader_code);
    const vert_shader_module = try self.createShaderModule(vert_shader_code);
    defer vk.destroyShaderModule(self.device, vert_shader_module, null);
    const frag_shader_module = try self.createShaderModule(frag_shader_code);
    defer vk.destroyShaderModule(self.device, frag_shader_module, null);
    const vert_state = vk.PipelineShaderStageCreateInfo{
        .stage = .vertex_bit,
        .module = vert_shader_module,
        .p_name = "main",
    };
    const frag_state = vk.PipelineShaderStageCreateInfo{
        .stage = .fragment_bit,
        .module = frag_shader_module,
        .p_name = "main",
    };
    const shader_state = [_]vk.PipelineShaderStageCreateInfo{
        vert_state,
        frag_state,
    };
    var bind_descs: [1]vk.VertexInputBindingDescription = undefined;
    Vertex3D.getBindingDescription(&bind_descs);
    // inefficient to both declare undefined +
    var attr_descs: [3]vk.VertexInputAttributeDescription = undefined;
    Vertex3D.getAttributeDescriptions(&attr_descs);
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
        .scissor_count = 1,
    };
    const rasterization_state = vk.PipelineRasterizationStateCreateInfo{
        .depth_clamp_enable = .false,
        .rasterizer_discard_enable = .false,
        .polygon_mode = .fill,
        .line_width = 1,
        .cull_mode = .init(.back_bit),
        .front_face = .counter_clockwise,
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
    const color_blend_attachment_state = vk.PipelineColorBlendAttachmentState{
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
        .logic_op = .copy,
        .attachment_count = 1,
        .p_attachments = &color_blend_attachment_state,
        .blend_constants = [_]f32{0} ** 4,
    };
    const graphics_pipeline_state = vk.GraphicsPipelineCreateInfo{
        .stage_count = @truncate(shader_state.len),
        .p_stages = &shader_state,
        .p_vertex_input_state = &vertex_input_state,
        .p_input_assembly_state = &input_assembly_state,
        .p_viewport_state = &viewport_state,
        .p_rasterization_state = &rasterization_state,
        .p_multisample_state = &multisample_state,
        .p_depth_stencil_state = &depth_stencil_state,
        .p_color_blend_state = &color_blend_state,
        .p_dynamic_state = &dynamic_state,
        .render_pass = self.render_pass,
        .layout = self.pipeline_layout,
        .subpass = 0,
        .base_pipeline_handle = .null,
        .base_pipeline_index = -1,
    };
    var pipeline: vk.Pipeline = .null;
    return switch (vk.createGraphicsPipelines(
        self.device,
        .null,
        1,
        &graphics_pipeline_state,
        null,
        &pipeline,
    )) {
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
    const shader_module_state = vk.ShaderModuleCreateInfo{
        .code_size = @truncate(code.len),
        .p_code = @ptrCast(@alignCast(code)),
    };
    var shader_module: vk.ShaderModule = .null;
    return switch (vk.createShaderModule(
        self.device,
        &shader_module_state,
        null,
        &shader_module,
    )) {
        .success => shader_module,
        else => error.FailedToCreateShaderModule,
    };
}

fn createCommandPool(self: *const Engine) !vk.CommandPool {
    const qfi = try QFI.init(self.surface, self.physical_device);
    const command_pool_state = vk.CommandPoolCreateInfo{
        .queue_family_index = qfi.graphics_family.?,
        .flags = .initEmpty(),
    };
    var command_pool: vk.CommandPool = .null;
    return switch (vk.createCommandPool(
        self.device,
        &command_pool_state,
        null,
        &command_pool,
    )) {
        .success => command_pool,
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
    return switch (vk.allocateCommandBuffers(
        self.device,
        &alloc_info,
        &command_buffer,
    )) {
        .success => command_buffer,
        else => error.FailedToAllocateCommandBuffer,
    };
}

fn createDepthResources(self: *Engine) !void {
    const depth_format = try self.findDepthFormat();
    try self.createImage(
        self.swapchain_extent.width,
        self.swapchain_extent.height,
        depth_format,
        .init(.optimal),
        .init(.depth_stencil_attachment_bit),
        .init(.device_local_bit),
        &self.depth_image,
        &self.depth_image_memory,
    );
    self.depth_image_view = try self.createImageView(self.depth_image, depth_format);
}

fn findSupportedFormat(
    self: *const Engine,
    candidates: []const vk.Format,
    tiling: vk.ImageTilingFlags,
    feature: vk.FormatFeatureFlags,
) !vk.Format {
    for (candidates) |candidate| {
        var props: vk.FormatProperties = undefined;
        vk.getPhysicalDeviceFormatProperties(self.physical_device, candidate, &props);
        if (tiling.contains(.linear) and
            props.linear_tiling_features.supersetOf(feature))
        {
            return candidate;
        } else if (tiling.contains(.optimal) and
            props.optimal_tiling_features.supersetOf(feature))
        {
            return candidate;
        }
    }
    return error.FailedToFindSupportedFormat;
}

fn findDepthFormat(self: *const Engine) !vk.Format {
    return self.findSupportedFormat(
        &.{ .d32_sfloat, .d32_sfloat_s8_uint, .d24_unorm_s8_uint },
        .init(.optimal),
        .init(.depth_stencil_attachment_bit),
    );
}

fn hasStencilComponent(format: vk.Format) bool {
    return switch (format) {
        .d32_sfloat_s8_uint, .d24_unorm_s8_uint => true,
        else => false,
    };
}

fn createTextureImage(self: *Engine, allo: std.mem.Allocator) !void {
    // init img loader
    zstbi.init(allo);
    defer zstbi.deinit();

    // load img
    var img = try zstbi.Image.loadFromFile("./Textures/dog.jpeg", 4);
    defer img.deinit();
    if (img.data.len == 0) return error.FailedToLoadTextureImg;
    std.debug.print("Img: {} {} {}\n", .{ img.width, img.height, img.num_components });
    // data, width, height, num_components, bytes per component, bytes per row, is hdr
    // check if successful
    const image_size: vk.DeviceSize = img.width * img.height * 4; // should this be 4?

    // create staging
    var staging_buffer: vk.Buffer = .null;
    var staging_buffer_memory: vk.DeviceMemory = .null;
    // create buffer
    try self.createBuffer(
        image_size,
        .init(.transfer_src_bit),
        .initMany(&.{ .host_visible_bit, .host_coherent_bit }),
        &staging_buffer,
        &staging_buffer_memory,
    );
    // cleanup buffer
    defer vk.destroyBuffer(self.device, staging_buffer, null);
    defer vk.freeMemory(self.device, staging_buffer_memory, null);
    {
        var gpu_ptr: ?*anyopaque = null;
        try switch (vk.mapMemory(
            self.device,
            staging_buffer_memory,
            0,
            image_size,
            .initEmpty(),
            &gpu_ptr,
        )) {
            .success => {},
            else => error.FailedToMapMemory,
        };
        var gpu_image: [*]u8 = @ptrCast(@alignCast(gpu_ptr));
        @memcpy(gpu_image[0..img.data.len], img.data);
        vk.unmapMemory(self.device, staging_buffer_memory);
    }
    try self.createImage(
        img.width,
        img.height,
        .r8g8b8a8_srgb,
        .init(.optimal),
        .initMany(&.{ .transfer_dst_bit, .sampled_bit }),
        .init(.device_local_bit),
        &self.texture_image,
        &self.texture_image_memory,
    );
    try self.transitionImageLayout(
        self.texture_image,
        .r8g8b8a8_srgb,
        .undefined,
        .transfer_dst_optimal,
    );
    try self.copyBufferToImage(
        staging_buffer,
        self.texture_image,
        img.width,
        img.height,
    );
    try self.transitionImageLayout(
        self.texture_image,
        .r8g8b8a8_srgb,
        .transfer_dst_optimal,
        .shader_read_only_optimal,
    );
}

fn createTextureImageView(self: *const Engine) !vk.ImageView {
    return self.createImageView(self.texture_image, .r8g8b8a8_srgb);
}

fn createTextureSampler(self: *const Engine) !vk.Sampler {
    var props: vk.PhysicalDeviceProperties = .{};
    vk.getPhysicalDeviceProperties(self.physical_device, &props);
    // instead of anisotropy on, can do anisotropyenable = false + max_anisotropy = 1.0
    const sampler_state = vk.SamplerCreateInfo{
        .mag_filter = .linear,
        .min_filter = .linear,
        .address_mode_u = .repeat,
        .address_mode_v = .repeat,
        .address_mode_w = .repeat,
        .anisotropy_enable = .true,
        .max_anisotropy = props.limits.max_sampler_anisotropy,
        .border_color = .float_opaque_black,
        .unnormalized_coordinates = .false,
        .compare_enable = .false,
        .compare_op = .always,
        .mipmap_mode = .linear,
        // .mip_lod_bias = 0.0,
        // .min_lod = 0.0,
        // .max_lod = 0.0,
    };
    var texture_sampler: vk.Sampler = .null;
    return switch (vk.createSampler(
        self.device,
        &sampler_state,
        null,
        &texture_sampler,
    )) {
        .success => texture_sampler,
        else => error.FailedToCreateTextureSampler,
    };
}

fn createImageView(
    self: *const Engine,
    image: vk.Image,
    format: vk.Format,
) !vk.ImageView {
    const image_view_state = vk.ImageViewCreateInfo{
        .image = image,
        .view_type = .@"2d",
        .format = format,
        .subresource_range = .{
            .aspect_mask = .init(.color_bit),
            .base_mip_level = 0,
            .level_count = 1,
            .base_array_layer = 0,
            .layer_count = 1,
        },
    };
    var image_view: vk.ImageView = .null;
    return switch (vk.createImageView(
        self.device,
        &image_view_state,
        null,
        &image_view,
    )) {
        .success => image_view,
        else => error.FailedToCreateTextureImageView,
    };
}

fn createImage(
    self: *const Engine,
    width: u32,
    height: u32,
    format: vk.Format,
    tiling: vk.ImageTilingFlags,
    usage: vk.ImageUsageFlags,
    props: vk.MemoryPropertyFlags,
    image: *vk.Image,
    image_memory: *vk.DeviceMemory,
) !void {
    const image_state = vk.ImageCreateInfo{
        .image_type = .@"2d",
        .extent = .{
            .width = width,
            .height = height,
            .depth = 1,
        },
        .mip_levels = 1,
        .array_layers = 1,
        .format = format,
        .tiling = tiling,
        .initial_layout = .undefined,
        .usage = usage,
        .samples = .@"1_bit",
        .sharing_mode = .exclusive,
    };

    // var texture: vk.Image = .null;
    try switch (vk.createImage(self.device, &image_state, null, image)) {
        .success => {},
        else => error.FailedToCreateImage,
    };

    var mem_reqs: vk.MemoryRequirements = .{};
    vk.getImageMemoryRequirements(self.device, image.*, &mem_reqs);

    const alloc_info = vk.MemoryAllocateInfo{
        .allocation_size = mem_reqs.size,
        .memory_type_index = try self.findMemoryType(mem_reqs.memory_type_bits, props),
    };

    try switch (vk.allocateMemory(self.device, &alloc_info, null, image_memory)) {
        .success => {},
        else => error.FailedToAllocateImageMemory,
    };

    try switch (vk.bindImageMemory(self.device, image.*, image_memory.*, 0)) {
        .success => {},
        else => error.FailedToBindImageMemory,
    };
}

fn transitionImageLayout(
    self: *const Engine,
    image: vk.Image,
    format: vk.Format,
    old_layout: vk.ImageLayout,
    new_layout: vk.ImageLayout,
) !void {
    _ = format;
    var command_buffer = try self.beginSingleTimeCommands();
    var barrier = vk.ImageMemoryBarrier{
        .old_layout = old_layout,
        .new_layout = new_layout,
        .src_queue_family_index = vk.QueueFamilyIgnored, // .queue_family_ignored,
        .dst_queue_family_index = vk.QueueFamilyIgnored, // .queue_family_ignored,
        .image = image,
        .subresource_range = .{
            .aspect_mask = .init(.color_bit),
            .base_mip_level = 0,
            .level_count = 1,
            .base_array_layer = 0,
            .layer_count = 1,
        },
    };
    var src_stage: vk.PipelineStageFlags = .initEmpty();
    var dst_stage: vk.PipelineStageFlags = .initEmpty();
    if (old_layout == .undefined and new_layout == .transfer_dst_optimal) {
        // barrier
        barrier.src_access_mask = .initEmpty();
        barrier.dst_access_mask = .init(.transfer_write_bit);
        // stages
        src_stage = .init(.top_of_pipe_bit);
        dst_stage = .init(.transfer_bit);
    } else if (old_layout == .transfer_dst_optimal and new_layout == .shader_read_only_optimal) {
        // barrier
        barrier.src_access_mask = .init(.transfer_write_bit);
        barrier.dst_access_mask = .init(.shader_read_bit);
        // stages
        src_stage = .init(.transfer_bit);
        dst_stage = .init(.fragment_shader_bit);
    } else {
        return error.UnsupportedLayoutTransition;
    }
    vk.cmdPipelineBarrier(
        command_buffer,
        src_stage,
        dst_stage,
        .initEmpty(),
        0,
        null,
        0,
        null,
        1,
        &barrier,
    );
    try self.endSingleTimeCommands(&command_buffer);
}

fn copyBufferToImage(
    self: *const Engine,
    buffer: vk.Buffer,
    image: vk.Image,
    width: u32,
    height: u32,
) !void {
    var command_buffer = try self.beginSingleTimeCommands();
    const region: vk.BufferImageCopy = .{
        .buffer_offset = 0,
        .buffer_row_length = 0,
        .buffer_image_height = 0,
        .image_subresource = .{
            .aspect_mask = .init(.color_bit),
            .mip_level = 0,
            .base_array_layer = 0,
            .layer_count = 1,
        },
        .image_offset = .{ .x = 0, .y = 0, .z = 0 },
        .image_extent = .{ .width = width, .height = height, .depth = 1 },
    };
    vk.cmdCopyBufferToImage(
        command_buffer,
        buffer,
        image,
        .transfer_dst_optimal,
        1,
        &region,
    );
    try self.endSingleTimeCommands(&command_buffer);
}

fn createVertexBuffer(self: *Engine, data: []const Vertex3D) !void {
    const size = @sizeOf(Vertex3D) * data.len;

    var staging_buffer: vk.Buffer = .null;
    var staging_buffer_memory: vk.DeviceMemory = .null;
    try self.createBuffer(
        size,
        .init(.transfer_src_bit),
        .initMany(&.{ .host_visible_bit, .host_coherent_bit }),
        &staging_buffer,
        &staging_buffer_memory,
    );
    {
        var gpu_ptr: ?*anyopaque = null;
        try switch (vk.mapMemory(self.device, staging_buffer_memory, 0, size, .initEmpty(), &gpu_ptr)) {
            .success => {},
            else => error.FailedToMapMemory,
        };
        var gpu_vertices: [*]Vertex3D = @ptrCast(@alignCast(gpu_ptr));
        @memcpy(gpu_vertices[0..data.len], data);
        vk.unmapMemory(self.device, staging_buffer_memory);
    }
    try self.createBuffer(
        size,
        .initMany(&.{ .transfer_src_bit, .vertex_buffer_bit }),
        .init(.device_local_bit),
        &self.vertex_buffer,
        &self.vertex_buffer_memory,
    );
    try self.copyBuffer(staging_buffer, self.vertex_buffer, size);
    vk.destroyBuffer(self.device, staging_buffer, null);
    vk.freeMemory(self.device, staging_buffer_memory, null);
}

fn createIndexBuffer(self: *Engine, data: []const u16) !void {
    const size = @sizeOf(u16) * data.len;
    var staging_buffer: vk.Buffer = .null;
    var staging_buffer_memory: vk.DeviceMemory = .null;
    try self.createBuffer(
        size,
        .init(.transfer_src_bit),
        .initMany(&.{ .host_visible_bit, .host_coherent_bit }),
        &staging_buffer,
        &staging_buffer_memory,
    );
    {
        var gpu_ptr: ?*anyopaque = null;
        try switch (vk.mapMemory(
            self.device,
            staging_buffer_memory,
            0,
            size,
            .initEmpty(),
            &gpu_ptr,
        )) {
            .success => {},
            else => error.FailedToMapMemory,
        };
        var gpu_indices: [*]u16 = @ptrCast(@alignCast(gpu_ptr));
        @memcpy(gpu_indices[0..data.len], data);
        vk.unmapMemory(self.device, staging_buffer_memory);
    }
    try self.createBuffer(
        size,
        .initMany(&.{ .transfer_dst_bit, .index_buffer_bit }),
        .init(.device_local_bit),
        &self.index_buffer,
        &self.index_buffer_memory,
    );
    try self.copyBuffer(staging_buffer, self.index_buffer, size);
    vk.destroyBuffer(self.device, staging_buffer, null);
    vk.freeMemory(self.device, staging_buffer_memory, null);
}

fn createBuffer(
    self: *Engine,
    size: vk.DeviceSize,
    usage: vk.BufferUsageFlags,
    props: vk.MemoryPropertyFlags,
    buffer: *vk.Buffer,
    memory: *vk.DeviceMemory,
) !void {
    const buffer_state = vk.BufferCreateInfo{
        .size = size,
        .usage = usage,
        .sharing_mode = .exclusive,
    };
    try switch (vk.createBuffer(self.device, &buffer_state, null, buffer)) {
        .success => {},
        else => error.FailedToCreateBuffer,
    };
    var mem_reqs: vk.MemoryRequirements = .{};
    vk.getBufferMemoryRequirements(self.device, buffer.*, &mem_reqs);
    const alloc_info = vk.MemoryAllocateInfo{
        .allocation_size = mem_reqs.size,
        .memory_type_index = try self.findMemoryType(mem_reqs.memory_type_bits, props),
    };
    try switch (vk.allocateMemory(self.device, &alloc_info, null, memory)) {
        .success => {},
        else => error.FailedToAllocateBufferMemory,
    };
    try switch (vk.bindBufferMemory(self.device, buffer.*, memory.*, 0)) {
        .success => {},
        else => error.FailedToBindBufferMemory,
    };
}

fn copyBuffer(
    self: *const Engine,
    src_buffer: vk.Buffer,
    dst_buffer: vk.Buffer,
    size: vk.DeviceSize,
) !void {
    var command_buffer = try self.beginSingleTimeCommands();
    const copy_region = vk.BufferCopy{
        .size = size,
    };
    vk.cmdCopyBuffer(command_buffer, src_buffer, dst_buffer, 1, &copy_region);
    try self.endSingleTimeCommands(&command_buffer);
}

fn beginSingleTimeCommands(self: *const Engine) !vk.CommandBuffer {
    const alloc_info = vk.CommandBufferAllocateInfo{
        .level = .primary,
        .command_pool = self.command_pool,
        .command_buffer_count = 1,
    };
    var command_buffer: vk.CommandBuffer = .null;
    try switch (vk.allocateCommandBuffers(
        self.device,
        &alloc_info,
        &command_buffer,
    )) {
        .success => {},
        else => error.FailedToAllocateCommandBuffer,
    };
    const begin_info = vk.CommandBufferBeginInfo{
        .flags = .init(.one_time_submit_bit),
    };
    return switch (vk.beginCommandBuffer(command_buffer, &begin_info)) {
        .success => command_buffer,
        else => error.FailedToBeginCommandBuffer,
    };
}

fn endSingleTimeCommands(self: *const Engine, command_buffer: *vk.CommandBuffer) !void {
    try switch (vk.endCommandBuffer(command_buffer.*)) {
        .success => {},
        else => error.FailedToEndCommandBuffer,
    };
    const submit_info = vk.SubmitInfo{
        .command_buffer_count = 1,
        .p_command_buffers = command_buffer,
    };
    try switch (vk.queueSubmit(self.graphics_queue, 1, &submit_info, .null)) {
        .success => {},
        else => error.FailedToSubmitQueue,
    };
    try switch (vk.queueWaitIdle(self.graphics_queue)) {
        .success => {},
        else => error.FailedToIdleQueue,
    };
    vk.freeCommandBuffers(self.device, self.command_pool, 1, command_buffer);
}

fn findMemoryType(
    self: *const Engine,
    type_filter: u32,
    props: vk.MemoryPropertyFlags,
) !u32 {
    var mem_props: vk.PhysicalDeviceMemoryProperties = .{};
    vk.getPhysicalDeviceMemoryProperties(self.physical_device, &mem_props);
    for (0..mem_props.memory_type_count) |i|
        if (((type_filter & (@as(u32, 1) << @truncate(i))) > 0) and
            ((mem_props.memory_types[i].property_flags.bits & props.bits) == props.bits))
            return @truncate(i);
    return error.FailedTOFindSuitableMemoryType;
}

fn createUniformBuffers(self: *Engine) !void {
    const size = @sizeOf(UBO);
    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        try self.createBuffer(
            size,
            .init(.uniform_buffer_bit),
            .initMany(&.{ .host_visible_bit, .host_coherent_bit }),
            &self.uniform_buffers[i],
            &self.uniform_buffer_memories[i],
        );
        try switch (vk.mapMemory(
            self.device,
            self.uniform_buffer_memories[i],
            0,
            size,
            .initEmpty(),
            &self.uniform_buffer_maps[i],
        )) {
            .success => {},
            else => error.FailedToMapMemory,
        };
    }
}

fn createDescriptorPool(self: *const Engine) !vk.DescriptorPool {
    const pool_sizes: [2]vk.DescriptorPoolSize = .{
        .{ .type = .uniform_buffer, .descriptor_count = MAX_FRAMES_IN_FLIGHT },
        .{ .type = .combined_image_sampler, .descriptor_count = MAX_FRAMES_IN_FLIGHT },
    };
    const descriptor_pool_state = vk.DescriptorPoolCreateInfo{
        .pool_size_count = @truncate(pool_sizes.len),
        .p_pool_sizes = &pool_sizes,
        .max_sets = MAX_FRAMES_IN_FLIGHT,
    };
    var descriptor_pool: vk.DescriptorPool = .null;
    return switch (vk.createDescriptorPool(
        self.device,
        &descriptor_pool_state,
        null,
        &descriptor_pool,
    )) {
        .success => descriptor_pool,
        else => error.FailedToCreateDescriptorPool,
    };
}

fn allocDescriptorSets(self: *Engine) !void {
    var layouts =
        [_]vk.DescriptorSetLayout{self.descriptor_set_layout} ** MAX_FRAMES_IN_FLIGHT;
    const alloc_info = vk.DescriptorSetAllocateInfo{
        .descriptor_pool = self.descriptor_pool,
        .descriptor_set_count = MAX_FRAMES_IN_FLIGHT,
        .p_set_layouts = &layouts,
    };
    // descriptor sets must equal layouts.len
    try switch (vk.allocateDescriptorSets(
        self.device,
        &alloc_info,
        &self.descriptor_sets,
    )) {
        .success => {},
        else => error.FailedToAllocateDescriptorSets,
    };
    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        const buffer_info = vk.DescriptorBufferInfo{
            .buffer = self.uniform_buffers[i],
            .offset = 0,
            .range = @sizeOf(UBO),
        };
        const image_info = vk.DescriptorImageInfo{
            .image_layout = .shader_read_only_optimal,
            .image_view = self.texture_image_view,
            .sampler = self.texture_sampler,
        };
        var descriptor_writes = [_]vk.WriteDescriptorSet{
            .{
                .dst_set = self.descriptor_sets[i],
                .dst_binding = 0,
                .dst_array_element = 0,
                .descriptor_type = .uniform_buffer,
                .descriptor_count = 1,
                .p_buffer_info = &buffer_info,
                // .p_image_info = null, // for image descriptors
                // .p_texel_buffer_view = null, // for texture descriptors
            },
            .{
                .dst_set = self.descriptor_sets[i],
                .dst_binding = 1,
                .dst_array_element = 0,
                .descriptor_type = .combined_image_sampler,
                .descriptor_count = 1,
                .p_image_info = &image_info,
                // .p_texel_buffer_view = null,
            },
        };
        vk.updateDescriptorSets(
            self.device,
            @truncate(descriptor_writes.len),
            &descriptor_writes,
            0,
            null,
        );
    }
}

fn allocCommandBuffers(self: *Engine) !void {
    const alloc_info = vk.CommandBufferAllocateInfo{
        .command_pool = self.command_pool,
        .level = .primary,
        .command_buffer_count = MAX_FRAMES_IN_FLIGHT,
    };
    return switch (vk.allocateCommandBuffers(
        self.device,
        &alloc_info,
        &self.command_buffers,
    )) {
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
    const clear_color = [_]vk.ClearValue{
        .{ .color = .{ .float32 = [4]f32{ 0, 0, 0, 1 } } },
        .{ .depth_stencil = .{ .depth = 1, .stencil = 0 } },
    };

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
    vk.cmdBindIndexBuffer(command_buffer, self.index_buffer, 0, .uint16);
    vk.cmdBindDescriptorSets(
        command_buffer,
        .graphics,
        self.pipeline_layout,
        0,
        1,
        &self.descriptor_sets[self.current_frame],
        0,
        null,
    );
    vk.cmdDrawIndexed(command_buffer, @as(u32, @truncate(self.indices.len)), 1, 0, 0, 0);
    // vk.cmdDraw(command_buffer, @truncate(vertices.len), 1, 0, 0);
    vk.cmdEndRenderPass(command_buffer);
    try switch (vk.endCommandBuffer(command_buffer)) {
        .success => {},
        else => error.FailedToRecordCommandBuffer,
    };
}

fn createSemaphore(self: *const Engine) !vk.Semaphore {
    const semaphore_state = vk.SemaphoreCreateInfo{};
    var semaphore: vk.Semaphore = .null;
    return switch (vk.createSemaphore(
        self.device,
        &semaphore_state,
        null,
        &semaphore,
    )) {
        .success => semaphore,
        else => error.FailedToCreateSemaphore,
    };
}

fn createFence(self: *const Engine) !vk.Fence {
    const fence_state = vk.FenceCreateInfo{
        .flags = .init(.signaled_bit),
    };
    var fence: vk.Fence = .null;
    return switch (vk.createFence(self.device, &fence_state, null, &fence)) {
        .success => fence,
        else => error.FailedToCreateFence,
    };
}

fn updateUniformBuffer(self: *const Engine, current_image: u32) void {
    const current = std.time.nanoTimestamp();
    const delta_time: f32 = @floatFromInt(current - self.start);
    // create ubo
    // model
    const eye = M4.eye();
    // const dos = eye.mulS(2);
    const angle = std.math.degreesToRadians(90.0) * delta_time;
    const z_axis = V3.new([_]f32{ 0, 0, 1 });
    const model: M4 = eye.rotate(angle, z_axis);
    // view
    const axis2 = V3.init(2);
    const axis3: V3 = .init(0);
    const view: M4 = axis2.lookAt(axis3, z_axis);
    // proj
    const proj: M4 = persp(
        f32,
        std.math.degreesToRadians(45.0),
        self.aspect(), // changes with window
        0.1,
        10.0,
    );
    var ubo = .{
        .model = model.toMat(),
        .view = view.toMat(),
        .proj = proj.toMat(),
    };
    // flip = vulkan specific
    ubo.proj[1][1] *= -1;
    // place on gpu
    var new_map: [*]UBO = @ptrCast(@alignCast(self.uniform_buffer_maps[current_image]));
    @memcpy(new_map[0..1], @as([*]UBO, @ptrCast(&ubo))[0..1]);
}

fn drawFrame(self: *Engine) !void {
    try switch (vk.waitForFences(
        self.device,
        1,
        &self.in_flight_fences[self.current_frame],
        .true,
        MAX_U64,
    )) {
        .success => {},
        else => error.FailedToWaitForFence,
    };
    var image_index: u32 = undefined;
    try switch (vk.acquireNextImageKHR(
        self.device,
        self.swapchain,
        MAX_U64,
        self.image_available_semaphores[self.current_frame],
        .null,
        &image_index,
    )) {
        .success => {},
        .error_out_of_date_khr => {
            try self.recreateSwapchain();
            return;
        },
        else => error.FailedToAcquireNextImage,
    };
    self.updateUniformBuffer(self.current_frame);
    try switch (vk.resetFences(
        self.device,
        1,
        &self.in_flight_fences[self.current_frame],
    )) {
        .success => {},
        else => error.FailedToResetFences,
    };
    try switch (vk.resetCommandBuffer(
        self.command_buffers[self.current_frame],
        .initEmpty(),
    )) {
        .success => {},
        else => error.FailedToResetCommandBuffer,
    };
    try self.recordCommandBuffer(self.command_buffers[self.current_frame], image_index);
    const wait_semaphores = [_]vk.Semaphore{
        self.image_available_semaphores[self.current_frame],
    };
    const wait_stages = [_]vk.PipelineStageFlags{.init(.color_attachment_output_bit)};
    const signal_semaphores = [_]vk.Semaphore{
        self.render_finished_semaphores[self.current_frame],
    };
    const submit_info = vk.SubmitInfo{
        .wait_semaphore_count = @truncate(wait_semaphores.len),
        .p_wait_semaphores = &wait_semaphores,
        .p_wait_dst_stage_mask = &wait_stages,
        .command_buffer_count = 1,
        .p_command_buffers = &self.command_buffers[self.current_frame],
        .signal_semaphore_count = @truncate(signal_semaphores.len),
        .p_signal_semaphores = &signal_semaphores,
    };
    try switch (vk.queueSubmit(
        self.graphics_queue,
        1,
        &submit_info,
        self.in_flight_fences[self.current_frame],
    )) {
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

fn aspect(self: *const Engine) f32 {
    const width: f32 = @floatFromInt(self.swapchain_extent.width);
    const height: f32 = @floatFromInt(self.swapchain_extent.height);
    return width / height;
}

fn imgPath(allo: std.mem.Allocator, rel_path: []const u8) ![]const u8 {
    // get abs path to img
    var exe_path_buf: [1024]u8 = undefined;
    const exe_path = std.fs.selfExePath(&exe_path_buf) catch unreachable;
    const idx = std.mem.indexOf(u8, exe_path, "zig-out").?;
    const basepath = exe_path[0..idx];
    return try std.mem.concat(allo, u8, &.{
        basepath,
        rel_path,
    });
}
