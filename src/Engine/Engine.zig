// TODO:
// Switch window handler based on os
// embed shader files
// use window handle as interface to windows
const std = @import("std");
const print = std.debug.print;
const Allocator = std.mem.Allocator;
const utf8ToUtf16 = std.unicode.utf8ToUtf16LeStringLiteral;
// imports
const win = @import("..\\windows\\windows.zig");
const WINDOW_HANDLE = @import("window_handle.zig");
const vk = @import("..\\vulkan\\vulkan.zig");
const QFI = @import("QueueFamilyIndices.zig");
const SSD = @import("SwapchainSupportDetails.zig");
const Vertex = @import("Vertex.zig");
// Extensions
const required_instance_extensions = [_][*:0]const u8{
    vk.ExtensionName.win32_surface,
    vk.ExtensionName.surface,
};
const required_device_extensions = [_][*:0]const u8{
    vk.ExtensionName.swapchain,
};
const MAX_FRAMES_IN_FLIGHT: u32 = 2;
// Vertices
const triangle_vertices = [_]Vertex{
    .{ .{ 0.0, -0.5 }, .{ 1.0, 0.0, 0.0 } },
    .{ .{ 0.5, 0.5 }, .{ 0.0, 1.0, 0.0 } },
    .{ .{ -0.5, 0.5 }, .{ 0.0, 0.0, 1.0 } },
};
const Engine = @This();
// Fields
window: WINDOW_HANDLE = undefined,
instance: vk.Instance = .null,
surface: vk.SurfaceKHR = .null,
physical_device: vk.PhysicalDevice = .null,
logical_device: vk.Device = .null,
// queues
graphics_queue: vk.Queue = .null,
present_queue: vk.Queue = .null,
// swapchain
swapchain: vk.SwapchainKHR = .null,
images: [MAX_FRAMES_IN_FLIGHT]vk.Image = //
    [_]vk.Image{.null} ** MAX_FRAMES_IN_FLIGHT,
views: [MAX_FRAMES_IN_FLIGHT]vk.ImageView = //
    [_]vk.ImageView{.null} ** MAX_FRAMES_IN_FLIGHT,
format: vk.Format = undefined,
extent: vk.Extent2D = undefined,
framebuffers: [MAX_FRAMES_IN_FLIGHT]vk.Framebuffer = //
    [_]vk.Framebuffer{.null} ** MAX_FRAMES_IN_FLIGHT,
// pipeline
render_pass: vk.RenderPass = .null,
pipeline_layout: vk.PipelineLayout = .null,
pipeline: vk.Pipeline = .null,
// command pool
command_pool: vk.CommandPool = .null,
vertex_buffer: vk.Buffer = .null,
vertex_buffer_memory: vk.DeviceMemory = .null,
command_buffers: [MAX_FRAMES_IN_FLIGHT]vk.CommandBuffer = //
    [_]vk.CommandBuffer{.null} ** MAX_FRAMES_IN_FLIGHT,
// synchronization
image_available_semaphores: [MAX_FRAMES_IN_FLIGHT]vk.Semaphore = //
    [_]vk.Semaphore{.null} ** MAX_FRAMES_IN_FLIGHT,
render_finished_semaphores: [MAX_FRAMES_IN_FLIGHT]vk.Semaphore = //
    [_]vk.Semaphore{.null} ** MAX_FRAMES_IN_FLIGHT,
in_flight_fences: [MAX_FRAMES_IN_FLIGHT]vk.Fence = //
    [_]vk.Fence{.null} ** MAX_FRAMES_IN_FLIGHT,
// flags
current_frame: u32 = 0,
is_framebuffer_resized: bool = false,

