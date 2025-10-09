const t = @import("windows_types.zig");
const e = @import("windows_enums.zig");
const s = @import("windows_structs.zig");
// Fns:
//  CreateWindowExW
//  DefWindowProcW
//  DispatchMessageW
//  GetMessageW
//  RegisterClassExW
//  ShowWindow
//  UnregisterClassExW
//  UpdateWindow
//  WndProc

// fns
pub extern "user32" fn CreateWindowExW(
    style: u32,
    class_name: [*:0]const u16,
    window_name: [*:0]const u16,
    style: u32,
    x: i32,
    y: i32,
    w: i32,
    h: i32,
    parent: t.HWND,
    menu: t.HMENU,
    instance: t.HINSTANCE,
    lpParam: t.LPVOID,
) callconv(.winapi) t.HWND;

pub extern "user32" fn DefWindowProcW(
    hwnd: t.HWND,
    msg: u32,
    wParam: t.WPARAM,
    lParam: t.LPARAM,
) callconv(.winapi) t.LRESULT;

pub extern "user32" fn DispatchMessageW(msg: *const s.MSG) callconv(.winapi) t.LRESULT;

pub extern "user32" fn GetMessageW(
    msg: *s.MSG,
    hwnd: t.HWND,
    msg_filter_min: u32,
    msg_filter_max: u32,
) callconv(.winapi) i32;

pub extern "kernel32" fn GetModuleHandleW(
    module_name: ?[*:0]const u16,
) callconv(.winapi) t.HINSTANCE;

pub extern "gdi32" fn GetSysColorBrush(index: e.Color) callconv(.winapi) t.HBRUSH;

pub extern "user32" fn GetSystemMetrics(n_index: e.SystemMetrics) callconv(.winapi) i32;

pub extern "user32" fn GetClientRect(
    hwnd: t.HWND,
    rect: *s.RECT,
) callconv(.winapi) bool;

pub extern "user32" fn GetWindowRect(
    hwnd: t.HWND,
    rect: *s.RECT,
) callconv(.winapi) bool;

pub extern "user32" fn LoadIconW(
    instance: t.HINSTANCE,
    icon_name: [*:0]const u16,
) callconv(.winapi) t.HICON;

pub extern "user32" fn LoadCursorW(
    instance: t.HINSTANCE,
    cursor_name: [*:0]const u16,
) callconv(.winapi) t.HCURSOR;

pub extern "user32" fn PostQuitMessage(exit_code: i32) callconv(.winapi) void;

pub extern "user32" fn PeekMessageW(
    msg: *s.MSG,
    hwnd: t.HWND,
    msg_filter_min: u32,
    msg_filter_max: u32,
    remove_msg: u32,
) callconv(.winapi) bool;

pub extern "user32" fn RegisterClassW(
    class: *const s.WNDCLASSW,
) callconv(.winapi) t.ATOM;

pub extern "user32" fn RegisterClassExW(
    class: *const s.WNDCLASSEXW,
) callconv(.winapi) t.ATOM;

pub extern "user32" fn SetWindowPos(
    hwnd: t.HWND,
    hwnd_insert_after: t.HWND,
    x: i32,
    y: i32,
    w: i32,
    h: i32,
    u_flags: e.SWP,
) callconv(.winapi) bool;

pub extern "user32" fn ShowWindow(hwnd: t.HWND, show_cmd: e.SW) callconv(.winapi) i32;

pub extern "user32" fn TranslateMessage(msg: *const s.MSG) callconv(.winapi) i32;

pub extern "user32" fn UnregisterClassW(
    class_name: [*:0]const u16,
    instance: t.HINSTANCE,
) bool;

pub extern "user32" fn UpdateWindow(hwnd: t.HWND) callconv(.winapi) i32;

pub export fn WndProc(
    hwnd: t.HWND,
    msg: u32,
    wParam: t.WPARAM,
    lParam: t.LPARAM,
) callconv(.winapi) t.LRESULT {
    switch (@as(e.Messages, @enumFromInt(msg))) {
        .destroy => {
            PostQuitMessage(0);
            return @enumFromInt(0);
        },
        else => return DefWindowProcW(hwnd, msg, wParam, lParam),
    }
}
