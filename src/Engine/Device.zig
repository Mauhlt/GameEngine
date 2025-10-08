const std = @import("std");
const vk = @import("..\\vulkan\\vulkan.zig");
const QFI = @import("QueueFamilyIndices.zig");
const required_device_extensions = [_][*:0]const u8{
    vk.ExtensionName.swapchain,
};
const Device = @This();

device: vk.Device = .null,
graphics_queue: vk.Queue = .null,
present_queue: vk.Queue = .null,

fn init(
    physical_device: vk.PhysicalDevice,
    surface: vk.SurfaceKHR,
) !Device {
    const indices = try QFI.init(physical_device, surface);
    var priority: f32 = 1.0;
    // 2 for AMD, 1 for NVIDIA
    const queue_create_infos = [_]vk.DeviceQueueCreateInfo{
        .{
            .queue_family_index = indices.graphics_family.?,
            .queue_count = 1,
            .p_queue_priorities = @ptrCast(&priority),
        },
        .{
            .queue_family_index = indices.present_family.?,
            .queue_count = 1,
            .p_queue_priorities = @ptrCast(&priority),
        },
    };
    // has version 2
    var device_feats: vk.PhysicalDeviceFeatures = .{};
    const len: u32 = if (indices.isSameFamily()) 1 else @truncate(queue_create_infos.len);

    const create_info: vk.DeviceCreateInfo = .{
        .queue_create_info_count = len,
        .p_queue_create_infos = &queue_create_infos,
        .p_enabled_features = &device_feats,
        .enabled_extension_count = @truncate(required_device_extensions.len),
        .pp_enabled_extension_names = &required_device_extensions,
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
    };

    var device: vk.Device = .null;
    try switch (vk.createDevice(
        physical_device,
        &create_info,
        null,
        &device,
    )) {
        .success => {},
        else => error.FailedToCreateLogicalDevice,
    };
    // create queues
    var graphics_queue: vk.Queue = .null;
    vk.getDeviceQueue(device, indices.graphics_family.?, 0, &graphics_queue);
    var present_queue: vk.Queue = .null;
    vk.getDeviceQueue(device, indices.present_family.?, 0, &present_queue);
    // return device
    return Device{
        .device = device,
        .graphics_queue = graphics_queue,
        .present_queue = present_queue,
    };
}

pub fn deinit(self: *Device) void {
    vk.destroyDevice(self.device, null);
}
