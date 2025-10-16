const std = @import("std");
const Vec2 = @import("Vector.zig").Vec2;
const Vec3 = @import("Vector.zig").Vec3;
const Vec4 = @import("Vector.zig").Vec4;

pub fn createMatrix(comptime n: usize) type {
    std.debug.assert(n >= 2 and n <= 4);
    const n2: @TypeOf(n) = n * n;
    const Vec = switch (n) {
        2 => Vec2,
        3 => Vec3,
        4 => Vec4,
        else => unreachable,
    };

    return struct {
        const Matrix = @This();
        data: [n][n]f32,

        pub fn zeros() Matrix {
            const data = [_]f32{0} ** n2;
            return .{ .data = @bitCast(data) };
        }

        pub fn ones() Matrix {
            const data = [_]f32{1} ** n2;
            return .{ .data = @bitCast(data) };
        }

        pub fn identity() Matrix {
            var mat: Matrix = .zeros();
            inline for (0..n) |i| {
                mat.data[i][i] = 1;
            }
            return mat;
        }

        pub fn add(A: Matrix, b: f32) Matrix {
            return .{
                .data = @as([n][n]f32, @bitCast(@as(@Vector(n2, f32), @as([n2]f32, @bitCast(A.data))) + @as(@Vector(n2, f32), @splat(b)))),
            };
        }

        pub fn matAdd(A: Matrix, B: Matrix) Matrix {
            return .{
                .data = @as([n][n]f32, @as(@Vector(n2, f32), A.data) + @as(@as(n2, f32), B.data)),
            };
        }

        pub fn vecAdd(A: Matrix, B: Vec) Matrix {
            var mat: Matrix = undefined;
            inline for (0..n) |i| {
                mat.data[i] = @as([n]f32, @as(@Vector(n, f32), A.data[i]) + @as(@Vector(n, f32), @splat(B.data[i])));
            }
            return mat;
        }

        pub fn sub(A: Matrix, b: f32) Matrix {
            return .{
                .data = @as(@Vector(n2, f32), A.data) - @as(@Vector(n2, f32), @splat(b)),
            };
        }

        pub fn matSub(A: Matrix, B: Matrix) Matrix {
            return .{
                .data = @as([n][n]f32, @as(@Vector(n2, f32), A.data) - @as(@as(n2, f32), B.data)),
            };
        }

        pub fn vecSub(A: Matrix, B: Vec) Matrix {
            var mat: Matrix = undefined;
            inline for (0..n) |i| {
                mat.data[i] = @as([n]f32, @as(@Vector(n, f32), A.data[i]) + @as(@Vector(n, f32), @splat(B.data[i])));
            }
            return mat;
        }

        pub fn mul(A: Matrix, b: f32) Matrix {
            return .{
                .data = @as(@Vector(n2, f32), A.data) * @as(@Vector(n2, f32), @splat(b)),
            };
        }

        pub fn matMul(A: Matrix, B: Matrix) Matrix {
            return .{
                .data = @as([n][n]f32, @as(@Vector(n2, f32), A.data) * @as(@as(n2, f32), B.data)),
            };
        }

        pub fn vecMul(A: Matrix, B: Vec) Matrix {
            var mat: Matrix = undefined;
            inline for (0..4) |i| {
                mat.data[i] = @as([4]f32, @as(@Vector(4, f32), A.data[i]) * @as(@Vector(4, f32), @splat(B.data[i])));
            }
            return mat;
        }

        pub fn div(A: Matrix, b: f32) Matrix {
            return .{
                .data = @as(@Vector(16, f32), A.data) / @as(@Vector(16, f32), @splat(b)),
            };
        }

        pub fn matDiv(A: Matrix, B: Matrix) Matrix {
            return .{
                .data = @as([4][4]f32, @as(@Vector(16, f32), A.data) / @as(@as(16, f32), B.data)),
            };
        }

        pub fn vecDiv(A: Matrix, B: Vec) Matrix {
            var mat: Matrix = undefined;
            inline for (0..4) |i| {
                mat.data[i] = @as([4]f32, @as(@Vector(4, f32), A.data[i]) / @as(@Vector(4, f32), @splat(B.data[i])));
            }
            return mat;
        }

        pub fn rot(A: Matrix, angle: f32) Matrix {
            // TODO Fix This
            A.matMul(rotX(angle)).matMul(rotY(angle)).matMul(rotZ(angle));
        }

        pub fn rotX(angle: f32) Matrix {
            const cost: f32 = @cos(angle);
            const sint: f32 = @sin(angle);

            switch (n) {
                2 => {},
                3 => {},
                4 => {},
            }

            return .{
                .data = [4][4]f32{
                    [4]f32{ 1, 0, 0, 0 },
                    [4]f32{ 0, cost, -sint, 0 },
                    [4]f32{ 0, sint, cost, 0 },
                    [4]f32{ 0, 0, 0, 1 },
                },
            };
        }

        pub fn rotY(angle: f32) Matrix {
            const cost: f32 = @cos(angle);
            const sint: f32 = @sin(angle);

            return .{
                .data = [4][4]f32{
                    [4]f32{ cost, 0, sint, 0 },
                    [4]f32{ 0, 1, 0, 0 },
                    [4]f32{ -sint, 0, cost, 0 },
                    [4]f32{ 0, 0, 0, 1 },
                },
            };
        }

        pub fn rotZ(angle: f32) Matrix {
            const cost: f32 = @cos(angle);
            const sint: f32 = @sin(angle);

            return .{
                .data = [4][4]f32{
                    [4]f32{ cost, -sint, 0, 0 },
                    [4]f32{ sint, cost, 0, 0 },
                    [4]f32{ 0, 0, 1, 0 },
                    [4]f32{ 0, 0, 0, 1 },
                },
            };
        }

        pub fn transpose(A: Matrix) Matrix {
            var mat: Matrix = undefined;
            for (0..n) |i| {
                for (0..n) |j| {
                    mat.data[i][j] = A.data[j][i];
                }
            }
            return mat;
        }
    };
}

pub const Mat2 = createMatrix(2);
pub const Mat3 = createMatrix(2);
pub const Mat4 = createMatrix(2);
