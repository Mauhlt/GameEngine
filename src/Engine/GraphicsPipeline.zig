const std = @import("std");
const Allocator = std.mem.Allocator;
const vk = @import("..\\vulkan\\vulkan.zig");
const Vertex = @import("Vertex.zig");
const Pipeline = @This();

pipeline_layout: vk.PipelineLayout = .null,
pipeline: vk.Pipeline = .null,

pub fn init(
    allo: Allocator,
    device: vk.Device,
    render_pass: vk.RenderPass,
) !Pipeline {
    const pipeline_layout = try createGraphicsPipelineLayout(device);
    const pipeline = try createGraphicsPipeline(allo, device, render_pass);

    return Pipeline{
        .pipeline_layout = pipeline_layout,
        .pipeline = pipeline,
    };
}

pub fn deinit(self: *Pipeline, device: vk.Device) void {
    vk.destroyPipeline(device, self.pipeline, null);
    vk.destroyPipelineLayout(device, self.pipeline_layout, null);
}

fn createGraphicsPipelineLayout(device: vk.Device) !vk.PipelineLayout {
    const create_info = vk.PipelineLayoutCreateInfo{
        .set_layout_count = 0,
        .p_set_layouts = null,
        .push_constant_range_count = 0,
        .p_push_constant_ranges = null,
    };

    var layout: vk.PipelineLayout = .null;
    return switch (vk.createPipelineLayout(
        device,
        &create_info,
        null,
        &layout,
    )) {
        .success => layout,
        else => error.FailedToCreatePipelineLayout,
    };
}