pub fn init(allo: Allocator) !Engine {
    var self: Engine = .{};
    self.window = try initWindow(800, 600);
    self.instance = try createInstance();
    self.surface = try self.createSurface();
    self.physical_device = try self.pickPhysicalDevice();
    self.logical_device = try self.createLogicalDevice();
    self.swapchain = try self.createSwapchain();
    self.extent = try self.createSwapchainExtent();
    self.format = try self.createSwapchainFormat();
    // arrays
    try self.createSwapchainImages(&self.images);
    try self.createSwapchainImageViews(&self.views);
    try self.createFramebuffers(&self.framebuffers);
    // pipeline
    self.render_pass = try self.createRenderPass();
    self.pipeline_layout = try self.createGraphicsPipelineLayout();
    self.pipeline = try self.createGraphicsPipeline(allo);
    // Commands
    self.command_pool = try self.createCommandPool();
    try self.createCommandBuffers(&self.command_buffers);
    // sync objects
    for (0..self.image_available_semaphores.len) |i| {
        self.image_available_semaphores[i] = try self.createSemaphore();
        self.render_finished_semaphores[i] = try self.createSemaphore();
        self.in_flight_fences[i] = try self.createFence();
    }
    // return
    return self;
}

pub fn deinit(self: *Engine) void {
    self.deinitSwapchain();
    // buffers
    vk.destroyBuffer(self.logical_device, self.vertex_buffer, null);
    // pipeline
    vk.destroyPipeline(self.logical_device, self.pipeline, null);
    vk.destroyPipelineLayout(
        self.logical_device,
        self.pipeline_layout,
        null,
    );
    vk.destroyRenderPass(self.logical_device, self.render_pass, null);
    // sync objects
    for (0..self.image_available_semaphores.len) |i| {
        vk.destroySemaphore(
            self.logical_device,
            self.image_available_semaphores[i],
            null,
        );
        vk.destroySemaphore(
            self.logical_device,
            self.render_finished_semaphores[i],
            null,
        );
        vk.destroyFence(
            self.logical_device,
            self.in_flight_fences[i],
            null,
        );
    }
    // commands
    vk.destroyCommandPool(
        self.logical_device,
        self.command_pool,
        null,
    );
    // base
    vk.destroyDevice(self.logical_device, null);
    vk.destroySurfaceKHR(self.instance, self.surface, null);
    vk.destroyInstance(self.instance, null);
    self.deinitWindow();
}

fn initWindow(w: u32, h: u32) !WINDOW_HANDLE {
    const instance = win.GetModuleHandleW(null);
    // wide strings
    const class_name = utf8ToUtf16("ZigWindowClass");
    const title = utf8ToUtf16("Zig Unicode Window");
    // icons + cursors
    const icon = win.LoadIconW(.null, utf8ToUtf16("IDI_APPLICATION"));
    const cursor = win.LoadCursorW(.null, utf8ToUtf16("IDC_ARROW"));
    var wc: win.WNDCLASSEXW = .{
        .style = win.redraw.bits.mask,
        .instance = instance,
        .icon = icon,
        .cursor = cursor,
        .brush = win.GetSysColorBrush(.window),
        .menu_name = null,
        .class_name = class_name,
        .small_icon = icon,
    };
    // register
    if (win.RegisterClassExW(&wc) == .null) //
        return error.FailedToRegisterClass;

    // HWND
    const hwnd = switch (win.CreateWindowExW(
        0,
        class_name,
        title,
        win.overlapped_window.bits.mask,
        100,
        100,
        w,
        h,
        .null,
        .null,
        instance,
        .null,
    )) {
        .null => return error.FailedToCreateWindow,
        else => |value| value,
    };
    return .{
        .instance = instance,
        .title = title,
        .hwnd = hwnd,
    };
    // set framebuffer size callback to change window size
}

fn deinitWindow(self: *Engine) void {
    _ = win.UnregisterClassW(
        self.window.title,
        self.window.instance,
    );
}

