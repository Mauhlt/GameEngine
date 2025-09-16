const std = @import("std");
const print = std.debug.print;
// windows
const win = std.os.windows;
const ATOM = win.ATOM;
const HWND = win.HWND;
const HINSTANCE = win.HINSTANCE;
const HCURSOR = win.HCURSOR;
const HICON = win.HICON;
const HBRUSH = win.HBRUSH;
const HMENU = win.HMENU;
const LPARAM = win.LPARAM;
const LRESULT = win.LRESULT;
const WPARAM = win.WPARAM;
// exports
export fn WndProc(
    hwnd: HWND,
    msg: u32,
    wParam: WPARAM,
    lParam: LPARAM,
) callconv(.winapi) LRESULT {
    switch (@as(Messages, @enumFromInt(msg))) {
        .destroy => {
            PostQuitMessage(0);
            return 0;
        },
        else => return DefWindowProcW(hwnd, msg, wParam, lParam),
    }
}
// enums
const WindowStyle = enum(u32) {
    overlapped = 0,
    maximize_box = 0x00_010_000,
    minimize_box = 0x00_020_000,
    thick_frame = 0x00_040_000,
    sys_menu = 0x00_080_000,
    h_scroll = 0x00_100_000,
    v_scroll = 0x00_200_000,
    dlg_frame = 0x00_400_000,
    border = 0x00_800_000,
    caption = 0x00_c00_000,
    max = 0x01_000_000,
    clip_children = 0x02_000_000,
    clip_siblings = 0x04_000_000,
    disabled = 0x08_000_000,
    visible = 0x10_000_000,
    min = 0x20_000_000,
    child = 0x40_000_000,
    pop_up = 0x80_000_000,
};
const WindowStyles = std.EnumSet(WindowStyle);
const overlapped_window: WindowStyles = .initMany(&.{
    .overlapped,
    .caption,
    .sys_menu,
    .thick_frame,
    .minimize_box,
    .maximize_box,
});
const popup_window: WindowStyles = .initMany(&.{ .popup, .border, .sysmenu });
const tiled_window: WindowStyles = .initMany(&.{
    .overlapped,
    .caption,
    .sys_menu,
    .thick_frame,
    .minimize_box,
    .maximize_box,
});
const Messages = enum(u32) {
    null = 0x0000,
    create = 0x0001,
    destroy = 0x0002,
    move = 0x0003,
    size = 0x0005,
    sizing = 0x0214,
    enable = 0x000A,
    close = 0x0010,
    quit = 0x0012,
    query_open = 0x0013,
    show_window = 0x0018,
    activate_app = 0x001C,
    cancel_mode = 0x001F,
    child_activate = 0x0022,
    get_min_max_info = 0x0024,
    query_drag_icon = 0x0037,
    compacting = 0x0041,
    window_pos_changing = 0x0046,
    window_pos_changed = 0x0047,
    input_lang_request_change = 0x0050,
    input_lang_change = 0x0051,
    user_changed = 0x0054,
    style_changing = 0x007C,
    style_changed = 0x007D,
    nc_create = 0x0081,
    nc_destroy = 0x0082,
    nc_calc_size = 0x0083,
    nc_activate = 0x0086,
    get_icon = 0x007F,
    moving = 0x0216,
    enter_size_move = 0x0231,
    exit_size_move = 0x0232,
    theme_changed = 0x031A,
    _,
};
const ClassStyle = enum(u32) {
    v_redraw = 1,
    h_redraw = 2,
};
const ClassStyles = std.EnumSet(ClassStyle);
const SW = enum(i32) {
    hide = 0,
    normal = 1,
    show_min = 2,
    max = 3,
    show_no_activate = 4,
    show = 5,
    min = 6,
    show_min_no_active = 7,
    show_na = 8,
    restore = 9,
};
// structs
const WNDCLASSEXW = extern struct {
    size: u32 = @sizeOf(WNDCLASSEXW),
    style: u32,
    wnd_proc: *const @TypeOf(WndProc) = WndProc,
    cls_extra: i32 = 0,
    wnd_extra: i32 = 0,
    instance: HINSTANCE,
    icon: ?HICON,
    cursor: ?HCURSOR,
    brush: HBRUSH,
    menu_name: ?[*:0]const u16,
    class_name: ?[*:0]const u16,
    small_icon: ?HICON,
};
const MSG = extern struct {
    hwnd: HWND,
    msg: u32,
    wParam: WPARAM,
    lParam: LPARAM,
    time: u32,
    pt: POINT,
    private: u32,
};
const POINT = extern struct {
    x: i32,
    y: i32,
};
const Color = enum(i32) {
    window = 5,
    window_frame = 6,
    window_text = 8,
};
// fns
extern "user32" fn DefWindowProcW(
    hwnd: HWND,
    msg: u32,
    wParam: WPARAM,
    lParam: LPARAM,
) callconv(.winapi) LRESULT;
extern "user32" fn RegisterClassExW(class: *const WNDCLASSEXW) callconv(.winapi) ATOM;
extern "user32" fn CreateWindowExW(
    style: u32,
    class_name: [*:0]const u16,
    window_name: [*:0]const u16,
    style: u32,
    x: i32,
    y: i32,
    w: i32,
    h: i32,
    parent: ?HWND,
    menu: ?HMENU,
    instance: HINSTANCE,
    lpParam: ?*anyopaque,
) callconv(.winapi) ?HWND;
extern "user32" fn ShowWindow(hwnd: HWND, show_cmd: SW) callconv(.winapi) i32;
extern "user32" fn UpdateWindow(hwnd: HWND) callconv(.winapi) i32;
extern "user32" fn GetMessageW(
    msg: *MSG,
    hwnd: ?HWND,
    msg_filter_min: u32,
    msg_filter_max: u32,
) callconv(.winapi) i32;
extern "user32" fn TranslateMessage(msg: *const MSG) callconv(.winapi) i32;
extern "user32" fn DisptachMessageW(msg: *const MSG) callconv(.winapi) LRESULT;
extern "user32" fn LoadIconW(
    instance: ?HINSTANCE,
    icon_name: [*:0]const u16,
) callconv(.winapi) ?HICON;
extern "user32" fn LoadCursorW(
    instance: ?HINSTANCE,
    cursor_name: [*:0]const u16,
) callconv(.winapi) ?HCURSOR;
extern "user32" fn PostQuitMessage(exit_code: i32) callconv(.winapi) void;
extern "user32" fn DispatchMessageW(msg: *const MSG) LRESULT;
extern "kernel32" fn GetModuleHandleW(
    module_name: ?[*:0]const u16,
) callconv(.winapi) HINSTANCE;
extern "gdi32" fn GetSysColorBrush(index: Color) callconv(.winapi) HBRUSH;

