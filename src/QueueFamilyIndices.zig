const vk = @import("vulkan\\vulkan.zig");
const QueueFamilyIndices = @This();

graphics_family: ?u32 = null,
present_family: ?u32 = null,

pub fn init(
    physical_device: vk.PhysicalDevice,
    surface: vk.SurfaceKHR,
) QueueFamilyIndices {
    var indices: QueueFamilyIndices = .{};
    // has version 2
    var n_queues: u32 = undefined;
    _ = vk.getPhysicalDeviceQueueFamilyProperties(physical_device, &n_queues, null);
    var queues: [32]vk.QueueFamilyProperties = undefined;
    _ = vk.getPhysicalDeviceQueueFamilyProperties(physical_device, &n_queues, &queues);

    var present_support: vk.Bool32 = .false;
    for (queues[0..n_queues], 0..) |queue, i| {
        if (queue.queue_flags.contains(.graphics_bit)) {
            indices.graphics_family = @truncate(i);
        }
        _ = vk.getPhysicalDeviceSurfaceSupportKHR(physical_device, @truncate(i), surface, &present_support);
        switch (present_support) {
            .true => {
                indices.present_family = @truncate(i);
                present_support = .false;
            },
            else => {},
        }
        if (indices.isComplete()) return indices;
    }
    unreachable;
    // return error.FailedToCompleteIndices;
}

pub fn isComplete(self: *const QueueFamilyIndices) bool {
    return self.graphics_family != null and self.present_family != null;
}
