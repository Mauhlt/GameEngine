const std = @import("std");
const vk = @import("vulkan\\vulkan.zig");
const QueueFamilyIndices = @This();

graphics_family: ?u32 = null,
present_family: ?u32 = null,

pub fn init(
    physical_device: vk.PhysicalDevice,
) QueueFamilyIndices {
    var indices: QueueFamilyIndices = .{};
    // has version 2
    var n_queues: u32 = undefined;
    _ = vk.getPhysicalDeviceQueueFamilyProperties(physical_device, &n_queues, null);
    var queues: [32]vk.QueueFamilyProperties = undefined;
    _ = vk.getPhysicalDeviceQueueFamilyProperties(physical_device, &n_queues, &queues);
    for (queues[0..n_queues], 0..) |queue, i| {
        std.debug.print("{any}", .{queue.queue_flags});
        // if (queue.queue_flags & .queue_graphics_bit) {
        indices.graphics_family = @truncate(i);
        // }
    }
    return indices;
}

pub fn isComplete(self: *const QueueFamilyIndices) bool {
    return self.graphics_family != null;
}
