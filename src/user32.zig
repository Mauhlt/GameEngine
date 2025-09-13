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
