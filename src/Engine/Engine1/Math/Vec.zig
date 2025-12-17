const std = @import("std");
const Matrix = @import("Mat.zig").Matrix;
// zero, x, y, z, w, (S/V) {add, sub, mul, div}, len, norm, cross, lookAt

pub fn Vector(comptime T: type, comptime N: comptime_int) type {
    if (N <= 1) @compileError("N must be greater than 1");
    if (N >= 4) @compileError("N must be less than or equal to 4");
    switch (@typeInfo(T)) {
        .int, .float => {},
        else => @compileError("Invalid Type."),
    }

    return struct {
        data: [N]T = [_]T{0} ** N,

        pub fn x() @This() {
            return .{
                .data = .{ 1, [_]T{0} ** N - 1 },
            };
        }

        pub fn y() @This() {
            return .{
                .data = switch (N) {
                    2 => .{ 0, 1 },
                    3 => .{ 0, 1, 0 },
                    4 => .{ 0, 1, 0, 0 },
                    else => unreachable,
                },
            };
        }

        pub fn z() @This() {
            return .{
                .data = switch (N) {
                    2 => @compileError("Not possible."),
                    3 => .{ 0, 0, 1 },
                    4 => .{ 0, 0, 1, 0 },
                    else => unreachable,
                },
            };
        }

        pub fn w() @This() {
            return .{
                .data = switch (N) {
                    2, 3 => @compileError("Not possible."),
                    4 => .{ 0, 0, 0, 1 },
                },
            };
        }

        pub fn init(scalar: T) @This() {
            // init a v3 from scalar
            return .{ .data = [_]T{scalar} ** N };
        }

        pub fn sum(self: @This()) T {
            return @reduce(.Add, @as(@Vector(N, T), self.data));
        }

        pub fn addS(self: @This(), scalar: T) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N, T), self.data) + @as(@Vector(N, T), @splat(scalar))) };
        }

        pub fn addV(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N, T), self.data) + @as(@Vector(N, T), other.data)) };
        }

        pub fn subS(self: @This(), scalar: T) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N, T), self.data) - @as(@Vector(N, T), @splat(scalar))) };
        }

        pub fn subV(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N, T), self.data) - @as(@Vector(N, T), other.data)) };
        }

        pub fn mulS(self: @This(), scalar: T) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N, T), self.data) * @as(@Vector(N, T), @splat(scalar))) };
        }

        pub fn mulV(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N, T), self.data) * @as(@Vector(N, T), other.data)) };
        }

        pub fn divS(self: @This(), scalar: T) @TypeOf(self) {
            std.debug.assert(scalar != 0);
            const den: @This() = .{ .data = @bitCast(@as(@Vector(N, T), @splat(1)) / @as(@Vector(N, T), scalar)) };
            return self.mulV(den);
        }

        pub fn divV(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            std.debug.assert(!@reduce(.Or, @as(@Vector(N, T), other.data) == @as(@Vector(N, T), @splat(0))));
            const den: @This() = .{ .data = @bitCast(@as(@Vector(N, T), @splat(1)) / @as(@Vector(N, T), other.data)) };
            return self.mulV(den);
        }

        pub fn pow(self: @This(), value: T) @TypeOf(self) {
            var new: @This() = self;
            switch (@typeInfo(T)) {
                .int, .float => {
                    inline for (0..N) |i| {
                        new.data[i] = std.math.pow(T, self.data[i], value);
                    }
                },
                else => unreachable,
            }
            return new;
        }

        pub fn dot(self: @This(), other: @TypeOf(self)) T {
            return self.mulV(other).sum();
        }

        pub fn len(self: @This()) T {
            return switch (@typeInfo(T)) {
                .int => std.math.sqrt(self.dot()),
                .float => @sqrt(self.dot()),
                else => unreachable,
            };
        }

        pub fn norm(self: @This()) @TypeOf(self) {
            return self.divS(self.len());
        }

        pub fn cross(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            switch (N) {
                2 => @compileError("Not possible"),
                3, 4 => {
                    const a = self.data[1] * other.data[2] - self.data[2] * other.data[1];
                    const b = self.data[2] * other.data[0] - self.data[0] * other.data[2];
                    const c = self.data[0] * other.data[1] - self.data[1] * other.data[0];
                    var data: @This() = self;
                    data.data[0] = a;
                    data.data[1] = b;
                    data.data[2] = c;
                    return data;
                },
                else => unreachable,
            }
        }

        pub fn mag(self: @This()) @This() {
            return self.len();
        }
    };
}

pub const V2 = Vector(f32, 2);
pub const V3 = Vector(f32, 3);
pub const V4 = Vector(f32, 4);

pub fn lookAt(comptime T: type, eye: V3, center: V3, up: V3) Matrix(4, T) {
    const f = center.subV(eye).norm();
    const s = f.cross(up).norm();
    const u = s.cross(f);

    return .{
        .data = .{
            .{ s[0], u[0], -f[0], 0 },
            .{ s[1], u[1], -f[1], 0 },
            .{ s[2], u[2], -f[2], 0 },
            .{ -s.dot(eye), -u.dot(eye), f.dot(eye), 1 },
        },
    };
}
