const Vec3 = @import("../../math/Vector1.zig").Vec3;
const Mat3 = @import("../../math/Matrix1.zig").Mat3;
const Mat4 = @import("../../math/Matrix1.zig").Mat4;
const Transform = @This();

translation: Vec3,
scale: Vec3,
rotation: Vec3,

fn mat4(self: *Transform) Mat4 {
    const c1 = @cos(self.rotation.x);
    const c2 = @cos(self.rotation.y);
    const c3 = @cos(self.rotation.z);

    const s1 = @sin(self.rotation.x);
    const s2 = @sin(self.rotation.y);
    const s3 = @sin(self.rotation.z);

    return .{
        .data = [4][4]f32{
            [4]f32{ self.scale.x * (c1 * c3 + s1 * s2 * s3), self.scale.x * (c2 * s3), self.scale.x * (c1 * s2 * s3 - c3 * s1), 0 },
            [4]f32{ self.scale.y * (c3 * s1 * s2 - c1 * s3), self.scale.y * (c2 * c3), self.scale.y * (c1 * c3 * s2 + s1 * s3), 0 },
            [4]f32{ self.scale.z * (c2 * s1), self.scale.y * (c2 * c3), self.scale.y * (c1 * c3 * s2 + s1 * s3), 0 },
            [4]f32{ self.translation.x, self.translation.y, self.translation.z, 0 },
        },
    };
}

fn norm(self: *Transform) Mat3 {
    const c1 = @cos(self.rotation.x);
    const c2 = @cos(self.rotation.y);
    const c3 = @cos(self.rotation.z);

    const s1 = @sin(self.rotation.x);
    const s2 = @sin(self.rotation.y);
    const s3 = @sin(self.rotation.z);

    const inv_scale: Vec3 = .inv();
}
