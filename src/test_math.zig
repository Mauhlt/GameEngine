// Two Basic Matrix Multiplication Algorithms
fn transposeSimdMatrixMultiply(C: anytype, A: anytype, B: anytype) !void {
    var tmp: @TypeOf(A) = undefined;
    for (0..B.len) |i| {
        for (0..B.len) |j| {
            tmp[i][j] = B[j][i];
        }
    }
    const vec_len = 32;
    for (0..B.len) |i| {
        for (0..B.len) |j| {
            var k: usize = 0;
            while (k + vec_len <= B.len) : (k += vec_len) {
                const u: @Vector(vec_len, f64) = A[i][k..][0..vec_len].*;
                const v: @Vector(vec_len, f64) = tmp[j][k..][0..vec_len].*;
                C[i][j] += @reduce(.Add, u * v);
            }
            while (k < B.len) : (k += 1) {
                C[i][j] += A[i][k] * tmp[j][k];
            }
        }
    }
}

fn unrollSimdMatrixMultiply(C: anytype, A: anytype, B: anytype) void {
    const N = B.len;
    const vec_len = 32;
    for (C, A) |*C_row, *A_row| {
        var j: u32 = 0;
        while (j <= N - vec_len) : (j += vec_len) {
            for (0..N) |k| {
                const u: @Vector(vec_len, f64) = B[k][j..][0..vec_len].*;
                const y: @Vector(vec_len, f64) = C_row.*[j..][0..vec_len].*;
                const w: @Vector(vec_len, f64) = @splat(A_row.*[k]);
                const slice: [vec_len]f64 = (u * w) + y;
                @memcpy(C_row.*[j .. j + vec_len], &slice);
            }
        }
        while (j < N) : (j += 1) {
            for (0..N) |k| {
                C_row.*[j] += A_row.*[k] * B[k][j];
            }
        }
    }
}
