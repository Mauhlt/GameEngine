const vk = @import("../../vulkan/vulkan.zig");
const Vertex = @This();

pos: [2]f32,

pub fn getBindingDescriptions(bind_descs: *[1]vk.VertexInputBindingDescription) void {
    bind_descs[0].binding = 0;
    bind_descs[0].stride = @sizeOf(Vertex);
    bind_descs[0].input_rate = .vertex;
}

pub fn getAttributeDescriptions(attr_descs: *[1]vk.VertexInputAttributeDescription) void {
    attr_descs[0].binding = 0;
    attr_descs[0].location = 0;
    attr_descs[0].format = .r32g32_sfloat;
    attr_descs[0].offset = 0;
}
