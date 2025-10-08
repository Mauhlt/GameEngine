const vk = @import("..\\vulkan\\vulkan.zig");
const SyncObjects = @This();

image_available_semaphores: [3]vk.Semaphore = [_]vk.Semaphore{.null} ** 3,
render_finished_semaphores: [3]vk.Semaphore = [_]vk.Semaphore{.null} ** 3,
in_flight_fences: [3]vk.Fence = [_]vk.Fence{.null} ** 3,

pub fn init(device: vk.Device) !SyncObjects {
    var self: SyncObjects = .{};
    for (0..3) |i| {
        self.image_available_semaphores[i] = try createSemaphore(device);
        self.render_finished_semaphores[i] = try createSemaphore(device);
        self.in_flight_fences[i] = try createFence(device);
    }
    return self;
}

pub fn deinit(self: *SyncObjects, device: vk.Device) void {
    for (0..3) |i| {
        vk.destroySemaphore(device, self.image_available_semaphores[i], null);
        vk.destroySemaphore(device, self.render_finished_semaphores[i], null);
        vk.destroyFence(device, self.in_flight_fences[i], null);
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
