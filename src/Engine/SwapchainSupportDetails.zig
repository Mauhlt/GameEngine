const std = @import("std");
const vk = @import("..\\vulkan\\vulkan.zig");
const WindowHandle = @import("WindowHandle.zig");
const SwapchainSupportDetails = @This();

capabilities: vk.SurfaceCapabilitiesKHR,
n_formats: u32,
formats: [32]vk.SurfaceFormatKHR,
n_present_modes: u32,
present_modes: [32]vk.PresentModeKHR,

pub fn init(
    surface: vk.SurfaceKHR,
    physical_device: vk.PhysicalDevice,
) !SwapchainSupportDetails {
    var self: SwapchainSupportDetails = undefined;
    switch (vk.getPhysicalDeviceSurfaceCapabilitiesKHR(
        physical_device,
        surface,
        &self.capabilities,
    )) {
        .success => {},
        else => return error.FailedTogetSurfaceCapabilities,
    }

    switch (vk.getPhysicalDeviceSurfaceFormatsKHR(
        physical_device,
        surface,
        &self.n_formats,
        null,
    )) {
        .success => {},
        else => return error.FailedToGetSurfaceFormats,
    }
    switch (vk.getPhysicalDeviceSurfaceFormatsKHR(
        physical_device,
        surface,
        &self.n_formats,
        &self.formats,
    )) {
        .success => {},
        else => return error.FailedToGetSurfaceFormats,
    }

    switch (vk.getPhysicalDeviceSurfacePresentModesKHR(
        physical_device,
        surface,
        &self.n_present_modes,
        null,
    )) {
        .success => {},
        else => return error.FailedToGetSurfacePresentModes,
    }
    switch (vk.getPhysicalDeviceSurfacePresentModesKHR(
        physical_device,
        surface,
        &self.n_present_modes,
        &self.present_modes,
    )) {
        .success => {},
        else => return error.FailedToGetSurfacePresentModes,
    }

    return self;
}

pub fn chooseExtent(
    self: *const SwapchainSupportDetails,
    window: *const WindowHandle,
) vk.Extent2D {
    if (self.capabilities.current_extent.width != std.math.maxInt(u32)) {
        return self.capabilities.current_extent;
    }
    // depends on os
    const size = window.clientSize();
    return vk.Extent2D{
        .width = std.math.clamp(
            @as(u32, @intCast(size.w)),
            self.capabilities.min_image_extent.width,
            self.capabilities.max_image_extent.width,
        ),
        .height = std.math.clamp(
            @as(u32, @intCast(size.h)),
            self.capabilities.min_image_extent.height,
            self.capabilities.max_image_extent.height,
        ),
    };
}

pub fn choosePresentMode(self: *const SwapchainSupportDetails) vk.PresentModeKHR {
    for (self.present_modes[0..self.n_present_modes]) |present_mode| {
        switch (present_mode) {
            .mailbox => return present_mode,
            else => {},
        }
    }
    return .fifo;
}

pub fn chooseFormat(self: *const SwapchainSupportDetails) vk.SurfaceFormatKHR {
    for (self.formats[0..self.n_formats]) |format| {
        if (format.format == .b8g8r8_srgb and format.color_space == .srgb_nonlinear) {
            return format;
        }
    }
    return self.formats[0];
}
