const std = @import("std");
const print = std.debug.print;
// windows
const win = @import("windows/windows.zig");
// vulkan
// const vk = @import("vulkan.zig");

pub fn main() void {
    // // allocator
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // const allo = gpa.allocator();
    // defer std.debug.assert(gpa.deinit() == .ok);
    // window
    const instance = win.GetModuleHandleW(null);
    const class_name = std.unicode.utf8ToUtf16LeStringLiteral("ZigWindowClass");
    const window_title = std.unicode.utf8ToUtf16LeStringLiteral("Zig Unicode Window");
    // _ = window_title;
    var wc: win.WNDCLASSEXW = .{
        .style = win.class_style_draw,
        .instance = instance,
        .icon = win.LoadIconW(null, std.unicode.utf8ToUtf16LeStringLiteral("IDI_APPLICATION")),
        .cursor = win.LoadCursorW(null, std.unicode.utf8ToUtf16LeStringLiteral("IDC_ARROW")),
        .brush = win.GetSysColorBrush(.window),
        .menu_name = null,
        .class_name = class_name,
        .small_icon = win.LoadIconW(null, std.unicode.utf8ToUtf16LeStringLiteral("IDI_APPLICATION")),
    };
    if (win.RegisterClassExW(&wc) == 0) {
        print("Registering Class Failed\n", .{});
        return;
    }
    const hwnd = win.CreateWindowExW(
        0,
        class_name,
        window_title,
        win.overlapped_window.bits.mask,
        100,
        100,
        800,
        600,
        null,
        null,
        instance,
        null,
    ) orelse {
        print("CreateWindow Failed.\n", .{});
        return;
    };
    _ = win.ShowWindow(hwnd, .show);
    _ = win.UpdateWindow(hwnd);
    // Surface
    // const surface_info = vk.Win32SurfaceCreateInfoKHR{
    //     .s_type = .win32_surface_create_info_khr,
    //     .p_next = null,
    //     .flags = 0,
    //     .hinstance = instance,
    //     .hwnd = hwnd,
    // };
    // var surface: vk.SurfaceKHR = undefined;
    // const result = vk.CreateWin32SurfaceKHR(instance, &surface_info, allo, &surface);
    // switch (result) {
    //     .success => {},
    //     else => return error.FailedToCreateVulkanSurface,
    // }
    // messages
    var msg: win.MSG = undefined;
    while (win.GetMessageW(&msg, null, 0, 0) != 0) {
        _ = win.TranslateMessage(&msg);
        _ = win.DispatchMessageW(&msg);
    }
}
