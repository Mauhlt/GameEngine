const std = @import("std");
const vk = @import("..\\vulkan\\vulkan.zig");
const QueueFamilyIndices = @This();

graphics_family: u32 = undefined,
present_family: u32 = undefined,

pub fn init(surface: vk.SurfaceKHR, device: vk.PhysicalDevice) !QueueFamilyIndices {
    var n_families: u32 = 0;
    vk.getPhysicalDeviceQueueFamilyProperties(device, &n_families, null);
    if (n_families > 64) return error.TooManyQueueFamilies;
    var families: [64]vk.QueueFamilyProperties = undefined;
    vk.getPhysicalDeviceQueueFamilyProperties(device, &n_families, &families);

    var self: QueueFamilyIndices = .{};
    var graphics_support: vk.Bool32 = .false;
    var present_support: vk.Bool32 = .false;
    for (0..n_families) |i| {
        graphics_support = .false;
        present_support = .false;

        const family = families[i];
        if (family.queue_flags.contains(.graphics_bit)) {
            graphics_support = .true;
            self.graphics_family = @truncate(i);
        }

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

        if (present_support == .true and graphics_support == .true) return self;
    }
    return error.FailedToFindQueuesSupportingGraphicsAndPresentation;
}

pub fn print(device: vk.PhysicalDevice) void {
    var n_families: u32 = 0;
    vk.getPhysicalDeviceQueueFamilyProperties(device, &n_families, null);
    var families: [64]vk.QueueFamilyProperties = undefined;
    vk.getPhysicalDeviceQueueFamilyProperties(device, &n_families, &families);

    for (families) |family| {
        const count = family.queue_count;
        std.debug.print("# Of Queues: {}\n", .{count});
    }
}
