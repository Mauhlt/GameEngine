const vk = @import("../../vulkan/vulkan.zig");
const Vertex = @This();

pos: [3]f32,
color: [3]f32,
tex_coord: [2]f32,

pub fn getBindingDescription(bind_desc: *[1]vk.VertexInputBindingDescription) void {
    bind_desc[0].binding = 0;
    bind_desc[0].stride = @sizeOf(Vertex);
    bind_desc[0].input_rate = .vertex;
}

pub fn getAttributeDescriptions(attr_desc: *[3]vk.VertexInputAttributeDescription) void {
    attr_desc[0].binding = 0;
    attr_desc[0].location = 0;
    attr_desc[0].format = .r32g32b32_sfloat;
    attr_desc[0].offset = @offsetOf(Vertex, "pos");

    attr_desc[1].binding = 0;
    attr_desc[1].location = 1;
    attr_desc[1].format = .r32g32b32_sfloat;
    attr_desc[1].offset = @offsetOf(Vertex, "color");

    attr_desc[2].binding = 0;
    attr_desc[2].location = 2;
    attr_desc[2].format = .r32g32_sfloat;
    attr_desc[2].offset = @offsetOf(Vertex, "tex_coord");
}
