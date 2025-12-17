const std = @import("std");
const Vec = @import("Vec.zig");
const V2 = Vec.V2;
const V3 = Vec.V3;
const V4 = Vec.V4;
// eye, fromCols, mulS, mulV

pub fn Matrix(comptime N: usize, comptime T: type) type {
    if (N < 2 or N > 4) @compileError("2 >= N <= 4\n");
    switch (@typeInfo(T)) {
        .int, .float => {},
        else => @compileError("T must be an int or float.\n"),
    }

    // col major
    return struct {
        data: [N][N]T = @bitCast([_]T{0} ** (N * N)),

        pub fn eye() @This() {
            var self: @This() = .{};
            inline for (0..N) |i| self.data[i][i] = 1;
            return self;
        }

        pub fn fromCols(cols: [N][N]T) @This() {
            return .{ .data = cols };
        }

        pub fn mulS(self: @This(), scalar: T) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N * N, T), @bitCast(self.data)) * scalar) };
        }

        pub fn mulV(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N * N, T), self.data) * @as(@Vector(N * N, T), other.data)) };
        }

        pub fn row(self: @This(), i: usize) Vec.Vector(T, N) {
            return switch (N) {
                2 => .{ .data = .{ self.data[0][i], self.data[1][i] } },
                3 => .{ .data = .{ self.data[0][i], self.data[1][i], self.data[2][i] } },
                4 => .{ .data = .{ self.data[0][i], self.data[1][i], self.data[2][i], self.data[3][i] } },
                else => unreachable,
            };
        }
        pub fn col(self: @This(), i: usize) Vec.Vector(T, N) {
            return .{ .data = self.data[i] };
        }

        pub fn mulM(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            // row major order
            // a b c     j k l     aj + bm + cp;  ak + bn + cq;  al + bo + cr;    aj + bm + cp;  dj + em + dp;  gj + hm + ip;
            // d e f  *  m n o  =  dj + em + dp;  dk + en + fq;  dl + eo + fr; =  ak + bn + cq;  dk + en + fq;  gk + hn + iq;
            // g h i     p q r     gj + hm + ip;  gk + hn + iq;  gl + ho + ir;    al + bo + cr;  dl + eo + fr;  gl + ho + ir;

            const V = switch (N) {
                2 => Vec.V2,
                3 => Vec.V3,
                4 => Vec.V4,
                else => unreachable,
            };
            var out: @This() = .{};
            inline for (0..N) |i| { // row
                var v1: V = self.row(i);
                inline for (0..N) |j| { // col
                    const v2: V = other.col(j);
                    out.data[i][j] = v1.dot(v2);
                }
            }
            return out;
        }
        // 2 3 * 4 2 = 2*4 + 3*1; 2*2 + 3*3;
        // 3 2   1 3   3*4 + 2*1; 3*2 + 2*3;
        //
        // 2 3 1 * 4 2 1 = 2*4 + 3*1 + 1*2;
        // 3 2 1   1 3 4
        // 4 2 5   2 0 2
        //
        // block version of above:
        // 2*4 + 3*1 + 1*2;

        pub fn transpose(self: @This()) @TypeOf(self) {
            var new: @This() = .{};
            inline for (0..N) |i| {
                inline for (0..N / 2) |j| {
                    new.data[i][j] = self.data[j][i];
                    new.data[j][i] = self.data[i][j];
                }
            }
            return new;
        }

        pub fn print(self: @This()) void {
            for (0..N) |j| {
                for (0..N) |i| {
                    std.debug.print("{} ", .{self.data[i][j]});
                }
                std.debug.print("\n", .{});
            }
            std.debug.print("\n", .{});
        }
    };
}

pub const M2 = Matrix(2, f32);
pub const M3 = Matrix(3, f32);
pub const M4 = Matrix(4, f32);

pub fn ortho(comptime T: type, left: T, right: T, bot: T, top: T, near: T, far: T) Matrix(4, T) {
    return .{
        .{ 2.0 / (right - left), 0, 0, 0 },
        .{ 0, 2.0 / (top - bot), 0, 0 },
        .{ 0, 0, -2.0 / (far - near), 0 },
        .{ -(right + left) / (right - left), -(top + bot) / (top - bot), -(far + near) / (far - near), 1 },
    };
}

pub fn persp(comptime T: type, fovy: T, aspect: T, zNear: T, zFar: T) Matrix(4, T) {
    const f = 1.0 / @tan(fovy * 0.5);
    return .{
        .{ f / aspect, 0, 0, 0 },
        .{ 0, f, 0, 0 },
        .{ 0, 0, (zFar + zNear) / (zNear - zFar), -1 },
        .{ 0, 0, (2 * zFar * zNear) / (zNear - zFar), 0 },
    };
}

test "Basics" {
    // testing matrix multiplication
    const a: M2 = .{ .data = .{
        .{ 2, 9 },
        .{ 3, 7 },
    } };
    const b: M2 = .{ .data = .{
        .{ 3, 7 },
        .{ 2, 9 },
    } };
    const c = a.mulM1(b);

    const d: [4]f32 = .{ 27, 31, 76, 81 };
    var k: usize = 0;
    for (0..c.data.len) |i| {
        for (0..c.data.len) |j| {
            try std.testing.expectEqual(c.data[i][j], d[k]);
            k += 1;
        }
    }
}
