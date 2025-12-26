const std = @import("std");
const Vector = @import("Vec.zig").Vector;
// eye, fromCols, mulS, mulV

pub fn Matrix(comptime T: type, comptime N: comptime_int) type {
    if (N < 2 or N > 4) @compileError("2 >= N <= 4\n");

    switch (@typeInfo(T)) {
        .float => {},
        else => @compileError("T must be an int or float.\n"),
    }

    // col major
    return struct {
        data: [N][N]T = @bitCast(@as(@Vector(N * N, T), @splat(0))),

        pub fn eye() @This() {
            var self: @This() = .{};
            inline for (0..N) |i| self.data[i][i] = 1.0;
            return self;
        }

        pub fn init(scalar: T) @This() {
            // for scalar matrices (i.e. all ones or all twos)
            return .{ .data = @bitCast(@as(@Vector(N * N, T), @splat(scalar))) };
        }

        pub fn fromCols(cols: [N][N]T) @This() {
            return .{ .data = cols };
        }

        // scalar
        pub fn addS(self: @This(), scalar: T) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N * N, T), self.data) + @as(@Vector(N * N, T), @splat(scalar))) };
        }

        pub fn subS(self: @This(), scalar: T) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N * N, T), self.data) - @as(@Vector(N * N, T), @splat(scalar))) };
        }

        pub fn mulS(self: @This(), scalar: T) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N * N, T), self.data) * @as(@Vector(N * N, T), @splat(scalar))) };
        }

        pub fn divS(self: @This(), scalar: T) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N * N, T), self.data) / @as(@Vector(N * N, T), @splat(scalar))) };
        }

        pub fn addV(self: @This(), other: Vector(T, N)) @TypeOf(self) {
            var output = .{};
            inline for (0..N) |i| {
                output.data[i] = @as(@Vector(N, T), @bitCast(self.data[i])) + @as(@Vector(N, T), other.data[i]);
            }
        }

        pub fn subV(self: @This(), other: Vector(T, N)) @TypeOf(self) {
            var output = .{};
            inline for (0..N) |i| {
                output.data[i] = @as(@Vector(N, T), @bitCast(self.data[i])) - @as(@Vector(N, T), other.data[i]);
            }
        }

        pub fn mulV(self: @This(), other: Vector(T, N)) @TypeOf(self) {
            var output = .{};
            inline for (0..N) |i| {
                output.data[i] = @as(@Vector(N, T), @bitCast(self.data[i])) * @as(@Vector(N, T), other.data[i]);
            }
        }

        pub fn divV(self: @This(), other: Vector(T, N)) @TypeOf(self) {
            var output = .{};
            inline for (0..N) |i| {
                output.data[i] = @as(@Vector(N, T), @bitCast(self.data[i])) / @as(@Vector(N, T), other.data[i]);
            }
        }

        pub fn addE(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N * N, T), self.data) + @as(@Vector(N * N, T), other.data)) };
        }

        pub fn subE(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N * N, T), self.data) - @as(@Vector(N * N, T), other.data)) };
        }

        pub fn mulE(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            // element-wise multiplication
            return .{ .data = @bitCast(@as(@Vector(N * N, T), self.data) * @as(@Vector(N * N, T), other.data)) };
        }

        pub fn divE(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            return .{ .data = @bitCast(@as(@Vector(N * N, T), self.data) / @as(@Vector(N * N, T), other.data)) };
        }

        pub fn mulM(self: @This(), other: @TypeOf(self)) @TypeOf(self) {
            // matrix multiplication
            // row major order
            // a b c     j k l     aj + bm + cp;  ak + bn + cq;  al + bo + cr;    aj + bm + cp;  dj + em + dp;  gj + hm + ip;
            // d e f  *  m n o  =  dj + em + dp;  dk + en + fq;  dl + eo + fr; =  ak + bn + cq;  dk + en + fq;  gk + hn + iq;
            // g h i     p q r     gj + hm + ip;  gk + hn + iq;  gl + ho + ir;    al + bo + cr;  dl + eo + fr;  gl + ho + ir;
            var out: @This() = .{};
            inline for (0..N) |i| { // row
                var v1: Vector(T, N) = self.row(i);
                inline for (0..N) |j| { // col
                    const v2: Vector(T, N) = other.col(j);
                    out.data[i][j] = v1.dot(v2);
                }
            }
            return out;
        }

        pub fn row(self: @This(), i: usize) Vector(T, N) {
            return switch (N) {
                2 => .{ .data = .{ self.data[0][i], self.data[1][i] } },
                3 => .{ .data = .{ self.data[0][i], self.data[1][i], self.data[2][i] } },
                4 => .{ .data = .{ self.data[0][i], self.data[1][i], self.data[2][i], self.data[3][i] } },
                else => unreachable,
            };
        }
        pub fn col(self: @This(), i: usize) Vector(T, N) {
            return .{ .data = self.data[i] };
        }

        pub fn rotate(self: @This(), angle: f32, axis: Vector(T, 3)) @TypeOf(self) {
            switch (N) {
                4 => {},
                2, 3 => unreachable,
                else => unreachable,
            }

            const a = axis.norm();
            const c = @cos(angle);
            const s = @sin(angle);
            const t = 1.0 - c;

            const x = a.data[0];
            const y = a.data[1];
            const z = a.data[2];

            const r00 = t * x * x + c;
            const r01 = t * x * y - s * z;
            const r02 = t * x * z + s * y;

            const r10 = t * x * y + s * z;
            const r11 = t * y * y + c;
            const r12 = t * y * z - s * x;

            const r20 = t * x * z - s * y;
            const r21 = t * y * z + s * x;
            const r22 = t * z * z + c;

            const r: @TypeOf(self) = .{
                .data = .{
                    .{ r00, r10, r20, 0 },
                    .{ r01, r11, r21, 0 },
                    .{ r02, r12, r22, 0 },
                    .{ 0, 0, 0, 1 },
                },
            };

            return self.mulM(r);
        }

        pub fn transpose(self: @This()) @TypeOf(self) {
            var new: @This() = .{};
            inline for (0..N) |i| {
                inline for (0..i) |j| {
                    new.data[i][j] = self.data[j][i];
                    new.data[j][i] = self.data[i][j];
                }
            }
            inline for (0..N) |i| new.data[i][i] = self.data[i][i];
            return new;
        }

        pub fn print(self: @This()) void {
            for (0..N) |j| {
                for (0..N) |i| {
                    std.debug.print("{} ", .{@round(self.data[i][j])});
                }
                std.debug.print("\n", .{});
            }
            std.debug.print("\n", .{});
        }

        pub fn ortho(left: T, right: T, bot: T, top: T, near: T, far: T) @This() {
            return switch (N) {
                4 => .{
                    .data = .{
                        .{ 2.0 / (right - left), 0, 0, 0 },
                        .{ 0, 2.0 / (top - bot), 0, 0 },
                        .{ 0, 0, -2.0 / (far - near), 0 },
                        .{ -(right + left) / (right - left), -(top + bot) / (top - bot), -(far + near) / (far - near), 1 },
                    },
                },
                else => unreachable,
            };
        }

        pub fn persp(fovy: T, aspect: T, zNear: T, zFar: T) @This() {
            const f = 1.0 / @tan(fovy * 0.5);
            return switch (N) {
                4 => .{
                    .data = .{
                        .{ f / aspect, 0, 0, 0 },
                        .{ 0, f, 0, 0 },
                        .{ 0, 0, (zFar + zNear) / (zNear - zFar), -1 },
                        .{ 0, 0, (2 * zFar * zNear) / (zNear - zFar), 0 },
                    },
                },
                else => unreachable,
            };
        }

        pub fn toMat(self: @This()) [N][N]T {
            return @bitCast(self.data);
        }
    };
}

