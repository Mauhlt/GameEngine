const vk = @import("../../vulkan/vulkan.zig");

capabilities: vk.SurfaceCapabilitiesKHR,
n_formats: u8,
formats: [255]vk.SurfaceFormatKHR,
n_present_modes: u8,
present_modes: [255]vk.PresentModeKHR,
