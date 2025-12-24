const std = @import("std");
// const Engine = @import("Engine/Engine1/Engine.zig");
const Mat = @import("Engine/Engine1/Math/Mat.zig");
// const Engine = @import("Engine/Engine2/Engine.zig");

pub fn main() !void {
    // // Allocator
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

    // const T: M4 = .{
    //     .data = .{
    //         .{ 1, 0, 0, 0 },
    //         .{ 0, 1, 0, 0 },
    //         .{ 0, 0, 1, 0 },
    //         .{ 5, 0, 0, 1 },
    //     },
    // };
    // const R: M4 = .{
    //     .data = .{
    //         .{ 0, -1, 0, 0 },
    //         .{ 1, 0, 0, 0 },
    //         .{ 0, 0, 1, 0 },
    //         .{ 0, 0, 0, 1 },
    //     },
    // };
    // const post = T.mulM(R);
    // post.print();
    // const pre = R.mulM(T);
    // pre.print();
}

test "_" {
    _ = @import("Engine/Engine1/Math/Vec.zig");
    _ = @import("Engine/Engine1/Math/Mat.zig");
    _ = @import("Engine/Engine1/Math/Quat.zig");
}
