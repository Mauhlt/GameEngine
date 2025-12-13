const std = @import("std");
// const Engine = @import("Engine/Engine1/Engine.zig");
// const Engine = @import("Engine/Engine2/Engine.zig");
const M2 = @import("Engine/Engine1/Math/Mat.zig").M2;

pub fn main() !void {
    const a: M2 = .{ .data = .{
        .{ 2, 9 },
        .{ 3, 7 },
    } };
    const b: M2 = .{ .data = .{
        .{ 3, 7 },
        .{ 2, 9 },
    } };
    const c = a.mulM(b);
    c.print();

    // Allocator
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // const allo = gpa.allocator();
    // defer std.debug.assert(.ok == gpa.deinit());
    // // engine
    // var engine = try Engine.init(
    //     allo,
    //     "HokaAndHoshi",
    //     "Hoka And Hoshi",
    //     .{
    //         .width = 800,
    //         .height = 600,
    //     },
    // );
    // defer engine.deinit(allo);
    // try engine.run();
}

test "Basics" {
    // testing matrix multiplication
    const a: M2 = .{ .data = .{
        .{ 2, 9 },
        .{ 3, 7 },
    } };
    const b: M2 = .{ .data = .{
        .{ 3, 7 },
        .{ 2, 9 },
    } };
    const c = a.mulM1(b);

    const d: [4]f32 = .{ 27, 31, 76, 81 };
    var k: usize = 0;
    for (0..c.data.len) |i| {
        for (0..c.data.len) |j| {
            try std.testing.expectEqual(c.data[i][j], d[k]);
            k += 1;
        }
    }
}