test "Matrix Multiplication" {
    // testing matrix multiplication
    const M2 = Matrix(f32, 2);
    const a: M2 = .{ .data = .{
        .{ 2, 9 },
        .{ 3, 7 },
    } };
    const b: M2 = .{ .data = .{
        .{ 3, 7 },
        .{ 2, 9 },
    } };
    const c = a.mulM(b);

    const d: [4]f32 = .{ 27, 31, 76, 81 };
    var k: usize = 0;
    for (0..c.data.len) |i| {
        for (0..c.data.len) |j| {
            try std.testing.expectEqual(c.data[i][j], d[k]);
            k += 1;
        }
    }
}

test "Matrix Pre vs Post" {
    // testing multiplication again
    const M4 = Matrix(f32, 4);
    const m1: M4 = .{
        .data = .{
            .{ 1, 5, 9, 13 },
            .{ 2, 6, 10, 14 },
            .{ 3, 7, 11, 15 },
            .{ 4, 8, 12, 16 },
        },
    };
    const m2: M4 = .{
        .data = .{
            .{ 17, 21, 25, 29 },
            .{ 18, 22, 26, 30 },
            .{ 19, 23, 27, 31 },
            .{ 20, 24, 28, 32 },
        },
    };
    const m3_post = m1.mulM(m2);
    // const m3_pre = m2.mulM(m1);
    // expected results
    const m4_post: M4 = .{
        .data = .{
            .{ 250, 260, 270, 280 },
            .{ 618, 644, 670, 696 },
            .{ 986, 1028, 1070, 1112 },
            .{ 1354, 1412, 1470, 1528 },
        },
    };
    // const m4_pre: M4 = m4.transpose();

    const tol: f32 = 1e-8;
    for (0..m3_post.data.len) |i| {
        for (0..m3_post.data[i].len) |j| {
            try std.testing.expectApproxEqAbs(m3_post.data[i][j], m4_post.data[i][j], tol);
            // try std.testing.expectApproxEqAbs(m3_pre.data[i][j], m4_pre.data[i][j], tol);
        }
    }
}

