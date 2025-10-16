const std = @import("std");
const Vector = @import("Vector.zig").Vector4;
const Quaternion = @This();

data: Vector,

pub fn init() Quaternion {
    return .{.data = .{ .data =  }};
}
