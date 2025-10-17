const vk = @import("../../../vulkan/vulkan.zig");
const SetLayout = @import("SetLayout.zig");
const Pool = @import("Pool.zig");

set_layout: *SetLayout,
pool: *Pool,

pub fn init() void {}

pub fn build() bool {}

pub fn overwrite(set: *vk.DescriptorSet) void {}
