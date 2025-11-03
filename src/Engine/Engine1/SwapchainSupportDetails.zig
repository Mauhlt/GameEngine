const std = @import("std");
const Window = @import("Window.zig");
const vk = @import("../../vulkan/vulkan.zig");
const SSD = @This();

capabilities: vk.SurfaceCapabilitiesKHR,
n_formats: u32,
formats: [8]vk.SurfaceFormatKHR,
n_present_modes: u32,
present_modes: [8]vk.PresentModeKHR,

pub fn init(surface: vk.SurfaceKHR, device: vk.PhysicalDevice) !SSD {
    var capabilities: vk.SurfaceCapabilitiesKHR = undefined;
    try switch (vk.getPhysicalDeviceSurfaceCapabilitiesKHR(device, surface, &capabilities)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToGetPhsicalDeviceSurfaceCapabilities;
        },
    };

    var n_formats: u32 = 0;
    var formats: [8]vk.SurfaceFormatKHR = undefined;
    try switch (vk.getPhysicalDeviceSurfaceFormatsKHR(device, surface, &n_formats, null)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToGetSurfaceFormats;
        },
    };
    try switch (vk.getPhysicalDeviceSurfaceFormatsKHR(device, surface, &n_formats, &formats)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToGetSurfaceFormats;
        },
    };

    var n_present_modes: u32 = 0;
    var present_modes: [8]vk.PresentModeKHR = undefined;
    try switch (vk.getPhysicalDeviceSurfacePresentModesKHR(device, surface, &n_present_modes, null)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToGetPresentModes;
        },
    };
    try switch (vk.getPhysicalDeviceSurfacePresentModesKHR(device, surface, &n_present_modes, &present_modes)) {
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

pub fn hasItems(self: *const SSD) bool {
    return self.n_formats > 0 and self.n_present_modes > 0;
}

pub fn chooseExtent(self: *const SSD, window: *const Window) vk.Extent2D {
    if (self.capabilities.current_extent.width != std.math.maxInt(u32)) {
        return self.capabilities.current_extent;
    } else {
        const size = window.clientSize();
        return .{
            .width = std.math.clamp(
                @as(u32, @intCast(size.w)),
                self.capabilities.min_image_extent.width,
                self.capabilities.max_image_extent.height,
            ),
            .height = std.math.clamp(
                @as(u32, @intCast(size.h)),
                self.capabilities.min_image_extent.height,
                self.capabilities.max_image_extent.height,
            ),
        };
    }
}

pub fn chooseSurfaceFormat(self: *const SSD) vk.SurfaceFormatKHR {
    for (self.formats[0..self.n_formats]) |format| {
        if (format.format == .b8g8r8a8_srgb and format.color_space == .srgb_nonlinear) return format;
    } else return self.formats[0];
}

pub fn choosePresentMode(self: *const SSD) vk.PresentModeKHR {
    for (self.present_modes[0..self.n_present_modes]) |present_mode| {
        switch (present_mode) {
            .mailbox => return present_mode,
            else => {},
        }
    } else return .fifo;
}
