pub const ATOM = enum(u16) {
    null = 0,
    _,
};
pub const DWORD = u32;
pub const HBRUSH = enum(isize) {
    null = 0,
    _,
};
pub const HCURSOR = enum(isize) {
    null = 0,
    _,
};
pub const HANDLE = enum(usize) {
    null = 0,
    _,
};
pub const HICON = enum(isize) {
    null = 0,
    _,
};
pub const HINSTANCE = enum(isize) {
    null = 0,
    _,
};
pub const HMENU = enum(isize) {
    null = 0,
    _,
};
pub const HMODULE = enum(isize) {
    null = 0,
    _,
};
pub const HMONITOR = enum(isize) {
    null = 0,
    _,
};
pub const HWND = enum(isize) {
    null = 0,
    _,
};
pub const LRESULT = enum(isize) {
    null = 0,
    _,
};
pub const LPARAM = enum(isize) {
    null = 0,
    _,
};
pub const LPCSTR = [*:0]const u8;
pub const LPCWSTR = [*:0]const u16;
pub const LPVOID = enum(isize) {
    null = 0,
    _,
};
pub const SECURITY_ATTRIBUTES = enum(usize) {
    null = 0,
    _,
};
pub const WPARAM = enum(usize) {
    null = 0,
    _,
};