pub fn main() void {
    const instance = GetModuleHandleW(null);
    const class_name = std.unicode.utf8ToUtf16LeStringLiteral("ZigWindowClass");
    const window_title = std.unicode.utf8ToUtf16LeStringLiteral("Zig Unicode Window");
    // _ = window_title;
    var wc: WNDCLASSEXW = .{
        .style = ClassStyles.initMany(&.{ .h_redraw, .v_redraw }).bits.mask,
        .instance = instance,
        .icon = LoadIconW(null, std.unicode.utf8ToUtf16LeStringLiteral("IDI_APPLICATION")),
        .cursor = LoadCursorW(null, std.unicode.utf8ToUtf16LeStringLiteral("IDC_ARROW")),
        .brush = GetSysColorBrush(.window),
        .menu_name = null,
        .class_name = class_name,
        .small_icon = LoadIconW(null, std.unicode.utf8ToUtf16LeStringLiteral("IDI_APPLICATION")),
    };
    if (RegisterClassExW(&wc) == 0) {
        print("Registering Class Failed\n", .{});
        return;
    }
    const hwnd = CreateWindowExW(
        0,
        class_name,
        window_title,
        overlapped_window.bits.mask,
        100,
        100,
        800,
        600,
        null,
        null,
        instance,
        null,
    ) orelse {
        print("CreateWindow Failed.\n", .{});
        return;
    };
    _ = ShowWindow(hwnd, .show);
    _ = UpdateWindow(hwnd);
    // messages
    var msg: MSG = undefined;
    while (GetMessageW(&msg, null, 0, 0) != 0) {
        _ = TranslateMessage(&msg);
        _ = DispatchMessageW(&msg);
    }
}
