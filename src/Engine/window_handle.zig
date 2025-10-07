const std = @import("std");
const win = @import("..\\windows\\windows.zig");
const utf8ToUtf16 = std.unicode.utf8ToUtf16LeStringLiteral;

pub const WindowHandle = struct {
    instance: win.HINSTANCE,
    title: [*:0]const u16,
    hwnd: win.HWND,

    pub fn init(
        name: []const u8,
        title: []const u8,
        width: u32,
        height: u32,
    ) WindowHandle {
        const instance = win.GetModuleHandleW(null);
        // wide strings
        const class_name = utf8ToUtf16(name);
        const window_title = utf8ToUtf16(title);
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
            window_title,
            win.overlapped_window.bits.mask,
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
            self.window.title,
            self.window.instance,
        );
    }
};

const WindowSize = struct {
    w: u32 = 0,
    h: u32 = 0,
};

pub fn getWindowSize() WindowSize {
    const width = win.GetSystemMetrics(win.SM_CXVIRTUAL_SCREEN);
    const height = win.GetSystemMetrics(win.SM_CYVIRTUAL_SCREEN);
    return .{ .w = width, .h = height };
}

pub fn setWindowSize(
    hwnd: win.HWND,
    x: i32,
    y: i32,
    w: i32,
    h: i32,
) bool {
    win.SetWindowPos(
        hwnd,
        null,
        x,
        y,
        w,
        h,
        .init(.no_zorder, .no_activate, .show_window),
    );
}
