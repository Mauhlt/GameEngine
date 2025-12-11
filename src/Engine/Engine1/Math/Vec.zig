const std = @import("std");
const Mat4 = @import("Mat.zig").Mat4;

// TODO: Add tests for each fn to prove reliability

fn createVector(comptime N: usize, comptime T: type) type {
    std.debug.assert(N >= 2 and N <= 4);
    switch (@typeInfo(T)) {
        .int, .float => {},
        else => @compileError("T must be of type int or float"),
    }

    // Vector of size N and type T
    const VNT = @Vector(N, T);

    return struct {
        const Self = @This();

        data: [N]T = [_]T{0} ** N,

        pub fn new(data: [N]T) Self {
            return .{ .data = data };
        }

        pub fn init(data: T) Self {
            return .{ .data = [_]T{data} ** N };
        }

        pub fn x() Self {
            var self = Self.zero();
            self.data[0] = 1;
            return self;
        }

        pub fn y() Self {
            var self = Self.zero();
            self.data[1] = 1;
            return self;
        }

        pub fn z() Self {
            std.debug.assert(N >= 3);
            var self: Self = .zero();
            self.data[2] = 1;
            return self;
        }

        pub fn w() Self {
            std.debug.assert(N == 4);
            var self: Self = .zero();
            self.data[3] = 1;
            return self;
        }

        pub fn add(self: Self, scalar: T) Self {
            var new: Self = .zero();
            inline for (0..N) |i| new.data[i] = self.data[i] + scalar;
            return new;
        }

        pub fn addV(self: Self, scalar: T) Self {
            return .{ .data = @bitCast(@as(VNT, self.data) + @as(VNT, @splat(scalar))) };
        }

        pub fn addVec(self: Self, other: Self) Self {
            var new: Self = .zero();
            inline for (0..N) |i| new.data[i] = self.data[i] + other.data[i];
            return new;
        }

        pub fn addVecV(self: Self, other: Self) Self {
            return .{ .data = @bitCast(@as(VNT, self.data) + @as(VNT, other.data)) };
        }

        pub fn sub(self: Self, scalar: T) Self {
            var new: Self = .zero();
            inline for (0..N) |i| new.data[i] = self.data[i] - scalar;
            return new;
        }

        pub fn subV(self: Self, scalar: T) Self {
            return .{ .data = @bitCast(@as(VNT, self.data) - @as(VNT, @splat(scalar))) };
        }

        pub fn subVec(self: Self, other: Self) Self {
            var new: Self = .zero();
            inline for (0..N) |i| new.data[i] = self.data[i] - other.data[i];
            return new;
        }

        pub fn subVecV(self: Self, other: Self) Self {
            return .{ .data = @bitCast(@as(VNT, self.data) - @as(VNT, other.data)) };
        }

        pub fn mul(self: Self, scalar: T) Self {
            var new: Self = self;
            inline for (0..N) |i| new.data[i] *= scalar;
            return new;
        }

        pub fn mulV(self: Self, scalar: T) Self {
            return .{ .data = @bitCast(@as(VNT, self.data) * @as(VNT, @splat(scalar))) };
        }

        pub fn mulVec(self: Self, other: Self) Self {
            // Hammard Product
            var new: Self = .zero();
            inline for (0..N) |i| new.data[i] = self.data[i] * other.data[i];
            return new;
        }

        pub fn mulVecV(self: Self, other: Self) Self {
            return .{ .data = @bitCast(@as(VNT, self.data) * @as(VNT, other.data)) };
        }

        pub fn div(self: Self, scalar: T) Self {
            std.debug.assert(scalar != 0.0);
            return self.mul(1 / scalar);
        }

        pub fn divV(self: Self, scalar: T) Self {
            std.debug.assert(scalar != 0.0);
            return .{ .data = @bitCast(@as(VNT, self.data) / @as(VNT, @splat(scalar))) };
        }

        pub fn divVec(self: Self, other: Self) Self {
            inline for (other.data) |datum| std.debug.assert(datum != 0);
            var new: Self = .zero();
            inline for (0..N) |i| new.data[i] = self.data[i] / other.data[i];
            return new;
        }

        pub fn divVecV(self: Self, other: Self) Self {
            std.debug.assert(@reduce(.Or, @as(VNT, other.data) == @as(VNT, @splat(0))) == false);
            return .{ .data = @bitCast(@as(VNT, self.data) / @as(VNT, other.data)) };
        }

        pub fn dot(self: Self, other: Self) T {
            const temp = self.mulVec(other);
            var sum: T = 0;
            inline for (0..N) |i| sum += temp.data[i];
            return sum;
        }

        pub fn dotV(self: Self, other: Self) T {
            return @reduce(.Add, @as(VNT, self.addVecV(other).data));
        }

        pub fn len(self: Self) T {
            const length: T = self.dot(self);
            return switch (@typeInfo(T)) {
                .int => std.math.sqrt(length),
                .float => @sqrt(length),
                else => unreachable,
            };
        }

        pub fn lenV(self: Self) T {
            const length: T = self.dotV(self);
            return switch (@typeInfo(T)) {
                .int => std.math.sqrt(length),
                .float => @sqrt(length),
                else => unreachable,
            };
        }

        pub fn norm(self: Self) Self {
            return self.div(self.len());
        }

        pub fn normV(self: Self) Self {
            return self.divV(self.lenV());
        }

        pub fn cross(self: Self, other: Vec3) Self {
            std.debug.assert(N >= 3);
            const a1 = Self{ .data = [_]T{ self.data[1], self.data[2], self.data[0] } };
            const a2 = Self{ .data = [_]T{ self.data[2], self.data[0], self.data[1] } };
            const b1 = Self{ .data = [_]T{ other.data[2], other.data[0], other.data[1] } };
            const b2 = Self{ .data = [_]T{ other.data[1], other.data[2], other.data[0] } };
            const result: Self = (a1.mulVec(b1)).subVec(a2.mulVec(b2));
            return switch (N) {
                3 => result,
                4 => .{ .data = [_]T{ result.data, self.data[3] } },
            };
        }

        pub fn crossV(self: Self, other: Self) Self {
            std.debug.assert(N >= 3);
            const a1 = Self{ .data = [_]T{ self.data[1], self.data[2], self.data[0] } };
            const a2 = Self{ .data = [_]T{ self.data[2], self.data[0], self.data[1] } };
            const b1 = Self{ .data = [_]T{ other.data[2], other.data[0], other.data[1] } };
            const b2 = Self{ .data = [_]T{ other.data[1], other.data[2], other.data[0] } };
            const result = (a1.mulVecV(b1)).subVecV(a2.mulVecV(b2));
            return switch (N) {
                3 => result,
                4 => .{ .data = [_]T{ result.data, self.data[3] } },
            };
        }
    };
}

