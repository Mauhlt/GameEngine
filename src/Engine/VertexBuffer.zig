const vk = @import("..\\vulkan\\vulkan.zig");
const Vertices = @import("Vertices.zig");
const VertexBuffer = @This();

buffer: vk.Buffer = .null,
device_memory: vk.DeviceMemory = .null,

pub fn init(
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    vertices: []const Vertices,
) !VertexBuffer {
    const buffer = try createVertexBuffer(device, vertices);
    const device_memory = try createVertexBufferMemory(
        physical_device,
        device,
        buffer,
    );

    return .{
        .buffer = buffer,
        .device_memory = device_memory,
    };
}

pub fn deinit(self: *VertexBuffer, device: vk.Device) void {
    vk.destroyBuffer(device, self.buffer, null);
    vk.freeMemory(device, self.device_memory, null);
}

fn createVertexBuffer(
    device: vk.Device,
    vertices: []const Vertices,
) !vk.Buffer {
    const create_info = vk.BufferCreateInfo{
        .size = @truncate(@sizeOf(Vertices) * vertices.len),
        .usage = .init(.vertex_buffer_bit),
        .sharing_mode = .exclusive,
    };

    var vertex_buffer: vk.Buffer = .null;
    return switch (vk.createBuffer(device, &create_info, null, &vertex_buffer)) {
        .success => vertex_buffer,
        else => return error.FailedToCreateVertexBuffer,
    };
}

fn createVertexBufferMemory(
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    vertex_buffer: vk.Buffer,
) !vk.DeviceMemory {
    var mem_reqs: vk.MemoryRequirements = .{};
    vk.getBufferMemoryRequirements(device, vertex_buffer, &mem_reqs);

    const props = [_]vk.MemoryPropertyFlagBits{ .host_visible_bit, .host_coherent_bit };
    const alloc_info = vk.MemoryAllocateInfo{
        .allocation_size = mem_reqs.size,
        .memory_type_index = try findMemory(
            physical_device,
            mem_reqs.memory_type_bits,
            &props,
        ),
    };

    var buffer_memory: vk.DeviceMemory = .null;
    return switch (vk.allocateMemory(device, &alloc_info, null, &buffer_memory)) {
        .success => buffer_memory,
        else => return error.FailedToAllocateVertexBufferMemory,
    };
}

fn findMemory(
    physical_device: vk.PhysicalDevice,
    type_filter: u32,
    props: []const vk.MemoryPropertyFlagBits,
) !u32 {
    var mem_props = vk.PhysicalDeviceMemoryProperties{};
    vk.getPhysicalDeviceMemoryProperties(physical_device, &mem_props);

    outer: for (0..mem_props.memory_type_count) |i| {
        if ((type_filter & (@as(u32, 1) << @truncate(i))) == 0) continue;
        for (props) |prop| {
            if (mem_props.memory_types[i].property_flags.contains(prop)) continue :outer;
        }
        return @truncate(i);
    }
    return error.FailedToFindSuitableMemoryType;
}
