const std = @import("std");
const print = std.debug.print;
const Allocator = std.mem.Allocator;
// imports
const win = @import("windows\\windows.zig");
const vk = @import("vulkan\\vulkan.zig");
// const vk = @import("translated_vulkan.zig");
// Extensions
// TODO: convert extension names from containing a bunch of fields to containing a bunch of declarations instead
const required_instance_extensions = [_][*:0]const u8{
    // vk.ExtensionNames.portability_enumeration,
    vk.VK_KHR_PORTABILITY_ENUMERATION_EXTENSION_NAME,
};
const required_device_extensions = [_][*:0]const u8{
    vk.VK_KHR_SURFACE_EXTENSION_NAME,
    vk.VK_KHR_WIN32_SURFACE_EXTENSION_NAME,
        // vk.ExtensionNames.surface,
        // vk.ExtensionNames.win32_surface,
};
// Fields
// instance: vk.Instance,

pub fn init(allo: Allocator) !void { // @This() {
    // Window Handle
    var win_han = try initWindow();
    defer deinitWindow(&win_han);
    // Vulkan Handle
    try initVulkan(allo);

    // // Surface
    // const surface_info = vk.Win32SurfaceCreateInfoKHR{
    //     .s_type = .win32_surface_create_info_khr,
    //     .p_next = null,
    //     .flags = 0,
    //     .hinstance = win_han.instance,
    //     .hwnd = win_han.hwnd,
    // };
    // var surface: vk.SurfaceKHR = undefined;
    // const result = vk.createWin32SurfaceKhr(
    //     win_han.instance,
    //     &surface_info,
    //     allo,
    //     &surface,
    // );
    // switch (result) {
    //     .success => {},
    //     else => return error.FailedToCreateVulkanSurface,
    // }

    // Show + Update: TODO: ABSTRACT THESE FUNCTIONS TO SHOW/UPDATE regardless of os
    // _ = win.ShowWindow(win_han.hwnd, .show);
    // _ = win.UpdateWindow(win_han.hwnd); // don't think I need this

    // TODO: messages - Should be turned into a pollevents type of thing for each os
    // var msg: win.MSG = undefined;
    // TODO: Turn this into a core loop
    // while (win.GetMessageW(&msg, .null, 0, 0) != 0) {
    //     _ = win.TranslateMessage(&msg);
    //     _ = win.DispatchMessageW(&msg);
    // }

    // return .{
    //     .instance = instance,
    // };
}

pub fn deinit(self: *@This()) void {
    _ = self;
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

fn deinitWindow(window_handle: *WINDOW_HANDLE) void {
    _ = win.UnregisterClassW(
        window_handle.window_title,
        window_handle.instance,
    );
}

fn initVulkan(allo: Allocator) !void {
    try createInstance(allo);
}

fn createInstance(allo: Allocator) !void { // !vk.VkInstance {
    _ = allo;

    // Old Way:
    // const app_info = vk.VkApplicationInfo{
    //     .sType = vk.VK_STRUCTURE_TYPE_APPLICATION_INFO,
    //     .pNext = null,
    //     .pApplicationName = "Curr App",
    //     .applicationVersion = vk.VK_MAKE_API_VERSION(0, 1, 0, 0),
    //     .pEngineName = "No Engine",
    //     .engineVersion = vk.VK_MAKE_API_VERSION(0, 1, 0, 0),
    //     .apiVersion = vk.VK_MAKE_API_VERSION(0, 1, 0, 0),
    // };
    // _ = app_info;
    // var n_props: u32 = 0;
    // _ = vk.vkEnumerateInstanceExtensionProperties(null, &n_props, null);
    // print("# of Props: {}\n", .{n_props});
    // vkEnumerateInstanceExtensionProperties(pLayerName: [*c]const u8, pPropertyCount: [*c]u32, pProperties: [*c]VkExtensionProperties) VkResult;
    // enumerateInstanceExtensionProperties(p_layer_name: [*c]const u8, p_property_count: [*c]u32, p_properties: [*c]ExtensionProperties) Result;
    // var n_props: u32 = 0;
    // _ = vk.enumerateInstanceExtensionProperties(null, &n_props, null);
    // print("# Of Props: {}\n", .{n_props});

    // New Way:
    var n_props: u32 = 0;
    _ = vk.enumerateInstanceExtensionProperties(null, &n_props, null); // changing the name means i cant use this - whaaaat
    print("# of Props: {}\n", .{n_props});
    // New way = write old name - write new name underneath it for translated vulkan to work

    // const create_info = vk.InstanceCreateInfo{
    //     .p_application_info = &app_info,
    //     .enabled_extension_count = 0,
    //     .pp_enabled_extension_names = null,
    //     .enabled_layer_count = 0,
    //     .pp_enabled_layer_names = null,
    // };
    // _ = create_info;
}
