const std = @import("std");
const Vertex = @import("Vertex.zig");
pub const G: f64 = 6.674 * 10 ^ -11; // m3 / kgs2
pub const c: f64 = 299_792_458; // m/s

pub const Position = struct {
    x: f32 = 0,
    y: f32 = 0,
};
pub const Direction = Position;

pub fn createObject(comptime N1: usize, comptime N2: usize) type {
    return struct {
        vertices: [N1]Vertex,
        indices: [N2]u16,
    };
}

pub const BHO = createObject(101, 150);
pub const RO = createObject(4, 6);

pub const BlackHole = struct {
    const Self = @This();

    pos: Position = .{ .x = 0, .y = 0 },
    mass: f32 = 0,
    r_s: f32 = 1, // event horizon

    pub fn init(pos: Position, mass: f32) Self {
        return .{
            .pos = pos,
            .mass = mass,
            .r_s = schwarzchildRadius(mass),
        };
    }

    pub fn draw(self: *const Self) BHO {
        // need ability to hook up into engine to draw it
        var vertices: [101]Vertex = undefined;
        // create vertices of a triangle here
        vertices[0] = .{ .pos = [_]f32{ self.pos.x, self.pos.y }, .color = [3]f32{ 0, 0, 1 } };
        for (0..100) |i| {
            const angle: f32 = @as(f32, 2.0) * std.math.PI * @as(f32, @floatFromInt(i)) / 100;
            const x = @cos(angle) * self.r + self.pos.x;
            const y = @sin(angle) * self.r + self.pos.y;
            vertices[i + 1] = .{ .pos = [_]f32{ x, y }, .color = .{ 0, 0, 1 } };
        }
        // create indices to connect vertices into a circle
        var indices: [50][3]u16 = undefined;
        for (0..50) |i| indices[i] = .{ vertices[0], vertices[i * 2 + 1], vertices[i * 2 + 2] };
        // return vertices + indices
        return .{
            .vertices = vertices,
            .indices = @bitCast(indices),
        };
    }
};

pub fn schwarzchildRadius(mass: f64) f64 {
    return (2.0 * G * mass) / (c * c);
}

// need a vector of rays
pub const Ray = struct {
    // pos
    pos: Position,
    // dir
    dir: Direction,
    // pos
    r: f32 = 0,
    phi: f32 = 0,
    // vel
    dr: f32 = 0,
    dphi: f32 = 0,
    // accel
    d2r: f32 = 0,
    d2phi: f32 = 0,
    // prev values
    trail: [16]Position = [_]Position{.{ .x = 0, .y = 0 }} ** 16,

    pub fn init(x: f64, y: f64) @This() {
        var self: @This() = .{};
        self.x = x;
        self.y = y;
        self.r = @sqrt(x * x + y * y);
        self.phi = std.math.atan2(y, x);
    }

    pub fn draw(self: *const @This()) void {
        gl.enable(.blend);
        gl.blend_func(.src_alpha, .one_minus_src_alpha);
        gl.line_width(1.0);

        const n = self.trail.len;
        if (N < 2) return;

        gl.begin(gl.line_strip);
        for (0..N) |i| {
            const alpha: f32 = @as(f32, @floatFromInt(i)) / @as(f32, @floatFromInt(N - 1));
            gl_color_4f(1, 1, 1, std.math.max());
        }

        gl.vertex2f(x, y);
        gl.end();

        // treat ray as tiny square
        const vertices = [4]Position{
            .{ .x = -0.5, .y = -0.5 },
            .{ .x = 0.5, .y = -0.5 },
            .{ .x = -0.5, .y = 0.5 },
            .{ .x = 0.5, .y = 0.5 },
        };
        const indices = [6]u16{ 0, 1, 2, 2, 3, 0 };
    }

    pub fn step(self: *@This(), r_s: f32, dL: f32) Position {
        _ = dL;
        if (self.pc.r < r_s) return;

        self.basic();
        // self.eulersMethod(r_s, dL);

        // append to trail
        for (1..16) |i| self.trail[i] = self.trail[i - 1];
        self.trail[0] = .{ .x = self.x, .y = self.y };
    }

    fn basic(self: *@This()) void {
        self.x += self.dir.x * c;
        self.y += self.dir.y * c;
    }

    fn eulersMethod(self: *@This(), r_s: f32, dL: f32) void {
        self.dpc.r += self.d2pc.r * dL;
        self.dpc.phi += self.d2pc.phi * dL;

        self.pc.r += self.dpc.dr * dL;
        self.pc.phi += self.dpc.dphi * dL;

        self.pos.x = @cos(self.pc.phi) * self.pc.r;
        self.pos.y = @sin(self.pc.phi) * self.pc.r;
    }

    fn addState(a: *[4]f32, b: *[4]f32, factor: f32, out: *[4]f32) void {}

    fn rk4(self: *@This(), r_s: f32, dL: f32) void {
        // 4 steps to make a better estimate of current step
        var y0: [4]f32 = .{ self.pc.r, self.pc.phi, self.dpc.dr, self.dpc.dphi };
        var k1: [4]f32 = undefined;
        var k2: [4]f32 = undefined;
        var k3: [4]f32 = undefined;
        var k4: [4]f32 = undefined;
        var temp: [4]f32 = undefined;

        self.geodesic(k1, r_s);
        addState(&y0, &k1, dL / 2.0, &temp);
        var r2: Ray = self;
        r2.pc.r = temp[0];
        r2.pc.phi = temp[1];
        r2.dpc.dr = temp[2];
        r2.dpc.dphi = temp[3];
        r2.geodesic(k2, r_s);

        addState(y0, k2, dL / 2.0, temp);
        var r3 = ray;

        addState(y0, k3, dL / 2.0, temp);
        // need to complete this
    }
};

// Stores all arrays
// pub const Rays = try std.ArrayList(Ray).initCapacity(std.heap.page_allocator, 16); // need this
// for (rays) |ray| {
//  geodesic(ray, r_s);
//  ray.draw();
//  ray.step(r_s, 1e-1);
// }

pub fn geodesic(ray: Ray, r_s: f32) void {
    const r, var phi, var dr, var dphi = ray;
    dr += r * dphi * dphi - (c * c * r_s) / (2.0 * r * r); // how fast ray moves closer to black hole
    dphi = -2.0 * dr * dphi / r; // how fast the angle changes relative to black hole
}

// Schwarschild Radius = remove right side of the equation
