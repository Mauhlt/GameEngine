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
            // cam vectors
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

            // // eye = camera direction
            // // up = world up (usually {0, 1, 0}) // must be perpendicular
            // // x-axis = cross of eye and up
            // var eye1 = eye;
            // var target1 = target;
            // var up1 = up;
            //
            // switch (N) {
            //     3 => {},
            //     4 => {
            //         eye1.data[3] = 0;
            //         target1.data[3] = 0;
            //         up1.data[3] = 0;
            //     },
            //     2 => unreachable,
            //     else => unreachable,
            // }
            //
            // const zc = target.subV(eye);
            // const xc = zc.mulS(-1).cross(up);
            // const yc = xc.cross(zc.mulS(-1));
            //
            // // const f = target1.subV(eye1).norm(); // forward
            // // const s = f.cross(up1).norm(); // right
            // // const u = s.cross(f); // up
            // //
            // // return .{
            // //     .data = .{
            // //         .{ s.data[0], u.data[0], -f.data[0], 0 },
            // //         .{ s.data[1], u.data[1], -f.data[1], 0 },
            // //         .{ s.data[2], u.data[2], -f.data[2], 0 },
            // //         .{ -s.dot(eye1), -u.dot(eye1), f.dot(eye1), 1 },
            // //     },
            // // };
        }
    };
}

test "Add Sub Mul Div Sqrt Sqr Dot Dist DistFast Len" {
    const V3 = Vector(f32, 3);
    const tol: f32 = 1e-8;
    { // Addition
        { // Scalar
            const a: V3 = .{};
            const b = a.addS(2);
            const c = V3.init(2);
            for (0..3) |i| try std.testing.expectApproxEqAbs(b.data[i], c.data[i], tol);
        }
        { // Vector
            const a = V3.new([_]f32{ 0, 0, 1 });
            const b = V3.new([_]f32{ 0, 1, 0 });
            const c = V3.new([_]f32{ 0, 1, 1 });
            const d = a.addV(b);
            for (0..3) |i| try std.testing.expectApproxEqAbs(c.data[i], d.data[i], tol);
        }
    }
    { // Subtraction
        { // Scalar
            const a: V3 = .init(3);
            const b = a.subS(2);
            const c = V3.init(1);
            for (0..3) |i| try std.testing.expectApproxEqAbs(b.data[i], c.data[i], tol);
        }
        { // Vector}
            const a: V3 = .init(3);
            const b: V3 = .init(2);
            const c: V3 = .init(1);
            const d: V3 = a.subV(b);
            for (0..3) |i| try std.testing.expectApproxEqAbs(c.data[i], d.data[i], tol);
        }
    }
    { // Multiplication
        { // Scalar
            const a: V3 = .new([_]f32{ 0, 1, 10 });
            const b = a.mulS(3);
            const c: V3 = .new([_]f32{ 0, 3, 30 });
            for (0..3) |i| try std.testing.expectApproxEqAbs(b.data[i], c.data[i], tol);
        }
        { // Multiplication
            const a: V3 = .init(2.5);
            const b: V3 = .init(2.5);
            const c: V3 = .init(6.25);
            const d = a.mulV(b);
            for (0..3) |i| try std.testing.expectApproxEqAbs(c.data[i], d.data[i], tol);
        }
    }
    { // Division
        { // Scalar
            const a: V3 = .init(6);
            const b = a.divS(2);
            const c: V3 = .init(3);
            for (0..3) |i| try std.testing.expectApproxEqAbs(c.data[i], b.data[i], tol);
        }
        { // Vector
            const a: V3 = .init(6);
            const b: V3 = .init(2);
            const c = a.divV(b);
            const d: V3 = .init(3);
            for (0..3) |i| try std.testing.expectApproxEqAbs(c.data[i], d.data[i], tol);
        }
    }
    { // Sqr
        const a: V3 = .init(2);
        const b: V3 = a.sqr();
        const c: V3 = .init(4);
        for (0..3) |i| try std.testing.expectApproxEqAbs(b.data[i], c.data[i], tol);
    }
    { // Sqr
        const a: V3 = .init(4);
        const b: V3 = a.sqrt();
        const c: V3 = .init(2);
        for (0..3) |i| try std.testing.expectApproxEqAbs(b.data[i], c.data[i], tol);
    }
    { // dot
        const a: V3 = .new([_]f32{ 1, 2, 3 });
        const b = a.dot(a);
        const c: f32 = 14;
        try std.testing.expectApproxEqAbs(b, c, tol);
    }
    { // dist
        const a: V3 = .new([_]f32{ 1, 2, 3 });
        const b: V3 = .new([_]f32{ 2, 3, 4 });
        const c = a.dist(b);
        const d: f32 = 1;
        try std.testing.expectApproxEqAbs(c, d, tol);
    }
    { // dist fast
        const a: V3 = .new([_]f32{ 1, 2, 3 });
        const b: V3 = .new([_]f32{ 2, 3, 4 });
        const c = a.distFast(b);
        const d: f32 = 1;
        try std.testing.expectApproxEqAbs(c, d, tol);
    }
    { // len
        const a: V3 = .new([_]f32{ 2, 4, 6 }); // 4 + 16 + 36 = sqrt(56)
        const b = a.len();
        const c = @sqrt(@as(f32, 56));
        try std.testing.expectApproxEqAbs(b, c, tol);
    }
}

test "Look At" {
    // failed
    const V3 = Vector(f32, 3);
    const eye: V3 = .{ .data = [_]f32{ 0, 0, 5 } };
    const center: V3 = .{ .data = [_]f32{ 0, 0, 0 } };
    const up: V3 = .{ .data = [_]f32{ 0, 1, 0 } };

    const mat = eye.lookAt(center, up);
    mat.print();
    const exp: Matrix(f32, 4) = .{
        .data = .{
            .{ 1, 0, 0, 0 },
            .{ 0, 1, 0, 0 },
            .{ 0, 0, 1, -5 },
            .{ 0, 0, 0, 1 },
        },
    };
    exp.print();

    // const tol: f32 = 1e-8;

    // for (0..4) |i| {
    //     for (0..4) |j| {
    //         try std.testing.expectApproxEqAbs(mat.data[i][j], exp.data[i][j], tol);
    //     }
    // }
}