// may not need f32
pub const Vec2 = createVector(2, f32);
pub const Vec3 = createVector(3, f32);
pub const Vec4 = createVector(4, f32);

pub fn lookAt(eye: Vec4, center: Vec4, up: Vec4) Mat4 {
    // eye = camera
    // center = of target
    // up = camera up
    const f = center.subVec(eye).norm(); // forward
    const s = f.cross(up).norm(); // right
    const u = s.cross(f); // up

    return Mat4{
        .data = .{
            .{ .x = s.x, .y = u.x, .z = -f.x, .w = 0 },
            .{ .x = s.y, .y = u.y, .z = -f.y, .w = 0 },
            .{ .x = s.z, .y = u.z, .z = -f.z, .w = 0 },
            .{ .x = -s.dot(eye), .y = -u.dot(eye), .z = f.dot(eye), .w = 1 },
        },
    };
}

pub fn lookAtV(eye: Vec4, center: Vec4, up: Vec4) Mat4 {
    // diff = uses vectors instead
    const f = center.subVecV(eye).normV();
    const s = f.crossV(up).normV();
    const u = s.crossV(f);

    return Mat4{
        .data = .{
            .{ .x = s.x, .y = u.x, .z = -f.x, .w = 0 },
            .{ .x = s.y, .y = u.y, .z = -f.y, .w = 0 },
            .{ .x = s.z, .y = u.z, .z = -f.z, .w = 0 },
            .{ .x = -s.dotV(eye), .y = -u.dotV(eye), .z = f.dotV(eye), .w = 1 },
        },
    };
}

pub fn rotateCol(angle: f32, axis: Vec3) Mat4 {
    // col order
    const naxis = axis.normV();

    const nx = naxis.data[0];
    const ny = naxis.data[1];
    const nz = naxis.data[2];

    const c = @cos(angle);
    const s = @sin(angle);
    const ic = 1.0 - c;

    return .{
        .data = .{
            .{ c + nx * nx * ic, ny * nx * ic + nz * s, nz * nx * ic - ny * s, 0 },
            .{ nx * ny * ic - nz * s, c + ny * ny * ic, nz * ny * ic + nx * s, 0 },
            .{ nx * nz * ic + ny * s, ny * nz * ic - nx * s, c + nz * nz * ic, 0 },
            .{ 0, 0, 0, 1 },
        },
    };
}

test "Vector Fns" {
    // test:
    // int/float
    // 2, 3, 4,
    // each fn
}
