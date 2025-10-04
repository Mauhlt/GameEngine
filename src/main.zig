const std = @import("std");
const print = std.debug.print;
const Engine = @import("engine.zig");

pub fn main() !void {
    // Allocator
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allo = gpa.allocator();
    defer std.debug.assert(.ok == gpa.deinit());
    // engine
    var engine = try Engine.init(allo);
    defer engine.deinit();
    // defer engine.deinit();
}
