const std = @import("std");
const print = std.debug.print;
const Allocator = std.mem.Allocator;
// imports
const win = @import("windows\\windows.zig");
const vk = @import("vulkan\\vulkan.zig");
const QFI = @import("QueueFamilyIndices.zig");
// Extensions
// TODO: convert extension names from containing a bunch of fields to containing a bunch of declarations instead
const required_instance_extensions = [_][*:0]const u8{
    vk.ExtensionName.win32_surface,
    vk.ExtensionName.surface,
};
const required_device_extensions = [_][*:0]const u8{
    // vk.VK_KHR_SURFACE_EXTENSION_NAME,
    // vk.VK_KHR_WIN32_SURFACE_EXTENSION_NAME,
    // vk.ExtensionNames.surface,
    // vk.ExtensionNames.win32_surface,
};
const GameEngine = @This();
// Fields
window: WINDOW_HANDLE,
instance: vk.Instance,
physical_device: vk.PhysicalDevice,

pub fn init(allo: Allocator) !GameEngine {
    var self: GameEngine = undefined;
    // Window Handle
    self.window = try initWindow();
    // Vulkan Handle
    try self.initVulkan(allo);
    return self;
}

pub fn deinit(self: *GameEngine) void {
    vk.destroyInstance(self.instance, null);
    self.deinitWindow();
}

const WINDOW_HANDLE = struct {
    instance: win.HINSTANCE,
    window_title: [*:0]const u16,
    hwnd: win.HWND,
};

fn initWindow() !WINDOW_HANDLE {
    // TODO: Switch based on os
    const instance = win.GetModuleHandleW(null);
    // wide strings
    const class_name = std.unicode.utf8ToUtf16LeStringLiteral("ZigWindowClass");
    const window_title = std.unicode.utf8ToUtf16LeStringLiteral("Zig Unicode Window");
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
        window_title,
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
        .window_title = window_title,
        .hwnd = hwnd,
    };
}

fn deinitWindow(self: *GameEngine) void {
    _ = win.UnregisterClassW(
        self.window.window_title,
        self.window.instance,
    );
}

fn initVulkan(self: *GameEngine, allo: Allocator) !void {
    _ = allo;
    self.instance = try createInstance();
    self.physical_device = try self.pickPhysicalDevice();
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
        .p_application_info = &app_info,
        .flags = if (@import("builtin").os.tag == .macos) //
            .init(.enumerate_portability_bit_khr) //
        else //
            .initEmpty(),
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
        .enabled_extension_count = n_exts,
        .pp_enabled_extension_names = @ptrCast(&required_instance_extensions),
    };
    // create instance
    var instance: vk.Instance = .null;
    const result = vk.createInstance(&create_info, null, &instance);
    print("Result: {s}\n", .{@tagName(result)});
    return instance;
}

fn pickPhysicalDevice(self: *GameEngine) !vk.PhysicalDevice {
    var n_devices: u32 = undefined;
    _ = vk.enumeratePhysicalDevices(self.instance, &n_devices, null);
    print("# of Physical Devices: {}\n", .{n_devices});
    if (n_devices == 0) return error.FoundNoPhysicalDevice;
    var physical_devices: [16]vk.PhysicalDevice = undefined;
    _ = vk.enumeratePhysicalDevices(self.instance, &n_devices, &physical_devices);

    for (physical_devices[0..n_devices]) |physical_device| {
        if (isDeviceSuitable(physical_device)) return physical_device;
    } else return error.FoundNoSuitablePhysicalDevice;
}

// simplest
fn isDeviceSuitable(device: vk.PhysicalDevice) bool {
    var indices = QFI.init(device);
    return indices.isComplete();
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
