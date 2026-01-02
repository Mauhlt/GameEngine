const ver1 = @import("ver1.zig").ver1;
const ver2 = @import("ver2.zig").ver2;

pub fn main() !void {
    try ver2();
}
