const std = @import("std");
const print = std.debug.print;
const Allocator = std.mem.Allocator;
// imports
const win = @import("windows\\windows.zig");
const WINDOW_HANDLE = @import("window_handle.zig");
const vk = @import("vulkan\\vulkan.zig");
const QFI = @import("QueueFamilyIndices.zig");
// Extensions
// TODO: convert extension names from containing a bunch of fields to containing a bunch of declarations instead
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

pub fn init(allo: Allocator) !Engine {
    _ = allo;
    var self: Engine = .{};
    self.window = try initWindow();
    self.instance = try createInstance();
    self.surface = try self.createSurface();
    self.physical_device = try self.pickPhysicalDevice();
    self.logical_device = try self.createLogicalDevice();
    return self;
}

pub fn deinit(self: *Engine) void {
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
    _ = vk.enumerateInstanceExtensionProperties(null, &n_exts, null);
    var exts: [64]vk.ExtensionProperties = undefined;
    _ = vk.enumerateInstanceExtensionProperties(null, &n_exts, &exts);
    // check that all required instance extensions are supported
    outer: for (required_instance_extensions) |req_ext| {
        const name1 = std.mem.span(req_ext);
        for (exts[0..n_exts]) |extension| {
            const len = std.mem.indexOfScalar(u8, &extension.extension_name, 0).?;
            const name2 = extension.extension_name[0..len];
            if (std.mem.eql(u8, name1, name2)) continue :outer;
        }
        print("Not Found: {s}\n", .{name1});
        return error.RequiredExtensionNotSupported;
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
        .enabled_extension_count = required_instance_extensions.len,
        .pp_enabled_extension_names = &required_instance_extensions,
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
    var n_devices: u32 = undefined;
    switch (vk.enumeratePhysicalDevices(self.instance, &n_devices, null)) {
        .success => {},
        else => return error.FailedToEnumeratePhysicalDevices,
    }
    if (n_devices == 0) return error.FoundNoPhysicalDevice;
    print("# Of Devices: {}\n", .{n_devices});

    var physical_devices: [16]vk.PhysicalDevice = undefined;
    switch (vk.enumeratePhysicalDevices(self.instance, &n_devices, &physical_devices)) {
        .success => {},
        else => return error.FailedToEnumeratePhysicalDevices,
    }

    for (physical_devices[0..n_devices]) |physical_device| {
        const is_device_suitable = isDeviceSuitable(physical_device, self.surface);
        print("Is Device Suitable: {}\n", .{is_device_suitable});
        if (is_device_suitable) return physical_device;
    }

    return physical_devices[0];
    // return error.FoundNoSuitablePhysicalDevice;
}

// simplest
fn isDeviceSuitable(device: vk.PhysicalDevice, surface: vk.SurfaceKHR) bool {
    const is_complete = !QFI.init(device, surface).isComplete();
    const are_exts_supported = checkDeviceExtensionSupport(device);
    return is_complete and are_exts_supported;
}

fn checkDeviceExtensionSupport(device: vk.PhysicalDevice) bool {
    var n_exts: u32 = 0;
    switch (vk.enumerateDeviceExtensionProperties(device, null, &n_exts, null)) {
        .success => {},
        else => return false,
        // else => return error.FailedToEnumerateDeviceExtensionProperties,
    }
    var exts: [512]vk.ExtensionProperties = undefined;
    switch (vk.enumerateDeviceExtensionProperties(device, null, &n_exts, &exts)) {
        .success => {},
        else => return false,
        // else => return error.FailedToEnumerateDeviceExtensionProperties,
    }

    for (required_device_extensions) |req_ext| {
        const name = std.mem.span(req_ext);
        print("Name: {s}\n", .{name});
    }
    print("\n", .{});

    for (required_instance_extensions) |req_ext| {
        const name1 = std.mem.span(req_ext);
        for (exts[0..n_exts]) |ext| {
            const len = std.mem.indexOfScalar(u8, &ext.extension_name, 0).?;
            const name2 = ext.extension_name[0..len];
            if (std.mem.eql(u8, name1, name2)) return true;
        }
    }

    return false;
}

// better
fn isDeviceSuitable1(device: vk.PhysicalDevice) bool {
    var props: vk.PhysicalDeviceProperties2 = undefined;
    vk.getPhysicalDeviceProperties(device, &props);
    var feats: vk.PhysicalDeviceFeatures2 = undefined;
    vk.getPhysicalDeviceFeatures2(device, &feats);
    return props.deviceType == .device_type_discrete_gpu and (feats.geometryShader > 0);
}

// complex
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
    const indices = QFI.init(self.physical_device, self.surface);
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
        .enabled_extension_count = 0,
        .pp_enabled_extension_names = null,
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
