const std = @import("std");
const windows = std.os.windows;

const HWND = windows.HWND;
const DWORD = windows.DWORD;
const WPARAM = windows.WPARAM;
const LPARAM = windows.LPARAM;
const LPPARAM = windows.LPPARAM;
const HICON = windows.HICON;
const HCURSOR = windows.HCURSOR;
const HMENU = windows.HMENU;
const HINSTANCE = windows.HINSTANCE;
const LPCWSTR = windows.LPCWSTR;
const LRESULT = windows.LRESULT;

pub const WNDCLASSW = extern struct {
    style: u32,
    lpfnWndProc: wndProc, // need to define
    cbClsExtra: i32,
    cbWndExtra: i32,
    hInstance: HINSTANCE,
    hIcon: HICON,
    hCursor: HCURSOR,
    lpszMenuName: LPCWSTR,
    lpszClassName: LPCWSTR,
};

pub fn wndProc(hwnd: HWND, msg: u32, wParam: WPARAM, lParam: LPARAM) callconv(.C) LRESULT {
    switch (msg) {
        2 => return 0, // WM_DESTROY,
        else => return DefWindowProcW(hwnd, msg, wParam, lParam),
    }
}

const POINT = extern struct {
    x: i32,
    y: i32,
};

const MSG = extern struct {
    hwnd: HWND,
    message: u32,
    wParam: WPARAM,
    lParam: LPARAM,
    time: DWORD,
    pt: POINT,
};

pub extern "user32" fn DefWindowProcW() callconv(.C) void;
pub extern "user32" fn RegisterClassW(lpWndClass: *const WNDCLASSW) callconv(.C) u16;
pub extern "user32" fn CreateWindowExW(dwExStyle: DWORD, lpClassName: LPCWSTR, lpWindowName: LPCWSTR, dwStyle: DWORD, x: i32, y: i32, nWidth: i32, nHeight: i32, hWndParent: HWND, hMenu: HMENU, hInstance: HINSTANCE, lpParam: LPPARAM) callconv(.C) HWND;
pub extern "user32" fn ShowWindow(hWnd: HWND, nCmdShow: i32) callconv(.C) bool;
pub extern "user32" fn UpdateWindow(hWnd: HWND) callconv(.C) bool;
pub extern "user32" fn GetMessageW(lpMsg: *MSG, hWnd: HWND, wMsgFilterMin: u32, wMsgFilterMax: u32) callconv(.C) bool;
pub extern "user32" fn TranslateMessage(lpMsg: *const MSG) callconv(.C) bool;
pub extern "user32" fn DispatchMessageW(lpMsg: *const MSG) void;

const WM = enum {
    create = 0x0001,
    destroy = 0x0002,
    enable = 0x000A,

    enter_size_move = 0x0231,
    exit_size_move = 0x0232,

    get_icon = 0x007F,
    get_min_max_info = 0x0024,

    input_lang_change = 0x0051,
    input_lang_change_request = 0x0050,
    move = 0x0003,
    moving = 0x0216,
    ncactivate = 0x0086,
    nc_calc_size = 0x0083,
    nc_calc_create = 0x0081,
    destroy = 0x0082,
    nc_null = 0x0000,

    query_drag_icon = 0x0037,
    query_open = 0x0013,
    
    quit = 0x0012,
    show_window = 0x0018,

    size = 0x0005,
    sizing = 0x0214,

    style_changed = 0x007D,
    style_changing = 0x007C,

    theme_changed = 0x031A,
    user_changed = 0x0054,

    window_pos_changed = 0x0047,
    windoww_pos_changing = 0x0046,
    
    activate_app = 0x001C,
    cancel_mode = 0x001F,
    child_activate = 0x0022,
    close = 0x0010,
    compacting = 0x0041,
};
