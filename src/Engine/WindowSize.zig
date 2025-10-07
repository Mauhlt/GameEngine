const win = @import("..\\windows\\windows.zig");
const WindowSize = @This();

w: u32 = 0,
h: u32 = 0,

pub fn init() WindowSize {
    const width = win.GetSystemMetrics(win.SM_CXVIRTUAL_SCREEN);
    const height = win.GetSystemMetrics(win.SM_CYVIRTUAL_SCREEN);
    return .{ .w = width, .h = height };
}
