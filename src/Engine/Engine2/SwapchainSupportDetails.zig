const std = @import("std");
const vk = @import("../../vulkan/vulkan.zig");
const Window = @import("Window.zig");
const SSD = @This();

capabilities: vk.SurfaceCapabilitiesKHR,
n_formats: u32,
formats: [8]vk.SurfaceFormatKHR,
n_present_modes: u32,
present_modes: [8]vk.PresentModeKHR,

pub fn init(surface: vk.SurfaceKHR, physical_device: vk.PhysicalDevice) SSD {
    var capabilities: vk.SurfaceCapabilitiesKHR = undefined;
    try switch (vk.getPhysicalDeviceSurfaceCapabilitiesKHR(physical_device, surface, &capabilities)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToGetSurfaceCapabilities;
        },
    };

    var n_formats: u32 = 0;
    try switch (vk.getPhysicalDeviceSurfaceFormatsKHR(physical_device, surface, &n_formats, null)) {
        .success => if (n_formats == 0) error.FoundNoFormats else {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToGetSurfaceFormats;
        }
    };
    var formats: [8]vk.SurfaceFormatKHR = undefined;
    try switch (vk.getPhysicalDeviceSurfaceFormatsKHR(physical_device, surface, &n_formats, &formats)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToGetSurfaceFormats;
        }
    };

    var n_present_modes: u32 = 0;
    try switch (vk.getPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, &n_present_modes, null)) {
        .success => if (n_present_modes == 0) error.FoundNoPresentModes else {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToGetPresentModes;
        },
    };
    var present_modes: [8]vk.PresentModeKHR = undefined;
    try switch (vk.getPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, &n_present_modes, &present_modes)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToGetPresentModes;
        },
    };

    return .{
        .capabilities = capabilities,
        .n_formats = n_formats,
        .formats = formats,
        .n_present_modes = n_present_modes,
        .present_modes = present_modes,
    };
}

pub fn choosePresentMode(self: *const SSD) vk.PresentModeKHR {
    for (self.present_modes[0..self.n_present_modes]) |present_mode| {
        if (present_mode == .mailbox) return present_mode;
    }
    std.debug.print("Chose Default Present Mode\n", .{});
    return .fifo;
}

pub fn chooseExtent(self: *const SSD, window: *const Window) vk.Extent2D {
    if (self.capabilities.current_extent.width != std.math.maxInt(u32)) {
        return self.capabilities.current_extent;
    }

    std.debug.print("Chose Default Extent\n", .{});
    const win_size = window.clientSize();
    return vk.Extent2D{
        .width = @max(self.capabilities.min_image_extent.width, @min(self.capabilities.max_image_extent.width, win_size.w)),
        .height = @max(self.capabilities.min_image_extent.height, @min(self.capabilities.max_image_extent.height, win_size.h)),
    };
}

pub fn chooseFormat(self: *const SSD) vk.SurfaceFormatKHR {
    for (self.formats[0..self.n_formats]) |surface_format| {
        switch (surface_format.color_space) {
            .srgb_nonlinear => {
                switch (surface_format.format) {
                    .b8g8r8a8_unorm => return surface_format,
                    else => continue,
                }
            },
            else => continue,
        }
    }
    std.debug.print("Chose Default Format\n", .{});
    return self.formats[0];
}

pub fn chooseDepthFormat() vk.Format {}
