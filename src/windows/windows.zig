// move all windows stuff to a library
const std = @import("std");
const windows = std.os.windows;

const ATOM = windows.ATOM;

const HMODULE = ?*anyopaque;
const HINSTANCE = windows.HINSTANCE;
const HMENU = windows.HMENU;
const HWND = windows.HWND;

const DWORD = windows.DWORD;

const LPCSTR = windows.LPCSTR;
const LPVOID = windows.LPVOID;
const LRESULT = windows.LRESULT;


pub const MessageBox = @import("MessageBox.zig");
// pub const module = @import("module.zig");

extern "user32" fn GetModuleHandleA(lpModuleName: ?LPCSTR) callconv(.Stdcall) HMODULE;
pub inline fn getModuleHandle(module_name: []const u8) HMODULE {
    return GetModuleHadleA(modue_name);
}

const ClassStyle = enum(u32) {
    v_redraw = 1,
    h_redraw = 2,
    dbl_clks = 8,
    own_dc = 20,
    class_dc = 40,
    parent_dc = 80,
    no_close = 200,
    save_bits = 800,
    byte_align_client = 1_000,
    byte_align_window = 2_000,
    global_class = 4_000,
    drop_shadow = 20_000,
};
pub const ClassStyles = std.enums.EnumSet(ClassStyle);
extern"user32" fn CreateWindowA(class_name: ?LPCSTR, window_name: ?LPCSTR, style: ClassStyles, x: i32, y: i32, w: i32, h: i32, parent: ?HWND, menu: HMENU, instance: HINSTANCE, param: LPVOID,) callconv(.Stdcall) HWND;
const CreateWindow = struct {
    class_name: ?[]const u8,
    window_name: ?[]const u8,
    style: ClassStyles,
    x: u32,
    y: u32,
    w: u32,
    h: u32,
    parent: ?HWND,
    menu: HMENU,
    instance: HINSTANCE,
    param: LPVOID,
};
pub fn createWindow(create_window: CreateWindow) !HWND {
    const x = try checkLimits(create_window.x);
    const y = try checkLimits(create_window.y);
    const w = try checkLimits(create_window.w);
    const h = try checkLimits(create_window.h);
    
   return CreateWindowA(
       create_window.class_name orelse null,
       create_window.window_name orelse null,
       create_window.style,
       x,
       y,
       w,
       h,
       null,
       create_window.menu
       create_window.instance,
       create_window.param,
   );
}

fn checkLimits(x: u32) !i32 {
    // used to convert u32 to i32
    if (x < 0) return error.TooSmall;
    if (x > std.math.maxInt(i32)) return error.TooLarge;
    return @intCast(x);
}

export fn WndProc(hwnd: HWND, msg: u32, wParam: WPARAM, lParam: LPARAM) callconv(.Stdcall) LRESULT {
    switch (msg) {
        .destroy => {
            PostQuitMessage(0);
            return 0;
        },
        else => return DefWindowProcA(hwnd, msg, wParam, lParam),
    }
}

extern "user32" fn LoadIconA(instance: ?HINSTANCE, icon_name: LPCSTR) ?HICON;
const LoadIcon = struct {
    instance: ?HINSTANCE = null,
    name: LPCSTR,
};
pub fn loadIcon(load_icon: LoadIcon) ?HICON {
    return LoadIconA(load_icon.instance, load_icon.name);
}

extern "user32" fn LoadCursorA(instance: ?HINSTANCE, icon_name: LPCSTR) ?HCURSOR;
const LoadCursor = struct {
    instance: ?HINSTANCE = null,
    name: LPCSTR,
};
pub fn loadCursor(load_cursor: LoadCursor) HCURSOR {
    return LoadCursorA(
        load_cursor.instance,
        load_cursor.name,
        );
}

extern "user32" RegisterClassA(lpWndClass: *const WNDCLASSA) ATOM;
const WNDCLASSA = extern struct {
    style: ClassStyles,
    lpfnWndProc: @TypeOf(wnd_proc),
    cbClsExtra: i32 = 0, // extra bytes for class 
    cbWndExtra: i32 = 0, // extra bytes for window instance
    instance: HINSTANCE,
    icon: HICON,
    cursor: HCURSOR,
    brush: HBRUSH,
    menu_name: LPCSTR,
    class_name: LPCSTR,
};
pub fn registerClass(wnd_class: *const WNDCLASSA) ATOM {
    return RegisterClassA(wnd_class);
}

const Color = enum(DWORD) {
    scroll_bar = 0,
    desktop = 1,
    background = 1,
    active_caption = 2,
    inactive_caption = 3,
    menu = 4,
    window = 5,
    window_frame = 6,
    menu_text = 7,
    window_text = 8,
    caption_text = 9,
    active_border = 10,
    inactive_boarder = 11,
    app_workspace = 12,
    highlight = 13,
    highlight_text = 14,
    face_3d = 15,
    btn_face = 15,
    shadow_3d = 16,
    btn_shadow = 16,
    graytext = 17,
    btn_text = 18,
    inactive_caption_text = 19,
    highlight_3d = 20,
    btn_highlight = 20,
    hilight_3d = 20, 
    btn_hilight = 20,
    dk_shadow_3d = 21,
    light_3d = 22,
    info_text = 23,
    info_bk = 24,
    hot_light = 26,
    gradient_active_caption = 27,
    gradient_inactive_caption = 28,
    menu_hilight = 29,
    menu_bar = 30,
};
extern "user32" fn GetSysColor(nIndex: i32) Color;
pub inline fn getSysColor(n_index: i32) Color {
    return GetSysColor(n_index);
}
