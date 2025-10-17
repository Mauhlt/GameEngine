const std = @import("std");
const win = @import("..\\windows\\windows.zig");
const utf8ToUtf16 = std.unicode.utf8ToUtf16LeStringLiteral;
const WindowHandle = @This();

instance: win.HINSTANCE = .null,
title: [*:0]const u16,
hwnd: win.HWND = .null,
msg: win.MSG = undefined,

pub fn init(
    comptime name: []const u8,
    comptime title: []const u8,
    width: u32,
    height: u32,
) !WindowHandle {
    const instance = win.GetModuleHandleW(null);
    // wide strings
    const class_name = utf8ToUtf16(name);
    const window_title = utf8ToUtf16(title);
    // icons + cursors
    const icon = win.LoadIconW(.null, utf8ToUtf16("IDI_APPLICATION"));
    const cursor = win.LoadCursorW(.null, utf8ToUtf16("IDC_ARROW"));
    const wnd_proc = WndProc;

    var wc: win.WNDCLASSEXW = .{
        // .size = @sizeOf(@This()),
        .style = win.redraw.bits,
        .wnd_proc = wnd_proc,
        .cls_extra = 0,
        .wnd_extra = 0,
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
        win.overlapped_window.bits,
        100,
        100,
        @intCast(width),
        @intCast(height),
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
        .title = window_title,
        .hwnd = hwnd,
    };
}

pub fn deinit(self: *WindowHandle) void {
    _ = win.UnregisterClassW(
        self.title,
        self.instance,
    );
}

pub fn show(self: *const WindowHandle) void {
    _ = win.ShowWindow(self.hwnd, .show);
}

pub fn poll(self: *WindowHandle) void {
    var msg: win.MSG = undefined;
    if (win.GetMessageW(&msg, self.hwnd, 0, 0) == 0) return;
    _ = win.TranslateMessage(&msg);
    _ = win.DispatchMessageW(&msg);
}

pub fn clientSize(self: *const WindowHandle) struct { w: i32, h: i32 } {
    // drawable space
    var rect: win.RECT = undefined;
    _ = win.GetClientRect(self.hwnd, &rect);
    return .{
        .w = rect.right - rect.left,
        .h = rect.bottom - rect.top,
    };
}

pub fn windowSize(self: *const WindowHandle) struct { w: i32, h: i32 } {
    // full window size
    var rect: win.RECT = undefined;
    _ = win.GetWindowRect(self.hwnd, &rect);
    return .{
        .w = rect.right - rect.left,
        .h = rect.bottom - rect.top,
    };
}

fn WndProc(
    hwnd: win.HWND,
    msg: u32,
    wParam: win.WPARAM,
    lParam: win.LPARAM,
) callconv(.winapi) win.LRESULT {
    switch (@as(win.Messages, @enumFromInt(msg))) {
        .close => {
            _ = win.DestroyWindow(hwnd);
            return .null;
        },
        .destroy => {
            _ = win.PostQuitMessage(0);
            return .null;
        },
        // .changing => { // continue polling },
        else => {
            return win.DefWindowProcW(hwnd, msg, wParam, lParam);
        }
    }
}

pub fn shouldClose(self: *WindowHandle) bool {
    _ = win.PeekMessageW(&self.msg, .null, 0, 0, .remove);
    return switch (@as(win.Messages, @enumFromInt(self.msg.msg))) {
        .quit => true,
        else => false,
    };
}
