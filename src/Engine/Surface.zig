const vk = @import("..\\vulkan\\vulkan.zig");
const WindowHandle = @import("WindowHandle.zig");
const Instance = @import("Instance.zig");
const Surface = @This();

pub fn init(
    window: *const WindowHandle,
    instance: vk.Instance,
) !vk.SurfaceKHR {
    return try createSurface(window, instance);
}

pub fn deinit(surface: vk.SurfaceKHR, instance: vk.Instance) void {
    vk.destroySurfaceKHR(instance, surface, null);
}

fn createSurface(window: *const WindowHandle, instance: vk.Instance) !vk.SurfaceKHR {
    const create_info = vk.Win32SurfaceCreateInfoKHR{
        .hwnd = window.hwnd,
        .hinstance = window.instance,
    };

    var surface: vk.SurfaceKHR = .null;
    return switch (vk.createWin32SurfaceKHR(
        instance,
        &create_info,
        null,
        &surface,
    )) {
        .success => surface,
        else => error.FailedToCreateSurface,
    };
}
