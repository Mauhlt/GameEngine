const vk = @import("vulkan.zig");
const std = @import("std");
const print = std.debug.print;

const windows = std.os.windows;
const HWND = windows.HWND;
const HINSTANCE = windows.HINSTANCE;
const LPCWSTR = windows.LPCWSTR;
const WNDPROC = fn (HWND, u32, usize, isize) callconv(.C) isize;

const State = enum(u64) {
    overlapped_window = 0x00CF000,
    used_default = 0x8000000,
    destroy = 0x0002,
    close = 0x0010,
    show = 5,
};

window: windows.HWND,

pub fn init() @This() {
    initVulkan();
    return @This(){};
}

pub fn deinit() void {}

pub fn run() void {}

fn initWindow(width: u32, height: u32) void {}

fn initVulkan() void {}

fn main() void {}

pub fn getExtensions() u32 {
    var n_exts: u32 = 0;
    vk.enumerateInstanceExtensionProperties(null, &n_exts, null);
    return n_exts;
}

extern "user32" fn CreateWindowExW(
    dwExStyle: u32,
    u32,
    lpClassName: LPCWSTR,
    lpWindowName: LPCWSTR,
    dwStyle: u32,
    x: c_int,
    y: c_int,
    w: c_int,
    h: c_int,
    hWndParent: ?HWND,
    hMenu: ?windows.HMENU,
    hInstance: ?HINSTANCE,
    lpParam: ?*anyopaque,
) HWND;

fn WndProc(hwnd: HWND, msg: u32, wParam: usize, lParam: isize) callconv(.C) isize {
    switch (msg) {
        .close => {
            PostQuitMessage(0);
            return 0;
        },
        else => return DefWindowProcW(hwnd, msg, wParam, lParam),
    }
}
