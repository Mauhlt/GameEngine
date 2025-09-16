// Windows Message Box
const std = @import("std");
const windows = std.os.windows;
const HWND = windows.HWND;
const LPCSTR = windows.LPCSTR;

pub extern "user32" fn MessageBoxA(hWnd: ?HWND, lpText: ?LPCSTR, lpCaption: ?LPCSTR, uType: BASE) RETURN;
const BASE = enum(u32) {
    ok = 0,
    ok_cancel = 1,
    abort_retry_ignore = 2,
    yes_no_cancel = 3,
    yes_no = 4,
    retry_cancel = 5,
    cancel_try_continue = 6,
    stop = 10,
    help = 4000,
};

const ICON = enum(u32) {
    question = 20,
    exclamation = 30,
    information = 40,
    _error = 10,
    pub const warning = @This().exclamation;
    pub const asterisk = @This().information;
    pub const hand = @This()._error;
};

const RETURN = enum(i32) {
    ok = 1,
    cancel = 2,
    abort = 3,
    retry = 4,
    ignore = 5,
    yes = 6,
    no = 7,
    try_again = 10,
    @"continue" = 11,
};
