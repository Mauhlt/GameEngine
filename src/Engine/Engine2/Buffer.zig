const Device = @import("Device.zig");
const vk = @import("../../vulkan/vulkan.zig");
const Buffer = @This();

device: *Device,
mapped: ?*anyopaque,
buffer: vk.Buffer,
memory: vk.DeviceMemory,

buffer_size: vk.DeviceSize,
instance_count: u32,
instance_size: vk.DeviceSize,
alignment_size: vk.DeviceSize,
usage_flags: vk.BufferUsageFlags,
memory_property_flags: vk.MemoryPropertyFlags,

pub fn init(
    device: *Device,
    instance_size: vk.DeviceSize,
    instance_count: u32,
    usage_flags: vk.BufferUsageFlags,
    memory_property_flags: vk.MemoryPropertyFlags,
    min_offset_alignment: vk.DeviceSize,
) !Buffer {
    const alignment_size = getAlignment(instance_size, min_offset_alignment);
    return .{
        .device = device,
        .mapped = null,
        .buffer = .null,
        .memory = .null,

        .intsance_size = instance_size,
        .instance_count = instance_count,
        .usage_flags = usage_flags,
        .memory_property_flags = memory_property_flags,
        .alignment_size = min_offset_alignment,
    };
}

pub fn map(self: *Buffer, size: vk.DeviceSize, offset: vk.DeviceSize) void {
    self.size = size;
    self.offset = offset;
}

pub fn unmap(self: *Buffer) void {
    _ = self;
}

pub fn writeToBuffer(data: ?*anyopaque, size: vk.DeviceSize, offset: vk.DeviceSize) void {}

pub fn flush(size: vk.DeviceSize, offset: vk.DeviceSize) vk.Result {}

pub fn descriptorInfo(size: vk.DeviceSize, offset: vk.DeviceSize) vk.DescriptorBufferInfo {}

pub fn invalidate(size: vk.DeviceSize, offset: vk.DeviceSize) vk.Result {}

pub fn writeToIndex(data: ?*anyopaque, index: u32) void {}
pub fn flushIndex(index: i32) vk.Result {}
pub fn descriptorInfoForIndex(index: i32) vk.DescriptorBufferInfo {}
pub fn invalidateIndex(index: i32) vk.Result {}

fn getAlignment(instance_size: vk.DeviceSize, min_offset_alignment: vk.DeviceSize) vk.DeviceSize {
    return if (min_offset_alignment > 0) //
        (instance_size + min_offset_alignment - 1) & ~(min_offset_alignment - 1) //
    else
        instance_size;
}
