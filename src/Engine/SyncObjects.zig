const vk = @import("..\\vulkan\\vulkan.zig");
const SyncObjects = @This();

image_available_semaphores: [3]vk.Semaphore = [_]vk.Semaphore{.null} ** 3,
render_finished_semaphores: [3]vk.Semaphore = [_]vk.Semaphore{.null} ** 3,
in_flight_fences: [3]vk.Fence = [_]vk.Fence{.null} ** 3,

pub fn init(device: vk.Device) !SyncObjects {
    const self: SyncObjects = .{};
    for (
        self.image_available_semaphores,
        self.render_finished_semaphores,
        self.in_flight_fences,
    ) |*ias, *rfs, *iff| {
        ias.* = try createSemaphore(device);
        rfs.* = try createSemaphore(device);
        iff.* = try createFence(device);
    }
    return self;
}

pub fn deinit(self: *SyncObjects, device: vk.Device) void {
    // sync objects
    for (
        self.image_available_semaphores,
        self.render_finished_semaphores,
        self.in_flight_fences,
    ) |ias, rfs, iff| {
        vk.destroySemaphore(device, ias, null);
        vk.destroySemaphore(device, rfs, null);
        vk.destroyFence(self.logical_device, iff, null);
    }
}

fn createSemaphore(device: vk.Device) !vk.Semaphore {
    const create_info = vk.SemaphoreCreateInfo{};
    var semaphore: vk.Semaphore = .null;
    return switch (vk.createSemaphore(device, &create_info, null, &semaphore)) {
        .success => semaphore,
        else => error.FailedToCreateSempahore,
    };
}

fn createFence(device: vk.Device) !vk.Fence {
    const create_info = vk.FenceCreateInfo{
        .flags = .init(.signaled_bit),
    };

    var fence: vk.Fence = .null;
    return switch (vk.createFence(device, &create_info, null, &fence)) {
        .success => fence,
        else => error.FailedToCreateFence,
    };
}
