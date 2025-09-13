const std = @import("std");
const print = std.debug.print;
// const engine = @import("engine.zig");

const user32 = @import("user32.zig");

pub fn main() void {
    print("Hello World", .{});
    // engine.init();

    const class_name = "MyWindowClass";
    const window_name = "Hello Zig";
    const wide_class_name = std.unicode.utf8ToUtf16LeStringLiteral(class_name);
    const wide_window_name = std.unicode.utf8ToUtf16LeStringLiteral(window_name);

    var wc = user32.WNDCLASSW{
        .style = 0,
        .lpfnWndProc = user32.wndProc,
        .cbClsExtra = 0,
        .cbWndExtra = 0,
        .hInstance = null,
        .hIcon = null,
        .hCursor = null,
        .hbrBackground = null,
        .lpszMenuName = null,
        .lpszClassName = wide_class_name,
    };

    _ = user32.RegisterClassW(&wc);

    const hwnd = user32.CreateWindowExW(
        0,
        wide_class_name,
        wide_window_name,
        0xcf0000, // overlapped window -> need to create an enum and convert back
        100,
        100,
        800,
        600,
        null,
        null,
        wc.hInstance,
        null,
    );

    _ = user32.ShowWindow(hwnd, 1); // shownormal
    _ = user32.UpdateWindow(hwnd);

    var msg: user32.MSG = undefined;
    while (user32.GetMessageW(&msg, null, 0, 0)) {
        _ = user32.TranslateMessage(&msg);
        _ = user32.DispatchMessageW(&msg);
    }
}
