const vk = @import("..\\vulkan\\vulkan.zig");
const QFI = @import("QueueFamilyIndices.zig");
const CommandPool = @This();

pool: vk.CommandPool = .null,
buffers: [2]vk.CommandBuffer = [_]vk.CommandBuffer{.null} ** 2,

pub fn init(
    surface: vk.SurfaceKHR,
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
) !CommandPool {
    var self: CommandPool = .{};
    self.pool = try createCommandPoolPool(surface, physical_device, device);
    try self.createCommandPoolBuffers(device);
    return self;
}

pub fn deinit(self: *CommandPool, device: vk.Device) void {
    vk.destroyCommandPool(device, self.pool, null);
}

fn createCommandPoolPool(
    surface: vk.SurfaceKHR,
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
) !vk.CommandPool {
    const indices = try QFI.init(surface, physical_device);

    const create_info = vk.CommandPoolCreateInfo{
        .flags = .initEmpty(),
        .queue_family_index = indices.graphics_family.?,
    };

    var pool: vk.CommandPool = .null;
    return switch (vk.createCommandPool(device, &create_info, null, &pool)) {
        .success => pool,
        else => error.FailedToCreateCommandPool,
    };
}

fn createCommandPoolBuffers(
    self: *CommandPool,
    device: vk.Device,
) !void {
    const alloc_info = vk.CommandBufferAllocateInfo{
        .command_pool = self.pool,
        .level = .primary,
        .command_buffer_count = @truncate(self.buffers.len),
    };

    return switch (vk.allocateCommandBuffers(
        device,
        &alloc_info,
        &self.buffers,
    )) {
        .success => {},
        else => return error.FailedToAllocateCommandBuffers,
    };
}
