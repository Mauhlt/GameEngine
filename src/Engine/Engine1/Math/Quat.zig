const std = @import("std");
const Vec = @import("Vec.zig");
const Mat = @import("Mat.zig");

fn Quaternion(comptime T: type) type {
    switch (@typeInfo(T)) {
        .int, .float => {},
        else => @compileError("T must be int or float.\n"),
    }

    const V3 = Vec.Vector(T, 3);
    const V4 = Vec.Vector(T, 4);
    const M3 = Mat.Matrix(T, 3);
    const M4 = Mat.Matrix(T, 4);

    return struct {
        // default is identity matrix
        w: T = 1,
        x: T = 0,
        y: T = 0,
        z: T = 0,

        pub fn pointFromQuat(self: @This()) V3 {
            return .{ .data = .{ self.x, self.y, self.z } };
        }

        pub fn quatFromPoint(self: V3) @This() {
            return .{ .w = 0, .x = self.data[0], .y = self.data[1], .z = self.data[2] };
        }

        pub fn v4FromQuat(self: @This()) V4 {
            // return @bitCast(self);
            return .{ .data = .{ self.w, self.x, self.y, self.z } };
        }

        pub fn quatFromV4(self: V4) @This() {
            // return @bitCast(self);
            return .{ .w = self.data[0], .x = self.data[1], .y = self.data[2], .z = self.data[3] };
        }

        pub fn quatFromAxisAngle(axis: V3, angle: T) @This() {
            if (angle == 0) return quatFromPoint(axis);
            // half angle
            const half = angle * 0.5;
            // sine
            const s = switch (@typeInfo(T)) {
                .int => std.math.sin(half),
                .float => @sin(half),
                else => unreachable,
            };
            // cos
            const c = switch (@typeInfo(T)) {
                .int => std.math.cos(half),
                .float => @cos(half),
                else => unreachable,
            };
            // sin
            const new = axis.mulS(s);
            // combine
            return .{ .w = c, .x = new.data[0], .y = new.data[1], .z = new.data[2] };
        }

        pub fn len(self: @This()) T {
            const sqrd_sum = self.v4FromQuat().len();
            return switch (@typeInfo(T)) {
                .int => std.math.sqrt(sqrd_sum),
                .float => @sqrt(sqrd_sum),
                else => unreachable,
            };
        }

        pub fn norm(self: @This()) @This() {
            const curr_len = self.len();
            if (curr_len == 0) return self;
            return quatFromV4(self.v4FromQuat().divS(curr_len));
        }

        pub fn axisFromQuat(self: @This()) V3 {
            // part of axis angle
            // half angle from cosine
            const half_theta = std.math.acos(self.data[0]);
            if (half_theta == 0) return self.pointFromQuat();
            // sine = x, y, z
            const s = switch (@typeInfo(T)) {
                .int => std.math.sin(half_theta),
                .float => @sin(half_theta),
                else => unreachable,
            };
            // remove sin component
            return self.pointFromQuat().divS(s);
        }

        pub fn angleFromQuat(self: @This()) T {
            // part of axis angle
            const angle = 2 * std.math.acos(self.data[0]);
            return angle;
        }

        pub fn mag(self: @This()) T {
            return self.v4FromQuat().len();
        }

        pub fn m3FromQuat(self: @This()) M3 {
            const v = self.pointFromQuat();
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

        pub fn mul(r: @This(), s: @This()) @This() {
            // associative but not commutative
            // const t0 = r.data[0] * s.data[0] - r.data[1] * s.data[1] - r.data[2] * s.data[2] - r.data[3] * s.data[3];
            // const t1 = r.data[0] * s.data[1] + r.data[1] * s.data[0] - r.data[2] * s.data[3] + r.data[3] * s.data[2];
            // const t2 = r.data[0] * s.data[2] + r.data[1] * s.data[3] + r.data[2] * s.data[0] - r.data[3] * s.data[1];
            // const t3 = r.data[0] * s.data[3] - r.data[1] * s.data[2] + r.data[2] * s.data[1] + r.data[3] * s.data[0];
            const c0 = @as(@Vector(4, T), @splat(r.data[0])) * @as(@Vector(4, T), s.data);
            const c1 = @as(@Vector(4, T), @splat(r.data[1])) * @as(@Vector(4, T), .{ s.data[1], s.data[0], s.data[3], s.data[2] });
            const c2 = @as(@Vector(4, T), @splat(r.data[2])) * @as(@Vector(4, T), .{ s.data[2], s.data[3], s.data[0], s.data[1] });
            const c3 = @as(@Vector(4, T), @splat(r.data[3])) * @as(@Vector(4, T), .{ s.data[3], s.data[2], s.data[1], s.data[0] });
            const t0 = c0[0] - c1[0] - c2[0] - c3[0];
            const t1 = c0[1] + c1[1] - c2[1] + c3[1];
            const t2 = c0[2] + c1[2] + c2[2] - c3[2];
            const t3 = c0[3] - c1[3] + c2[3] + c3[3];
            return .{ .data = .{ t0, t1, t2, t3 } };
        }

        pub fn inv(a: @This()) @This() {
            return .{ .data = .{ a.data[0], -a.data[1], -a.data[2], -a.data[3] } };
        }

        pub fn rot(p: V3, q_r: @This()) V3 {
            // p = point to be rotated
            // q_r = rotation quaternion
            // q' = inv of q
            // mag of q_r must be 1
            // p' = coordinates of rotated point
            // TODO: abstract this for different forms of data:
            // 1. 2 points - how to rotate to each other?
            // 2. 1 axis + 1 angle
            // 3. 1 point + 1 axis + angle
            const q_prime = q_r.inv();
            const p_prime = q_prime.mul(p).mul(q_r);
            return p_prime.pointFromQuat();
        }

        pub fn slerp(a: @This(), b: @This(), t: T) @This() {
            // t must be a number between 0 and 1
            // needs more work
            var cos_theta = v4FromQuat(a).mulV(v4FromQuat(b)).sum();

            var b2 = b;
            if (cos_theta < 0) {
                cos_theta = -cos_theta;
                b2 = .{ .w = -b.w, .x = -b.x, .y = -b.y, .z = -b.z };
            }

            // if close, use normal lerp
            if (cos_theta > 0.9995) {
                return quatFromV4((a.v4FromQuat() + @as(@Vector(4, T), @splat(t)) * (b2.v4FromQuat() - a.v4FromQuat())));
            }

            const theta = std.math.acos(cos_theta);
            const sin_theta = @sin(theta);

            const w1 = @sin(1 - t) * theta / sin_theta;
            const w2 = @sin(t * theta) / sin_theta;
            const output = quatFromV4(v4FromQuat(a) * @as(@Vector(4, T), w1) + v4FromQuat(b) * @as(@Vector(4, T), w2));
            return output;
        }
    };
}

// example:
// const q = quatFromAxisAngle(.{0, 1, 0}, std.math.degToRad(45));
// const rot = quatToMat4(q);
