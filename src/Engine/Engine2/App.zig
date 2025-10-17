const Device = @import("Device.zig");
const Window = @import("WindowHandle.zig");
const Renderer = @import("Renderer.zig");
const GameObject = @import("GameObject.zig");
const App = @This();

window: Window,
device: Device,
renderer: Renderer,
game_objects: [1024]GameObject,

pub fn init() App {}
pub fn deinit(self: *App) void {
    _ = self;
}

fn loadGameObjects() void {}
