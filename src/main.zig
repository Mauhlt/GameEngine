const std = @import("std");
const Engine = @import("Engine\\Engine2.zig");

pub fn main() !void {
    // Allocator
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allo = gpa.allocator();
    defer std.debug.assert(.ok == gpa.deinit());
    // engine
    var engine = try Engine.init(
        allo,
        "HokaAndHoshi",
        "Hoka And Hoshi",
        "EurekaEngine",
        .{
            .width = 800,
            .height = 600,
        },
    );
    defer engine.deinit();

    // var i: usize = 0;
    // while (i < 100_000_000) : (i += 1) {}
    try engine.run();
}
