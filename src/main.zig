const std = @import("std");
const Engine = @import("Engine\\Engine.zig");

pub fn main() !void {
    // Allocator
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allo = gpa.allocator();
    defer std.debug.assert(.ok == gpa.deinit());
    // engine
    var engine = try Engine.init(allo);
    defer engine.deinit();
    try engine.run();
}