// pub const WPARAM = UINT_PTR;
// pub const LPARAM = LONG_PTR;
// pub const LRESULT = LONG_PTR;
// pub const SPHANDLE = [*c]HANDLE;
// pub const LPHANDLE = [*c]HANDLE;
// pub const HGLOBAL = HANDLE;
// pub const HLOCAL = HANDLE;
// pub const GLOBALHANDLE = HANDLE;
// pub const LOCALHANDLE = HANDLE;
// pub const FARPROC = ?*const fn (...) callconv(.c) INT_PTR;
// pub const NEARPROC = ?*const fn (...) callconv(.c) INT_PTR;
// pub const PROC = ?*const fn (...) callconv(.c) INT_PTR;
// pub const ATOM = WORD;
// pub const HFILE = c_int;
// pub const struct_HKEY__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HKEY = [*c]struct_HKEY__;
// pub const PHKEY = [*c]HKEY;
// pub const struct_HKL__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HKL = [*c]struct_HKL__;
// pub const struct_HLSURF__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HLSURF = [*c]struct_HLSURF__;
// pub const struct_HMETAFILE__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HMETAFILE = [*c]struct_HMETAFILE__;
// pub const struct_HRGN__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HRGN = [*c]struct_HRGN__;
// pub const struct_HRSRC__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HRSRC = [*c]struct_HRSRC__;
// pub const struct_HSPRITE__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HSPRITE = [*c]struct_HSPRITE__;
// pub const struct_HSTR__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HSTR = [*c]struct_HSTR__;
// pub const struct_HTASK__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HTASK = [*c]struct_HTASK__;
// pub const struct_HWINSTA__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HWINSTA = [*c]struct_HWINSTA__;
// pub const struct__FILETIME = extern struct {
//     dwLowDateTime: DWORD = @import("std").mem.zeroes(DWORD),
//     dwHighDateTime: DWORD = @import("std").mem.zeroes(DWORD),
// };
// pub const FILETIME = struct__FILETIME;
// pub const PFILETIME = [*c]struct__FILETIME;
// pub const LPFILETIME = [*c]struct__FILETIME;
// pub const struct_HHOOK__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HHOOK = [*c]struct_HHOOK__;
// pub const HGDIOBJ = ?*anyopaque;
// pub const struct_HACCEL__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HACCEL = [*c]struct_HACCEL__;
// pub const struct_HBITMAP__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HBITMAP = [*c]struct_HBITMAP__;
// pub const struct_HCOLORSPACE__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HCOLORSPACE = [*c]struct_HCOLORSPACE__;
// pub const struct_HDC__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HDC = [*c]struct_HDC__;
// pub const struct_HGLRC__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HGLRC = [*c]struct_HGLRC__;
// pub const struct_HDESK__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HDESK = [*c]struct_HDESK__;
// pub const struct_HENHMETAFILE__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HENHMETAFILE = [*c]struct_HENHMETAFILE__;
// pub const struct_HFONT__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HFONT = [*c]struct_HFONT__;
// pub const struct_HPALETTE__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HPALETTE = [*c]struct_HPALETTE__;
// pub const struct_HPEN__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HPEN = [*c]struct_HPEN__;
// pub const struct_HMONITOR__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HMONITOR = [*c]struct_HMONITOR__;
// pub const struct_HWINEVENTHOOK__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HWINEVENTHOOK = [*c]struct_HWINEVENTHOOK__;
// pub const COLORREF = DWORD;
// pub const struct_HUMPD__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const HUMPD = [*c]struct_HUMPD__;
// pub const LPCOLORREF = [*c]DWORD;
// pub const struct_tagRECT = extern struct {
//     left: LONG = @import("std").mem.zeroes(LONG),
//     top: LONG = @import("std").mem.zeroes(LONG),
//     right: LONG = @import("std").mem.zeroes(LONG),
//     bottom: LONG = @import("std").mem.zeroes(LONG),
// };
// pub const RECT = struct_tagRECT;
// pub const PRECT = [*c]struct_tagRECT;
// pub const NPRECT = [*c]struct_tagRECT;
// pub const LPRECT = [*c]struct_tagRECT;
// pub const LPCRECT = [*c]const RECT;
// pub const struct__RECTL = extern struct {
//     left: LONG = @import("std").mem.zeroes(LONG),
//     top: LONG = @import("std").mem.zeroes(LONG),
//     right: LONG = @import("std").mem.zeroes(LONG),
//     bottom: LONG = @import("std").mem.zeroes(LONG),
// };
// pub const RECTL = struct__RECTL;
// pub const PRECTL = [*c]struct__RECTL;
// pub const LPRECTL = [*c]struct__RECTL;
// pub const LPCRECTL = [*c]const RECTL;
// pub const struct_tagPOINT = extern struct {
//     x: LONG = @import("std").mem.zeroes(LONG),
//     y: LONG = @import("std").mem.zeroes(LONG),
// };
// pub const POINT = struct_tagPOINT;
// pub const PPOINT = [*c]struct_tagPOINT;
// pub const NPPOINT = [*c]struct_tagPOINT;
// pub const LPPOINT = [*c]struct_tagPOINT;
// pub const struct__POINTL = extern struct {
//     x: LONG = @import("std").mem.zeroes(LONG),
//     y: LONG = @import("std").mem.zeroes(LONG),
// };
// pub const POINTL = struct__POINTL;
// pub const PPOINTL = [*c]struct__POINTL;
// pub const struct_tagSIZE = extern struct {
//     cx: LONG = @import("std").mem.zeroes(LONG),
//     cy: LONG = @import("std").mem.zeroes(LONG),
// };
// pub const SIZE = struct_tagSIZE;
// pub const PSIZE = [*c]struct_tagSIZE;
// pub const LPSIZE = [*c]struct_tagSIZE;
// pub const SIZEL = SIZE;
// pub const PSIZEL = [*c]SIZE;
// pub const LPSIZEL = [*c]SIZE;
// pub const struct_tagPOINTS = extern struct {
//     x: SHORT = @import("std").mem.zeroes(SHORT),
//     y: SHORT = @import("std").mem.zeroes(SHORT),
// };
// pub const POINTS = struct_tagPOINTS;
// pub const PPOINTS = [*c]struct_tagPOINTS;
// pub const LPPOINTS = [*c]struct_tagPOINTS;
// pub const struct_APP_LOCAL_DEVICE_ID = extern struct {
//     value: [32]BYTE = @import("std").mem.zeroes([32]BYTE),
// };
// pub const APP_LOCAL_DEVICE_ID = struct_APP_LOCAL_DEVICE_ID;
// pub const struct_DPI_AWARENESS_CONTEXT__ = extern struct {
//     unused: c_int = @import("std").mem.zeroes(c_int),
// };
// pub const DPI_AWARENESS_CONTEXT = [*c]struct_DPI_AWARENESS_CONTEXT__;
// pub const DPI_AWARENESS_INVALID: c_int = -1;
// pub const DPI_AWARENESS_UNAWARE: c_int = 0;
// pub const DPI_AWARENESS_SYSTEM_AWARE: c_int = 1;
// pub const DPI_AWARENESS_PER_MONITOR_AWARE: c_int = 2;
// pub const enum_DPI_AWARENESS = c_int;
// pub const DPI_AWARENESS = enum_DPI_AWARENESS;
// pub const DPI_HOSTING_BEHAVIOR_INVALID: c_int = -1;
// pub const DPI_HOSTING_BEHAVIOR_DEFAULT: c_int = 0;
// pub const DPI_HOSTING_BEHAVIOR_MIXED: c_int = 1;
// pub const enum_DPI_HOSTING_BEHAVIOR = c_int;
// pub const DPI_HOSTING_BEHAVIOR = enum_DPI_HOSTING_BEHAVIOR;
// pub const struct__SECURITY_ATTRIBUTES = extern struct {
//     nLength: DWORD = @import("std").mem.zeroes(DWORD),
//     lpSecurityDescriptor: LPVOID = @import("std").mem.zeroes(LPVOID),
//     bInheritHandle: WINBOOL = @import("std").mem.zeroes(WINBOOL),
// };
// pub const SECURITY_ATTRIBUTES = struct__SECURITY_ATTRIBUTES;
// pub const PSECURITY_ATTRIBUTES = [*c]struct__SECURITY_ATTRIBUTES;
// pub const LPSECURITY_ATTRIBUTES = [*c]struct__SECURITY_ATTRIBUTES;
// const struct_unnamed_147 = extern struct {
//     Offset: DWORD = @import("std").mem.zeroes(DWORD),
//     OffsetHigh: DWORD = @import("std").mem.zeroes(DWORD),
// };
// const union_unnamed_146 = extern union {
//     unnamed_0: struct_unnamed_147,
//     Pointer: PVOID,
// };
// pub const struct__OVERLAPPED = extern struct {
//     Internal: ULONG_PTR = @import("std").mem.zeroes(ULONG_PTR),
//     InternalHigh: ULONG_PTR = @import("std").mem.zeroes(ULONG_PTR),
//     unnamed_0: union_unnamed_146 = @import("std").mem.zeroes(union_unnamed_146),
//     hEvent: HANDLE = @import("std").mem.zeroes(HANDLE),
// };
// pub const OVERLAPPED = struct__OVERLAPPED;
// pub const LPOVERLAPPED = [*c]struct__OVERLAPPED;
// pub const struct__OVERLAPPED_ENTRY = extern struct {
//     lpCompletionKey: ULONG_PTR = @import("std").mem.zeroes(ULONG_PTR),
//     lpOverlapped: LPOVERLAPPED = @import("std").mem.zeroes(LPOVERLAPPED),
//     Internal: ULONG_PTR = @import("std").mem.zeroes(ULONG_PTR),
//     dwNumberOfBytesTransferred: DWORD = @import("std").mem.zeroes(DWORD),
// };
// pub const OVERLAPPED_ENTRY = struct__OVERLAPPED_ENTRY;
// pub const LPOVERLAPPED_ENTRY = [*c]struct__OVERLAPPED_ENTRY;
// pub const struct__SYSTEMTIME = extern struct {
//     wYear: WORD = @import("std").mem.zeroes(WORD),
//     wMonth: WORD = @import("std").mem.zeroes(WORD),
//     wDayOfWeek: WORD = @import("std").mem.zeroes(WORD),
//     wDay: WORD = @import("std").mem.zeroes(WORD),
//     wHour: WORD = @import("std").mem.zeroes(WORD),
//     wMinute: WORD = @import("std").mem.zeroes(WORD),
//     wSecond: WORD = @import("std").mem.zeroes(WORD),
//     wMilliseconds: WORD = @import("std").mem.zeroes(WORD),
// };
// pub const SYSTEMTIME = struct__SYSTEMTIME;
// pub const PSYSTEMTIME = [*c]struct__SYSTEMTIME;
// pub const LPSYSTEMTIME = [*c]struct__SYSTEMTIME;
// pub const struct__WIN32_FIND_DATAA = extern struct {
//     dwFileAttributes: DWORD = @import("std").mem.zeroes(DWORD),
//     ftCreationTime: FILETIME = @import("std").mem.zeroes(FILETIME),
//     ftLastAccessTime: FILETIME = @import("std").mem.zeroes(FILETIME),
//     ftLastWriteTime: FILETIME = @import("std").mem.zeroes(FILETIME),
//     nFileSizeHigh: DWORD = @import("std").mem.zeroes(DWORD),
//     nFileSizeLow: DWORD = @import("std").mem.zeroes(DWORD),
//     dwReserved0: DWORD = @import("std").mem.zeroes(DWORD),
//     dwReserved1: DWORD = @import("std").mem.zeroes(DWORD),
//     cFileName: [260]CHAR = @import("std").mem.zeroes([260]CHAR),
//     cAlternateFileName: [14]CHAR = @import("std").mem.zeroes([14]CHAR),
// };
// pub const WIN32_FIND_DATAA = struct__WIN32_FIND_DATAA;
// pub const PWIN32_FIND_DATAA = [*c]struct__WIN32_FIND_DATAA;
// pub const LPWIN32_FIND_DATAA = [*c]struct__WIN32_FIND_DATAA;
// pub const struct__WIN32_FIND_DATAW = extern struct {
//     dwFileAttributes: DWORD = @import("std").mem.zeroes(DWORD),
//     ftCreationTime: FILETIME = @import("std").mem.zeroes(FILETIME),
//     ftLastAccessTime: FILETIME = @import("std").mem.zeroes(FILETIME),
//     ftLastWriteTime: FILETIME = @import("std").mem.zeroes(FILETIME),
//     nFileSizeHigh: DWORD = @import("std").mem.zeroes(DWORD),
//     nFileSizeLow: DWORD = @import("std").mem.zeroes(DWORD),
//     dwReserved0: DWORD = @import("std").mem.zeroes(DWORD),
//     dwReserved1: DWORD = @import("std").mem.zeroes(DWORD),
//     cFileName: [260]WCHAR = @import("std").mem.zeroes([260]WCHAR),
//     cAlternateFileName: [14]WCHAR = @import("std").mem.zeroes([14]WCHAR),
// };
// pub const WIN32_FIND_DATAW = struct__WIN32_FIND_DATAW;
// pub const PWIN32_FIND_DATAW = [*c]struct__WIN32_FIND_DATAW;
// pub const LPWIN32_FIND_DATAW = [*c]struct__WIN32_FIND_DATAW;
// pub const WIN32_FIND_DATA = WIN32_FIND_DATAA;
// pub const PWIN32_FIND_DATA = PWIN32_FIND_DATAA;
// pub const LPWIN32_FIND_DATA = LPWIN32_FIND_DATAA;
