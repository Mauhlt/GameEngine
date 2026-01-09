const std = @import("std");
const Vec = @import("Vec.zig").Vector;
const Mat = @import("Mat.zig").Matrix;
// Use init quaternions
// Goal: rotate 1 point to another point

pub fn Quaternion(comptime T: type) type {
    switch (@typeInfo(T)) {
        .float => {},
        else => @compileError("T must be a float.\n"),
    }

    // Types
    const V3 = Vec(T, 3);
    const V4 = Vec(T, 4);
    const M3 = Mat(T, 3);
    const M4 = Mat(T, 4);

    return struct {
        // default is identity matrix
        w: T = 1,
        x: T = 0,
        y: T = 0,
        z: T = 0,

        pub fn v3FromQuat(q: @This()) V3 {
            // also point from quat
            return .{ .data = .{ q.x, q.y, q.z } };
        }

        pub fn v4FromQuat(q: @This()) V4 {
            // return @bitCast(self);
            return .{ .data = @Vector(4, T){ q.w, q.x, q.y, q.z } };
        }

        pub fn quatFromV3(v: V3) @This() {
            // const n = v.norm();
            return .{ .w = 0, .x = v.data[0], .y = v.data[1], .z = v.data[2] };
        }

        pub fn quatFromV4(v: V4) @This() {
            return .{ .w = v.data[3], .x = v.data[0], .y = v.data[1], .z = v.data[2] };
        }

        pub fn quatFromAxisAngle(axis: V3, angle: T) @This() {
            // if (angle == 0) return axis.quatFromVec();
            // half angle
            const half = angle * 0.5;
            // sine
            const s = @sin(half);
            // cos
            const c = @cos(half);
            // sin
            const new = axis.mulS(s);
            // combine
            return .{ .w = c, .x = new.data[0], .y = new.data[1], .z = new.data[2] };
        }

        pub fn axisFromQuat(self: @This()) V3 {
            // part of axis angle
            // half angle from cosine
            const half_theta = std.math.acos(self.w);
            if (half_theta == 0) return self.v3FromQuat();
            // sine = x, y, z
            const s = @sin(half_theta);
            // remove sin component
            return self.v3FromQuat().divS(s);
        }

        pub fn angleFromQuat(self: @This()) T {
            // part of axis angle
            return 2 * std.math.acos(self.w);
        }

        pub fn len(self: @This()) T {
            return @sqrt(self.v4FromQuat().len());
        }

        pub fn norm(self: @This()) @This() {
            const curr_len = self.len();
            if (curr_len == 0) return self;
            return quatFromV4(self.v4FromQuat().norm());
        }

        pub fn mag(self: @This()) T {
            return self.v4FromQuat().len();
        }

        pub fn m3FromQuat(self: @This()) M3 {
            const v = self.v3FromQuat();
            const v2 = v.addV(v);

            const xyz = v.mulV(v2);
            const xx = xyz.data[0];
            const yy = xyz.data[1];
            const zz = xyz.data[2];

            const xy = self.x * v2.data[1];
            const xz = self.x * v2.data[2];
            const yz = self.y * v2.data[2];

            const w = V3.init(self.w).mulV(v2);
            const wx = w.data[0];
            const wy = w.data[1];
            const wz = w.data[2];

            return .{
                .data = .{
                    .{ 1 - (yy + zz), xy + wz, xz - wy },
                    .{ xy - wz, 1 - (xx + zz), yz + wx },
                    .{ xz + wy, yz - wx, 1 - (xx + yy) },
                },
            };
        }

        pub fn m4FromQuat(self: @This()) M4 {
            const m3 = self.m3FromQuat();
            return .{
                .data = .{
                    .{ m3.data[0][0..3].*, 0 },
                    .{ m3.data[1][0..3].*, 0 },
                    .{ m3.data[2][0..3].*, 0 },
                    .{ 0, 0, 0, 1 },
                },
            };
        }

        pub fn quatFromM3(m: M3) @This() {
            // normally sqrt sum, but unit quaternion
            const trace = m.data[0][0] + m.data[1][1] + m.data[2][2];

            if (trace > 0) {
                const t = @sqrt(trace + 1.0) * 2.0;
                return .{
                    .w = 0.25 * t,
                    .x = (m.data[2][1] - m.data[1][2]) / t,
                    .y = (m.data[0][2] - m.data[2][0]) / t,
                    .z = (m.data[1][0] - m.data[0][1]) / t,
                };
            }

            if (m.data[0][0] > m.data[1][1] and m.data[0][0] > m.data[2][2]) {
                const t = @sqrt(1 + m.data[0][0] - m.data[1][1] - m.data[2][2]) * 2.0;
                return .{
                    .w = (m.data[2][1] - m.data[1][2]) / t,
                    .x = 0.25 * t,
                    .y = (m.data[0][1] + m.data[1][0]) / t,
                    .z = (m.data[0][2] + m.data[2][0]),
                };
            }

            if (m.data[1][1] > m.data[2][2]) {
                const t = @sqrt(1.0 + m.data[1][1] - m.data[0][0] - m.data[2][2]) * 2.0;
                return .{
                    .w = (m.data[0][2] - m.data[2][0]) / t,
                    .x = (m.data[0][1] + m.data[1][0]) / t,
                    .y = 0.25 * t,
                    .z = (m.data[1][2] + m.data[2][1]) / t,
                };
            }

            const t = @sqrt(1.0 + m.data[0][0] - m.data[1][1] - m.data[2][2]) * 2.0;
            return .{
                .w = (m.data[1][0] - m.data[0][1]) / t,
                .x = (m.data[0][2] + m.data[2][0]) / t,
                .y = (m.data[1][2] + m.data[2][1]) / t,
                .z = 0.25 * t,
            };
        }

        pub fn quatFromM4(m: M4) @This() {
            return quatFromM3(.{ .data = .{
                .{m.data[0][0..3].*},
                .{m.data[1][0..3].*},
                .{m.data[2][0..3].*},
            } });
        }

        pub fn add(p: @This(), q: @TypeOf(p)) @TypeOf(p) {
            return quatFromV4(p.v4FromQuat().addV(q.v4FromQuat()));
        }

        pub fn mul(p: @This(), q: @TypeOf(p)) @TypeOf(p) {
            const p3 = p.v3FromQuat();
            const q3 = q.v3FromQuat();
            const output = V3.init((p.w * q.w) - p3.dot(q3)).addV(q3.mulS(p.w)).addV(p3.mulS(q.w)).addV(p3.cross(q3));
            return quatFromV3(output);
        }

        // pub fn mul(r: @This(), s: @TypeOf(r)) @TypeOf(r) {
        //     // associative but not commutative
        //     // const t0 = r.data[0] * s.data[0] - r.data[1] * s.data[1] - r.data[2] * s.data[2] - r.data[3] * s.data[3];
        //     // const t1 = r.data[0] * s.data[1] + r.data[1] * s.data[0] - r.data[2] * s.data[3] + r.data[3] * s.data[2];
        //     // const t2 = r.data[0] * s.data[2] + r.data[1] * s.data[3] + r.data[2] * s.data[0] - r.data[3] * s.data[1];
        //     // const t3 = r.data[0] * s.data[3] - r.data[1] * s.data[2] + r.data[2] * s.data[1] + r.data[3] * s.data[0];
        //
        //     const c0: [4]T = s.v4FromQuat().mulS(r.w).data;
        //     const sV = @Vector(4, T){ s.w, s.x, s.y, s.z };
        //     const c1: [4]T = @bitCast(@as(@Vector(4, T), @splat(r.x)) * sV);
        //     const c2: [4]T = @bitCast(@as(@Vector(4, T), @splat(r.y)) * sV);
        //     const c3: [4]T = @bitCast(@as(@Vector(4, T), @splat(r.z)) * sV);
        //
        //     const t0 = c0[0] - c1[0] - c2[0] - c3[0];
        //     const t1 = c0[1] + c1[1] - c2[1] + c3[1];
        //     const t2 = c0[2] + c1[2] + c2[2] - c3[2];
        //     const t3 = c0[3] - c1[3] + c2[3] + c3[3];
        //
        //     return .{ .w = t0, .x = t1, .y = t2, .z = t3 };
        // }

        pub fn inv(a: @This()) @This() {
            return .{ .w = a.w, .x = -a.x, .y = -a.y, .z = -a.z };
        }

        pub fn conj(a: @This()) @This() {
            return a.inv();
        }

        pub fn rotate(q: @This(), v: V3) V3 {
            // no intermediate quats = optimized closed form
            const qv = v3FromQuat(q);
            // t = 2 * cross(qv, v);
            const t = qv.cross(v).mulS(2.0);
            // v' = v + q.w * t + cross(qv, t)
            return v.addV(t.mulS(q.w).addV(qv.cross(t)));
        }

        pub fn rotate2(q: @This(), v: V3) @This() {
            // no intermediate quats = optimized closed form
            const qv = v3FromQuat(q);
            // t = 2 * cross(qv, v);
            const t = qv.cross(v).mulS(2.0);
            // v' = v + q.w * t + cross(qv, t)
            const result = v.addV(t.mulS(q.w).addV(qv.cross(t)));
            return .{ .w = q.w, .x = result.data[0], .y = result.data[1], .z = result.data[2] };
        }

        pub fn lerp(a: @This(), b: @This(), t: T) @This() {
            return a.v4FromQuat().lerp(b.v4FromQuat(), t);
        }

        pub fn slerp(a: @This(), b: @This(), t: T) @This() {
            // t must be a number between 0 and 1
            // needs more work
            var cos_theta = a.v4FromQuat().dot(b.v4FromQuat());

            var b2 = b;
            if (cos_theta < 0) {
                cos_theta = -cos_theta;
                b2 = .{ .w = -b.w, .x = -b.x, .y = -b.y, .z = -b.z };
            }

            // if close, use normal lerp
            if (cos_theta > 0.995) return a.lerp(b2, t); // limit 0.9995

            const theta = std.math.acos(cos_theta);
            const sin_theta = @sin(theta);

            const w1 = @sin(1 - t) * theta / sin_theta;
            const w2 = @sin(t * theta) / sin_theta;
            return a.v4FromQuat().mulS(w1).addV(b.v4FromQuat().mulS(w2)); // .quatFromVec();
        }

        // pub fn lookAt(src: @This(), dst: @TypeOf(src)) @TypeOf(src) {
        //     const f = dst.v3FromQuat().subV(src.v3FromQuat());
        // }
    };
}

