const std = @import("std");
const Device = @import("Device.zig");
const Engine = @This();

device: Device,

pub fn init() Engine {
    const self: Engine = .{};
    return self;
}

pub fn deinit(self: *Engine) void {
    _ = self;
}
