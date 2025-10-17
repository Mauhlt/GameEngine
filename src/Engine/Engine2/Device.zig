const WindowHandle = @import("../")
const vk = @import("../../vulkan/vulkan.zig");
const Device = @This();

window: WindowHandle,
instance: vk.Instance,
device: vk.Device,

pub fn createInstance() vk.Instance {}

pub fn createSurface() vk.Surface {}

pub fn pickPhysicalDevice() vk.PhysicalDevice {}

pub fn createLogicalDevice() vk.Device {}

pub fn createCommandPool() vk.CommandPool {}

fn isDeviceSuitable() bool {}

fn getRequiredInstanceExtensions() void {}

fn getRequiredDeviceExtensions() void {}
