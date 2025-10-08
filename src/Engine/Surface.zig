const vk = @import("..\\vulkan\\vulkan.zig");
const WindowHandle = @import("WindowHandle.zig");
const Instance = @import("Instance.zig");
const Surface = @This();

surface: vk.SurfaceKHR = .null,

fn init(
    window: *const WindowHandle,
    instance: Instance,
) !vk.SurfaceKHR {
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
        .success => Surface{ .surface = surface },
        else => error.FailedToCreateSurface,
    };
}

pub fn deinit(self: *Surface, instance: vk.Instance) void {
    vk.destroySurfaceKHR(instance, self.surface, null);
}
