const std = @import("std");
const assert = std.debug.assert;
const vk = @import("vulkan\\vulkan.zig");
const SwapchainSupportDetails = @This();
// has version 2
capabilities: vk.SurfaceCapabilitiesKHR,
n_formats: u32 = 0,
formats: [32]vk.SurfaceFormatKHR,
n_present_modes: u32 = 0,
present_modes: [32]vk.PresentModeKHR,

pub fn init(
    physical_device: vk.PhysicalDevice,
    surface: vk.SurfaceKHR,
) !SwapchainSupportDetails {
    // get capabilities
    var capabilities = vk.SurfaceCapabilitiesKHR{};
    switch (vk.getPhysicalDeviceSurfaceCapabilitiesKHR(
        physical_device,
        surface,
        &capabilities,
    )) {
        .success => {},
        else => return error.FailedToGetPhysicalDeviceSurfaceCapabilities,
    }
    // get formats
    var n_formats: u32 = 0;
    switch (vk.getPhysicalDeviceSurfaceFormatsKHR(
        physical_device,
        surface,
        &n_formats,
        null,
    )) {
        .success => {},
        else => return error.FailedToGetPhysicalDeviceSurfaceFormats,
    }
    assert(n_formats > 0);
    var formats: [32]vk.SurfaceFormatKHR = undefined;
    switch (vk.getPhysicalDeviceSurfaceFormatsKHR(
        physical_device,
        surface,
        &n_formats,
        @ptrCast(&formats),
    )) {
        .success => {},
        else => return error.FailedToGetPhysicalDeviceSurfaceFormats,
    }
    // get present modes
    var n_present_modes: u32 = 0;
    switch (vk.getPhysicalDeviceSurfacePresentModesKHR(
        physical_device,
        surface,
        &n_present_modes,
        null,
    )) {
        .success => {},
        else => return error.FailedToGetPhysicalDevicePresentModes,
    }
    assert(n_present_modes > 0);
    var present_modes: [32]vk.PresentModeKHR = undefined;
    switch (vk.getPhysicalDeviceSurfacePresentModesKHR(
        physical_device,
        surface,
        &n_present_modes,
        @ptrCast(&present_modes),
    )) {
        .success => {},
        else => return error.FailedToGetPhysicalDevicePresentModes,
    }
    // return filled out SSD
    return .{
        .capabilities = capabilities,
        .n_formats = n_formats,
        .formats = formats,
        .n_present_modes = n_present_modes,
        .present_modes = present_modes,
    };
}

pub fn isAdequate(self: *const SwapchainSupportDetails) bool {
    return self.n_formats > 0 and self.n_present_modes > 0;
}

pub fn chooseSurfaceFormat(
    self: *const SwapchainSupportDetails,
) vk.SurfaceFormatKHR {
    for (self.formats) |format| {
        if (format.format == .b8g8r8a8_srgb and format.color_space == .srgb_nonlinear) {
            return format;
        }
    }
    return self.formats[0];
}

pub fn choosePresentMode(
    self: *const SwapchainSupportDetails,
) vk.PresentModeKHR {
    for (self.present_modes) |present_mode| {
        if (present_mode == .mailbox) {
            return present_mode;
        }
    }
    return .fifo;
}

pub fn chooseExtent(
    self: *const SwapchainSupportDetails,
) vk.Extent2D {
    if (self.capabilities.current_extent.width != std.math.maxInt(u32)) {
        return self.capabilities.current_extent;
    } else {
        var width: i32, var height: i32 = .{ 0, 0 };
        height = 640;
        width = 480;
        // get framebuffer size
        var extent = vk.Extent2D{
            .width = @intCast(width),
            .height = @intCast(height),
        };
        extent.width = std.math.clamp(
            extent.width,
            self.capabilities.min_image_extent.width,
            self.capabilities.max_image_extent.width,
        );
        extent.height = std.math.clamp(
            extent.height,
            self.capabilities.min_image_extent.height,
            self.capabilities.max_image_extent.height,
        );
        return extent;
    }
}
