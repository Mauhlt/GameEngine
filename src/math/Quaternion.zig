const std = @import("std");
const Vec = @import("Vector1.zig").Vec4;
const Quaternion = @This();

data: Vec,

pub fn posFromQuat(quat: Quaternion) Vec {
    return .{ .data = [_]f32{ quat.data[0], quat.data[1], quat.data[2], 1 } };
}

pub fn quatFromPos(x: f32, y: f32, z: f32) Quaternion {
    return .{ .data = [_]f32{ x, y, z, 1 } };
}