// example:
// const q = quatFromAxisAngle(.{0, 1, 0}, std.math.degToRad(45));
// const rot = quatToMat4(q);

test "Quaternions" {
    const T: type = f32;
    const V3 = Vec(T, 3);
    // const V4 = Vec(T, 4);
    const Q4 = Quaternion(T);

    // check types
    const q1: Q4 = .{};
    const v3_1 = q1.v3FromQuat();
    try std.testing.expectEqualStrings(@typeName(@TypeOf(v3_1)), "Engine.Engine1.Math.Vec.Vector(f32,3)");

    const v4_1 = q1.v4FromQuat();
    try std.testing.expectEqualStrings(@typeName(@TypeOf(v4_1)), "Engine.Engine1.Math.Vec.Vector(f32,4)");

    const angle: T = std.math.degreesToRadians(45);
    const axis = V3{ .data = .{ 0, 1, 0 } };
    const q2 = Q4.quatFromAxisAngle(axis, angle);
    try std.testing.expectEqualStrings(@typeName(@TypeOf(q2)), "Engine.Engine1.Math.Quat.Quaternion(f32)");

    // check axis-angle
    const q3 = Q4.quatFromAxisAngle(axis, angle);
    try std.testing.expectApproxEqAbs(q3.w, 0.9238795, 1e-4);
    try std.testing.expectApproxEqAbs(q3.x, 0, 1e-4);
    try std.testing.expectApproxEqAbs(q3.y, 0.38268346, 1e-4);
    try std.testing.expectApproxEqAbs(q3.z, 0, 1e-4);
    const q3_len = q3.len();
    try std.testing.expectApproxEqAbs(1, q3_len, 1e-4);

    const axis1 = q3.axisFromQuat();
    try std.testing.expectApproxEqAbs(axis.data[0], axis1.data[0], 1e-4);
    try std.testing.expectApproxEqAbs(axis.data[1], axis1.data[1], 1e-4);
    try std.testing.expectApproxEqAbs(axis.data[2], axis1.data[2], 1e-4);
    const angle1 = q3.angleFromQuat();
    try std.testing.expectApproxEqAbs(angle, angle1, 1e-4);

    // norm
    var q4: Q4 = .{ .w = 2, .x = 2, .y = 2, .z = 2 };
    q4 = q4.norm();
    try std.testing.expectApproxEqAbs(q4.w, 0.5, 1e-4);
    try std.testing.expectApproxEqAbs(q4.x, 0.5, 1e-4);
    try std.testing.expectApproxEqAbs(q4.y, 0.5, 1e-4);
    try std.testing.expectApproxEqAbs(q4.z, 0.5, 1e-4);

    // mag + len
    const len1 = q4.len();
    const len2 = q4.mag();
    try std.testing.expectEqual(1, len1);
    try std.testing.expectEqual(1, len2);
    try std.testing.expectEqual(1, q3_len);

    // rotation
    const q = Q4.quatFromAxisAngle(.{ .data = .{ 0, 1, 0 } }, std.math.degreesToRadians(90));
    const v: V3 = .{ .data = .{ 1, 0, 0 } };
    const rot_vec = Q4.rotate(q, v);
    try std.testing.expectApproxEqAbs(0, rot_vec.data[0], 1e-4);
    try std.testing.expectApproxEqAbs(0, rot_vec.data[1], 1e-4);
    try std.testing.expectApproxEqAbs(-1, rot_vec.data[2], 1e-4);
    // success
}
