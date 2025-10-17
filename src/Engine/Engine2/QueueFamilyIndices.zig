const std = @import("std");
const vk = @import("..\\vulkan\\vulkan.zig");
const QueueFamilyIndices = @This();

graphics_family: ?u32 = null,
present_family: ?u32 = null,

pub fn init(surface: vk.SurfaceKHR, device: vk.PhysicalDevice) !QueueFamilyIndices {
    var n_families: u32 = 0;
    vk.getPhysicalDeviceQueueFamilyProperties(device, &n_families, null);
    if (n_families == 0) return error.NoQueueFamiliesFound;
    if (n_families > 64) return error.TooManyQueueFamiliesFound;

    var families: [64]vk.QueueFamilyProperties = undefined;
    vk.getPhysicalDeviceQueueFamilyProperties(device, &n_families, &families);

    var self: QueueFamilyIndices = .{};
    for (0..n_families) |i| {
        const family = families[i];
        if (family.queue_flags.contains(.graphics_bit)) {
            self.graphics_family = @truncate(i);
        }
        var present_support: vk.Bool32 = .false;
        switch (vk.getPhysicalDeviceSurfaceSupportKHR(
            device,
            @truncate(i),
            surface,
            &present_support,
        )) {
            .success => {},
            else => continue,
        }
        switch (present_support) {
            .true => self.present_family = @truncate(i),
            else => {},
        }
        if (self.isComplete()) break;
    }
    return self;
}

pub fn print(device: vk.PhysicalDevice) !void {
    var n_families: u32 = 0;
    vk.getPhysicalDeviceQueueFamilyProperties(device, &n_families, null);
    if (n_families == 0) return error.NoQueueFamiliesFound;
    if (n_families > 64) return error.TooManyQueueFamiliesFound;
    var families: [64]vk.QueueFamilyProperties = undefined;
    vk.getPhysicalDeviceQueueFamilyProperties(device, &n_families, &families);
    for (families) |family| {
        const count = family.queue_count;
        std.debug.print("# Of Queues: {}\n", .{count});
    }
}

pub fn isComplete(self: *const QueueFamilyIndices) bool {
    return self.graphics_family != null and self.present_family != null;
}