fn createGraphicsPipeline(
    allo: Allocator,
    device: vk.Device,
    render_pass: vk.RenderPass,
    pipeline_layout: vk.PipelineLayout,
) !vk.Pipeline {
    const vert_spv = try allocReadFile(allo, "tri.vert.spv");
    // print("Vert SPV: {}\n", .{vert_spv.len});
    defer allo.free(vert_spv);

    const frag_spv = try allocReadFile(allo, "tri.frag.spv");
    // print("Frag SPV: {}\n", .{frag_spv.len});
    defer allo.free(frag_spv);

    // create shader modules
    const vert_sm = try createShaderModule(vert_spv);
    defer vk.destroyShaderModule(device, vert_sm, null);

    const frag_sm = try createShaderModule(frag_spv);
    defer vk.destroyShaderModule(device, frag_sm, null);

    const vert_shader_stage_info = vk.PipelineShaderStageCreateInfo{
        .stage = .vertex_bit,
        .module = vert_sm,
        .p_name = "main",
    };

    const frag_shader_stage_info = vk.PipelineShaderStageCreateInfo{
        .stage = .fragment_bit,
        .module = frag_sm,
        .p_name = "main",
    };

    const shader_stages = [_]vk.PipelineShaderStageCreateInfo{
        vert_shader_stage_info,
        frag_shader_stage_info,
    };

    var binds: [1]vk.VertexInputBindingDescription = undefined;
    Vertex.getBindingDescription(&binds);
    var attrs: [2]vk.VertexInputAttributeDescription = undefined;
    Vertex.getAttributeDescriptions(&attrs);

    const vertex_input_info = vk.PipelineVertexInputStateCreateInfo{
        .vertex_binding_description_count = @truncate(binds.len),
        .p_vertex_binding_descriptions = &binds,
        .vertex_attribute_description_count = @truncate(attrs.len),
        .p_vertex_attribute_descriptions = &attrs,
    };

    const input_assembly = vk.PipelineInputAssemblyStateCreateInfo{
        .topology = .triangle_list,
        .primitive_restart_enable = .false,
    };

    const viewport_state = vk.PipelineViewportStateCreateInfo{
        .viewport_count = 1,
        // .p_viewports = &viewport,
        .scissor_count = 1,
        // .p_scissors = &scissor,
    };

    const rasterizer = vk.PipelineRasterizationStateCreateInfo{
        .depth_clamp_enable = .false,
        .rasterizer_discard_enable = .false,
        .polygon_mode = .fill,
        .line_width = 1,
        .cull_mode = .init(.back_bit),
        .front_face = .clockwise,
        .depth_bias_enable = .false,
        .depth_bias_constant_factor = 0,
        .depth_bias_clamp = 0,
        .depth_bias_slope_factor = 0,
    };

    const multisampling = vk.PipelineMultisampleStateCreateInfo{
        .sample_shading_enable = .false,
        .rasterization_samples = .@"1_bit",
        // .min_sample_shading = 1,
        // .p_sample_mask = null,
        // .alpha_to_coverage_enable = .false,
        // .alpha_to_one_enable = .false,
    };

    const color_blend_attachment = vk.PipelineColorBlendAttachmentState{
        .color_write_mask = .initMany(&.{ .r_bit, .g_bit, .b_bit, .a_bit }),
        .blend_enable = .false, // .true,
        // .src_color_blend_factor = .src_alpha,
        // .dst_color_blend_factor = .one_minus_src_alpha,
        // .color_blend_op = .add,
        // .src_alpha_blend_factor = .one,
        // .dst_alpha_blend_factor = .zero,
        // .alpha_blend_op = .add,
    };

    const color_blending = vk.PipelineColorBlendStateCreateInfo{
        .logic_op_enable = .false,
        .logic_op = .copy,
        .attachment_count = 1,
        .p_attachments = &color_blend_attachment,
        .blend_constants = [4]f32{ 0, 0, 0, 0 },
    };

    const dynamic_states = [_]vk.DynamicState{
        .viewport,
        .scissor,
    };

    const dynamic_state = vk.PipelineDynamicStateCreateInfo{
        .dynamic_state_count = @truncate(dynamic_states.len),
        .p_dynamic_states = &dynamic_states,
    };

    const create_info = vk.GraphicsPipelineCreateInfo{
        .stage_count = @truncate(shader_stages.len),
        .p_stages = &shader_stages,
        .p_vertex_input_state = &vertex_input_info,
        .p_input_assembly_state = &input_assembly,
        .p_viewport_state = &viewport_state,
        .p_rasterization_state = &rasterizer,
        .p_multisample_state = &multisampling,
        .p_depth_stencil_state = null,
        .p_color_blend_state = &color_blending,
        .p_dynamic_state = &dynamic_state,
        .layout = pipeline_layout,
        .render_pass = render_pass,
        .subpass = 0,
        .base_pipeline_handle = .null,
        // .base_pipeline_index = -1,
    };

    var pipeline: vk.Pipeline = .null;
    return switch (vk.createGraphicsPipelines(
        self.logical_device,
        .null,
        1,
        &create_info,
        null,
        &pipeline,
    )) {
        .success => pipeline,
        else => error.FailedToCreateGraphicsPipeline,
    };
}

fn allocReadFile(allo: Allocator, filename: []const u8) ![]const u8 {
    // get basepath
    var buf1: [1024]u8 = undefined;
    const exe_path = try std.fs.selfExePath(&buf1);
    const basepath = exe_path[0..std.mem.indexOf(u8, exe_path, "zig-out").?];
    // get shaders dir
    const shaders = try std.fs.path.join(allo, &.{ basepath, "src", "Shaders" });
    defer allo.free(shaders);
    // get shader specifically
    const read_filepath = try std.fs.path.join(allo, &.{ shaders, filename });
    defer allo.free(read_filepath);
    // read file
    const rfile = try std.fs.openFileAbsolute(read_filepath, .{});
    defer rfile.close();
    const size = (try rfile.stat()).size;
    const buffer: []u8 = try allo.alloc(u8, size);
    _ = try rfile.readAll(buffer);
    // return data
    return buffer;
}

fn createShaderModule(device: vk.Device, code: []const u8) !vk.ShaderModule {
    const create_info = vk.ShaderModuleCreateInfo{
        .code_size = @truncate(code.len),
        .p_code = @ptrCast(@alignCast(code)),
    };

    var shader_module: vk.ShaderModule = .null;
    return switch (vk.createShaderModule(
        device,
        &create_info,
        null,
        &shader_module,
    )) {
        .success => shader_module,
        else => error.FailedToCreateShaderModule,
    };
}
