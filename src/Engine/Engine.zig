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
n_images: u32 = 0,
images: [3]vk.Image = [_]vk.Image{.null} ** 3,
image_views: [3]vk.ImageView = [_]vk.ImageView{.null} ** 3,
framebuffers: [3]vk.Framebuffer = [_]vk.Framebuffer{.null} ** 3,

pub fn init(
    allo: std.mem.Allocator,
    comptime app_name: [*:0]const u8,
    comptime window_title: [*:0]const u8,
    engine_name: [*:0]const u8,
    width: u32,
    height: u32,
) !Engine {
    _ = allo;
    const window = try WindowHandle.init(
        std.mem.span(app_name),
        std.mem.span(window_title),
        width,
        height,
    );
    const instance = try createInstance(app_name, engine_name);
    const surface = try createSurface(&window, instance);
    const physical_device = try pickPhysicalDevice(instance, surface);
    const device = try createLogicalDevice(surface, physical_device);

    const indices = QFI.init(surface, physical_device) catch unreachable;
    const graphics_queue = getDeviceQueue(device, indices.graphics_family);
    const present_queue = getDeviceQueue(device, indices.present_family);

    const ssd = try SSD.init(surface, physical_device);
    const swapchain = try createSwapchain(&window, surface, physical_device, device, &ssd);
    const n_images = try getNumImages(device, swapchain);
    var images: [3]vk.Image = [_]vk.Image{.null} ** 3;
    try getImages(device, swapchain, &n_images, &images);
    const format = ssd.chooseFormat();
    const extent = ssd.chooseExtent();
    var image_views: [3]vk.ImageView = [_]vk.ImageView{.null} ** 3;
    try createImageViews(device, format, n_images, &images, &image_views);

    window.show();
    return Engine{
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
        .n_images = n_images,
        .images = images,
        .format = format,
        .extent = extent,
    };
}

pub fn deinit(self: *Engine) void {
    for (self.image_views[0..self.n_images]) |*image_view| //
        vk.destroyImageView(self.device, image_view, null);
    vk.destroySwapchainKHR(self.device, self.swapchain, null);
    vk.destroyDevice(self.device, null);
    vk.destroySurfaceKHR(self.instance, self.surface, null);
    vk.destroyInstance(self.instance, null);
    self.window.deinit();
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
    and ssd.capabilities.max_image_count < ssd.min_image_count + 1) //
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
        .image_usage = .color_attachment_bit,
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

fn getNumImages(device: vk.Device, swapchain: vk.SwapchainKHR) !u32 {
    var n_images: u32 = 0;
    return switch (vk.getSwapchainImagesKHR(device, swapchain, &n_images, null)) {
        .success => n_images,
        else => return error.FailedToGetSwapchainImages,
    };
}

fn getImages(
    device: vk.Device,
    swapchain: vk.SwapchainKHR,
    n_images: *u32,
    images: *[3]vk.Image,
) !void {
    switch (vk.getSwapchainImagesKHR(device, swapchain, &n_images, images)) {
        .success => {},
        else => return error.FailedToGetSwapchainImages,
    }
}

fn createImageViews(
    device: vk.Device,
    format: vk.Format,
    n_images: u32,
    images: *const [3]vk.Image,
    image_views: *[3]vk.ImageView,
) !void {
    for (0..n_images) |i| {
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
            .aspect_mask = .color_bit,
            .base_mip_level = 0,
            .level_count = 1,
            .base_array_layer = 0,
            .layer_count = 1,
        };

        var image_view: vk.ImageView = .null;
        switch (vk.createImageView(device, &create_info, null, &image_view)) {
            .success => {},
            else => return error.FailedToCreateImageView,
        }
        image_views[i] = image_view;
    }
}
