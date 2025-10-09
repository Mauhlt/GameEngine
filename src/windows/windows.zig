// Single File That You Import
// Windows Enums + EnumSets
pub const overlapped_window = @import("windows_enums.zig").overlapped_window;
pub const popup_window = @import("windows_enums.zig").popup_window;
pub const tiled_window = @import("windows_enums.zig").tiled_window;
pub const Messages = @import("windows_enums.zig").Messages;
pub const SW = @import("windows_enums.zig").SW;
const ClassStyles = @import("windows_enums.zig").ClassStyles;
pub const redraw = @import("windows_enums.zig").redraw;
// Types
pub const ATOM = @import("windows_types.zig").ATOM;
pub const DWORD = @import("windows_types.zig").DWORD;
pub const HBRUSH = @import("windows_types.zig").HBRUSH;
pub const HCURSOR = @import("windows_types.zig").HCURSOR;
pub const HANDLE = @import("windows_types.zig").HANDLE;
pub const HICON = @import("windows_types.zig").HICON;
pub const HINSTANCE = @import("windows_types.zig").HINSTANCE;
pub const HMENU = @import("windows_types.zig").HMENU;
pub const HMODULE = @import("windows_types.zig").HMODULE;
pub const HMONITOR = @import("windows_types.zig").HMONITOR;
pub const HWND = @import("windows_types.zig").HWND;
pub const LPCWSTR = @import("windows_types.zig").LPCWSTR;
pub const LRESULT = @import("windows_types.zig").LRESULT;
pub const LPARAM = @import("windows_types.zig").LPARAM;
pub const SECURITY_ATTRIBUTES = @import("windows_types.zig").SECURITY_ATTRIBUTES;
pub const WPARAM = @import("windows_types.zig").WPARAM;
// Fns
pub const CreateWindowExW = @import("windows_fns.zig").CreateWindowExW;
pub const DefWindowProcW = @import("windows_fns.zig").DefWindowProcW;
pub const DispatchMessageW = @import("windows_fns.zig").DispatchMessageW;
pub const GetMessageW = @import("windows_fns.zig").GetMessageW;
pub const GetModuleHandleW = @import("windows_fns.zig").GetModuleHandleW;
pub const GetSysColorBrush = @import("windows_fns.zig").GetSysColorBrush;
pub const GetSystemMetrics = @import("windows_fns.zig").GetSystemMetrics;
pub const GetClientRect = @import("windows_fns.zig").GetClientRect;
pub const GetWindowRect = @import("windows_fns.zig").GetWindowRect;
pub const RegisterClassW = @import("windows_fns.zig").RegisterClassW;
pub const RegisterClassExW = @import("windows_fns.zig").RegisterClassExW;
pub const LoadCursorW = @import("windows_fns.zig").LoadCursorW;
pub const LoadIconW = @import("windows_fns.zig").LoadIconW;
pub const PeekMessageW = @import("windows_fns.zig").PeekMessageW;
pub const SetWindowPos = @import("windows_fns.zig").SetWindowPos;
pub const ShowWindow = @import("windows_fns.zig").ShowWindow;
pub const TranslateMessage = @import("windows_fns.zig").TranslateMessage;
pub const UpdateWindow = @import("windows_fns.zig").UpdateWindow;
pub const UnregisterClassW = @import("windows_fns.zig").UnregisterClassW;
// Structs
pub const WNDCLASSW = @import("windows_structs.zig").WNDCLASSW;
pub const WNDCLASSEXW = @import("windows_structs.zig").WNDCLASSEXW;
pub const MSG = @import("windows_structs.zig").MSG;
pub const POINT = @import("windows_structs.zig").POINT;
pub const RECT = @import("windows_structs.zig").RECT;