fn createInstance() !vk.Instance {
    // app info
    const app_info = vk.ApplicationInfo{
        .p_application_name = "Curr App",
        .application_version = vk.makeApiVersion(0, 1, 0, 0),
        .p_engine_name = "No Engine",
        .engine_version = vk.makeApiVersion(0, 1, 0, 0),
        .api_version = vk.makeApiVersion(0, 1, 0, 0),
    };
    // get extensions
    var n_exts: u32 = 0;
    switch (vk.enumerateInstanceExtensionProperties(null, &n_exts, null)) {
        .success => {},
        else => return error.FailedToEnumerateInstanceExtensionProperties,
    }
    // print("# Of Instance Extensions: {}\n", .{n_exts});
    var exts: [64]vk.ExtensionProperties = undefined;
    switch (vk.enumerateInstanceExtensionProperties(null, &n_exts, &exts)) {
        .success => {},
        else => return error.FailedToEnumerateInstanceExtensionProperties,
    }
    // check that all required instance extensions are supported
    var has_instance_extensions: bool = true;
    outer: for (required_instance_extensions) |req_ext| {
        const name1 = std.mem.span(req_ext);
        for (exts[0..n_exts]) |extension| {
            const len = std.mem.indexOfScalar(u8, &extension.extension_name, 0).?;
            const name2 = extension.extension_name[0..len];
            if (std.mem.eql(u8, name1, name2)) continue :outer;
        }
        print("Missing: {s}\n", .{name1});
        has_instance_extensions = false;
    }
    if (!has_instance_extensions) {
        return error.MissingRequiredInstanceExtension;
    }

    // create info
    const create_info = vk.InstanceCreateInfo{
        .flags = switch (@import("builtin").os.tag) {
            .macos => .init(.enumerate_portability_bit_khr),
            else => .initEmpty(),
        },
        .p_application_info = &app_info,
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
        .enabled_extension_count = @truncate(required_instance_extensions.len),
        .pp_enabled_extension_names = @ptrCast(&required_instance_extensions),
    };
    // create instance
    var instance: vk.Instance = .null;
    return switch (vk.createInstance(&create_info, null, &instance)) {
        .success => instance,
        else => error.FailedToCreateInstance,
    };
}

fn createSurface(self: *Engine) !vk.SurfaceKHR {
    const create_info = vk.Win32SurfaceCreateInfoKHR{
        .hwnd = self.window.hwnd,
        .hinstance = self.window.instance,
    };
    var surface: vk.SurfaceKHR = .null;
    return switch (vk.createWin32SurfaceKHR(
        self.instance,
        &create_info,
        null,
        &surface,
    )) {
        .success => surface,
        else => error.FailedToCreateSurface,
    };
}

fn pickPhysicalDevice(self: *const Engine) !vk.PhysicalDevice {
    // get # of devices
    var n_devices: u32 = 0;
    switch (vk.enumeratePhysicalDevices(self.instance, &n_devices, null)) {
        .success => {},
        else => return error.FailedToEnumeratePhysicalDevices,
    }
    if (n_devices == 0) return error.FoundNoPhysicalDevice;
    // get physical devices
    var physical_devices: [16]vk.PhysicalDevice = undefined;
    switch (vk.enumeratePhysicalDevices(self.instance, &n_devices, &physical_devices)) {
        .success => {},
        else => return error.FailedToEnumeratePhysicalDevices,
    }
    // get physical device
    for (physical_devices[0..n_devices]) |physical_device| {
        const is_device_suitable = try isDeviceSuitable(physical_device, self.surface);
        if (is_device_suitable) return physical_device;
    }
    // default
    return error.FoundNoSuitablePhysicalDevice;
}

// simplest
fn isDeviceSuitable(device: vk.PhysicalDevice, surface: vk.SurfaceKHR) !bool {
    const qfi = try QFI.init(device, surface);
    if (!qfi.isComplete()) return false;
    if (!checkDeviceExtensionSupport(device)) return false;
    const ssd = try SSD.init(device, surface);
    return ssd.isAdequate();
}

