const std = @import("std");
const Allocator = std.mem.Allocator;
const vk = @import("../../../vulkan/vulkan.zig");
const Device = @import("../Device.zig");
const SetLayout = @This();

device: *Device,
bindings: std.ArrayHashMap(u32, vk.DescriptorSetLayoutBinding),

pub fn init(allo: Allocator, device: *Device) SetLayout {
    return .{
        .device = device,
        .bindings = std.AutoHashMap(u32, vk.DescriptorSetLayoutBinding).init(allo),
    };
}

pub fn deinit(self: *SetLayout) void {
    self.bindings.deinit();
}

pub fn addBinding(
    binding: u32,
    desc_type: vk.DescriptorType,
    stage_flags: vk.ShaderStageFlags,
) void {}
