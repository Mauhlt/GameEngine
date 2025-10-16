const std = @import("std");

pub fn createVector(comptime n: usize) type {
    std.debug.assert(n >= 2);
    std.debug.assert(n <= 4);

    return struct {
        const Vector = @This();
        data: [n]f32 = [_]f32{0} ** n,

        pub fn ones() Vector {
            return .{ .data = [_]f32{1} ** n };
        }

        pub fn zeros() Vector {
            return .{ .data = [_]f32{0} ** n };
        }

        pub fn x() Vector {
            var data = [_]f32{0} ** n;
            data[0] = 1;
            return .{ .data = data };
        }

        pub fn y() Vector {
            var data = [_]f32{0} ** n;
            data[1] = 1;
            return .{ .data = data };
        }

        pub fn z() Vector {
            var data: Vector = .zeros();
            switch (n) {
                3, 4 => {
                    data.data[2] = 1;
                },
                else => {},
                _ => unreachable,
            }
            return data;
        }

        pub fn add(A: Vector, b: f32) Vector {
            return .{
                .data = @as([n]f32, @as(@Vector(n, f32), A.data) + @as(@Vector(n, f32), @splat(b))),
            };
        }

        pub fn vecAdd(A: Vector, B: Vector) Vector {
            return .{
                .data = @as([n]f32, @as(@Vector(n, f32), A.data) + @as(@Vector(n, f32), B.data)),
            };
        }

        pub fn sub(A: Vector, b: f32) Vector {
            return .{
                .data = @as([n]f32, @as(@Vector(n, f32), A.data) - @as(@Vector(n, f32), @splat(b))),
            };
        }

        pub fn vecSub(A: Vector, B: Vector) Vector {
            return .{
                .data = @as([n]f32, @as(@Vector(n, f32), A.data) - @as(@Vector(n, f32), B.data)),
            };
        }

        pub fn mul(A: Vector, b: f32) Vector {
            return .{
                .data = @as([n]f32, @as(@Vector(n, f32), A.data) * @as(@Vector(n, f32), @splat(b))),
            };
        }

        pub fn vecMul(A: Vector, B: Vector) Vector {
            return .{
                .data = @as([n]f32, @as(@Vector(n, f32), A.data) * @as(@Vector(n, f32), B.data)),
            };
        }

        pub fn div(A: Vector, b: f32) Vector {
            // need to catch div by 0
            return .{
                .data = @as([n]f32, @as(@Vector(n, f32), A.data) / @as(@Vector(n, f32), @splat(b))),
            };
        }

        pub fn vecDiv(A: Vector, B: Vector) Vector {
            // need to catch div by 0
            return .{
                .data = @as([n]f32, @as(@Vector(n, f32), A.data) / @as(@Vector(n, f32), B.data)),
            };
        }

        pub fn dot(A: Vector, B: Vector) f32 {
            return @reduce(.Add, @as(@Vector(n, f32), A) * @as(@Vector(n, f32), B));
        }

        pub fn cross(A: Vector, B: Vector) Vector {
            switch (n) {
                3 => {
                    const x_vec = A.data[1] * B.data[2] - A.data[2] * B.data[1];
                    const y_vec = A.data[2] * B.data[0] - A.data[0] * B.data[2];
                    const z_vec = A.data[0] * B.data[1] - A.data[1] * B.data[0];
                    return .{ .data = [3]f32{ x_vec, y_vec, z_vec } };
                },
                else => {
                    return A;
                },
            }
        }

        pub fn len(A: Vector) f32 {
            return @sqrt(A.dot(A));
        }

        pub fn norm(A: Vector) Vector {
            return .{
                .data = @as([n]f32, @as(@Vector(n, f32), A.data) / @as(@Vector(n, f32), @splat(A.len()))),
            };
        }
    };
}

pub const Vec2 = createVector(2);
pub const Vec3 = createVector(3);
pub const Vec4 = createVector(4);
