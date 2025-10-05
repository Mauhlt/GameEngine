const win = @import("..\\windows\\windows.zig");
const WindowHandle = @This();

instance: win.HINSTANCE,
title: [*:0]const u16,
hwnd: win.HWND,
