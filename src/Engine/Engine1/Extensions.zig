const std = @import("std");
const vk = @import("../../vulkan/vulkan.zig");
const Extension = @This();

n_props: u32 = 0,
props: [255]vk.ExtensionProperties = undefined,

pub fn getInstanceExtensions() !Extension {
    var self: Extension = .{};

    try switch (vk.enumerateInstanceExtensionProperties(null, &self.n_props, null)) {
        .success => if (self.n_props == 0) error.FailedToFindInstanceExtensionProperties else {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToEnumerateExtensionProperties;
        },
    };

    try switch (vk.enumerateInstanceExtensionProperties(null, &self.n_props, &self.props)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToEnumerateExtensionProperties;
        },
    };

    return self;
}

pub fn getDeviceExtensions(physical_device: vk.PhysicalDevice) !Extension {
    var self: Extension = .{};

    try switch (vk.enumerateDeviceExtensionProperties(physical_device, null, &self.n_props, null)) {
        .success => if (self.n_props == 0) error.FailedToFindDeviceExtensions else {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToEnumerateDeviceExtensionProperties;
        },
    };

    try switch (vk.enumerateDeviceExtensionProperties(physical_device, null, &self.n_props, &self.props)) {
        .success => {},
        else => |tag| blk: {
            std.debug.print("Error: {s}\n", .{@tagName(tag)});
            break :blk error.FailedToEnumerateDeviceExtensionProperties;
        },
    };

    return self;
}

pub fn print(self: *const Extension) void {
    for (0..self.n_props) |i| {
        const prop = self.props[i];
        std.debug.print("{s}\n", .{std.mem.sliceTo(&prop.extension_name, 0)});
    }
    std.debug.print("\n", .{});
}

pub fn hasRequiredExtensions(self: *const Extension, reqs: []const [*:0]const u8) bool {
    var has_exts: bool = true;
    outer: for (reqs) |req| {
        const name1 = std.mem.span(req);
        for (self.props[0..self.n_props]) |prop| {
            const name2 = std.mem.sliceTo(&prop.extension_name, 0);
            if (std.mem.eql(u8, name1, name2)) continue :outer;
        }
        has_exts = false;
        std.debug.print("Missing Extension: {s}\n", .{name1});
    }
    return has_exts;
}
