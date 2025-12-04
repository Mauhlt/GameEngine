const std = @import("std");

// need to implement: rotate, lookAt, perspective, radians, and complete ubo

pub fn rotateRow(angle: f32, axis: [3]f32) [4][4]f32 {
    // row order
    const x = axis[0];
    const y = axis[1];
    const z = axis[2];

    const len = @sqrt(x * x + y * y + z * z);
    const nx = x / len;
    const ny = y / len;
    const nz = z / len;

    const c = @cos(angle);
    const s = @sin(angle);
    const ic = 1.0 - c;

    return .{
        .{ c + nx * nx * ic, nx * ny * ic - nz * s, nx * nz * ic + ny * s, 0 },
        .{ ny * nx * ic + nz * s, c + ny * ny * ic, ny * nz * ic - nx * s, 0 },
        .{ nz * nx * ic - ny * s, nz * ny * ic + nx * s, c + nz * nz * ic, 0 },
        .{ 0, 0, 0, 1 },
    };
}

pub fn rotateCol(angle: f32, axis: [3]f32) [4][4]f32 {
    // col order
    const x = axis[0];
    const y = axis[1];
    const z = axis[2];

    const len = @sqrt(x * x + y * y + z * z);
    const nx = x / len;
    const ny = y / len;
    const nz = z / len;

    const c = @cos(angle);
    const s = @sin(angle);
    const ic = 1.0 - c;

    return .{
        .{ c + nx * nx * ic, ny * nx * ic + nz * s, nz * nx * ic - ny * s, 0 },
        .{ nx * ny * ic - nz * s, c + ny * ny * ic, nz * ny * ic + nx * s, 0 },
        .{ nx * nz * ic + ny * s, ny * nz * ic - nx * s, c + nz * nz * ic, 0 },
        .{ 0, 0, 0, 1 },
    };
}

pub fn rotate3(m: [4][4]f32, angle: f32, axis: [3]f32) [4][4]f32 {
    const r = rotate(angle, axis);
    return matMul4(m, r);
}

pub fn matMul4Row(a: [4][4]f32, b: [4][4]f32) [4][4]f32 {
    // row
    var out: [4][4]f32 = undefined;
    inline for (0..4) |i| {
        inline for (0..4) |j| {
            var sum: f32 = 0;
            inline for (0..4) |k| {
                sum += a[i][k] * b[k][j];
            }
            out[i][j] = sum;
        }
    }
    return out;
}

pub fn matMul4Col(a: [4][4]f32, b: [4][4]f32) [4][4]f32 {
    var out: [4][4]f32 = undefined;
    inline for (0..4) |i| {
        inline for (0..4) |j| {
            var sum: f32 = 0;
            inline for (0..4) |k| {
                sum += a[k][i] * b[j][i];
            }
            out[j][i] = sum;
        }
    }
    return out;
}

pub fn matMul4RowSIMD(a: [4][4]f32, b: [4][4]f32) [4][4]f32 {
    const V4 = @Vector(4, f32);

    const ar0: V4 = a[0];
    const ar1: V4 = a[1];
    const ar2: V4 = a[2];
    const ar3: V4 = a[3];

    const bc0: V4 = .{ b[0][0], b[1][0], b[2][0], b[3][0] };
    const bc1: V4 = .{ b[0][1], b[1][1], b[2][1], b[3][1] };
    const bc2: V4 = .{ b[0][2], b[1][2], b[2][2], b[3][2] };
    const bc3: V4 = .{ b[0][3], b[1][3], b[2][3], b[3][3] };
}
