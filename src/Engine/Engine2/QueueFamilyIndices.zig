const vk = @import("../../vulkan/vulkan.zig");
const QFI = @This();

graphics_family: ?u32 = null,
present_family: ?u32 = null,

pub fn init(surface: vk.SurfaceKHR, physical_device: vk.PhysicalDevice) !QFI {
    var n_families: u32 = 0;
    var families: [255]vk.QueueFamilyProperties = undefined;
    vk.getPhysicalDeviceQueueFamilyProperties(physical_device, &n_families, null);
    vk.getPhysicalDeviceQueueFamilyProperties(physical_device, &n_families, &families);

    var self: QFI = .{};
    for (families, 0..) |family, i| {
        if (family.queue_flags.contains(.graphics_bit)) {
            self.graphics_family = @truncate(i);
        }

        var present_support: vk.Bool32 = .false;
        try switch (vk.getPhysicalDeviceSurfaceSupportKHR(physical_device, @truncate(i), surface, &present_support)) {
            .success => {},
            else => error.FailedToGetDeviceSurfaceSupport,
        };

        if (present_support == .true) {
            self.present_family = @truncate(i);
        }

        if (self.isComplete()) break;
    }

    return self;
}

pub fn isComplete(self: *const QFI) bool {
    return self.graphics_family != null and self.present_family != null;
}

pub fn isSameFamily(self: *const QFI) bool {
    return (self.graphics_family orelse false) and (self.present_family orelse false);
}
