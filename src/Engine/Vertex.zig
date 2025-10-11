const vk = @import("..\\vulkan\\vulkan.zig");
const Vertex = @This();

pos: [2]f32,
color: [3]f32,

pub fn getBindingDescription() void {
    return vk.VertexInputBindingDescription{
        .binding = 0,
        .stride = @sizeOf(Vertex),
        .input_rate = .vertex,
    };
}

pub fn getAttributeDescriptions(attr_descs: *[2]vk.VertexInputAttributeDescription) void {
    attr_descs[0] = .{
        .binding = 0,
        .location = 0,
        .format = .r32g32_sfloat,
        .offset = @offsetOf(Vertex, "pos"),
    };
    attr_descs[1] = .{
        .binding = 0,
        .location = 1,
        .format = .r32g32b32_sfloat,
        .offset = @offsetOf(Vertex, "color"),
    };
}

//
// vec2 positions[3] = vec2[](
//     vec2(0.0, -0.5),
//     vec2(0.5, 0.5),
//     vec2(-0.5, 0.5)
// );
//
// vec3 colors[3] = vec3[](
//     vec3(1.0, 0.0, 0.0),
//     vec3(0.0, 1.0, 0.0),
//     vec3(0.0, 0.0, 1.0)
// );
//
