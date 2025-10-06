const win = @import("..\\windows\\windows.zig");
const WindowHandle = @This();

instance: win.HINSTANCE,
title: [*:0]const u16,
hwnd: win.HWND,

pub fn getWindowSize() struct { w: u32, h: u32 } {
    const width = win.GetSystemMetrics(win.SM_CXVIRTUAL_SCREEN);
    const height = win.GetSystemMetrics(win.SM_CYVIRTUAL_SCREEN);
    return .{ .w = width, .h = height };
}
