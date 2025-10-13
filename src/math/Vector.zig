// TODO: Need to fix this file
const Matrix = @import("Matrix.zig");
const Vector = @This();

data: [4]f32,

pub fn init0(x: f32, y: f32, z: f32) Vector {
    return .{ .data = [4]f32{ x, y, z, 0 } };
}

pub fn init1(x: f32, y: f32, z: f32) Vector {
    return .{ .data = [4]f32{ x, y, z, 1 } };
}

pub fn swap1(A: Vector) Vector {
    return .init1(A.data[0], A.data[1], A.data[2]);
}

pub fn swap0(A: Vector) Vector {
    return .init0(A.data[0], A.data[1], A.data[2]);
}

pub fn ones() Vector {
    return .init1(1, 1, 1);
}

pub fn zeros() Vector {
    return .init0(0, 0, 0);
}

pub fn x_axis() Vector {
    return .init0(1, 0, 0);
}

pub fn y_axis() Vector {
    return .init0(0, 1, 0);
}

pub fn z_axis() Vector {
    return .init0(0, 0, 1);
}

pub fn add(A: Vector, b: f32) Vector {
    return .{
        .data = @as([4]f32, @as(@Vector(4, f32), A.data) + @as(@Vector(4, f32), @splat(b))),
    };
}

pub fn vecAdd(A: Vector, B: Vector) Vector {
    return .{
        .data = @as([4]f32, @as(@Vector(4, f32), A.data) + @as(@Vector(4, f32), B.data)),
    };
}

pub fn sub(A: Vector, b: f32) Vector {
    return .{
        .data = @as([4]f32, @as(@Vector(4, f32), A.data) - @as(@Vector(4, f32), @splat(b))),
    };
}

pub fn vecSub(A: Vector, B: Vector) Vector {
    return .{
        .data = @as([4]f32, @as(@Vector(4, f32), A.data) - @as(@Vector(4, f32), B.data)),
    };
}

pub fn mul(A: Vector, b: f32) Vector {
    return .{
        .data = @as([4]f32, @as(@Vector(4, f32), A.data) * @as(@Vector(4, f32), @splat(b))),
    };
}

pub fn vecMul(A: Vector, B: Vector) Vector {
    return .{
        .data = @as([4]f32, @as(@Vector(4, f32), A.data) * @as(@Vector(4, f32), B.data)),
    };
}

pub fn div(A: Vector, b: f32) Vector {
    // need to catch div by 0
    return .{
        .data = @as([4]f32, @as(@Vector(4, f32), A.data) / @as(@Vector(4, f32), @splat(b))),
    };
}

pub fn vecDiv(A: Vector, B: Vector) Vector {
    // need to catch div by 0
    return .{
        .data = @as([4]f32, @as(@Vector(4, f32), A.data) / @as(@Vector(4, f32), B.data)),
    };
}

pub fn dot(A: Vector, B: Vector) f32 {
    return @reduce(.Add, @as(@Vector(4, f32), A) * @as(@Vector(4, f32), B));
}

pub fn cross(A: Vector, B: Vector) Vector {
    const x = A.data[1] * B.data[2] - A.data[2] * B.data[1];
    const y = A.data[2] * B.data[0] - A.data[0] * B.data[2];
    const z = A.data[0] * B.data[1] - A.data[1] * B.data[0];
    return .init1(x, y, z);
}

pub fn len(A: Vector) f32 {
    return @sqrt(A.dot(A));
}

pub fn norm(A: Vector) Vector {
    return .{
        .data = @as([4]f32, @as(@Vector(4, f32), A.data) / @as(@Vector(4, f32), @splat(A.len()))),
    };
}

// pub fn lookAt(camera: Vector, up: Vector, right: Vector) Matrix {
//
// }
