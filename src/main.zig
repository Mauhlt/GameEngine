const std = @import("std");
// const Engine = @import("Engine/Engine1/Engine.zig");
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
}

test "_" {
    _ = @import("Engine/Engine1/Math/Vec.zig");
    _ = @import("Engine/Engine1/Math/Mat.zig");
    _ = @import("Engine/Engine1/Math/Quat.zig");
}
