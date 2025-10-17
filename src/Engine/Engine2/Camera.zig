const Vec3 = @import("../../math/Vector1.zig").Vec3;
const Mat4 = @import("../../math/Matrix1.zig").Mat4;
const assert = @import("std").debug.assert;
const Camera = @This();

view: Mat4 = .identity(),
inv_view: Mat4 = .identity(),
proj: Mat4 = .identity(),

pub fn setOrthographicProjection(
    self: *Camera,
    left: f32,
    right: f32,
    top: f32,
    bot: f32,
    near: f32,
    far: f32,
) void {
    assert(right > left);
    assert(top < bot);
    assert(far > near);

    self.proj = .identity();
    // diagonal
    self.proj.data[0][0] = 2 / (right - left); // right = +x for vulkan
    self.proj.data[1][1] = 2 / (bot - top); // bot = +y for vulkan
    self.proj.data[2][2] = 2 / (far - near); // far = +z for vulkan
    // positional
    self.proj.data[3][0] = -(right + left) / (right - left);
    self.proj.data[3][1] = -(bot + top) / (bot - top);
    self.proj.data[3][2] = -near / (far - near); // near = 0 hence difference
}

pub fn setPerspectiveProjection(
    self: *Camera,
    fovy: f32,
    aspect: f32,
    near: f32,
    far: f32,
) void {
    assert(aspect > 1e-4);
    assert(far > near);

    const tan_half_fovy = @tan(fovy / 2);

    self.proj = .zeros();
    // diagonal
    self.proj.data[0][0] = 1 / (aspect * tan_half_fovy);
    self.proj.data[1][1] = 1 / (tan_half_fovy);
    self.proj.data[2][2] = far / (far - near);
    // edge cases
    self.proj.data[2][3] = 1;
    self.proj.data[3][2] = -(far * near) / (far - near);
}

pub fn setViewDirection(self: *Camera, pos: Vec3, dir: Vec3, up: Vec3) void {
    const w = dir.norm();
    const u = w.cross(up).norm();
    const v = w.cross(u);

    self.view = .identity();
    self.view.data[0][0] = u.x;
    self.view.data[1][0] = u.y;
    self.view.data[2][0] = u.z;

    self.view.data[0][1] = v.x;
    self.view.data[1][1] = v.y;
    self.view.data[2][1] = v.z;

    self.view.data[0][2] = w.x;
    self.view.data[1][2] = w.y;
    self.view.data[2][2] = w.z;

    self.view.data[3][0] = -u.dot(pos);
    self.view.data[3][1] = -v.dot(pos);
    self.view.data[3][2] = -w.dot(pos);

    self.inv_view = .identity();
    self.inv_view.data[0][0] = u.x;
    self.inv_view.data[0][1] = u.y;
    self.inv_view.data[0][2] = u.z;

    self.inv_view.data[1][0] = v.x;
    self.inv_view.data[1][1] = v.x;
    self.inv_view.data[1][2] = v.x;

    self.inv_view.data[2][0] = w.x;
    self.inv_view.data[2][1] = w.y;
    self.inv_view.data[2][2] = w.z;

    self.inv_view.data[3][0] = pos.x;
    self.inv_view.data[3][1] = pos.y;
    self.inv_view.data[3][2] = pos.z;
}

pub fn setViewTarget(self: *Camera, pos: Vec3, target: Vec3, up: Vec3) void {
    self.setViewDirection(pos, target - pos, up);
}

pub fn setViewXYZ(self: *Camera, pos: Vec3, rot: Vec3) void {
    const c3 = @cos(rot.z);
    const s3 = @sin(rot.z);

    const c2 = @cos(rot.x);
    const s2 = @sin(rot.x);

    const c1 = @cos(rot.y);
    const s1 = @sin(rot.y);

    const u: Vec3 = .{ .data = [3]f32{ c1 * c3 + s1 * s2 * s3, c2 * s3, c1 * s2 * s3 - c3 * s1 } };
    const v: Vec3 = .{ .data = [3]f32{ c3 * s1 * s2 - c1 * s3, c2 * c3, c1 * c3 * s2 + s1 * s3 } };
    const w: Vec3 = .{ .data = [3]f32{ c2 * s1, -s2, c1 * c2 } };

    self.view = .identity();
    // col 0
    self.view.data[0][0] = u.data[0];
    self.view.data[1][0] = u.data[1];
    self.view.data[2][0] = u.data[2];
    // col 1
    self.view.data[0][1] = v.data[0];
    self.view.data[1][1] = v.data[1];
    self.view.data[2][1] = v.data[2];
    // col 2
    self.view.data[0][2] = w.data[0];
    self.view.data[1][2] = w.data[1];
    self.view.data[2][2] = w.data[2];
    // row 3
    self.view.data[3][0] = -u.dot(pos);
    self.view.data[3][1] = -v.dot(pos);
    self.view.data[3][2] = -w.dot(pos);

    self.inv_view = .identity();

    self.inv_view.data[0][0] = u.data[0];
    self.inv_view.data[0][1] = u.data[1];
    self.inv_view.data[0][2] = u.data[2];

    self.inv_view.data[1][0] = v.data[0];
    self.inv_view.data[1][1] = v.data[1];
    self.inv_view.data[1][2] = v.data[2];

    self.inv_view.data[2][0] = w.data[0];
    self.inv_view.data[2][1] = w.data[1];
    self.inv_view.data[2][2] = w.data[2];

    self.inv_view.data[3][0] = pos.data[0];
    self.inv_view.data[3][1] = pos.data[1];
    self.inv_view.data[3][2] = pos.data[2];
}

pub fn getPos(self: *const Camera) Vec3 {
    return .{
        .data = [3]f32{
            self.inv_view.data[3][0],
            self.inv_view.data[3][1],
            self.inv_view.data[3][2],
        },
    };
}
