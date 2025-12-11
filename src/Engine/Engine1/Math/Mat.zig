const std = @import("std");

pub fn createMatrix(comptime N: usize, comptime T: type) type {
    if (N < 2 or N > 4) @compileError("2 >= N <= 4\n");
    switch (@typeInfo(T)) {
        .int, .float => {},
        else => @compileError("T must be an int or float.\n"),
    }

    // col major
    return struct {
        const Self = @This();

        data: [N][N]T = @bitCast([_]T{0} ** (N * N)),

        pub fn eye() Self {
            var self: Self = .{};
            inline for (0..N) |i| self.data[i][i] = 1;
            return self;
        }

        pub fn fromCols(cols: [N][N]T) Self {
            return .{ .data = cols };
        }

        pub fn mul(self: Self, scalar: T) Self {
            var new: Self = .{};
            inline for (0..N) |i| {
                inline for (0..N) |j| {
                    new.data[i][j] = self.data[i][j] * scalar;
                }
            }
            return new;
        }

        pub fn mulV(self: Self, scalar: T) Self {
            return .{ .data = @bitCast(@as(@Vector(N * N, T), @bitCast(self.data)) * scalar) };
        }

        pub fn mulElem(self: Self, other: Self) Self {
            var new: Self = .{};
            inline for (0..N) |i| {
                inline for (0..N) |j| {
                    new.data[i][j] = self.data[i][j] * other.data[i][j];
                }
            }
            return new;
        }

        pub fn mulElemV(self: Self, other: Self) Self {
            return .{ .data = @bitCast(@as(@Vector(N * N, T), self.data) * @as(@Vector(N * N, T), other.data)) };
        }

        pub fn mulMat(self: Self, other: Self) Self {
            var out: Self = .{};
            inline for (0..N) |i| {
                inline for (0..N) |j| {
                    var sum: T = 0;
                    switch (@typeInfo(T)) {
                        .int => {
                            inline for (0..N) |k| {
                                sum += self.data[k][i] * other.data[j][k];
                            }
                        },
                        .float => {
                            inline for (0..N) |k| {
                                sum = @mulAdd(T, self.data[k][i], other.data[j][k], sum);
                            }
                        },
                    }
                    out.data[j][i] = sum;
                }
            }
            return out;
        }

        pub fn mulMatV(self: Self, other: Self) Self {
            // row major order
            // a b c     j k l     aj + bm + cp;  ak + bn + cq;  al + bo + cr;    aj + bm + cp;  dj + em + dp;  gj + hm + ip;
            // d e f  *  m n o  =  dj + em + dp;  dk + en + fq;  dl + eo + fr; =  ak + bn + cq;  dk + en + fq;  gk + hn + iq;
            // g h i     p q r     gj + hm + ip;  gk + hn + iq;  gl + ho + ir;    al + bo + cr;  dl + eo + fr;  gl + ho + ir;
            // col major order
            // a d g  *  j m p
            // b e h     k n q  =
            // c f i     l o r
            const VNT = @Vector(N, T);
            var out: Self = .{};
            inline for (0..N) |i| {
                inline for (0..N) |j| {
                    const v1 = @as(VNT, other.data[j]);
                    inline for (0..N) |k| {
                        const v2 = @as(VNT, @splat(self.data[k][i]));
                        out.data[j][i] = @mulAdd(VNT, v1, v2, out.data[j][i]);
                    }
                }
            }
        }

        pub fn transpose(a: Self) Self {
            var new: Self = .{};
            inline for (0..N) |i| {
                inline for (0..N / 2) |j| {
                    new.data[i][j] = a.data[j][i];
                    new.data[j][i] = a.data[i][j];
                }
            }
            return new;
        }

        pub fn print(self: Self) void {
            for (0..N) |j| {
                for (0..N) |i| {
                    std.debug.print("{}", .{self.data[i][j]});
                }
            }
        }
    };
}

pub const Mat2 = createMatrix(2, f32);
pub const Mat3 = createMatrix(3, f32);
pub const Mat4 = createMatrix(4, f32);

pub fn ortho(comptime T: type, left: T, right: T, bot: T, top: T, near: T, far: T) createMatrix(4, T) {
    return .{
        .{ 2.0 / (right - left), 0, 0, 0 },
        .{ 0, 2.0 / (top - bot), 0, 0 },
        .{ 0, 0, -2.0 / (far - near), 0 },
        .{ -(right + left) / (right - left), -(top + bot) / (top - bot), -(far + near) / (far - near), 1 },
    };
}

pub fn persp(comptime T: type, fovy: T, aspect: T, zNear: T, zFar: T) createMatrix(4, T) {
    const f = 1.0 / @tan(fovy * 0.5);
    return .{
        .{ f / aspect, 0, 0, 0 },
        .{ 0, f, 0, 0 },
        .{ 0, 0, (zFar + zNear) / (zNear - zFar), -1 },
        .{ 0, 0, (2 * zFar * zNear) / (zNear - zFar), 0 },
    };
}

// test "Matrix Math" {
//     const data1: Mat3 = .{
//         .data = .{
//             .{ 1, 4, 7 },
//             .{ 2, 5, 8 },
//             .{ 3, 6, 9 },
//         },
//     };
//     const data2: Mat3 = .eye();
//     std.debug.print();
// }
