const Quat = @import("Quat.zig").Quaternion;

pub fn DualQuaternion(comptime T: type) type {
    switch (@typeInfo(T)) {
        .float => {},
        else => @compileError("Only accepts floats"),
    }
    const Q = Quat(T);

    return struct {
        a: Quat,
        b: Quat,

        pub fn init() @This() {
            return .{};
        }

        pub fn add()
    };
}