fn checkDeviceExtensionSupport(device: vk.PhysicalDevice) bool {
    // get # of device extensions
    var n_exts: u32 = 0;
    switch (vk.enumerateDeviceExtensionProperties(device, null, &n_exts, null)) {
        .success => {},
        else => return false,
        // else => return error.FailedToEnumerateDeviceExtensionProperties,
    }
    // get device extensions
    var exts: [512]vk.ExtensionProperties = undefined;
    switch (vk.enumerateDeviceExtensionProperties(device, null, &n_exts, &exts)) {
        .success => {},
        else => return false,
        // else => return error.FailedToEnumerateDeviceExtensionProperties,
    }
    // check that required device extensions are supported
    var has_device_extensions: bool = true;
    outer: for (required_device_extensions) |req_ext| {
        const name1 = std.mem.span(req_ext);
        for (exts[0..n_exts]) |ext| {
            const len = std.mem.indexOfScalar(u8, &ext.extension_name, 0).?;
            const name2 = ext.extension_name[0..len];
            if (std.mem.eql(u8, name1, name2)) continue :outer;
        }
        has_device_extensions = false;
        print("Missing: {s}\n", .{name1});
    }
    // default
    return has_device_extensions;
}

// better
fn isDeviceSuitable1(device: vk.PhysicalDevice) bool {
    var props: vk.PhysicalDeviceProperties2 = undefined;
    vk.getPhysicalDeviceProperties(device, &props);
    var feats: vk.PhysicalDeviceFeatures2 = undefined;
    vk.getPhysicalDeviceFeatures2(device, &feats);
    return props.deviceType == .device_type_discrete_gpu and (feats.geometryShader > 0);
}

// best
fn ratePhysicalDeviceSuitability(device: vk.PhysicalDevice) i32 {
    var score: i32 = 0;
    // props + feats
    var props: vk.PhysicalDeviceProperties2 = undefined;
    vk.getPhysicalDeviceProperties(device, &props);
    var feats: vk.PhysicalDeviceFeatures2 = undefined;
    vk.getPhysicalDeviceFeatures2(device, &feats);
    // device type
    score += switch (device.deviceType) {
        .discrete_gpu => 1000,
        .integrated_gpu => 100,
        .virtual_gpu => 10,
        else => 0,
    };
    // dims - max possible txeture size
    score += props.limits.max_image_dimension_2d;
    score += props.limits.max_image_dimension_3d;
    // ensure shader types
    if (!feats.geometry_shader) {
        return 0;
    }
    // score
    return score;
}

fn createLogicalDevice(self: *Engine) !vk.Device {
    const indices = try QFI.init(self.physical_device, self.surface);
    var priority: f32 = 1.0;
    // 2 for amd, 1 for nvidia
    const queue_create_infos = [_]vk.DeviceQueueCreateInfo{
        .{
            .queue_family_index = indices.graphics_family.?,
            .queue_count = 1,
            .p_queue_priorities = @ptrCast(&priority),
        },
        .{
            .queue_family_index = indices.present_family.?,
            .queue_count = 1,
            .p_queue_priorities = @ptrCast(&priority),
        },
    };
    var feats: vk.PhysicalDeviceFeatures = .{}; // has version 2
    const len: u32 = if (indices.present_family == indices.graphics_family) //
        1 //
    else //
        @truncate(queue_create_infos.len);
    const create_info: vk.DeviceCreateInfo = .{
        .queue_create_info_count = len,
        .p_queue_create_infos = &queue_create_infos,
        .p_enabled_features = &feats,
        .enabled_extension_count = @truncate(required_device_extensions.len),
        .pp_enabled_extension_names = @ptrCast(&required_device_extensions),
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
    };

    var logical_device: vk.Device = .null;
    try switch (vk.createDevice(self.physical_device, &create_info, null, &logical_device)) {
        .success => {},
        else => error.FailedToCreateLogicalDevice,
    };
    // below has version 2
    vk.getDeviceQueue(logical_device, indices.graphics_family.?, 0, &self.graphics_queue);
    return logical_device;
}

