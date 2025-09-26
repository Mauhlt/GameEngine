const std = @import("std");
const print = std.debug.print;
const engine = @import("engine.zig");

pub fn main() !void {
    // Allocator
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allo = gpa.allocator();
    defer std.debug.assert(.ok == gpa.deinit());
    // engine
    try engine.init(allo);
    // defer engine.deinit();
}
