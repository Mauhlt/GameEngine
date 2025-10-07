const vk = @import("..\\vulkan\\vulkan.zig");
const QueueFamilyIndices = @This();

graphics_family: ?u32 = null,
present_family: ?u32 = null,

pub fn init(
    physical_device: vk.PhysicalDevice,
    surface: vk.SurfaceKHR,
) !QueueFamilyIndices {
    // get queues
    // has version 2
    var n_queues: u32 = undefined;
    vk.getPhysicalDeviceQueueFamilyProperties(
        physical_device,
        &n_queues,
        null,
    );
    var queues: [32]vk.QueueFamilyProperties = undefined;
    vk.getPhysicalDeviceQueueFamilyProperties(
        physical_device,
        &n_queues,
        &queues,
    );
    // get indices
    var indices: QueueFamilyIndices = .{};
    var present_support: vk.Bool32 = .false;
    for (queues[0..n_queues], 0..) |queue, i| {
        // find graphics support
        if (queue.queue_flags.contains(.graphics_bit)) {
            indices.graphics_family = @truncate(i);
        }
        // find present support
        switch (vk.getPhysicalDeviceSurfaceSupportKHR(
            physical_device,
            @truncate(i),
            surface,
            &present_support,
        )) {
            .success => {},
            else => return error.FailedToGetPhysicalDeviceSurfaceSupportKHR,
        }
        switch (present_support) {
            .true => {
                indices.present_family = @truncate(i);
                present_support = .false;
            },
            else => {},
        }
        // check if complete
        if (indices.isComplete()) return indices;
    }

    return error.FailedToCompleteIndices;
}

pub fn isComplete(self: *const QueueFamilyIndices) bool {
    return self.graphics_family != null and self.present_family != null;
}

pub fn isSameFamily(self: *const QueueFamilyIndices) bool {
    return self.graphics_family.? == self.present_family.?;
}