fn createSwapchain(self: *Engine) !vk.SwapchainKHR {
    const ssd = try SSD.init(self.physical_device, self.surface);
    const surface_format = ssd.chooseSurfaceFormat();
    const present_mode = ssd.choosePresentMode();
    const extent = ssd.chooseExtent();

    var n_images: u32 = ssd.capabilities.min_image_count + 1;
    if (ssd.capabilities.max_image_count > 0 and ssd.capabilities.max_image_count < n_images) //
        n_images = ssd.capabilities.max_image_count;

    const indices = try QFI.init(self.physical_device, self.surface);
    const is_same_family = indices.isSameFamily();
    const queue_family_indices = [_]u32{ indices.graphics_family.?, indices.present_family.? };

    const create_info = vk.SwapchainCreateInfoKHR{
        .surface = self.surface,
        .min_image_count = n_images,
        .image_format = surface_format.format,
        .image_color_space = surface_format.color_space,
        .image_extent = extent,
        .image_array_layers = 1,
        .image_usage = .init(.color_attachment_bit),
        .image_sharing_mode = if (is_same_family) .exclusive else .concurrent,
        .queue_family_index_count = if (is_same_family) 0 else 2,
        .p_queue_family_indices = if (is_same_family) null else &queue_family_indices,
        .pre_transform = ssd.capabilities.current_transform,
        .composite_alpha = .opaque_bit,
        .present_mode = present_mode,
        .clipped = .true,
        .old_swapchain = .null,
    };
    // create swapchain
    var swapchain: vk.SwapchainKHR = .null;
    return switch (vk.createSwapchainKHR(
        self.logical_device,
        &create_info,
        null,
        &swapchain,
    )) {
        .success => swapchain,
        else => error.FailedToCreateSwapchain,
    };
}

fn createSwapchainFormat(self: *Engine) !vk.Format {
    const ssd = try SSD.init(self.physical_device, self.surface);
    const surface_format = ssd.chooseSurfaceFormat();
    return surface_format.format;
}

fn createSwapchainExtent(self: *Engine) !vk.Extent2D {
    const ssd = try SSD.init(self.physical_device, self.surface);
    const extent = ssd.chooseExtent();
    return extent;
}

fn createSwapchainImages(
    self: *Engine,
    images: *[MAX_FRAMES_IN_FLIGHT]vk.Image,
) !void {
    var n_images: u32 = 0;
    switch (vk.getSwapchainImagesKHR(
        self.logical_device,
        self.swapchain,
        &n_images,
        null,
    )) {
        .success => {},
        else => return error.FailedToGetSwapchainImages,
    }
    switch (vk.getSwapchainImagesKHR(
        self.logical_device,
        self.swapchain,
        &n_images,
        images,
    )) {
        .success => {},
        else => return error.FailedToGetSwapchainImages,
    }
}

