const vk = @import("..\\vulkan\\vulkan.zig");
const RenderPass = @This();

pub fn init(device: vk.Device, format: vk.Format) !vk.RenderPass {
    return createRenderPass(device, format);
}

pub fn deinit(device: vk.Device, render_pass: vk.RenderPass) void {
    vk.destroyRenderPass(device, render_pass, null);
}

fn createRenderPass(
    device: vk.Device,
    format: vk.Format,
) !vk.RenderPass {
    const color_attachment = vk.AttachmentDescription{
        .format = format,
        .samples = .@"1_bit",
        .load_op = .clear,
        .store_op = .store,
        .stencil_load_op = .dont_care,
        .stencil_store_op = .dont_care,
        .initial_layout = .undefined,
        .final_layout = .present_src_khr,
    };

    // has version 2
    const color_attachment_ref = vk.AttachmentReference{
        .attachment = 0,
        .layout = .color_attachment_optimal,
    };

    // has version 2
    const subpass = vk.SubpassDescription{
        .pipeline_bind_point = .graphics,
        .color_attachment_count = 1,
        .p_color_attachments = &color_attachment_ref,
    };

    // has version 2
    const dependency = vk.SubpassDependency{
        .src_subpass = vk.SubpassExternal, // constant
        .dst_subpass = 0,
        .src_stage_mask = .init(.color_attachment_output_bit),
        .src_access_mask = .initEmpty(),
        .dst_stage_mask = .init(.color_attachment_output_bit),
        .dst_access_mask = .init(.color_attachment_write_bit),
    };

    // has version 2
    const create_info = vk.RenderPassCreateInfo{
        .attachment_count = 1,
        .p_attachments = &color_attachment,
        .subpass_count = 1,
        .p_subpasses = &subpass,
        .dependency_count = 1,
        .p_dependencies = &dependency,
    };

    // has version 2
    var render_pass: vk.RenderPass = .null;
    return switch (vk.createRenderPass(
        device,
        &create_info,
        null,
        &render_pass,
    )) {
        .success => render_pass,
        else => return error.FailedToCreateRenderPass,
    };
}
