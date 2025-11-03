const vk = @import("../../vulkan/vulkan.zig");
const QFI = @This();

graphics_family: ?u32 = null,
present_family: ?u32 = null,

pub fn init(surface: vk.SurfaceKHR, device: vk.PhysicalDevice) !QFI {
    var n_props: u32 = 0;
    var props: [64]vk.QueueFamilyProperties = undefined;
    vk.getPhysicalDeviceQueueFamilyProperties(device, &n_props, null);
    if (n_props == 0) return error.FoundNoSuitableQueueFamilies;
    vk.getPhysicalDeviceQueueFamilyProperties(device, &n_props, &props);

    var self: QFI = .{};

    for (0..n_props) |i| {
        const prop = props[i];
        if (prop.queue_flags.contains(.graphics_bit)) {
            self.graphics_family = @truncate(i);
        }

        var present_support: vk.Bool32 = .false;
        try switch (vk.getPhysicalDeviceSurfaceSupportKHR(device, @truncate(i), surface, &present_support)) {
            .success => {
                if (present_support == .true) {
                    self.present_family = @truncate(i);
                }
            },
            else => error.FailedToGetPhysicalDeviceSurfaceSupport,
        };

        if (self.isComplete()) break;
    }

    return self;
}

pub fn isComplete(self: *const QFI) bool {
    return self.graphics_family != null and self.present_family != null;
}

pub fn isSameFamily(self: *const QFI) bool {
    return (self.graphics_family.?) == (self.present_family.?);
}
