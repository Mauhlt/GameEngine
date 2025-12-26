const std = @import("std");
const Quat = @import("Quat.zig").Quaternion;
const Matrix = @import("Mat.zig").Matrix;
// zero, x, y, z, w, (S/V) {add, sub, mul, div}, len, norm, cross, lookAt

pub fn Vector(comptime T: type, comptime N: comptime_int) type {
    if (N > 4 or N < 2) @compileError("2 <= N <= 4");

    switch (@typeInfo(T)) {
        .float => {},
        else => @compileError("Invalid Type."),
    }

    return struct {
        data: @Vector(N, T) = @as(@Vector(N, T), [_]T{0} ** N),

        pub fn new(data: [N]T) @This() {
            return .{ .data = @as(@Vector(N, T), data) };
        }

        pub fn init(scalar: T) @This() {
            // init a v3 from scalar
            return .{ .data = @as(@Vector(N, T), @splat(scalar)) };
        }

        pub fn sum(self: @This()) T {
            return @reduce(.Add, self.data);
        }

        pub fn addS(self: @This(), scalar: T) @TypeOf(self) {
            const s = init(scalar);
            return .{ .data = self.data + s.data };
        }

        pub fn addV(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            return .{ .data = self.data + other.data };
        }

        pub fn subS(self: @This(), scalar: T) @TypeOf(self) {
            const s = init(scalar);
            return .{ .data = self.data - s.data };
        }

        pub fn subV(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            return .{ .data = self.data - other.data };
        }

        pub fn mulS(self: @This(), scalar: T) @TypeOf(self) {
            const s = init(scalar);
            return .{ .data = self.data * s.data };
        }

        pub fn mulV(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            return .{ .data = self.data * other.data };
        }

        pub fn mulM(self: @This(), other: Matrix(T, N)) Matrix(T, N) {
            var output: Matrix(T, N) = .{};
            inline for (0..N) |i| {
                output.data[i] = @bitCast(@as(@Vector(N, T), @splat(self.data[i])) * @as(@Vector(N, T), @bitCast(other.data[i])));
            }
        }

        pub fn divS(self: @This(), scalar: T) @TypeOf(self) {
            std.debug.assert(scalar != @as(T, 0));
            const s = init(scalar);
            return .{ .data = self.data / s.data };
        }

        pub fn divV(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            const zero_vec = init(0);
            std.debug.assert(!@reduce(.Or, other.data == zero_vec.data));
            return .{ .data = self.data / other.data };
        }

        pub fn divM(self: @This(), other: Matrix(T, N)) Matrix(T, N) {
            // post
            var output: Matrix(T, N) = .{};
            inline for (0..N) |i| {
                output.data[i] = @bitCast(@as(@Vector(N, T), @splat(self.data[i])) / @as(@Vector(N, T), @bitCast(other.data[i])));
            }
            return output;
        }

        pub fn sqrt(self: @This()) @TypeOf(self) {
            return .{ .data = @sqrt(self.data) };
        }

        pub fn sqr(self: @This()) @TypeOf(self) {
            return .{ .data = self.data * self.data };
        }

        pub fn dot(a: @This(), b: @TypeOf(a)) T {
            return a.mulV(b).sum();
        }

        pub fn dist(a: @This(), b: @TypeOf(a)) T {
            return @sqrt(a.subV(b).sqr().sum());
        }

        pub fn distFast(a: @This(), b: @TypeOf(a)) T {
            // faster
            return a.subV(b).sqr().sum();
        }

        pub fn len(a: @This()) T {
            return @sqrt(a.dot(a));
        }

        pub fn mag(a: @This()) T {
            return a.len();
        }

        pub fn norm(self: @This()) @TypeOf(self) {
            return self.divS(self.len());
        }

        pub fn cross(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            std.debug.assert(N >= 3 and N <= 4);

            const c1 = @Vector(3, T){ self.data[1], self.data[2], self.data[0] };
            const c2 = @Vector(3, T){ other.data[2], other.data[0], other.data[1] };
            const c3 = @Vector(3, T){ self.data[2], self.data[0], self.data[1] };
            const c4 = @Vector(3, T){ other.data[1], other.data[2], other.data[0] };
            const out = (c1 * c2) - (c3 * c4);
            return switch (N) {
                3 => .{ .data = out },
                4 => .{ .data = @Vector(N, T){ out[0..3].*, 0 } },
                else => unreachable,
            };
        }

        pub fn lerp(a: @This(), b: @TypeOf(a), t: T) @TypeOf(a) {
            // a + t * (b - a) = (b - a) * t + a
            return b.subV(a).mulS(t).addV(a);
        }

        pub fn lookAt(eye: @This(), center: @TypeOf(eye), up: @TypeOf(eye)) Matrix(T, 4) {
            // works for V3 and V4s
            switch (N) {
                3 => {},
                4 => std.debug.assert(center.data[3] == 0),
                2 => unreachable,
                else => unreachable,
            }
            // works for 3 and 4
            const f = center.subV(eye).norm();
            const s = f.cross(up).norm();
            const u = s.cross(f);

            return .{
                .data = .{
                    .{ s.data[0], u.data[0], -f.data[0], 0 },
                    .{ s.data[1], u.data[1], -f.data[1], 0 },
                    .{ s.data[2], u.data[2], -f.data[2], 0 },
                    .{ -s.dot(eye), -u.dot(eye), f.dot(eye), 1 },
                },
            };
        }
    };
}

test "Vectors" {}
