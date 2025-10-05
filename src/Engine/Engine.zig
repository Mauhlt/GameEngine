const std = @import("std");
const print = std.debug.print;
const Allocator = std.mem.Allocator;
// imports
const win = @import("..\\windows\\windows.zig");
const WINDOW_HANDLE = @import("window_handle.zig");
const vk = @import("..\\vulkan\\vulkan.zig");
const QFI = @import("QueueFamilyIndices.zig");
const SSD = @import("SwapchainSupportDetails.zig");
// Extensions
const required_instance_extensions = [_][*:0]const u8{
    vk.ExtensionName.win32_surface,
    vk.ExtensionName.surface,
};
const required_device_extensions = [_][*:0]const u8{
    vk.ExtensionName.swapchain,
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
n_images: u32 = 0,
images: [3]vk.Image = [_]vk.Image{.null} ** 3,
views: [3]vk.ImageView = [_]vk.ImageView{.null} ** 3,
format: vk.Format = undefined,
extent: vk.Extent2D = undefined,
// pipeline
render_pass: vk.RenderPass = .null,
pipeline_layout: vk.PipelineLayout = .null,
pipeline: vk.Pipeline = .null,

pub fn init(allo: Allocator) !Engine {
    var self: Engine = .{};
    self.window = try initWindow();
    self.instance = try createInstance();
    self.surface = try self.createSurface();
    self.physical_device = try self.pickPhysicalDevice();
    self.logical_device = try self.createLogicalDevice();
    self.swapchain = try self.createSwapchain();
    self.extent = try self.createSwapchainExtent();
    self.format = try self.createSwapchainFormat();
    // arrays
    try self.createSwapchainImages(&self.n_images, null);
    try self.createSwapchainImages(&self.n_images, &self.images);
    try self.createSwapchainImageViews(&self.views);
    // pipeline
    self.render_pass = try self.createRenderPass();
    self.pipeline_layout = try self.createGraphicsPipelineLayout();
    self.pipeline = try self.createGraphicsPipeline(allo);
    return self;
}

pub fn deinit(self: *Engine) void {
    vk.destroyPipeline(self.logical_device, self.pipeline, null);
    vk.destroyPipelineLayout(self.logical_device, self.pipeline_layout, null);
    for (0..self.n_images) |i| {
        vk.destroyImageView(self.logical_device, self.views[i], null);
    }
    vk.destroySwapchainKHR(self.logical_device, self.swapchain, null);
    vk.destroyDevice(self.logical_device, null);
    vk.destroySurfaceKHR(self.instance, self.surface, null);
    vk.destroyInstance(self.instance, null);
    self.deinitWindow();
}

fn initWindow() !WINDOW_HANDLE {
    // TODO: Switch based on os
    const instance = win.GetModuleHandleW(null);
    // wide strings
    const class_name = std.unicode.utf8ToUtf16LeStringLiteral("ZigWindowClass");
    const title = std.unicode.utf8ToUtf16LeStringLiteral("Zig Unicode Window");
    // icons + cursors
    const icon = win.LoadIconW(.null, std.unicode.utf8ToUtf16LeStringLiteral("IDI_APPLICATION"));
    const cursor = win.LoadCursorW(.null, std.unicode.utf8ToUtf16LeStringLiteral("IDC_ARROW"));
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
        800,
        600,
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
    return switch (vk.createWin32SurfaceKHR(self.instance, &create_info, null, &surface)) {
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
    n_images: *u32,
    images: [*c]vk.Image,
) !void {
    switch (vk.getSwapchainImagesKHR(
        self.logical_device,
        self.swapchain,
        n_images,
        images,
    )) {
        .success => {},
        else => return error.FailedTogetSwapchainImages,
    }
}

fn createSwapchainImageViews(
    self: *Engine,
    views: [*c]vk.ImageView,
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
        .code_size = code.len,
        .p_code = @ptrCast(@alignCast(code)),
    };
    var shader_module: vk.ShaderModule = .null;
    return switch (vk.createShaderModule(self.logical_device, &create_info, null, &shader_module)) {
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
    const create_info = vk.RenderPassCreateInfo{
        .attachment_count = 1,
        .p_attachments = &color_attachment,
        .subpass_count = 1,
        .p_subpasses = &subpass,
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
    // read files - prob should embed them for better performance
    const vert_spv = try allocReadFile(allo, "tri.vert.spv");
    defer allo.free(vert_spv);

    const frag_spv = try allocReadFile(allo, "tri.frag.spv");
    defer allo.free(frag_spv);
    // create shader modules
    const vert_sm = try self.createShaderModule(vert_spv);
    defer vk.destroyShaderModule(self.logical_device, vert_sm, null);

    const frag_sm = try self.createShaderModule(frag_spv);
    defer vk.destroyShaderModule(self.logical_device, vert_sm, null);

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
        .width = @floatFromInt(self.extent.width),
        .height = @floatFromInt(self.extent.height),
        .min_depth = 0,
        .max_depth = 1,
    };

    const scissor = vk.Rect2D{
        .offset = .{
            .x = 0,
            .y = 0,
        },
        .extent = self.extent,
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
        .layout = self.pipeline_layout,
        .render_pass = self.render_pass,
        .subpass = 0,
        .base_pipeline_handle = .null,
        .base_pipeline_index = -1,
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
