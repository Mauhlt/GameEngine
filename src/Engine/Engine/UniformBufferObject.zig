const Matrix = @import("../math/Matrix.zig");
const UniformBufferObject = @This();

model: Matrix,
view: Matrix,
proj: Matrix,
