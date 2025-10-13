const std = @import("std");
const Chrono = @This();
start: i128,
current: i128,

pub fn init() Chrono {
    return Chrono{
        .start = std.time.nanoTimestamp(),
        .current = std.time.nanoTimestamp(),
    };
}

pub fn diff(self: *Chrono) f32 {
    self.current = std.time.nanoTimestamp();
    return @floatFromInt(@divFloor(self.current - self.start, std.time.ns_per_s));
}
