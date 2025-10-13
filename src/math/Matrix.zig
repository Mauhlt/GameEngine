// TODO: Need to fix this file
const Vector = @import("Vector.zig");
const Matrix = @This();
data: [4][4]f32,

pub fn zeros() Matrix {
    return .{ .data = [4][4]f32{
        [_]f32{0} ** 4,
        [_]f32{0} ** 4,
        [_]f32{0} ** 4,
        [_]f32{0} ** 4,
    } };
}

pub fn ones() Matrix {
    return .{ .data = [4][4]f32{
        [_]f32{1} ** 4,
        [_]f32{1} ** 4,
        [_]f32{1} ** 4,
        [_]f32{1} ** 4,
    } };
}

pub fn identity() Matrix {
    var mat: Matrix = .zeros();
    inline for (0..4) |i| {
        mat.data[i][i] = 1;
    }
    return mat;
}

pub fn add(A: Matrix, b: f32) Matrix {
    return .{
        .data = @as([4][4]f32, @bitCast(@as(@Vector(16, f32), @as([16]f32, @bitCast(A.data))) + @as(@Vector(16, f32), @splat(b)))),
    };
}

pub fn matAdd(A: Matrix, B: Matrix) Matrix {
    return .{
        .data = @as([4][4]f32, @as(@Vector(16, f32), A.data) + @as(@as(16, f32), B.data)),
    };
}

pub fn vecAdd(A: Matrix, B: Vector) Matrix {
    var mat: Matrix = undefined;
    inline for (0..4) |i| {
        mat.data[i] = @as([4]f32, @as(@Vector(4, f32), A.data[i]) + @as(@Vector(4, f32), @splat(B.data[i])));
    }
    return mat;
}

pub fn sub(A: Matrix, b: f32) Matrix {
    return .{
        .data = @as(@Vector(16, f32), A.data) - @as(@Vector(16, f32), @splat(b)),
    };
}

pub fn matSub(A: Matrix, B: Matrix) Matrix {
    return .{
        .data = @as([4][4]f32, @as(@Vector(16, f32), A.data) - @as(@as(16, f32), B.data)),
    };
}

pub fn vecSub(A: Matrix, B: Vector) Matrix {
    var mat: Matrix = undefined;
    inline for (0..4) |i| {
        mat.data[i] = @as([4]f32, @as(@Vector(4, f32), A.data[i]) + @as(@Vector(4, f32), @splat(B.data[i])));
    }
    return mat;
}

pub fn mul(A: Matrix, b: f32) Matrix {
    return .{
        .data = @as(@Vector(16, f32), A.data) * @as(@Vector(16, f32), @splat(b)),
    };
}

pub fn matMul(A: Matrix, B: Matrix) Matrix {
    return .{
        .data = @as([4][4]f32, @as(@Vector(16, f32), A.data) * @as(@as(16, f32), B.data)),
    };
}

pub fn vecMul(A: Matrix, B: Vector) Matrix {
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

pub fn vecDiv(A: Matrix, B: Vector) Matrix {
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
    for (0..A.data.len) |i| {
        for (0..A.data[i].len) |j| {
            mat.data[i][j] = A.data[j][i];
        }
    }
    return mat;
}

// pub fn frustrum() Matrix {}

// pub fn perspective() Matrix {}
