const vk = @import("..\\vulkan\\vulkan.zig");
const Vertex = @This();

pos: [2]f32,
color: [3]f32,

pub fn getBindingDescription(binds: *[1]vk.VertexInputBindingDescription) void {
    binds[0] = vk.VertexInputBindingDescription{
        .binding = 0,
        .stride = @sizeOf(Vertex),
        .input_rate = .vertex,
    };
}

pub fn getAttributeDescriptions(attrs: *[2]vk.VertexInputAttributeDescription) void {
    attrs[0] = vk.VertexInputAttributeDescription{
        .binding = 0,
        .location = 0,
        .format = .r32g32_sfloat,
        .offset = @offsetOf(Vertex, "pos"),
    };
    attrs[1] = vk.VertexInputAttributeDescription{
        .binding = 0,
        .location = 1,
        .format = .r32g32b32_sfloat,
        .offset = @offsetOf(Vertex, "color"),
    };
}