test "Rotation" {
    const M4 = Matrix(f32, 4);
    const V3 = Vector(f32, 3);
    const tol: f32 = 1e-4;
    const m1: M4 = .eye();
    const forty_five = @as(f32, std.math.pi) / @as(f32, @floatFromInt(2));
    const axis = V3.new(.{ 0, 0, 1 });
    const m2 = m1.rotate(forty_five, axis);
    // m2.print();
    const m2_expected: M4 = .{
        .data = .{
            .{ 0, 1, 0, 0 },
            .{ -1, 0, 0, 0 },
            .{ 0, 0, 1, 0 },
            .{ 0, 0, 0, 1 },
        },
    };
    // m2_expected.print();
    for (0..m2.data.len) |i| {
        for (0..m2.data[i].len) |j| {
            std.testing.expectApproxEqAbs(m2.data[i][j], m2_expected.data[i][j], tol) catch |err| {
                m2.print();
                m2_expected.print();
                std.debug.print("Failed on: col: {}, row: {}\n", .{ i, j });
                std.debug.print("Got: {}, Expected: {}\n", .{ m2.data[i][j], m2_expected.data[i][j] });
                return err;
            };
        }
    }

    const m3 = m2.rotate(@as(f32, std.math.pi / @as(f32, @floatFromInt(2))), .{ .data = .{ 0, 0, 1 } });
    const m3_expected: M4 = .eye();
    for (0..m3.data.len) |i| {
        for (0..m3.data.len) |j| {
            try std.testing.expectApproxEqAbs(m3.data[i][j], m3_expected.data[i][j], tol);
        }
    }
    // m3.print();
}

test "Transpose" {
    const M4 = Matrix(f32, 4);
    const m1: M4 = .{
        .data = .{
            .{ 0, 1, 2, 3 },
            .{ 4, 5, 6, 7 },
            .{ 8, 9, 10, 11 },
            .{ 12, 13, 14, 15 },
        },
    };
    const m2: M4 = .{
        .data = .{
            .{ 0, 4, 8, 12 },
            .{ 1, 5, 9, 13 },
            .{ 2, 6, 10, 14 },
            .{ 3, 7, 11, 15 },
        },
    };
    const m3 = m1.transpose();
    const tol: f32 = 1e-8;
    for (0..4) |i| {
        for (0..i) |j| {
            try std.testing.expectApproxEqAbs(m2.data[i][j], m3.data[i][j], tol);
        }
    }

    const m4 = M4.eye().transpose();
    const m5: M4 = .{
        .data = .{
            .{ 1, 0, 0, 0 },
            .{ 0, 1, 0, 0 },
            .{ 0, 0, 1, 0 },
            .{ 0, 0, 0, 1 },
        },
    };
    for (0..4) |i| {
        for (0..4) |j| {
            try std.testing.expectApproxEqAbs(m4.data[i][j], m5.data[i][j], tol);
        }
    }
}