fn createSwapchainImageViews(
    self: *Engine,
    views: *[MAX_FRAMES_IN_FLIGHT]vk.ImageView,
) !void {
    for (0..self.n_images) |i| {
        const image = self.images[i];
        const create_info = vk.ImageViewCreateInfo{
            .image = image,
            .view_type = .@"2d",
            .format = self.format,
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
        var view = views[i];
        switch (vk.createImageView(
            self.logical_device,
            &create_info,
            null,
            &view,
        )) {
            .success => {},
            else => return error.FailedToCreateImageView,
        }
    }
}

fn allocReadFile(allo: Allocator, filename: []const u8) ![]const u8 {
    // get basepath
    var buf1: [1024]u8 = undefined;
    const exe_path = try std.fs.selfExePath(&buf1);
    const basepath = exe_path[0..std.mem.indexOf(u8, exe_path, "zig-out").?];
    // get shaders dir
    const shaders = try std.fs.path.join(allo, &.{ basepath, "src", "Shaders" });
    defer allo.free(shaders);
    // get shader specifically
    const read_filepath = try std.fs.path.join(allo, &.{ shaders, filename });
    defer allo.free(read_filepath);
    // read file
    const rfile = try std.fs.openFileAbsolute(read_filepath, .{});
    defer rfile.close();
    const size = (try rfile.stat()).size;
    const buffer: []u8 = try allo.alloc(u8, size);
    _ = try rfile.readAll(buffer);
    // return data
    return buffer;
}

fn createShaderModule(self: *Engine, code: []const u8) !vk.ShaderModule {
    const create_info = vk.ShaderModuleCreateInfo{
        .code_size = @truncate(code.len),
        .p_code = @ptrCast(@alignCast(code)),
    };

    var shader_module: vk.ShaderModule = .null;
    return switch (vk.createShaderModule(
        self.logical_device,
        &create_info,
        null,
        &shader_module,
    )) {
        .success => shader_module,
        else => error.FailedToCreateShaderModule,
    };
}

fn createRenderPass(self: *Engine) !vk.RenderPass {
    const color_attachment = vk.AttachmentDescription{
        .format = self.format,
        .samples = .@"1_bit",
        .load_op = .clear,
        .store_op = .store,
        .stencil_load_op = .dont_care,
        .stencil_store_op = .dont_care,
        .initial_layout = .undefined,
        .final_layout = .present_src_khr,
    };

    // has version 2
    const color_attachment_ref = vk.AttachmentReference{
        .attachment = 0,
        .layout = .color_attachment_optimal,
    };

    // has version 2
    const subpass = vk.SubpassDescription{
        .pipeline_bind_point = .graphics,
        .color_attachment_count = 1,
        .p_color_attachments = &color_attachment_ref,
    };

    // has version 2
    const dependency = vk.SubpassDependency{
        .src_subpass = vk.SubpassExternal,
        .dst_subpass = 0,
        .src_stage_mask = .init(.color_attachment_output_bit),
        .src_access_mask = .initEmpty(),
        .dst_stage_mask = .init(.color_attachment_output_bit),
        .dst_access_mask = .init(.color_attachment_write_bit),
    };

    // has version 2
    const create_info = vk.RenderPassCreateInfo{
        .attachment_count = 1,
        .p_attachments = &color_attachment,
        .subpass_count = 1,
        .p_subpasses = &subpass,
        .dependency_count = 1,
        .p_dependencies = &dependency,
    };

    // has version 2
    var render_pass: vk.RenderPass = .null;
    return switch (vk.createRenderPass(
        self.logical_device,
        &create_info,
        null,
        &render_pass,
    )) {
        .success => render_pass,
        else => return error.FailedToCreateRenderPass,
    };
}

fn createGraphicsPipelineLayout(self: *Engine) !vk.PipelineLayout {
    const create_info = vk.PipelineLayoutCreateInfo{
        .set_layout_count = 0,
        .p_set_layouts = null,
        .push_constant_range_count = 0,
        .p_push_constant_ranges = null,
    };

    var layout: vk.PipelineLayout = .null;
    return switch (vk.createPipelineLayout(
        self.logical_device,
        &create_info,
        null,
        &layout,
    )) {
        .success => layout,
        else => error.FailedToCreatePipelineLayout,
    };
}

fn createGraphicsPipeline(self: *Engine, allo: Allocator) !vk.Pipeline {
    const vert_spv = try allocReadFile(allo, "tri.vert.spv");
    // print("Vert SPV: {}\n", .{vert_spv.len});
    defer allo.free(vert_spv);

    const frag_spv = try allocReadFile(allo, "tri.frag.spv");
    // print("Frag SPV: {}\n", .{frag_spv.len});
    defer allo.free(frag_spv);

    // create shader modules
    const vert_sm = try self.createShaderModule(vert_spv);
    defer vk.destroyShaderModule(self.logical_device, vert_sm, null);

    const frag_sm = try self.createShaderModule(frag_spv);
    defer vk.destroyShaderModule(self.logical_device, frag_sm, null);

    const vert_shader_stage_info = vk.PipelineShaderStageCreateInfo{
        .stage = .vertex_bit,
        .module = vert_sm,
        .p_name = "main",
    };

    const frag_shader_stage_info = vk.PipelineShaderStageCreateInfo{
        .stage = .fragment_bit,
        .module = frag_sm,
        .p_name = "main",
    };

    const shader_stages = [_]vk.PipelineShaderStageCreateInfo{
        vert_shader_stage_info,
        frag_shader_stage_info,
    };

    const binding_description = Vertex.getBindingDescription();
    const attribute_descriptions = Vertex.getAttributeDescriptions();
    const vertex_input_info = vk.PipelineVertexInputStateCreateInfo{
        .vertex_binding_description_count = @truncate(binding_description.len),
        .p_vertex_binding_descriptions = &binding_description,
        .vertex_attribute_description_count = @truncate(attribute_descriptions.len),
        .p_vertex_attribute_descriptions = &attribute_descriptions,
    };

    const input_assembly = vk.PipelineInputAssemblyStateCreateInfo{
        .topology = .triangle_list,
        .primitive_restart_enable = .false,
    };

    const viewport_state = vk.PipelineViewportStateCreateInfo{
        .viewport_count = 1,
        // .p_viewports = &viewport,
        .scissor_count = 1,
        // .p_scissors = &scissor,
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
        // .min_sample_shading = 1,
        // .p_sample_mask = null,
        // .alpha_to_coverage_enable = .false,
        // .alpha_to_one_enable = .false,
    };

    const color_blend_attachment = vk.PipelineColorBlendAttachmentState{
        .color_write_mask = .initMany(&.{ .r_bit, .g_bit, .b_bit, .a_bit }),
        .blend_enable = .false, // .true,
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
        .layout = self.pipeline_layout,
        .render_pass = self.render_pass,
        .subpass = 0,
        .base_pipeline_handle = .null,
        // .base_pipeline_index = -1,
    };

    var pipeline: vk.Pipeline = .null;
    return switch (vk.createGraphicsPipelines(
        self.logical_device,
        .null,
        1,
        &create_info,
        null,
        &pipeline,
    )) {
        .success => pipeline,
        else => error.FailedToCreateGraphicsPipeline,
    };
}

fn createFramebuffers(
    self: *Engine,
    framebuffers: *[MAX_FRAMES_IN_FLIGHT]vk.Framebuffer,
) !void {
    for (0..self.n_images) |i| {
        const attachments = [_]vk.ImageView{
            self.views[i],
        };

        const create_info = vk.FramebufferCreateInfo{
            .render_pass = self.render_pass,
            .attachment_count = 1,
            .p_attachments = &attachments,
            .width = self.extent.width,
            .height = self.extent.height,
            .layers = 1,
        };

        switch (vk.createFramebuffer(
            self.logical_device,
            &create_info,
            null,
            &framebuffers[i],
        )) {
            .success => {},
            else => return error.FailedToCreateFramebuffer,
        }
    }
}

fn createCommandPool(self: *Engine) !vk.CommandPool {
    const indices = try QFI.init(self.physical_device, self.surface);

    const create_info = vk.CommandPoolCreateInfo{
        .flags = .initEmpty(),
        .queue_family_index = indices.graphics_family.?,
    };

    var pool: vk.CommandPool = .null;
    return switch (vk.createCommandPool(
        self.logical_device,
        &create_info,
        null,
        &pool,
    )) {
        .success => pool,
        else => error.FailedToCreateCommandPool,
    };
}

fn findMemory(self: *Engine, type_filter: u32, props: vk.MemoryPropertyFlags) !u32 {
    const mem_props = vk.PhysicalDeviceMemoryProperties{};
    vk.getPhysicalDeviceMemoryProperties(self.physical_device, &mem_props);
    for (0..mem_props.memory_type_count) |i| {
        if (!(type_filter and (1 << i))) continue;
        if (!(mem_props.memory_types[i].property_flags & props) == props) continue;
        return i;
    }
    return error.FailedToFindSuitableMemoryType;
}

fn createCommandBuffers(
    self: *Engine,
    command_buffers: *[MAX_FRAMES_IN_FLIGHT]vk.CommandBuffer,
) !void {
    const alloc_info = vk.CommandBufferAllocateInfo{
        .command_pool = self.command_pool,
        .level = .primary,
        .command_buffer_count = MAX_FRAMES_IN_FLIGHT,
    };

    return switch (vk.allocateCommandBuffers(
        self.logical_device,
        &alloc_info,
        command_buffers,
    )) {
        .success => {},
        else => return error.FailedToAllocateCommandBuffers,
    };
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

fn createSemaphore(self: *Engine) !vk.Semaphore {
    const create_info = vk.SemaphoreCreateInfo{};
    var semaphore: vk.Semaphore = .null;
    return switch (vk.createSemaphore(
        self.logical_device,
        &create_info,
        null,
        &semaphore,
    )) {
        .success => semaphore,
        else => error.FailedToCreateSempahore,
    };
}

fn createFence(self: *Engine) !vk.Fence {
    const create_info = vk.FenceCreateInfo{
        .flags = .init(.signaled_bit),
    };

    var fence: vk.Fence = .null;
    return switch (vk.createFence(
        self.logical_device,
        &create_info,
        null,
        &fence,
    )) {
        .success => fence,
        else => error.FailedToCreateFence,
    };
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
    _ = win.ShowWindow(self.window.hwnd, .show);
    _ = win.UpdateWindow(self.window.hwnd);

    var msg: win.MSG = undefined;
    while (win.GetMessageW(&msg, self.window.hwnd, 0, 0) != 0) {
        _ = win.TranslateMessage(&msg);
        _ = win.DispatchMessageW(&msg);
        // can switch on msg to get key press
        try self.drawFrame();
    }

    switch (vk.deviceWaitIdle(self.logical_device)) {
        .success => {},
        else => return error.FailedToIdleDevice,
    }

    // while (!glfwWindowShouldClose(window)) {
    //     glfwPollEvents();
    //     self.drawFrame();
    // }
}

fn initSwapchain(self: *Engine) void {
    var w: i32, var h: i32 = win.getWindowSize();
    while (w == 0 or h == 0) {
        w, h = win.getWindowSize();
    }
    win.SetWindowPos();
    // wait
    vk.deviceWaitIdle(self.logical_device);
    // cleanup
    try self.deinitSwapchain();
    // recreate
    try self.createSwapchain();
    try self.createSwapchainImageViews(self.views);
    try self.createFramebuffers(self.framebuffers);
}

fn deinitSwapchain(self: *Engine) void {
    for (0..self.n_images) |i| {
        vk.destroyFramebuffer(self.logical_device, self.framebuffers[i], null);
        vk.destroyImageView(self.logical_device, self.views[i], null);
    }
    vk.destroySwapchainKHR(self.logical_device, self.swapchain, null);
}

fn createVertexBuffer(
    self: *Engine,
    vertices: []Vertex,
) vk.Buffer {
    const create_info = vk.BufferCreateInfo{
        .size = @as(u32, @truncate(@sizeOf(vertices[0]))) * @as(u32, @truncate(vertices.len)),
        .usage = .vertex_buffer_bit,
        .sharing_mode = .exclusive,
    };

    var vertex_buffer: vk.Buffer = .null;
    return switch (vk.createBuffer(
        self.logical_device,
        &create_info,
        null,
        &vertex_buffer,
    )) {
        .success => vertex_buffer,
        else => return error.FailedToCreateVertexBuffer,
    };
}

fn createVertexBufferMemory(
    self: *Engine,
    vertex_buffer: vk.Buffer,
) vk.DeviceMemory {
    var mem_reqs: vk.MemoryRequirements = .{};
    vk.getBufferMemoryRequirements(self.logical_device, vertex_buffer, &mem_reqs);

    const alloc_info = vk.MemoryAllocateInfo{
        .allocation_size = mem_reqs.size,
        .memory_type_index = try self.findMemory(
            mem_reqs.memory_type_bits,
            .init(.host_visible_bit, .host_coherent_bit),
        ),
    };

    var vertex_buffer_memory: vk.DeviceMemory = .null;
    switch (vk.allocateMemory(
        self.logical_device,
        &alloc_info,
        null,
        &vertex_buffer_memory,
    )) {
        .success => {},
        else => return error.FailedToAllocateVertexBufferMemory,
    }
}
