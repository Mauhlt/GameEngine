const Vector = @This();
data: [4]f32 = [_]f32{0} ** 4,

pub fn ones() Vector {
    return .{ .data = [_]f32{1} ** 4 };
}

pub fn zeros() Vector {
    return .{ .data = [_]f32{0} ** 4 };
}

pub fn x() Vector {
    var data = [_]f32{0} ** 4;
    data[0] = 1;
    return .{ .data = data };
}

pub fn y() Vector {
    var data = [_]f32{0} ** 4;
    data[1] = 1;
    return .{ .data = data };
}

pub fn z() Vector {
    var data = [_]f32{0} ** 4;
    data[2] = 1;
    return .{ .data = data };
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
    const x_vec = A.data[1] * B.data[2] - A.data[2] * B.data[1];
    const y_vec = A.data[2] * B.data[0] - A.data[0] * B.data[2];
    const z_vec = A.data[0] * B.data[1] - A.data[1] * B.data[0];
    return .{ .data = [4]f32{ x_vec, y_vec, z_vec, 1 } };
}

pub fn len(A: Vector) f32 {
    return @sqrt(A.dot(A));
}

pub fn norm(A: Vector) Vector {
    return .{
        .data = @as([4]f32, @as(@Vector(4, f32), A.data) / @as(@Vector(4, f32), @splat(A.len()))),
    };
}
