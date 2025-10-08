const vk = @import("..\\vulkan\\vulkan.zig");
const QFI = @import("QueueFamilyIndices.zig");
const CommandPool = @This();

pool: vk.CommandPool = .null,
buffers: [2]vk.CommandBuffer = [_]vk.CommandBuffer{.null} ** 2,

pub fn init(
    physical_device: vk.PhysicalDevice,
    surface: vk.SurfaceKHR,
) !CommandPool {
    var self: CommandPool = .{};
    self.pool = try createCommandPool(physical_device, surface);
    try createCommandBuffers(&self.buffers);
}

pub fn deinit(self: *CommandPool, device: vk.Device) void {
    vk.destroyCommandPool(device, self.pool, null);
}

fn createCommandPool(
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    surface: vk.SurfaceKHR,
) !vk.CommandPool {
    const indices = try QFI.init(physical_device, surface);

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

fn createCommandBuffers(
    self: *CommandPool,
    device: vk.Device,
) !void {
    const alloc_info = vk.CommandBufferAllocateInfo{
        .command_pool = self.command_pool,
        .level = .primary,
        .command_buffer_count = @truncate(self.command_buffers.len),
    };

    return switch (vk.allocateCommandBuffers(
        device,
        &alloc_info,
        &self.command_buffers,
    )) {
        .success => {},
        else => return error.FailedToAllocateCommandBuffers,
    };
}
