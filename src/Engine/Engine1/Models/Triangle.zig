const Vertex = @import("../Vertex.zig");

pub const vertices = [_]Vertex{
    .{ .pos = [_]f32{ -0.5, -0.5 }, .color = [_]f32{ 1, 0, 0 } },
    .{ .pos = [_]f32{ 0.5, -0.5 }, .color = [_]f32{ 0, 1, 0 } },
    .{ .pos = [_]f32{ 0.5, 0.5 }, .color = [_]f32{ 0, 0, 1 } },
};

pub const indices = [_]u16{ 0, 1, 2 };
