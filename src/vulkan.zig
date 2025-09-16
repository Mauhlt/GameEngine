pub const PES = @import("PackedEnumSet").PackedEnumSet;
pub const Bool32 = enum(u32) {
    false = 0,
    true = 1,
};
pub const DeviceAddress = u64;
pub const DeviceSize = u64;
pub const Flags = u32;
pub const SampleMask = u32;
pub const Buffer = enum(u64) { null = 0, _ };
pub const Image = enum(u64) { null = 0, _ };
pub const Instance = enum(u64) { null = 0, _ };
pub const PhysicalDevice = enum(u64) { null = 0, _ };
pub const Device = enum(u64) { null = 0, _ };
pub const Queue = enum(u64) { null = 0, _ };
pub const Semaphore = enum(u64) { null = 0, _ };
pub const CommandBuffer = enum(u64) { null = 0, _ };
pub const Fence = enum(u64) { null = 0, _ };
pub const DeviceMemory = enum(u64) { null = 0, _ };
pub const Event = enum(u64) { null = 0, _ };
pub const QueryPool = enum(u64) { null = 0, _ };
pub const BufferView = enum(u64) { null = 0, _ };
pub const ImageView = enum(u64) { null = 0, _ };
pub const ShaderModule = enum(u64) { null = 0, _ };
pub const PipelineCache = enum(u64) { null = 0, _ };
pub const PipelineLayout = enum(u64) { null = 0, _ };
pub const Pipeline = enum(u64) { null = 0, _ };
pub const RenderPass = enum(u64) { null = 0, _ };
pub const DescriptorSetLayout = enum(u64) { null = 0, _ };
pub const Sampler = enum(u64) { null = 0, _ };
pub const DescriptorSet = enum(u64) { null = 0, _ };
pub const DescriptorPool = enum(u64) { null = 0, _ };
pub const Framebuffer = enum(u64) { null = 0, _ };
pub const CommandPool = enum(u64) { null = 0, _ };
pub const Result = enum(i32) {
    error_not_enough_space_khr = -1000483000,
    error_compression_exhausted_ext = -1000338000,
    error_invalid_video_std_parameters_khr = -1000299000,
    error_invalid_device_address_ext = -1000257000,
    error_full_screen_exclusive_mode_lost_ext = -1000255000,
    error_not_permitted = -1000174001,
    error_fragmentation = -1000161000,
    error_invalid_drm_format_modifier_plane_layout_ext = -1000158000,
    error_invalid_external_handle = -1000072003,
    error_out_of_pool_memory = -1000069000,
    error_video_std_version_not_supported_khr = -1000023005,
    error_video_profile_codec_not_supported_khr = -1000023004,
    error_video_profile_format_not_supported_khr = -1000023003,
    error_video_profile_operation_not_supported_khr = -1000023002,
    error_video_picture_layout_not_supported_khr = -1000023001,
    error_image_usage_not_supported_khr = -1000023000,
    error_invalid_shader_nv = -1000012000,
    error_validation_failed_ext = -1000011001,
    error_incompatible_display_khr = -1000003001,
    error_out_of_date_khr = -1000001004,
    error_native_window_in_use_khr = -1000000001,
    error_surface_lost_khr = -1000000000,
    error_unknown = -13,
    error_fragmented_pool = -12,
    error_format_not_supported = -11,
    error_too_many_objects = -10,
    error_incompatible_driver = -9,
    error_feature_not_present = -8,
    error_extension_not_present = -7,
    error_layer_not_present = -6,
    error_memory_map_failed = -5,
    error_device_lost = -4,
    error_initialization_failed = -3,
    error_out_of_device_memory = -2,
    error_out_of_host_memory = -1,
    success = 0,
    not_ready = 1,
    timeout = 2,
    event_set = 3,
    event_reset = 4,
    incomplete = 5,
    suboptimal_khr = 1000001003,
    thread_idle_khr = 1000268000,
    thread_done_khr = 1000268001,
    operation_deferred_khr = 1000268002,
    operation_not_deferred_khr = 1000268003,
    pipeline_compile_required = 1000297000,
    incompatible_shader_binary_ext = 1000482000,
    pipeline_binary_missing_khr = 1000483000,
    max_enum = 2147483647,
    const Self = @This();
    pub const error_pipeline_compile_required_ext = Self.pipeline_compile_required_ext;
    pub const error_invalid_opaque_capture_address_khr = Self.error_invalid_device_address_ext;
    pub const error_not_permitted_ext = Self.error_not_permitted_khr;
    pub const error_incompatible_shader_binary_ext = Self.incompatible_shader_binary_ext;
    pub const error_not_permitted_khr = Self.error_not_permitted;
    pub const pipeline_compile_required_ext = Self.pipeline_compile_required;
    pub const error_invalid_opaque_capture_address = Self.error_invalid_device_address_ext;
    pub const error_fragmentation_ext = Self.error_fragmentation;
    pub const error_invalid_external_handle_khr = Self.error_invalid_external_handle;
    pub const error_out_of_pool_memory_khr = Self.error_out_of_pool_memory;
};
pub const StructureType = enum(u32) {
    application_info = 0,
    instance_create_info = 1,
    device_queue_create_info = 2,
    device_create_info = 3,
    submit_info = 4,
    memory_allocate_info = 5,
    mapped_memory_range = 6,
    bind_sparse_info = 7,
    fence_create_info = 8,
    semaphore_create_info = 9,
    event_create_info = 10,
    query_pool_create_info = 11,
    buffer_create_info = 12,
    buffer_view_create_info = 13,
    image_create_info = 14,
    image_view_create_info = 15,
    shader_module_create_info = 16,
    pipeline_cache_create_info = 17,
    pipeline_shader_stage_create_info = 18,
    pipeline_vertex_input_state_create_info = 19,
    pipeline_input_assembly_state_create_info = 20,
    pipeline_tessellation_state_create_info = 21,
    pipeline_viewport_state_create_info = 22,
    pipeline_rasterization_state_create_info = 23,
    pipeline_multisample_state_create_info = 24,
    pipeline_depth_stencil_state_create_info = 25,
    pipeline_color_blend_state_create_info = 26,
    pipeline_dynamic_state_create_info = 27,
    graphics_pipeline_create_info = 28,
    compute_pipeline_create_info = 29,
    pipeline_layout_create_info = 30,
    sampler_create_info = 31,
    descriptor_set_layout_create_info = 32,
    descriptor_pool_create_info = 33,
    descriptor_set_allocate_info = 34,
    write_descriptor_set = 35,
    copy_descriptor_set = 36,
    framebuffer_create_info = 37,
    render_pass_create_info = 38,
    command_pool_create_info = 39,
    command_buffer_allocate_info = 40,
    command_buffer_inheritance_info = 41,
    command_buffer_begin_info = 42,
    render_pass_begin_info = 43,
    buffer_memory_barrier = 44,
    image_memory_barrier = 45,
    memory_barrier = 46,
    loader_instance_create_info = 47,
    loader_device_create_info = 48,
    physical_device_vulkan_1_1_features = 49,
    physical_device_vulkan_1_1_properties = 50,
    physical_device_vulkan_1_2_features = 51,
    physical_device_vulkan_1_2_properties = 52,
    physical_device_vulkan_1_3_features = 53,
    physical_device_vulkan_1_3_properties = 54,
    physical_device_vulkan_1_4_features = 55,
    physical_device_vulkan_1_4_properties = 56,
    swapchain_create_info_khr = 1000001000,
    present_info_khr = 1000001001,
    display_mode_create_info_khr = 1000002000,
    display_surface_create_info_khr = 1000002001,
    display_present_info_khr = 1000003000,
    xlib_surface_create_info_khr = 1000004000,
    xcb_surface_create_info_khr = 1000005000,
    wayland_surface_create_info_khr = 1000006000,
    android_surface_create_info_khr = 1000008000,
    win32_surface_create_info_khr = 1000009000,
    debug_report_create_info_ext = 1000011000,
    pipeline_rasterization_state_rasterization_order_amd = 1000018000,
    debug_marker_object_name_info_ext = 1000022000,
    debug_marker_object_tag_info_ext = 1000022001,
    debug_marker_marker_info_ext = 1000022002,
    video_profile_info_khr = 1000023000,
    video_capabilities_khr = 1000023001,
    video_picture_resource_info_khr = 1000023002,
    video_session_memory_requirements_khr = 1000023003,
    bind_video_session_memory_info_khr = 1000023004,
    video_session_create_info_khr = 1000023005,
    video_session_parameters_create_info_khr = 1000023006,
    video_session_parameters_update_info_khr = 1000023007,
    video_begin_coding_info_khr = 1000023008,
    video_end_coding_info_khr = 1000023009,
    video_coding_control_info_khr = 1000023010,
    video_reference_slot_info_khr = 1000023011,
    queue_family_video_properties_khr = 1000023012,
    video_profile_list_info_khr = 1000023013,
    physical_device_video_format_info_khr = 1000023014,
    video_format_properties_khr = 1000023015,
    queue_family_query_result_status_properties_khr = 1000023016,
    video_decode_info_khr = 1000024000,
    video_decode_capabilities_khr = 1000024001,
    video_decode_usage_info_khr = 1000024002,
    dedicated_allocation_image_create_info_nv = 1000026000,
    dedicated_allocation_buffer_create_info_nv = 1000026001,
    dedicated_allocation_memory_allocate_info_nv = 1000026002,
    physical_device_transform_feedback_features_ext = 1000028000,
    physical_device_transform_feedback_properties_ext = 1000028001,
    pipeline_rasterization_state_stream_create_info_ext = 1000028002,
    cu_module_create_info_nvx = 1000029000,
    cu_function_create_info_nvx = 1000029001,
    cu_launch_info_nvx = 1000029002,
    cu_module_texturing_mode_create_info_nvx = 1000029004,
    image_view_handle_info_nvx = 1000030000,
    image_view_address_properties_nvx = 1000030001,
    video_encode_h264_capabilities_khr = 1000038000,
    video_encode_h264_session_parameters_create_info_khr = 1000038001,
    video_encode_h264_session_parameters_add_info_khr = 1000038002,
    video_encode_h264_picture_info_khr = 1000038003,
    video_encode_h264_dpb_slot_info_khr = 1000038004,
    video_encode_h264_nalu_slice_info_khr = 1000038005,
    video_encode_h264_gop_remaining_frame_info_khr = 1000038006,
    video_encode_h264_profile_info_khr = 1000038007,
    video_encode_h264_rate_control_info_khr = 1000038008,
    video_encode_h264_rate_control_layer_info_khr = 1000038009,
    video_encode_h264_session_create_info_khr = 1000038010,
    video_encode_h264_quality_level_properties_khr = 1000038011,
    video_encode_h264_session_parameters_get_info_khr = 1000038012,
    video_encode_h264_session_parameters_feedback_info_khr = 1000038013,
    video_encode_h265_capabilities_khr = 1000039000,
    video_encode_h265_session_parameters_create_info_khr = 1000039001,
    video_encode_h265_session_parameters_add_info_khr = 1000039002,
    video_encode_h265_picture_info_khr = 1000039003,
    video_encode_h265_dpb_slot_info_khr = 1000039004,
    video_encode_h265_nalu_slice_segment_info_khr = 1000039005,
    video_encode_h265_gop_remaining_frame_info_khr = 1000039006,
    video_encode_h265_profile_info_khr = 1000039007,
    video_encode_h265_rate_control_info_khr = 1000039009,
    video_encode_h265_rate_control_layer_info_khr = 1000039010,
    video_encode_h265_session_create_info_khr = 1000039011,
    video_encode_h265_quality_level_properties_khr = 1000039012,
    video_encode_h265_session_parameters_get_info_khr = 1000039013,
    video_encode_h265_session_parameters_feedback_info_khr = 1000039014,
    video_decode_h264_capabilities_khr = 1000040000,
    video_decode_h264_picture_info_khr = 1000040001,
    video_decode_h264_profile_info_khr = 1000040003,
    video_decode_h264_session_parameters_create_info_khr = 1000040004,
    video_decode_h264_session_parameters_add_info_khr = 1000040005,
    video_decode_h264_dpb_slot_info_khr = 1000040006,
    texture_lod_gather_format_properties_amd = 1000041000,
    rendering_info = 1000044000,
    rendering_attachment_info = 1000044001,
    pipeline_rendering_create_info = 1000044002,
    physical_device_dynamic_rendering_features = 1000044003,
    command_buffer_inheritance_rendering_info = 1000044004,
    rendering_fragment_shading_rate_attachment_info_khr = 1000044006,
    rendering_fragment_density_map_attachment_info_ext = 1000044007,
    attachment_sample_count_info_nv = 1000044008,
    multiview_per_view_attributes_info_nvx = 1000044009,
    stream_descriptor_surface_create_info_ggp = 1000049000,
    physical_device_corner_sampled_image_features_nv = 1000050000,
    render_pass_multiview_create_info = 1000053000,
    physical_device_multiview_features = 1000053001,
    physical_device_multiview_properties = 1000053002,
    external_memory_image_create_info_nv = 1000056000,
    export_memory_allocate_info_nv = 1000056001,
    import_memory_win32_handle_info_nv = 1000057000,
    export_memory_win32_handle_info_nv = 1000057001,
    win32_keyed_mutex_acquire_release_info_nv = 1000058000,
    physical_device_features_2 = 1000059000,
    physical_device_properties_2 = 1000059001,
    format_properties_2 = 1000059002,
    image_format_properties_2 = 1000059003,
    physical_device_image_format_info_2 = 1000059004,
    queue_family_properties_2 = 1000059005,
    physical_device_memory_properties_2 = 1000059006,
    sparse_image_format_properties_2 = 1000059007,
    physical_device_sparse_image_format_info_2 = 1000059008,
    memory_allocate_flags_info = 1000060000,
    device_group_render_pass_begin_info = 1000060003,
    device_group_command_buffer_begin_info = 1000060004,
    device_group_submit_info = 1000060005,
    device_group_bind_sparse_info = 1000060006,
    device_group_present_capabilities_khr = 1000060007,
    image_swapchain_create_info_khr = 1000060008,
    bind_image_memory_swapchain_info_khr = 1000060009,
    acquire_next_image_info_khr = 1000060010,
    device_group_present_info_khr = 1000060011,
    device_group_swapchain_create_info_khr = 1000060012,
    bind_buffer_memory_device_group_info = 1000060013,
    bind_image_memory_device_group_info = 1000060014,
    validation_flags_ext = 1000061000,
    vi_surface_create_info_nn = 1000062000,
    physical_device_shader_draw_parameter_features = 1000063000,
    physical_device_texture_compression_astc_hdr_features = 1000066000,
    image_view_astc_decode_mode_ext = 1000067000,
    physical_device_astc_decode_features_ext = 1000067001,
    pipeline_robustness_create_info = 1000068000,
    physical_device_pipeline_robustness_features = 1000068001,
    physical_device_pipeline_robustness_properties = 1000068002,
    physical_device_group_properties = 1000070000,
    device_group_device_create_info = 1000070001,
    physical_device_external_image_format_info = 1000071000,
    external_image_format_properties = 1000071001,
    physical_device_external_buffer_info = 1000071002,
    external_buffer_properties = 1000071003,
    physical_device_id_properties = 1000071004,
    external_memory_buffer_create_info = 1000072000,
    external_memory_image_create_info = 1000072001,
    export_memory_allocate_info = 1000072002,
    import_memory_win32_handle_info_khr = 1000073000,
    export_memory_win32_handle_info_khr = 1000073001,
    memory_win32_handle_properties_khr = 1000073002,
    memory_get_win32_handle_info_khr = 1000073003,
    import_memory_fd_info_khr = 1000074000,
    memory_fd_properties_khr = 1000074001,
    memory_get_fd_info_khr = 1000074002,
    win32_keyed_mutex_acquire_release_info_khr = 1000075000,
    physical_device_external_semaphore_info = 1000076000,
    external_semaphore_properties = 1000076001,
    export_semaphore_create_info = 1000077000,
    import_semaphore_win32_handle_info_khr = 1000078000,
    export_semaphore_win32_handle_info_khr = 1000078001,
    d3d12_fence_submit_info_khr = 1000078002,
    semaphore_get_win32_handle_info_khr = 1000078003,
    import_semaphore_fd_info_khr = 1000079000,
    semaphore_get_fd_info_khr = 1000079001,
    physical_device_push_descriptor_properties = 1000080000,
    command_buffer_inheritance_conditional_rendering_info_ext = 1000081000,
    physical_device_conditional_rendering_features_ext = 1000081001,
    conditional_rendering_begin_info_ext = 1000081002,
    physical_device_float16_int8_features_khr = 1000082000,
    physical_device_16bit_storage_features = 1000083000,
    present_regions_khr = 1000084000,
    descriptor_update_template_create_info = 1000085000,
    pipeline_viewport_w_scaling_state_create_info_nv = 1000087000,
    surface_capabilities2_ext = 1000090000,
    display_power_info_ext = 1000091000,
    device_event_info_ext = 1000091001,
    display_event_info_ext = 1000091002,
    swapchain_counter_create_info_ext = 1000091003,
    present_times_info_google = 1000092000,
    physical_device_subgroup_properties = 1000094000,
    physical_device_multiview_per_view_attributes_properties_nvx = 1000097000,
    pipeline_viewport_swizzle_state_create_info_nv = 1000098000,
    physical_device_discard_rectangle_properties_ext = 1000099000,
    pipeline_discard_rectangle_state_create_info_ext = 1000099001,
    physical_device_conservative_rasterization_properties_ext = 1000101000,
    pipeline_rasterization_conservative_state_create_info_ext = 1000101001,
    physical_device_depth_clip_enable_features_ext = 1000102000,
    pipeline_rasterization_depth_clip_state_create_info_ext = 1000102001,
    hdr_metadata_ext = 1000105000,
    physical_device_imageless_framebuffer_features = 1000108000,
    framebuffer_attachments_create_info = 1000108001,
    framebuffer_attachment_image_info = 1000108002,
    render_pass_attachment_begin_info = 1000108003,
    attachment_description_2 = 1000109000,
    attachment_reference_2 = 1000109001,
    subpass_description_2 = 1000109002,
    subpass_dependency_2 = 1000109003,
    render_pass_create_info_2 = 1000109004,
    subpass_begin_info = 1000109005,
    subpass_end_info = 1000109006,
    physical_device_relaxed_line_rasterization_features_img = 1000110000,
    shared_present_surface_capabilities_khr = 1000111000,
    physical_device_external_fence_info = 1000112000,
    external_fence_properties = 1000112001,
    export_fence_create_info = 1000113000,
    import_fence_win32_handle_info_khr = 1000114000,
    export_fence_win32_handle_info_khr = 1000114001,
    fence_get_win32_handle_info_khr = 1000114002,
    import_fence_fd_info_khr = 1000115000,
    fence_get_fd_info_khr = 1000115001,
    physical_device_performance_query_features_khr = 1000116000,
    physical_device_performance_query_properties_khr = 1000116001,
    query_pool_performance_create_info_khr = 1000116002,
    performance_query_submit_info_khr = 1000116003,
    acquire_profiling_lock_info_khr = 1000116004,
    performance_counter_khr = 1000116005,
    performance_counter_description_khr = 1000116006,
    physical_device_point_clipping_properties = 1000117000,
    render_pass_input_attachment_aspect_create_info = 1000117001,
    image_view_usage_create_info = 1000117002,
    pipeline_tessellation_domain_origin_state_create_info = 1000117003,
    physical_device_surface_info_2_khr = 1000119000,
    surface_capabilities_2_khr = 1000119001,
    surface_format_2_khr = 1000119002,
    physical_device_variable_pointer_features = 1000120000,
    display_properties_2_khr = 1000121000,
    display_plane_properties_2_khr = 1000121001,
    display_mode_properties_2_khr = 1000121002,
    display_plane_info_2_khr = 1000121003,
    display_plane_capabilities_2_khr = 1000121004,
    ios_surface_create_info_mvk = 1000122000,
    macos_surface_create_info_mvk = 1000123000,
    memory_dedicated_requirements = 1000127000,
    memory_dedicated_allocate_info = 1000127001,
    debug_utils_object_name_info_ext = 1000128000,
    debug_utils_object_tag_info_ext = 1000128001,
    debug_utils_label_ext = 1000128002,
    debug_utils_messenger_callback_data_ext = 1000128003,
    debug_utils_messenger_create_info_ext = 1000128004,
    android_hardware_buffer_usage_android = 1000129000,
    android_hardware_buffer_properties_android = 1000129001,
    android_hardware_buffer_format_properties_android = 1000129002,
    import_android_hardware_buffer_info_android = 1000129003,
    memory_get_android_hardware_buffer_info_android = 1000129004,
    external_format_android = 1000129005,
    android_hardware_buffer_format_properties_2_android = 1000129006,
    physical_device_sampler_filter_minmax_properties = 1000130000,
    sampler_reduction_mode_create_info = 1000130001,
    physical_device_inline_uniform_block_features = 1000138000,
    physical_device_inline_uniform_block_properties = 1000138001,
    write_descriptor_set_inline_uniform_block = 1000138002,
    descriptor_pool_inline_uniform_block_create_info = 1000138003,
    sample_locations_info_ext = 1000143000,
    render_pass_sample_locations_begin_info_ext = 1000143001,
    pipeline_sample_locations_state_create_info_ext = 1000143002,
    physical_device_sample_locations_properties_ext = 1000143003,
    multisample_properties_ext = 1000143004,
    protected_submit_info = 1000145000,
    physical_device_protected_memory_features = 1000145001,
    physical_device_protected_memory_properties = 1000145002,
    device_queue_info_2 = 1000145003,
    buffer_memory_requirements_info_2 = 1000146000,
    image_memory_requirements_info_2 = 1000146001,
    image_sparse_memory_requirements_info_2 = 1000146002,
    memory_requirements_2 = 1000146003,
    sparse_image_memory_requirements_2 = 1000146004,
    image_format_list_create_info = 1000147000,
    physical_device_blend_operation_advanced_features_ext = 1000148000,
    physical_device_blend_operation_advanced_properties_ext = 1000148001,
    pipeline_color_blend_advanced_state_create_info_ext = 1000148002,
    pipeline_coverage_to_color_state_create_info_nv = 1000149000,
    acceleration_structure_build_geometry_info_khr = 1000150000,
    acceleration_structure_device_address_info_khr = 1000150002,
    acceleration_structure_geometry_aabbs_data_khr = 1000150003,
    acceleration_structure_geometry_instances_data_khr = 1000150004,
    acceleration_structure_geometry_triangles_data_khr = 1000150005,
    acceleration_structure_geometry_khr = 1000150006,
    write_descriptor_set_acceleration_structure_khr = 1000150007,
    acceleration_structure_version_info_khr = 1000150009,
    copy_acceleration_structure_info_khr = 1000150010,
    copy_acceleration_structure_to_memory_info_khr = 1000150011,
    copy_memory_to_acceleration_structure_info_khr = 1000150012,
    physical_device_acceleration_structure_features_khr = 1000150013,
    physical_device_acceleration_structure_properties_khr = 1000150014,
    ray_tracing_pipeline_create_info_khr = 1000150015,
    ray_tracing_shader_group_create_info_khr = 1000150016,
    acceleration_structure_create_info_khr = 1000150017,
    ray_tracing_pipeline_interface_create_info_khr = 1000150018,
    acceleration_structure_build_sizes_info_khr = 1000150020,
    pipeline_coverage_modulation_state_create_info_nv = 1000152000,
    physical_device_shader_sm_builtins_features_nv = 1000154000,
    physical_device_shader_sm_builtins_properties_nv = 1000154001,
    sampler_ycbcr_conversion_create_info = 1000156000,
    sampler_ycbcr_conversion_info = 1000156001,
    bind_image_plane_memory_info = 1000156002,
    image_plane_memory_requirements_info = 1000156003,
    physical_device_sampler_ycbcr_conversion_features = 1000156004,
    sampler_ycbcr_conversion_image_format_properties = 1000156005,
    bind_buffer_memory_info = 1000157000,
    bind_image_memory_info = 1000157001,
    drm_format_modifier_properties_list_ext = 1000158000,
    physical_device_image_drm_format_modifier_info_ext = 1000158002,
    image_drm_format_modifier_list_create_info_ext = 1000158003,
    image_drm_format_modifier_explicit_create_info_ext = 1000158004,
    image_drm_format_modifier_properties_ext = 1000158005,
    drm_format_modifier_properties_list_2_ext = 1000158006,
    validation_cache_create_info_ext = 1000160000,
    shader_module_validation_cache_create_info_ext = 1000160001,
    descriptor_set_layout_binding_flags_create_info = 1000161000,
    physical_device_descriptor_indexing_features = 1000161001,
    physical_device_descriptor_indexing_properties = 1000161002,
    descriptor_set_variable_descriptor_count_allocate_info = 1000161003,
    descriptor_set_variable_descriptor_count_layout_support = 1000161004,
    pipeline_viewport_shading_rate_image_state_create_info_nv = 1000164000,
    physical_device_shading_rate_image_features_nv = 1000164001,
    physical_device_shading_rate_image_properties_nv = 1000164002,
    pipeline_viewport_coarse_sample_order_state_create_info_nv = 1000164005,
    ray_tracing_pipeline_create_info_nv = 1000165000,
    acceleration_structure_create_info_nv = 1000165001,
    geometry_nv = 1000165003,
    geometry_triangles_nv = 1000165004,
    geometry_aabb_nv = 1000165005,
    bind_acceleration_structure_memory_info_nv = 1000165006,
    write_descriptor_set_acceleration_structure_nv = 1000165007,
    acceleration_structure_memory_requirements_info_nv = 1000165008,
    physical_device_ray_tracing_properties_nv = 1000165009,
    ray_tracing_shader_group_create_info_nv = 1000165011,
    acceleration_structure_info_nv = 1000165012,
    physical_device_representative_fragment_test_features_nv = 1000166000,
    pipeline_representative_fragment_test_state_create_info_nv = 1000166001,
    physical_device_maintenance_3_properties = 1000168000,
    descriptor_set_layout_support = 1000168001,
    physical_device_image_view_image_format_info_ext = 1000170000,
    filter_cubic_image_view_image_format_properties_ext = 1000170001,
    device_queue_global_priority_create_info = 1000174000,
    physical_device_shader_subgroup_extended_types_features = 1000175000,
    physical_device_8bit_storage_features = 1000177000,
    import_memory_host_pointer_info_ext = 1000178000,
    memory_host_pointer_properties_ext = 1000178001,
    physical_device_external_memory_host_properties_ext = 1000178002,
    physical_device_shader_atomic_int64_features = 1000180000,
    physical_device_shader_clock_features_khr = 1000181000,
    pipeline_compiler_control_create_info_amd = 1000183000,
    calibrated_timestamp_info_ext = 1000184000,
    physical_device_shader_core_properties_amd = 1000185000,
    video_decode_h265_capabilities_khr = 1000187000,
    video_decode_h265_session_parameters_create_info_khr = 1000187001,
    video_decode_h265_session_parameters_add_info_khr = 1000187002,
    video_decode_h265_profile_info_khr = 1000187003,
    video_decode_h265_picture_info_khr = 1000187004,
    video_decode_h265_dpb_slot_info_khr = 1000187005,
    device_memory_overallocation_create_info_amd = 1000189000,
    physical_device_vertex_attribute_divisor_properties_ext = 1000190000,
    pipeline_vertex_input_divisor_state_create_info = 1000190001,
    physical_device_vertex_attribute_divisor_features = 1000190002,
    present_frame_token_ggp = 1000191000,
    pipeline_creation_feedback_create_info = 1000192000,
    physical_device_driver_properties = 1000196000,
    physical_device_float_controls_properties = 1000197000,
    physical_device_depth_stencil_resolve_properties = 1000199000,
    subpass_description_depth_stencil_resolve = 1000199001,
    physical_device_compute_shader_derivatives_features_nv = 1000201000,
    physical_device_mesh_shader_features_nv = 1000202000,
    physical_device_mesh_shader_properties_nv = 1000202001,
    physical_device_fragment_shader_barycentric_features_nv = 1000203000,
    physical_device_shader_image_footprint_features_nv = 1000204000,
    pipeline_viewport_exclusive_scissor_state_create_info_nv = 1000205000,
    physical_device_exclusive_scissor_features_nv = 1000205002,
    checkpoint_data_nv = 1000206000,
    queue_family_checkpoint_properties_nv = 1000206001,
    physical_device_timeline_semaphore_features = 1000207000,
    physical_device_timeline_semaphore_properties = 1000207001,
    semaphore_type_create_info = 1000207002,
    timeline_semaphore_submit_info = 1000207003,
    semaphore_wait_info = 1000207004,
    semaphore_signal_info = 1000207005,
    physical_device_shader_integer_functions_2_features_intel = 1000209000,
    query_pool_create_info_intel = 1000210000,
    initialize_performance_api_info_intel = 1000210001,
    performance_marker_info_intel = 1000210002,
    performance_stream_marker_info_intel = 1000210003,
    performance_override_info_intel = 1000210004,
    performance_configuration_acquire_info_intel = 1000210005,
    physical_device_vulkan_memory_model_features = 1000211000,
    physical_device_pci_bus_info_properties_ext = 1000212000,
    display_native_hdr_surface_capabilities_amd = 1000213000,
    swapchain_display_native_hdr_create_info_amd = 1000213001,
    imagepipe_surface_create_info_fuchsia = 1000214000,
    physical_device_shader_terminate_invocation_features = 1000215000,
    metal_surface_create_info_ext = 1000217000,
    physical_device_fragment_density_map_features_ext = 1000218000,
    physical_device_fragment_density_map_properties_ext = 1000218001,
    render_pass_fragment_density_map_create_info_ext = 1000218002,
    physical_device_scalar_block_layout_features = 1000221000,
    physical_device_subgroup_size_control_properties = 1000225000,
    shader_required_subgroup_size_create_info_ext = 1000225001,
    physical_device_subgroup_size_control_features = 1000225002,
    fragment_shading_rate_attachment_info_khr = 1000226000,
    pipeline_fragment_shading_rate_state_create_info_khr = 1000226001,
    physical_device_fragment_shading_rate_properties_khr = 1000226002,
    physical_device_fragment_shading_rate_features_khr = 1000226003,
    physical_device_fragment_shading_rate_khr = 1000226004,
    physical_device_shader_core_properties_2_amd = 1000227000,
    physical_device_coherent_memory_features_amd = 1000229000,
    physical_device_dynamic_rendering_local_read_features = 1000232000,
    rendering_attachment_location_info = 1000232001,
    rendering_input_attachment_index_info = 1000232002,
    physical_device_shader_image_atomic_int64_features_ext = 1000234000,
    physical_device_shader_quad_control_features_khr = 1000235000,
    physical_device_memory_budget_properties_ext = 1000237000,
    physical_device_memory_priority_features_ext = 1000238000,
    memory_priority_allocate_info_ext = 1000238001,
    surface_protected_capabilities_khr = 1000239000,
    physical_device_dedicated_allocation_image_aliasing_features_nv = 1000240000,
    physical_device_separate_depth_stencil_layouts_features = 1000241000,
    attachment_reference_stencil_layout = 1000241001,
    attachment_description_stencil_layout = 1000241002,
    physical_device_buffer_address_features_ext = 1000244000,
    buffer_device_address_info = 1000244001,
    buffer_device_address_create_info_ext = 1000244002,
    physical_device_tool_properties = 1000245000,
    image_stencil_usage_create_info = 1000246000,
    validation_features_ext = 1000247000,
    physical_device_present_wait_features_khr = 1000248000,
    physical_device_cooperative_matrix_features_nv = 1000249000,
    cooperative_matrix_properties_nv = 1000249001,
    physical_device_cooperative_matrix_properties_nv = 1000249002,
    physical_device_coverage_reduction_mode_features_nv = 1000250000,
    pipeline_coverage_reduction_state_create_info_nv = 1000250001,
    framebuffer_mixed_samples_combination_nv = 1000250002,
    physical_device_fragment_shader_interlock_features_ext = 1000251000,
    physical_device_ycbcr_image_arrays_features_ext = 1000252000,
    physical_device_uniform_buffer_standard_layout_features = 1000253000,
    physical_device_provoking_vertex_features_ext = 1000254000,
    pipeline_rasterization_provoking_vertex_state_create_info_ext = 1000254001,
    physical_device_provoking_vertex_properties_ext = 1000254002,
    surface_full_screen_exclusive_info_ext = 1000255000,
    surface_full_screen_exclusive_win32_info_ext = 1000255001,
    surface_capabilities_full_screen_exclusive_ext = 1000255002,
    headless_surface_create_info_ext = 1000256000,
    physical_device_buffer_device_address_features = 1000257000,
    buffer_opaque_capture_address_create_info = 1000257002,
    memory_opaque_capture_address_allocate_info = 1000257003,
    device_memory_opaque_capture_address_info = 1000257004,
    physical_device_line_rasterization_features = 1000259000,
    pipeline_rasterization_line_state_create_info = 1000259001,
    physical_device_line_rasterization_properties = 1000259002,
    physical_device_shader_atomic_float_features_ext = 1000260000,
    physical_device_host_query_reset_features = 1000261000,
    physical_device_index_type_uint8_features = 1000265000,
    physical_device_extended_dynamic_state_features_ext = 1000267000,
    physical_device_pipeline_executable_properties_features_khr = 1000269000,
    pipeline_info_ext = 1000269001,
    pipeline_executable_properties_khr = 1000269002,
    pipeline_executable_info_khr = 1000269003,
    pipeline_executable_statistic_khr = 1000269004,
    pipeline_executable_internal_representation_khr = 1000269005,
    physical_device_host_image_copy_features = 1000270000,
    physical_device_host_image_copy_properties = 1000270001,
    memory_to_image_copy = 1000270002,
    image_to_memory_copy = 1000270003,
    copy_image_to_memory_info = 1000270004,
    copy_memory_to_image_info = 1000270005,
    host_image_layout_transition_info = 1000270006,
    copy_image_to_image_info = 1000270007,
    subresource_host_memcpy_size = 1000270008,
    host_image_copy_device_performance_query = 1000270009,
    memory_map_info = 1000271000,
    memory_unmap_info = 1000271001,
    physical_device_map_memory_placed_features_ext = 1000272000,
    physical_device_map_memory_placed_properties_ext = 1000272001,
    memory_map_placed_info_ext = 1000272002,
    physical_device_shader_atomic_float_2_features_ext = 1000273000,
    surface_present_mode_ext = 1000274000,
    surface_present_scaling_capabilities_ext = 1000274001,
    surface_present_mode_compatibility_ext = 1000274002,
    physical_device_swapchain_maintenance_1_features_ext = 1000275000,
    swapchain_present_fence_info_ext = 1000275001,
    swapchain_present_modes_create_info_ext = 1000275002,
    swapchain_present_mode_info_ext = 1000275003,
    swapchain_present_scaling_create_info_ext = 1000275004,
    release_swapchain_images_info_ext = 1000275005,
    physical_device_shader_demote_to_helper_invocation_features = 1000276000,
    physical_device_device_generated_commands_properties_nv = 1000277000,
    graphics_shader_group_create_info_nv = 1000277001,
    graphics_pipeline_shader_groups_create_info_nv = 1000277002,
    indirect_commands_layout_token_nv = 1000277003,
    indirect_commands_layout_create_info_nv = 1000277004,
    generated_commands_info_nv = 1000277005,
    generated_commands_memory_requirements_info_nv = 1000277006,
    physical_device_device_generated_commands_features_nv = 1000277007,
    physical_device_inherited_viewport_scissor_features_nv = 1000278000,
    command_buffer_inheritance_viewport_scissor_info_nv = 1000278001,
    physical_device_shader_integer_dot_product_features = 1000280000,
    physical_device_shader_integer_dot_product_properties = 1000280001,
    physical_device_texel_buffer_alignment_features_ext = 1000281000,
    physical_device_texel_buffer_alignment_properties = 1000281001,
    command_buffer_inheritance_render_pass_transform_info_qcom = 1000282000,
    render_pass_transform_begin_info_qcom = 1000282001,
    physical_device_depth_bias_control_features_ext = 1000283000,
    depth_bias_info_ext = 1000283001,
    depth_bias_representation_info_ext = 1000283002,
    physical_device_device_memory_report_features_ext = 1000284000,
    device_device_memory_report_create_info_ext = 1000284001,
    device_memory_report_callback_data_ext = 1000284002,
    physical_device_robustness_2_features_ext = 1000286000,
    physical_device_robustness_2_properties_ext = 1000286001,
    sampler_custom_border_color_create_info_ext = 1000287000,
    physical_device_custom_border_color_properties_ext = 1000287001,
    physical_device_custom_border_color_features_ext = 1000287002,
    pipeline_library_create_info_khr = 1000290000,
    physical_device_present_barrier_features_nv = 1000292000,
    surface_capabilities_present_barrier_nv = 1000292001,
    swapchain_present_barrier_create_info_nv = 1000292002,
    present_id_khr = 1000294000,
    physical_device_present_id_features_khr = 1000294001,
    physical_device_private_data_features = 1000295000,
    device_private_data_create_info = 1000295001,
    private_data_slot_create_info = 1000295002,
    physical_device_pipeline_creation_cache_control_features = 1000297000,
    video_encode_info_khr = 1000299000,
    video_encode_rate_control_info_khr = 1000299001,
    video_encode_rate_control_layer_info_khr = 1000299002,
    video_encode_capabilities_khr = 1000299003,
    video_encode_usage_info_khr = 1000299004,
    query_pool_video_encode_feedback_create_info_khr = 1000299005,
    physical_device_video_encode_quality_level_info_khr = 1000299006,
    video_encode_quality_level_properties_khr = 1000299007,
    video_encode_quality_level_info_khr = 1000299008,
    video_encode_session_parameters_get_info_khr = 1000299009,
    video_encode_session_parameters_feedback_info_khr = 1000299010,
    physical_device_diagnostics_config_features_nv = 1000300000,
    device_diagnostics_config_create_info_nv = 1000300001,
    cuda_module_create_info_nv = 1000307000,
    cuda_function_create_info_nv = 1000307001,
    cuda_launch_info_nv = 1000307002,
    physical_device_cuda_kernel_launch_features_nv = 1000307003,
    physical_device_cuda_kernel_launch_properties_nv = 1000307004,
    query_low_latency_support_nv = 1000310000,
    export_metal_object_create_info_ext = 1000311000,
    export_metal_objects_info_ext = 1000311001,
    export_metal_device_info_ext = 1000311002,
    export_metal_command_queue_info_ext = 1000311003,
    export_metal_buffer_info_ext = 1000311004,
    import_metal_buffer_info_ext = 1000311005,
    export_metal_texture_info_ext = 1000311006,
    import_metal_texture_info_ext = 1000311007,
    export_metal_io_surface_info_ext = 1000311008,
    import_metal_io_surface_info_ext = 1000311009,
    export_metal_shared_event_info_ext = 1000311010,
    import_metal_shared_event_info_ext = 1000311011,
    memory_barrier_2 = 1000314000,
    buffer_memory_barrier_2 = 1000314001,
    image_memory_barrier_2 = 1000314002,
    dependency_info = 1000314003,
    submit_info_2 = 1000314004,
    semaphore_submit_info = 1000314005,
    command_buffer_submit_info = 1000314006,
    physical_device_synchronization_2_features = 1000314007,
    queue_family_checkpoint_properties_2_nv = 1000314008,
    checkpoint_data_2_nv = 1000314009,
    physical_device_descriptor_buffer_properties_ext = 1000316000,
    physical_device_descriptor_buffer_density_map_properties_ext = 1000316001,
    physical_device_descriptor_buffer_features_ext = 1000316002,
    descriptor_address_info_ext = 1000316003,
    descriptor_get_info_ext = 1000316004,
    buffer_capture_descriptor_data_info_ext = 1000316005,
    image_capture_descriptor_data_info_ext = 1000316006,
    image_view_capture_descriptor_data_info_ext = 1000316007,
    sampler_capture_descriptor_data_info_ext = 1000316008,
    acceleration_structure_capture_descriptor_data_info_ext = 1000316009,
    opaque_capture_descriptor_data_create_info_ext = 1000316010,
    descriptor_buffer_binding_info_ext = 1000316011,
    descriptor_buffer_binding_push_descriptor_buffer_handle_ext = 1000316012,
    physical_device_graphics_pipeline_library_features_ext = 1000320000,
    physical_device_graphics_pipeline_library_properties_ext = 1000320001,
    graphics_pipeline_library_create_info_ext = 1000320002,
    physical_device_shader_early_and_late_fragment_tests_features_amd = 1000321000,
    physical_device_fragment_shader_barycentric_properties_khr = 1000322000,
    physical_device_shader_subgroup_uniform_control_flow_features_khr = 1000323000,
    physical_device_zero_initialize_workgroup_memory_features = 1000325000,
    physical_device_fragment_shading_rate_enums_properties_nv = 1000326000,
    physical_device_fragment_shading_rate_enums_features_nv = 1000326001,
    pipeline_fragment_shading_rate_enum_state_create_info_nv = 1000326002,
    acceleration_structure_geometry_motion_triangles_data_nv = 1000327000,
    physical_device_ray_tracing_motion_blur_features_nv = 1000327001,
    acceleration_structure_motion_info_nv = 1000327002,
    physical_device_mesh_shader_features_ext = 1000328000,
    physical_device_mesh_shader_properties_ext = 1000328001,
    physical_device_ycbcr_2_plane_444_formats_features_ext = 1000330000,
    physical_device_fragment_density_map_2_features_ext = 1000332000,
    physical_device_fragment_density_map_2_properties_ext = 1000332001,
    copy_command_transform_info_qcom = 1000333000,
    physical_device_image_robustness_features = 1000335000,
    physical_device_workgroup_memory_explicit_layout_features_khr = 1000336000,
    copy_buffer_info_2 = 1000337000,
    copy_image_info_2 = 1000337001,
    copy_buffer_to_image_info_2 = 1000337002,
    copy_image_to_buffer_info_2 = 1000337003,
    blit_image_info_2 = 1000337004,
    resolve_image_info_2 = 1000337005,
    buffer_copy_2 = 1000337006,
    image_copy_2 = 1000337007,
    image_blit_2 = 1000337008,
    buffer_image_copy_2 = 1000337009,
    image_resolve_2 = 1000337010,
    physical_device_image_compression_control_features_ext = 1000338000,
    image_compression_control_ext = 1000338001,
    subresource_layout_2 = 1000338002,
    image_subresource_2 = 1000338003,
    image_compression_properties_ext = 1000338004,
    physical_device_attachment_feedback_loop_layout_features_ext = 1000339000,
    physical_device_4444_formats_features_ext = 1000340000,
    physical_device_fault_features_ext = 1000341000,
    device_fault_counts_ext = 1000341001,
    device_fault_info_ext = 1000341002,
    physical_device_rasterization_order_attachment_access_features_arm = 1000342000,
    physical_device_rgba10x6_formats_features_ext = 1000344000,
    directfb_surface_create_info_ext = 1000346000,
    physical_device_ray_tracing_pipeline_features_khr = 1000347000,
    physical_device_ray_tracing_pipeline_properties_khr = 1000347001,
    physical_device_ray_query_features_khr = 1000348013,
    physical_device_mutable_descriptor_type_features_ext = 1000351000,
    mutable_descriptor_type_create_info_ext = 1000351002,
    physical_device_vertex_input_dynamic_state_features_ext = 1000352000,
    vertex_input_binding_description_2_ext = 1000352001,
    vertex_input_attribute_description_2_ext = 1000352002,
    physical_device_drm_properties_ext = 1000353000,
    physical_device_address_binding_report_features_ext = 1000354000,
    device_address_binding_callback_data_ext = 1000354001,
    physical_device_depth_clip_control_features_ext = 1000355000,
    pipeline_viewport_depth_clip_control_create_info_ext = 1000355001,
    physical_device_primitive_topology_list_restart_features_ext = 1000356000,
    format_properties_3 = 1000360000,
    physical_device_present_mode_fifo_latest_ready_features_ext = 1000361000,
    import_memory_zircon_handle_info_fuchsia = 1000364000,
    memory_zircon_handle_properties_fuchsia = 1000364001,
    memory_get_zircon_handle_info_fuchsia = 1000364002,
    import_semaphore_zircon_handle_info_fuchsia = 1000365000,
    semaphore_get_zircon_handle_info_fuchsia = 1000365001,
    buffer_collection_create_info_fuchsia = 1000366000,
    import_memory_buffer_collection_fuchsia = 1000366001,
    buffer_collection_image_create_info_fuchsia = 1000366002,
    buffer_collection_properties_fuchsia = 1000366003,
    buffer_constraints_info_fuchsia = 1000366004,
    buffer_collection_buffer_create_info_fuchsia = 1000366005,
    image_constraints_info_fuchsia = 1000366006,
    image_format_constraints_info_fuchsia = 1000366007,
    sysmem_color_space_fuchsia = 1000366008,
    buffer_collection_constraints_info_fuchsia = 1000366009,
    subpass_shading_pipeline_create_info_huawei = 1000369000,
    physical_device_subpass_shading_features_huawei = 1000369001,
    physical_device_subpass_shading_properties_huawei = 1000369002,
    physical_device_invocation_mask_features_huawei = 1000370000,
    memory_get_remote_address_info_nv = 1000371000,
    physical_device_external_memory_rdma_features_nv = 1000371001,
    pipeline_properties_identifier_ext = 1000372000,
    physical_device_pipeline_properties_features_ext = 1000372001,
    physical_device_frame_boundary_features_ext = 1000375000,
    frame_boundary_ext = 1000375001,
    physical_device_multisampled_render_to_single_sampled_features_ext = 1000376000,
    subpass_resolve_performance_query_ext = 1000376001,
    multisampled_render_to_single_sampled_info_ext = 1000376002,
    physical_device_extended_dynamic_state_2_features_ext = 1000377000,
    screen_surface_create_info_qnx = 1000378000,
    physical_device_color_write_enable_features_ext = 1000381000,
    pipeline_color_write_create_info_ext = 1000381001,
    physical_device_primitives_generated_query_features_ext = 1000382000,
    physical_device_ray_tracing_maintenance_1_features_khr = 1000386000,
    physical_device_global_priority_query_features = 1000388000,
    queue_family_global_priority_properties = 1000388001,
    physical_device_image_view_min_lod_features_ext = 1000391000,
    image_view_min_lod_create_info_ext = 1000391001,
    physical_device_multi_draw_features_ext = 1000392000,
    physical_device_multi_draw_properties_ext = 1000392001,
    physical_device_image_2d_view_of_3d_features_ext = 1000393000,
    physical_device_shader_tile_image_features_ext = 1000395000,
    physical_device_shader_tile_image_properties_ext = 1000395001,
    micromap_build_info_ext = 1000396000,
    micromap_version_info_ext = 1000396001,
    copy_micromap_info_ext = 1000396002,
    copy_micromap_to_memory_info_ext = 1000396003,
    copy_memory_to_micromap_info_ext = 1000396004,
    physical_device_opacity_micromap_features_ext = 1000396005,
    physical_device_opacity_micromap_properties_ext = 1000396006,
    micromap_create_info_ext = 1000396007,
    micromap_build_sizes_info_ext = 1000396008,
    acceleration_structure_triangles_opacity_micromap_ext = 1000396009,
    physical_device_cluster_culling_shader_features_huawei = 1000404000,
    physical_device_cluster_culling_shader_properties_huawei = 1000404001,
    physical_device_cluster_culling_shader_vrs_features_huawei = 1000404002,
    physical_device_border_color_swizzle_features_ext = 1000411000,
    sampler_border_color_component_mapping_create_info_ext = 1000411001,
    physical_device_pageable_device_local_memory_features_ext = 1000412000,
    physical_device_maintenance_4_features = 1000413000,
    physical_device_maintenance_4_properties = 1000413001,
    device_buffer_memory_requirements = 1000413002,
    device_image_memory_requirements = 1000413003,
    physical_device_shader_core_properties_arm = 1000415000,
    physical_device_shader_subgroup_rotate_features = 1000416000,
    device_queue_shader_core_control_create_info_arm = 1000417000,
    physical_device_scheduling_controls_features_arm = 1000417001,
    physical_device_scheduling_controls_properties_arm = 1000417002,
    physical_device_image_sliced_view_of_3d_features_ext = 1000418000,
    image_view_sliced_create_info_ext = 1000418001,
    physical_device_descriptor_set_host_mapping_features_valve = 1000420000,
    descriptor_set_binding_reference_valve = 1000420001,
    descriptor_set_layout_host_mapping_info_valve = 1000420002,
    physical_device_depth_clamp_zero_one_features_ext = 1000421000,
    physical_device_non_seamless_cube_map_features_ext = 1000422000,
    physical_device_render_pass_striped_features_arm = 1000424000,
    physical_device_render_pass_striped_properties_arm = 1000424001,
    render_pass_stripe_begin_info_arm = 1000424002,
    render_pass_stripe_info_arm = 1000424003,
    render_pass_stripe_submit_info_arm = 1000424004,
    physical_device_fragment_density_map_offset_features_qcom = 1000425000,
    physical_device_fragment_density_map_offset_properties_qcom = 1000425001,
    subpass_fragment_density_map_offset_end_info_qcom = 1000425002,
    physical_device_copy_memory_indirect_features_nv = 1000426000,
    physical_device_copy_memory_indirect_properties_nv = 1000426001,
    physical_device_memory_decompression_features_nv = 1000427000,
    physical_device_memory_decompression_properties_nv = 1000427001,
    physical_device_device_generated_commands_compute_features_nv = 1000428000,
    compute_pipeline_indirect_buffer_info_nv = 1000428001,
    pipeline_indirect_device_address_info_nv = 1000428002,
    physical_device_ray_tracing_linear_swept_spheres_features_nv = 1000429008,
    acceleration_structure_geometry_linear_swept_spheres_data_nv = 1000429009,
    acceleration_structure_geometry_spheres_data_nv = 1000429010,
    physical_device_linear_color_attachment_features_nv = 1000430000,
    physical_device_shader_maximal_reconvergence_features_khr = 1000434000,
    physical_device_image_compression_control_swapchain_features_ext = 1000437000,
    physical_device_image_processing_features_qcom = 1000440000,
    physical_device_image_processing_properties_qcom = 1000440001,
    image_view_sample_weight_create_info_qcom = 1000440002,
    physical_device_nested_command_buffer_features_ext = 1000451000,
    physical_device_nested_command_buffer_properties_ext = 1000451001,
    external_memory_acquire_unmodified_ext = 1000453000,
    physical_device_extended_dynamic_state_3_features_ext = 1000455000,
    physical_device_extended_dynamic_state_3_properties_ext = 1000455001,
    physical_device_subpass_merge_feedback_features_ext = 1000458000,
    render_pass_creation_control_ext = 1000458001,
    render_pass_creation_feedback_create_info_ext = 1000458002,
    render_pass_subpass_feedback_create_info_ext = 1000458003,
    direct_driver_loading_info_lunarg = 1000459000,
    direct_driver_loading_list_lunarg = 1000459001,
    physical_device_shader_module_identifier_features_ext = 1000462000,
    physical_device_shader_module_identifier_properties_ext = 1000462001,
    pipeline_shader_stage_module_identifier_create_info_ext = 1000462002,
    shader_module_identifier_ext = 1000462003,
    physical_device_optical_flow_features_nv = 1000464000,
    physical_device_optical_flow_properties_nv = 1000464001,
    optical_flow_image_format_info_nv = 1000464002,
    optical_flow_image_format_properties_nv = 1000464003,
    optical_flow_session_create_info_nv = 1000464004,
    optical_flow_execute_info_nv = 1000464005,
    optical_flow_session_create_private_data_info_nv = 1000464010,
    physical_device_legacy_dithering_features_ext = 1000465000,
    physical_device_pipeline_protected_access_features = 1000466000,
    physical_device_external_format_resolve_features_android = 1000468000,
    physical_device_external_format_resolve_properties_android = 1000468001,
    android_hardware_buffer_format_resolve_properties_android = 1000468002,
    physical_device_maintenance_5_features = 1000470000,
    physical_device_maintenance_5_properties = 1000470001,
    rendering_area_info = 1000470003,
    device_image_subresource_info = 1000470004,
    pipeline_create_flags_2_create_info = 1000470005,
    buffer_usage_flags_2_create_info = 1000470006,
    physical_device_anti_lag_features_amd = 1000476000,
    anti_lag_data_amd = 1000476001,
    anti_lag_presentation_info_amd = 1000476002,
    physical_device_ray_tracing_position_fetch_features_khr = 1000481000,
    physical_device_shader_object_features_ext = 1000482000,
    physical_device_shader_object_properties_ext = 1000482001,
    shader_create_info_ext = 1000482002,
    physical_device_pipeline_binary_features_khr = 1000483000,
    pipeline_binary_create_info_khr = 1000483001,
    pipeline_binary_info_khr = 1000483002,
    pipeline_binary_key_khr = 1000483003,
    physical_device_pipeline_binary_properties_khr = 1000483004,
    release_captured_pipeline_data_info_khr = 1000483005,
    pipeline_binary_data_info_khr = 1000483006,
    pipeline_create_info_khr = 1000483007,
    device_pipeline_binary_internal_cache_control_khr = 1000483008,
    pipeline_binary_handles_info_khr = 1000483009,
    physical_device_tile_properties_features_qcom = 1000484000,
    tile_properties_qcom = 1000484001,
    physical_device_amigo_profiling_features_sec = 1000485000,
    amigo_profiling_submit_info_sec = 1000485001,
    physical_device_multiview_per_view_viewports_features_qcom = 1000488000,
    physical_device_ray_tracing_invocation_reorder_features_nv = 1000490000,
    physical_device_ray_tracing_invocation_reorder_properties_nv = 1000490001,
    physical_device_cooperative_vector_features_nv = 1000491000,
    physical_device_cooperative_vector_properties_nv = 1000491001,
    cooperative_vector_properties_nv = 1000491002,
    convert_cooperative_vector_matrix_info_nv = 1000491004,
    physical_device_extended_sparse_address_space_features_nv = 1000492000,
    physical_device_extended_sparse_address_space_properties_nv = 1000492001,
    physical_device_legacy_vertex_attributes_features_ext = 1000495000,
    physical_device_legacy_vertex_attributes_properties_ext = 1000495001,
    layer_settings_create_info_ext = 1000496000,
    physical_device_shader_core_builtins_features_arm = 1000497000,
    physical_device_shader_core_builtins_properties_arm = 1000497001,
    physical_device_pipeline_library_group_handles_features_ext = 1000498000,
    physical_device_dynamic_rendering_unused_attachments_features_ext = 1000499000,
    latency_sleep_mode_info_nv = 1000505000,
    latency_sleep_info_nv = 1000505001,
    set_latency_marker_info_nv = 1000505002,
    get_latency_marker_info_nv = 1000505003,
    latency_timings_frame_report_nv = 1000505004,
    latency_submission_present_id_nv = 1000505005,
    out_of_band_queue_type_info_nv = 1000505006,
    swapchain_latency_create_info_nv = 1000505007,
    latency_surface_capabilities_nv = 1000505008,
    physical_device_cooperative_matrix_features_khr = 1000506000,
    cooperative_matrix_properties_khr = 1000506001,
    physical_device_cooperative_matrix_properties_khr = 1000506002,
    physical_device_multiview_per_view_render_areas_features_qcom = 1000510000,
    multiview_per_view_render_areas_render_pass_begin_info_qcom = 1000510001,
    physical_device_compute_shader_derivatives_properties_khr = 1000511000,
    video_decode_av1_capabilities_khr = 1000512000,
    video_decode_av1_picture_info_khr = 1000512001,
    video_decode_av1_profile_info_khr = 1000512003,
    video_decode_av1_session_parameters_create_info_khr = 1000512004,
    video_decode_av1_dpb_slot_info_khr = 1000512005,
    video_encode_av1_capabilities_khr = 1000513000,
    video_encode_av1_session_parameters_create_info_khr = 1000513001,
    video_encode_av1_picture_info_khr = 1000513002,
    video_encode_av1_dpb_slot_info_khr = 1000513003,
    physical_device_video_encode_av1_features_khr = 1000513004,
    video_encode_av1_profile_info_khr = 1000513005,
    video_encode_av1_rate_control_info_khr = 1000513006,
    video_encode_av1_rate_control_layer_info_khr = 1000513007,
    video_encode_av1_quality_level_properties_khr = 1000513008,
    video_encode_av1_session_create_info_khr = 1000513009,
    video_encode_av1_gop_remaining_frame_info_khr = 1000513010,
    physical_device_video_maintenance_1_features_khr = 1000515000,
    video_inline_query_info_khr = 1000515001,
    physical_device_per_stage_descriptor_set_features_nv = 1000516000,
    physical_device_image_processing_2_features_qcom = 1000518000,
    physical_device_image_processing_2_properties_qcom = 1000518001,
    sampler_block_match_window_create_info_qcom = 1000518002,
    sampler_cubic_weights_create_info_qcom = 1000519000,
    physical_device_cubic_weights_features_qcom = 1000519001,
    blit_image_cubic_weights_info_qcom = 1000519002,
    physical_device_ycbcr_degamma_features_qcom = 1000520000,
    sampler_ycbcr_conversion_ycbcr_degamma_create_info_qcom = 1000520001,
    physical_device_cubic_clamp_features_qcom = 1000521000,
    physical_device_attachment_feedback_loop_dynamic_state_features_ext = 1000524000,
    physical_device_vertex_attribute_divisor_properties = 1000525000,
    physical_device_shader_float_controls_2_features = 1000528000,
    screen_buffer_properties_qnx = 1000529000,
    screen_buffer_format_properties_qnx = 1000529001,
    import_screen_buffer_info_qnx = 1000529002,
    external_format_qnx = 1000529003,
    physical_device_external_memory_screen_buffer_features_qnx = 1000529004,
    physical_device_layered_driver_properties_msft = 1000530000,
    physical_device_shader_expect_assume_features = 1000544000,
    physical_device_maintenance_6_features = 1000545000,
    physical_device_maintenance_6_properties = 1000545001,
    bind_memory_status = 1000545002,
    bind_descriptor_sets_info = 1000545003,
    push_constants_info = 1000545004,
    push_descriptor_set_info = 1000545005,
    push_descriptor_set_with_template_info = 1000545006,
    set_descriptor_buffer_offsets_info_ext = 1000545007,
    bind_descriptor_buffer_embedded_samplers_info_ext = 1000545008,
    physical_device_descriptor_pool_overallocation_features_nv = 1000546000,
    display_surface_stereo_create_info_nv = 1000551000,
    display_mode_stereo_properties_nv = 1000551001,
    video_encode_quantization_map_capabilities_khr = 1000553000,
    video_format_quantization_map_properties_khr = 1000553001,
    video_encode_quantization_map_info_khr = 1000553002,
    video_encode_h264_quantization_map_capabilities_khr = 1000553003,
    video_encode_h265_quantization_map_capabilities_khr = 1000553004,
    video_encode_quantization_map_session_parameters_create_info_khr = 1000553005,
    video_format_h265_quantization_map_properties_khr = 1000553006,
    video_encode_av1_quantization_map_capabilities_khr = 1000553007,
    video_format_av1_quantization_map_properties_khr = 1000553008,
    physical_device_video_encode_quantization_map_features_khr = 1000553009,
    physical_device_raw_access_chains_features_nv = 1000555000,
    physical_device_shader_relaxed_extended_instruction_features_khr = 1000558000,
    physical_device_command_buffer_inheritance_features_nv = 1000559000,
    physical_device_maintenance_7_features_khr = 1000562000,
    physical_device_maintenance_7_properties_khr = 1000562001,
    physical_device_layered_api_properties_list_khr = 1000562002,
    physical_device_layered_api_properties_khr = 1000562003,
    physical_device_layered_api_vulkan_properties_khr = 1000562004,
    physical_device_shader_atomic_float16_vector_features_nv = 1000563000,
    physical_device_shader_replicated_composites_features_ext = 1000564000,
    physical_device_ray_tracing_validation_features_nv = 1000568000,
    physical_device_cluster_acceleration_structure_features_nv = 1000569000,
    physical_device_cluster_acceleration_structure_properties_nv = 1000569001,
    cluster_acceleration_structure_clusters_bottom_level_input_nv = 1000569002,
    cluster_acceleration_structure_triangle_cluster_input_nv = 1000569003,
    cluster_acceleration_structure_move_objects_input_nv = 1000569004,
    cluster_acceleration_structure_input_info_nv = 1000569005,
    cluster_acceleration_structure_commands_info_nv = 1000569006,
    ray_tracing_pipeline_cluster_acceleration_structure_create_info_nv = 1000569007,
    physical_device_partitioned_acceleration_structure_features_nv = 1000570000,
    physical_device_partitioned_acceleration_structure_properties_nv = 1000570001,
    write_descriptor_set_partitioned_acceleration_structure_nv = 1000570002,
    partitioned_acceleration_structure_instances_input_nv = 1000570003,
    build_partitioned_acceleration_structure_info_nv = 1000570004,
    partitioned_acceleration_structure_flags_nv = 1000570005,
    physical_device_device_generated_commands_features_ext = 1000572000,
    physical_device_device_generated_commands_properties_ext = 1000572001,
    generated_commands_memory_requirements_info_ext = 1000572002,
    indirect_execution_set_create_info_ext = 1000572003,
    generated_commands_info_ext = 1000572004,
    indirect_commands_layout_create_info_ext = 1000572006,
    indirect_commands_layout_token_ext = 1000572007,
    write_indirect_execution_set_pipeline_ext = 1000572008,
    write_indirect_execution_set_shader_ext = 1000572009,
    indirect_execution_set_pipeline_info_ext = 1000572010,
    indirect_execution_set_shader_info_ext = 1000572011,
    indirect_execution_set_shader_layout_info_ext = 1000572012,
    generated_commands_pipeline_info_ext = 1000572013,
    generated_commands_shader_info_ext = 1000572014,
    physical_device_maintenance_8_features_khr = 1000574000,
    memory_barrier_access_flags_3_khr = 1000574002,
    physical_device_image_alignment_control_features_mesa = 1000575000,
    physical_device_image_alignment_control_properties_mesa = 1000575001,
    image_alignment_control_create_info_mesa = 1000575002,
    physical_device_depth_clamp_control_features_ext = 1000582000,
    pipeline_viewport_depth_clamp_control_create_info_ext = 1000582001,
    physical_device_video_maintenance_2_features_khr = 1000586000,
    video_decode_h264_inline_session_parameters_info_khr = 1000586001,
    video_decode_h265_inline_session_parameters_info_khr = 1000586002,
    video_decode_av1_inline_session_parameters_info_khr = 1000586003,
    physical_device_hdr_vivid_features_huawei = 1000590000,
    hdr_vivid_dynamic_metadata_huawei = 1000590001,
    physical_device_cooperative_matrix_2_features_nv = 1000593000,
    cooperative_matrix_flexible_dimensions_properties_nv = 1000593001,
    physical_device_cooperative_matrix_2_properties_nv = 1000593002,
    physical_device_pipeline_opacity_micromap_features_arm = 1000596000,
    import_memory_metal_handle_info_ext = 1000602000,
    memory_metal_handle_properties_ext = 1000602001,
    memory_get_metal_handle_info_ext = 1000602002,
    physical_device_vertex_attribute_robustness_features_ext = 1000608000,
    max_enum = 2147483647,
    const Self = @This();
    pub const image_subresource_2_ext = Self.image_subresource_2_khr;
    pub const subresource_layout_2_ext = Self.subresource_layout_2_khr;
    pub const physical_device_index_type_uint8_features_ext = Self.physical_device_index_type_uint8_features_khr;
    pub const physical_device_line_rasterization_properties_ext = Self.physical_device_line_rasterization_properties_khr;
    pub const pipeline_rasterization_line_state_create_info_ext = Self.pipeline_rasterization_line_state_create_info_khr;
    pub const physical_device_line_rasterization_features_ext = Self.physical_device_line_rasterization_features_khr;
    pub const buffer_device_address_info_ext = Self.buffer_device_address_info_khr;
    pub const pipeline_shader_stage_required_subgroup_size_create_info_ext = Self.shader_required_subgroup_size_create_info_ext;
    pub const physical_device_vertex_attribute_divisor_features_ext = Self.physical_device_vertex_attribute_divisor_features_khr;
    pub const pipeline_vertex_input_divisor_state_create_info_ext = Self.pipeline_vertex_input_divisor_state_create_info_khr;
    pub const queue_family_global_priority_properties_khr = Self.queue_family_global_priority_properties_ext;
    pub const physical_device_global_priority_query_features_khr = Self.physical_device_global_priority_query_features_ext;
    pub const device_queue_global_priority_create_info_ext = Self.device_queue_global_priority_create_info_khr;
    pub const physical_device_variable_pointers_features_khr = Self.physical_device_variable_pointer_features_khr;
    pub const physical_device_shader_float16_int8_features_khr = Self.physical_device_float16_int8_features_khr;
    pub const physical_device_variable_pointer_features_khr = Self.physical_device_variable_pointer_features;
    pub const physical_device_depth_clamp_zero_one_features_khr = Self.physical_device_depth_clamp_zero_one_features_ext;
    pub const calibrated_timestamp_info_khr = Self.calibrated_timestamp_info_ext;
    pub const physical_device_compute_shader_derivatives_features_khr = Self.physical_device_compute_shader_derivatives_features_nv;
    pub const mutable_descriptor_type_create_info_valve = Self.mutable_descriptor_type_create_info_ext;
    pub const physical_device_mutable_descriptor_type_features_valve = Self.physical_device_mutable_descriptor_type_features_ext;
    pub const physical_device_rasterization_order_attachment_access_features_ext = Self.physical_device_rasterization_order_attachment_access_features_arm;
    pub const physical_device_fragment_shader_barycentric_features_khr = Self.physical_device_fragment_shader_barycentric_features_nv;
    pub const pipeline_info_khr = Self.pipeline_info_ext;
    pub const physical_device_buffer_device_address_features_ext = Self.physical_device_buffer_address_features_ext;
    pub const query_pool_performance_query_create_info_intel = Self.query_pool_create_info_intel;
    pub const attachment_sample_count_info_amd = Self.attachment_sample_count_info_nv;
    pub const surface_capabilities_2_ext = Self.surface_capabilities2_ext;
    pub const debug_report_callback_create_info_ext = Self.debug_report_create_info_ext;
    pub const host_image_copy_device_performance_query_ext = Self.host_image_copy_device_performance_query;
    pub const subresource_host_memcpy_size_ext = Self.subresource_host_memcpy_size;
    pub const copy_image_to_image_info_ext = Self.copy_image_to_image_info;
    pub const host_image_layout_transition_info_ext = Self.host_image_layout_transition_info;
    pub const copy_memory_to_image_info_ext = Self.copy_memory_to_image_info;
    pub const copy_image_to_memory_info_ext = Self.copy_image_to_memory_info;
    pub const image_to_memory_copy_ext = Self.image_to_memory_copy;
    pub const memory_to_image_copy_ext = Self.memory_to_image_copy;
    pub const physical_device_host_image_copy_properties_ext = Self.physical_device_host_image_copy_properties;
    pub const physical_device_host_image_copy_features_ext = Self.physical_device_host_image_copy_features;
    pub const physical_device_pipeline_robustness_properties_ext = Self.physical_device_pipeline_robustness_properties;
    pub const physical_device_pipeline_robustness_features_ext = Self.physical_device_pipeline_robustness_features;
    pub const pipeline_robustness_create_info_ext = Self.pipeline_robustness_create_info;
    pub const physical_device_pipeline_protected_access_features_ext = Self.physical_device_pipeline_protected_access_features;
    pub const push_descriptor_set_with_template_info_khr = Self.push_descriptor_set_with_template_info;
    pub const push_descriptor_set_info_khr = Self.push_descriptor_set_info;
    pub const push_constants_info_khr = Self.push_constants_info;
    pub const bind_descriptor_sets_info_khr = Self.bind_descriptor_sets_info;
    pub const bind_memory_status_khr = Self.bind_memory_status;
    pub const physical_device_maintenance_6_properties_khr = Self.physical_device_maintenance_6_properties;
    pub const physical_device_maintenance_6_features_khr = Self.physical_device_maintenance_6_features;
    pub const rendering_input_attachment_index_info_khr = Self.rendering_input_attachment_index_info;
    pub const rendering_attachment_location_info_khr = Self.rendering_attachment_location_info;
    pub const physical_device_dynamic_rendering_local_read_features_khr = Self.physical_device_dynamic_rendering_local_read_features;
    pub const physical_device_push_descriptor_properties_khr = Self.physical_device_push_descriptor_properties;
    pub const buffer_usage_flags_2_create_info_khr = Self.buffer_usage_flags_2_create_info;
    pub const pipeline_create_flags_2_create_info_khr = Self.pipeline_create_flags_2_create_info;
    pub const image_subresource_2_khr = Self.image_subresource_2;
    pub const subresource_layout_2_khr = Self.subresource_layout_2;
    pub const device_image_subresource_info_khr = Self.device_image_subresource_info;
    pub const rendering_area_info_khr = Self.rendering_area_info;
    pub const physical_device_maintenance_5_properties_khr = Self.physical_device_maintenance_5_properties;
    pub const physical_device_maintenance_5_features_khr = Self.physical_device_maintenance_5_features;
    pub const memory_unmap_info_khr = Self.memory_unmap_info;
    pub const memory_map_info_khr = Self.memory_map_info;
    pub const physical_device_index_type_uint8_features_khr = Self.physical_device_index_type_uint8_features;
    pub const physical_device_vertex_attribute_divisor_features_khr = Self.physical_device_vertex_attribute_divisor_features;
    pub const pipeline_vertex_input_divisor_state_create_info_khr = Self.pipeline_vertex_input_divisor_state_create_info;
    pub const physical_device_vertex_attribute_divisor_properties_khr = Self.physical_device_vertex_attribute_divisor_properties;
    pub const physical_device_line_rasterization_properties_khr = Self.physical_device_line_rasterization_properties;
    pub const pipeline_rasterization_line_state_create_info_khr = Self.pipeline_rasterization_line_state_create_info;
    pub const physical_device_line_rasterization_features_khr = Self.physical_device_line_rasterization_features;
    pub const physical_device_shader_expect_assume_features_khr = Self.physical_device_shader_expect_assume_features;
    pub const physical_device_shader_float_controls_2_features_khr = Self.physical_device_shader_float_controls_2_features;
    pub const physical_device_shader_subgroup_rotate_features_khr = Self.physical_device_shader_subgroup_rotate_features;
    pub const queue_family_global_priority_properties_ext = Self.queue_family_global_priority_properties;
    pub const physical_device_global_priority_query_features_ext = Self.physical_device_global_priority_query_features;
    pub const device_queue_global_priority_create_info_khr = Self.device_queue_global_priority_create_info;
    pub const device_image_memory_requirements_khr = Self.device_image_memory_requirements;
    pub const device_buffer_memory_requirements_khr = Self.device_buffer_memory_requirements;
    pub const physical_device_maintenance_4_properties_khr = Self.physical_device_maintenance_4_properties;
    pub const physical_device_maintenance_4_features_khr = Self.physical_device_maintenance_4_features;
    pub const format_properties_3_khr = Self.format_properties_3;
    pub const physical_device_texel_buffer_alignment_properties_ext = Self.physical_device_texel_buffer_alignment_properties;
    pub const physical_device_shader_integer_dot_product_properties_khr = Self.physical_device_shader_integer_dot_product_properties;
    pub const physical_device_shader_integer_dot_product_features_khr = Self.physical_device_shader_integer_dot_product_features;
    pub const command_buffer_inheritance_rendering_info_khr = Self.command_buffer_inheritance_rendering_info;
    pub const physical_device_dynamic_rendering_features_khr = Self.physical_device_dynamic_rendering_features;
    pub const pipeline_rendering_create_info_khr = Self.pipeline_rendering_create_info;
    pub const rendering_attachment_info_khr = Self.rendering_attachment_info;
    pub const rendering_info_khr = Self.rendering_info;
    pub const physical_device_texture_compression_astc_hdr_features_ext = Self.physical_device_texture_compression_astc_hdr_features;
    pub const descriptor_pool_inline_uniform_block_create_info_ext = Self.descriptor_pool_inline_uniform_block_create_info;
    pub const write_descriptor_set_inline_uniform_block_ext = Self.write_descriptor_set_inline_uniform_block;
    pub const physical_device_inline_uniform_block_properties_ext = Self.physical_device_inline_uniform_block_properties;
    pub const physical_device_inline_uniform_block_features_ext = Self.physical_device_inline_uniform_block_features;
    pub const physical_device_subgroup_size_control_features_ext = Self.physical_device_subgroup_size_control_features;
    pub const pipeline_shader_stage_required_subgroup_size_create_info = Self.shader_required_subgroup_size_create_info_ext;
    pub const physical_device_subgroup_size_control_properties_ext = Self.physical_device_subgroup_size_control_properties;
    pub const image_resolve_2_khr = Self.image_resolve_2;
    pub const buffer_image_copy_2_khr = Self.buffer_image_copy_2;
    pub const image_blit_2_khr = Self.image_blit_2;
    pub const image_copy_2_khr = Self.image_copy_2;
    pub const buffer_copy_2_khr = Self.buffer_copy_2;
    pub const resolve_image_info_2_khr = Self.resolve_image_info_2;
    pub const blit_image_info_2_khr = Self.blit_image_info_2;
    pub const copy_image_to_buffer_info_2_khr = Self.copy_image_to_buffer_info_2;
    pub const copy_buffer_to_image_info_2_khr = Self.copy_buffer_to_image_info_2;
    pub const copy_image_info_2_khr = Self.copy_image_info_2;
    pub const copy_buffer_info_2_khr = Self.copy_buffer_info_2;
    pub const physical_device_image_robustness_features_ext = Self.physical_device_image_robustness_features;
    pub const physical_device_zero_initialize_workgroup_memory_features_khr = Self.physical_device_zero_initialize_workgroup_memory_features;
    pub const physical_device_synchronization_2_features_khr = Self.physical_device_synchronization_2_features;
    pub const command_buffer_submit_info_khr = Self.command_buffer_submit_info;
    pub const semaphore_submit_info_khr = Self.semaphore_submit_info;
    pub const submit_info_2_khr = Self.submit_info_2;
    pub const dependency_info_khr = Self.dependency_info;
    pub const image_memory_barrier_2_khr = Self.image_memory_barrier_2;
    pub const buffer_memory_barrier_2_khr = Self.buffer_memory_barrier_2;
    pub const memory_barrier_2_khr = Self.memory_barrier_2;
    pub const physical_device_pipeline_creation_cache_control_features_ext = Self.physical_device_pipeline_creation_cache_control_features;
    pub const private_data_slot_create_info_ext = Self.private_data_slot_create_info;
    pub const device_private_data_create_info_ext = Self.device_private_data_create_info;
    pub const physical_device_private_data_features_ext = Self.physical_device_private_data_features;
    pub const physical_device_shader_demote_to_helper_invocation_features_ext = Self.physical_device_shader_demote_to_helper_invocation_features;
    pub const physical_device_tool_properties_ext = Self.physical_device_tool_properties;
    pub const physical_device_shader_terminate_invocation_features_khr = Self.physical_device_shader_terminate_invocation_features;
    pub const pipeline_creation_feedback_create_info_ext = Self.pipeline_creation_feedback_create_info;
    pub const device_memory_opaque_capture_address_info_khr = Self.device_memory_opaque_capture_address_info;
    pub const memory_opaque_capture_address_allocate_info_khr = Self.memory_opaque_capture_address_allocate_info;
    pub const buffer_opaque_capture_address_create_info_khr = Self.buffer_opaque_capture_address_create_info;
    pub const buffer_device_address_info_khr = Self.buffer_device_address_info;
    pub const physical_device_buffer_device_address_features_khr = Self.physical_device_buffer_device_address_features;
    pub const semaphore_signal_info_khr = Self.semaphore_signal_info;
    pub const semaphore_wait_info_khr = Self.semaphore_wait_info;
    pub const timeline_semaphore_submit_info_khr = Self.timeline_semaphore_submit_info;
    pub const semaphore_type_create_info_khr = Self.semaphore_type_create_info;
    pub const physical_device_timeline_semaphore_properties_khr = Self.physical_device_timeline_semaphore_properties;
    pub const physical_device_timeline_semaphore_features_khr = Self.physical_device_timeline_semaphore_features;
    pub const physical_device_host_query_reset_features_ext = Self.physical_device_host_query_reset_features;
    pub const attachment_description_stencil_layout_khr = Self.attachment_description_stencil_layout;
    pub const attachment_reference_stencil_layout_khr = Self.attachment_reference_stencil_layout;
    pub const physical_device_separate_depth_stencil_layouts_features_khr = Self.physical_device_separate_depth_stencil_layouts_features;
    pub const physical_device_shader_subgroup_extended_types_features_khr = Self.physical_device_shader_subgroup_extended_types_features;
    pub const physical_device_uniform_buffer_standard_layout_features_khr = Self.physical_device_uniform_buffer_standard_layout_features;
    pub const render_pass_attachment_begin_info_khr = Self.render_pass_attachment_begin_info;
    pub const framebuffer_attachment_image_info_khr = Self.framebuffer_attachment_image_info;
    pub const framebuffer_attachments_create_info_khr = Self.framebuffer_attachments_create_info;
    pub const physical_device_imageless_framebuffer_features_khr = Self.physical_device_imageless_framebuffer_features;
    pub const physical_device_vulkan_memory_model_features_khr = Self.physical_device_vulkan_memory_model_features;
    pub const sampler_reduction_mode_create_info_ext = Self.sampler_reduction_mode_create_info;
    pub const physical_device_sampler_filter_minmax_properties_ext = Self.physical_device_sampler_filter_minmax_properties;
    pub const image_stencil_usage_create_info_ext = Self.image_stencil_usage_create_info;
    pub const physical_device_scalar_block_layout_features_ext = Self.physical_device_scalar_block_layout_features;
    pub const subpass_description_depth_stencil_resolve_khr = Self.subpass_description_depth_stencil_resolve;
    pub const physical_device_depth_stencil_resolve_properties_khr = Self.physical_device_depth_stencil_resolve_properties;
    pub const descriptor_set_variable_descriptor_count_layout_support_ext = Self.descriptor_set_variable_descriptor_count_layout_support;
    pub const descriptor_set_variable_descriptor_count_allocate_info_ext = Self.descriptor_set_variable_descriptor_count_allocate_info;
    pub const physical_device_descriptor_indexing_properties_ext = Self.physical_device_descriptor_indexing_properties;
    pub const physical_device_descriptor_indexing_features_ext = Self.physical_device_descriptor_indexing_features;
    pub const descriptor_set_layout_binding_flags_create_info_ext = Self.descriptor_set_layout_binding_flags_create_info;
    pub const physical_device_float_controls_properties_khr = Self.physical_device_float_controls_properties;
    pub const physical_device_shader_float16_int8_features = Self.physical_device_float16_int8_features_khr;
    pub const physical_device_shader_atomic_int64_features_khr = Self.physical_device_shader_atomic_int64_features;
    pub const physical_device_driver_properties_khr = Self.physical_device_driver_properties;
    pub const physical_device_8bit_storage_features_khr = Self.physical_device_8bit_storage_features;
    pub const subpass_end_info_khr = Self.subpass_end_info;
    pub const subpass_begin_info_khr = Self.subpass_begin_info;
    pub const render_pass_create_info_2_khr = Self.render_pass_create_info_2;
    pub const subpass_dependency_2_khr = Self.subpass_dependency_2;
    pub const subpass_description_2_khr = Self.subpass_description_2;
    pub const attachment_reference_2_khr = Self.attachment_reference_2;
    pub const attachment_description_2_khr = Self.attachment_description_2;
    pub const image_format_list_create_info_khr = Self.image_format_list_create_info;
    pub const physical_device_shader_draw_parameters_features = Self.physical_device_shader_draw_parameter_features;
    pub const descriptor_set_layout_support_khr = Self.descriptor_set_layout_support;
    pub const physical_device_maintenance_3_properties_khr = Self.physical_device_maintenance_3_properties;
    pub const external_semaphore_properties_khr = Self.external_semaphore_properties;
    pub const physical_device_external_semaphore_info_khr = Self.physical_device_external_semaphore_info;
    pub const export_semaphore_create_info_khr = Self.export_semaphore_create_info;
    pub const export_fence_create_info_khr = Self.export_fence_create_info;
    pub const external_fence_properties_khr = Self.external_fence_properties;
    pub const physical_device_external_fence_info_khr = Self.physical_device_external_fence_info;
    pub const export_memory_allocate_info_khr = Self.export_memory_allocate_info;
    pub const external_memory_image_create_info_khr = Self.external_memory_image_create_info;
    pub const external_memory_buffer_create_info_khr = Self.external_memory_buffer_create_info;
    pub const physical_device_id_properties_khr = Self.physical_device_id_properties;
    pub const external_buffer_properties_khr = Self.external_buffer_properties;
    pub const physical_device_external_buffer_info_khr = Self.physical_device_external_buffer_info;
    pub const external_image_format_properties_khr = Self.external_image_format_properties;
    pub const physical_device_external_image_format_info_khr = Self.physical_device_external_image_format_info;
    pub const descriptor_update_template_create_info_khr = Self.descriptor_update_template_create_info;
    pub const sampler_ycbcr_conversion_image_format_properties_khr = Self.sampler_ycbcr_conversion_image_format_properties;
    pub const physical_device_sampler_ycbcr_conversion_features_khr = Self.physical_device_sampler_ycbcr_conversion_features;
    pub const image_plane_memory_requirements_info_khr = Self.image_plane_memory_requirements_info;
    pub const bind_image_plane_memory_info_khr = Self.bind_image_plane_memory_info;
    pub const sampler_ycbcr_conversion_info_khr = Self.sampler_ycbcr_conversion_info;
    pub const sampler_ycbcr_conversion_create_info_khr = Self.sampler_ycbcr_conversion_create_info;
    pub const physical_device_variable_pointers_features = Self.physical_device_variable_pointer_features;
    pub const physical_device_multiview_properties_khr = Self.physical_device_multiview_properties;
    pub const physical_device_multiview_features_khr = Self.physical_device_multiview_features;
    pub const render_pass_multiview_create_info_khr = Self.render_pass_multiview_create_info;
    pub const pipeline_tessellation_domain_origin_state_create_info_khr = Self.pipeline_tessellation_domain_origin_state_create_info;
    pub const image_view_usage_create_info_khr = Self.image_view_usage_create_info;
    pub const render_pass_input_attachment_aspect_create_info_khr = Self.render_pass_input_attachment_aspect_create_info;
    pub const physical_device_point_clipping_properties_khr = Self.physical_device_point_clipping_properties;
    pub const physical_device_sparse_image_format_info_2_khr = Self.physical_device_sparse_image_format_info_2;
    pub const sparse_image_format_properties_2_khr = Self.sparse_image_format_properties_2;
    pub const physical_device_memory_properties_2_khr = Self.physical_device_memory_properties_2;
    pub const queue_family_properties_2_khr = Self.queue_family_properties_2;
    pub const physical_device_image_format_info_2_khr = Self.physical_device_image_format_info_2;
    pub const image_format_properties_2_khr = Self.image_format_properties_2;
    pub const format_properties_2_khr = Self.format_properties_2;
    pub const physical_device_properties_2_khr = Self.physical_device_properties_2;
    pub const physical_device_features_2_khr = Self.physical_device_features_2;
    pub const sparse_image_memory_requirements_2_khr = Self.sparse_image_memory_requirements_2;
    pub const memory_requirements_2_khr = Self.memory_requirements_2;
    pub const image_sparse_memory_requirements_info_2_khr = Self.image_sparse_memory_requirements_info_2;
    pub const image_memory_requirements_info_2_khr = Self.image_memory_requirements_info_2;
    pub const buffer_memory_requirements_info_2_khr = Self.buffer_memory_requirements_info_2;
    pub const device_group_device_create_info_khr = Self.device_group_device_create_info;
    pub const physical_device_group_properties_khr = Self.physical_device_group_properties;
    pub const bind_image_memory_device_group_info_khr = Self.bind_image_memory_device_group_info;
    pub const bind_buffer_memory_device_group_info_khr = Self.bind_buffer_memory_device_group_info;
    pub const device_group_bind_sparse_info_khr = Self.device_group_bind_sparse_info;
    pub const device_group_submit_info_khr = Self.device_group_submit_info;
    pub const device_group_command_buffer_begin_info_khr = Self.device_group_command_buffer_begin_info;
    pub const device_group_render_pass_begin_info_khr = Self.device_group_render_pass_begin_info;
    pub const memory_allocate_flags_info_khr = Self.memory_allocate_flags_info;
    pub const memory_dedicated_allocate_info_khr = Self.memory_dedicated_allocate_info;
    pub const memory_dedicated_requirements_khr = Self.memory_dedicated_requirements;
    pub const physical_device_16bit_storage_features_khr = Self.physical_device_16bit_storage_features;
    pub const bind_image_memory_info_khr = Self.bind_image_memory_info;
    pub const bind_buffer_memory_info_khr = Self.bind_buffer_memory_info;
};
pub const PipelineCacheHeaderVersion = enum(u32) {
    one = 1,
    max_enum = 2147483647,
};
pub const ImageLayout = enum(u32) {
    undefined = 0,
    general = 1,
    color_attachment_optimal = 2,
    depth_stencil_attachment_optimal = 3,
    depth_stencil_read_only_optimal = 4,
    shader_read_only_optimal = 5,
    transfer_src_optimal = 6,
    transfer_dst_optimal = 7,
    preinitialized = 8,
    present_src_khr = 1000001002,
    video_decode_dst_khr = 1000024000,
    video_decode_src_khr = 1000024001,
    video_decode_dpb_khr = 1000024002,
    shared_present_khr = 1000111000,
    depth_read_only_stencil_attachment_optimal = 1000117000,
    depth_attachment_stencil_read_only_optimal = 1000117001,
    shading_rate_optimal_nv = 1000164003,
    fragment_density_map_optimal_ext = 1000218000,
    rendering_local_read = 1000232000,
    depth_attachment_optimal = 1000241000,
    depth_read_only_optimal = 1000241001,
    stencil_attachment_optimal = 1000241002,
    stencil_read_only_optimal = 1000241003,
    video_encode_dst_khr = 1000299000,
    video_encode_src_khr = 1000299001,
    video_encode_dpb_khr = 1000299002,
    read_only_optimal = 1000314000,
    attachment_optimal = 1000314001,
    attachment_feedback_loop_optimal_ext = 1000339000,
    video_encode_quantization_map_khr = 1000553000,
    max_enum = 2147483647,
    const Self = @This();
    pub const fragment_shading_rate_attachment_optimal_khr = Self.shading_rate_optimal_nv;
    pub const rendering_local_read_khr = Self.rendering_local_read;
    pub const attachment_optimal_khr = Self.attachment_optimal;
    pub const read_only_optimal_khr = Self.read_only_optimal;
    pub const stencil_read_only_optimal_khr = Self.stencil_read_only_optimal;
    pub const stencil_attachment_optimal_khr = Self.stencil_attachment_optimal;
    pub const depth_read_only_optimal_khr = Self.depth_read_only_optimal;
    pub const depth_attachment_optimal_khr = Self.depth_attachment_optimal;
    pub const depth_attachment_stencil_read_only_optimal_khr = Self.depth_attachment_stencil_read_only_optimal;
    pub const depth_read_only_stencil_attachment_optimal_khr = Self.depth_read_only_stencil_attachment_optimal;
};
pub const ObjectType = enum(u32) {
    unknown = 0,
    instance = 1,
    physical_device = 2,
    device = 3,
    queue = 4,
    semaphore = 5,
    command_buffer = 6,
    fence = 7,
    device_memory = 8,
    buffer = 9,
    image = 10,
    event = 11,
    query_pool = 12,
    buffer_view = 13,
    image_view = 14,
    shader_module = 15,
    pipeline_cache = 16,
    pipeline_layout = 17,
    render_pass = 18,
    pipeline = 19,
    descriptor_set_layout = 20,
    sampler = 21,
    descriptor_pool = 22,
    descriptor_set = 23,
    framebuffer = 24,
    command_pool = 25,
    surface_khr = 1000000000,
    swapchain_khr = 1000001000,
    display_khr = 1000002000,
    display_mode_khr = 1000002001,
    debug_report_callback_ext = 1000011000,
    video_session_khr = 1000023000,
    video_session_parameters_khr = 1000023001,
    cu_module_nvx = 1000029000,
    cu_function_nvx = 1000029001,
    descriptor_update_template = 1000085000,
    debug_utils_messenger_ext = 1000128000,
    acceleration_structure_khr = 1000150000,
    sampler_ycbcr_conversion = 1000156000,
    validation_cache_ext = 1000160000,
    acceleration_structure_nv = 1000165000,
    performance_configuration_intel = 1000210000,
    deferred_operation_khr = 1000268000,
    indirect_commands_layout_nv = 1000277000,
    private_data_slot = 1000295000,
    cuda_module_nv = 1000307000,
    cuda_function_nv = 1000307001,
    buffer_collection_fuchsia = 1000366000,
    micromap_ext = 1000396000,
    optical_flow_session_nv = 1000464000,
    shader_ext = 1000482000,
    pipeline_binary_khr = 1000483000,
    indirect_commands_layout_ext = 1000572000,
    indirect_execution_set_ext = 1000572001,
    max_enum = 2147483647,
    const Self = @This();
    pub const private_data_slot_ext = Self.private_data_slot;
    pub const descriptor_update_template_khr = Self.descriptor_update_template;
    pub const sampler_ycbcr_conversion_khr = Self.sampler_ycbcr_conversion;
};
pub const VendorId = enum(u32) {
    khronos = 65536,
    viv = 65537,
    vsi = 65538,
    kazan = 65539,
    codeplay = 65540,
    mesa = 65541,
    pocl = 65542,
    mobileye = 65543,
    max_enum = 2147483647,
};
pub const SystemAllocationScope = enum(u32) {
    command = 0,
    object = 1,
    cache = 2,
    device = 3,
    instance = 4,
    max_enum = 2147483647,
};
pub const InternalAllocationType = enum(u32) {
    executable = 0,
    max_enum = 2147483647,
};
pub const Format = enum(u32) {
    g8b8g8r8_422_unorm_khr = 1000156000,
    b8g8r8g8_422_unorm_khr = 1000156001,
    g8_b8_r8_3plane_420_unorm_khr = 1000156002,
    g8_b8r8_2plane_420_unorm_khr = 1000156003,
    g8_b8_r8_3plane_422_unorm_khr = 1000156004,
    g8_b8r8_2plane_422_unorm_khr = 1000156005,
    g8_b8_r8_3plane_444_unorm_khr = 1000156006,
    r10x6_unorm_pack16_khr = 1000156007,
    r10x6g10x6_unorm_2pack16_khr = 1000156008,
    r10x6g10x6b10x6a10x6_unorm_4pack16_khr = 1000156009,
    g10x6b10x6g10x6r10x6_422_unorm_4pack16_khr = 1000156010,
    b10x6g10x6r10x6g10x6_422_unorm_4pack16_khr = 1000156011,
    g10x6_b10x6_r10x6_3plane_420_unorm_3pack16_khr = 1000156012,
    g10x6_b10x6r10x6_2plane_420_unorm_3pack16_khr = 1000156013,
    g10x6_b10x6_r10x6_3plane_422_unorm_3pack16_khr = 1000156014,
    g10x6_b10x6r10x6_2plane_422_unorm_3pack16_khr = 1000156015,
    g10x6_b10x6_r10x6_3plane_444_unorm_3pack16_khr = 1000156016,
    r12x4_unorm_pack16_khr = 1000156017,
    r12x4g12x4_unorm_2pack16_khr = 1000156018,
    r12x4g12x4b12x4a12x4_unorm_4pack16_khr = 1000156019,
    g12x4b12x4g12x4r12x4_422_unorm_4pack16_khr = 1000156020,
    b12x4g12x4r12x4g12x4_422_unorm_4pack16_khr = 1000156021,
    g12x4_b12x4_r12x4_3plane_420_unorm_3pack16_khr = 1000156022,
    g12x4_b12x4r12x4_2plane_420_unorm_3pack16_khr = 1000156023,
    g12x4_b12x4_r12x4_3plane_422_unorm_3pack16_khr = 1000156024,
    g12x4_b12x4r12x4_2plane_422_unorm_3pack16_khr = 1000156025,
    g12x4_b12x4_r12x4_3plane_444_unorm_3pack16_khr = 1000156026,
    g16b16g16r16_422_unorm_khr = 1000156027,
    b16g16r16g16_422_unorm_khr = 1000156028,
    g16_b16_r16_3plane_420_unorm_khr = 1000156029,
    g16_b16r16_2plane_420_unorm_khr = 1000156030,
    g16_b16_r16_3plane_422_unorm_khr = 1000156031,
    g16_b16r16_2plane_422_unorm_khr = 1000156032,
    g16_b16_r16_3plane_444_unorm_khr = 1000156033,
    g8_b8r8_2plane_444_unorm_ext = 1000330000,
    g10x6_b10x6r10x6_2plane_444_unorm_3pack16_ext = 1000330001,
    g12x4_b12x4r12x4_2plane_444_unorm_3pack16_ext = 1000330002,
    g16_b16r16_2plane_444_unorm_ext = 1000330003,
    a4r4g4b4_unorm_pack16_ext = 1000340000,
    a4b4g4r4_unorm_pack16_ext = 1000340001,
    r16g16_s10_5_nv = 1000464000,
    a1b5g5r5_unorm_pack16_khr = 1000470000,
    a8_unorm_khr = 1000470001,
    max_enum = 2147483647,
};
pub const ImageTiling = enum(u32) {
    optimal = 0,
    linear = 1,
    drm_format_modifier_ext = 1000158000,
    max_enum = 2147483647,
};
pub const ImageType = enum(u32) {
    @"1d" = 0,
    @"2d" = 1,
    @"3d" = 2,
    max_enum = 2147483647,
};
pub const PhysicalDeviceType = enum(u32) {
    other = 0,
    integrated_gpu = 1,
    discrete_gpu = 2,
    virtual_gpu = 3,
    cpu = 4,
    max_enum = 2147483647,
};
pub const QueryType = enum(u32) {
    occlusion = 0,
    pipeline_statistics = 1,
    timestamp = 2,
    result_status_only_khr = 1000023000,
    transform_feedback_stream_ext = 1000028004,
    performance_query_khr = 1000116000,
    acceleration_structure_compacted_size_khr = 1000150000,
    acceleration_structure_serialization_size_khr = 1000150001,
    acceleration_structure_compacted_size_nv = 1000165000,
    performance_query_intel = 1000210000,
    video_encode_feedback_khr = 1000299000,
    mesh_primitives_generated_ext = 1000328000,
    primitives_generated_ext = 1000382000,
    acceleration_structure_serialization_bottom_level_pointers_khr = 1000386000,
    acceleration_structure_size_khr = 1000386001,
    micromap_serialization_size_ext = 1000396000,
    micromap_compacted_size_ext = 1000396001,
    max_enum = 2147483647,
};
pub const SharingMode = enum(u32) {
    exclusive = 0,
    concurrent = 1,
    max_enum = 2147483647,
};
pub const ComponentSwizzle = enum(u32) {
    identity = 0,
    zero = 1,
    one = 2,
    r = 3,
    g = 4,
    b = 5,
    a = 6,
    max_enum = 2147483647,
};
pub const ImageViewType = enum(u32) {
    @"1d" = 0,
    @"2d" = 1,
    @"3d" = 2,
    cube = 3,
    @"1d_array" = 4,
    @"2d_array" = 5,
    cube_array = 6,
    max_enum = 2147483647,
};
pub const BlendFactor = enum(u32) {
    zero = 0,
    one = 1,
    src_color = 2,
    one_minus_src_color = 3,
    dst_color = 4,
    one_minus_dst_color = 5,
    src_alpha = 6,
    one_minus_src_alpha = 7,
    dst_alpha = 8,
    one_minus_dst_alpha = 9,
    constant_color = 10,
    one_minus_constant_color = 11,
    constant_alpha = 12,
    one_minus_constant_alpha = 13,
    src_alpha_saturate = 14,
    src1_color = 15,
    one_minus_src1_color = 16,
    src1_alpha = 17,
    one_minus_src1_alpha = 18,
    max_enum = 2147483647,
};
pub const BlendOp = enum(u32) {
    add = 0,
    subtract = 1,
    reverse_subtract = 2,
    min = 3,
    max = 4,
    zero_ext = 1000148000,
    src_ext = 1000148001,
    dst_ext = 1000148002,
    src_over_ext = 1000148003,
    dst_over_ext = 1000148004,
    src_in_ext = 1000148005,
    dst_in_ext = 1000148006,
    src_out_ext = 1000148007,
    dst_out_ext = 1000148008,
    src_atop_ext = 1000148009,
    dst_atop_ext = 1000148010,
    xor_ext = 1000148011,
    multiply_ext = 1000148012,
    screen_ext = 1000148013,
    overlay_ext = 1000148014,
    darken_ext = 1000148015,
    lighten_ext = 1000148016,
    colordodge_ext = 1000148017,
    colorburn_ext = 1000148018,
    hardlight_ext = 1000148019,
    softlight_ext = 1000148020,
    difference_ext = 1000148021,
    exclusion_ext = 1000148022,
    invert_ext = 1000148023,
    invert_rgb_ext = 1000148024,
    lineardodge_ext = 1000148025,
    linearburn_ext = 1000148026,
    vividlight_ext = 1000148027,
    linearlight_ext = 1000148028,
    pinlight_ext = 1000148029,
    hardmix_ext = 1000148030,
    hsl_hue_ext = 1000148031,
    hsl_saturation_ext = 1000148032,
    hsl_color_ext = 1000148033,
    hsl_luminosity_ext = 1000148034,
    plus_ext = 1000148035,
    plus_clamped_ext = 1000148036,
    plus_clamped_alpha_ext = 1000148037,
    plus_darker_ext = 1000148038,
    minus_ext = 1000148039,
    minus_clamped_ext = 1000148040,
    contrast_ext = 1000148041,
    invert_ovg_ext = 1000148042,
    red_ext = 1000148043,
    green_ext = 1000148044,
    blue_ext = 1000148045,
    max_enum = 2147483647,
};
pub const CompareOp = enum(u32) {
    never = 0,
    less = 1,
    equal = 2,
    less_or_equal = 3,
    greater = 4,
    not_equal = 5,
    greater_or_equal = 6,
    always = 7,
    max_enum = 2147483647,
};
pub const DynamicState = enum(u32) {
    viewport = 0,
    scissor = 1,
    line_width = 2,
    depth_bias = 3,
    blend_constants = 4,
    depth_bounds = 5,
    stencil_compare_mask = 6,
    stencil_write_mask = 7,
    stencil_reference = 8,
    viewport_w_scaling_nv = 1000087000,
    discard_rectangle_ext = 1000099000,
    discard_rectangle_enable_ext = 1000099001,
    discard_rectangle_mode_ext = 1000099002,
    sample_locations_ext = 1000143000,
    viewport_shading_rate_palette_nv = 1000164004,
    viewport_coarse_sample_order_nv = 1000164006,
    exclusive_scissor_enable_nv = 1000205000,
    exclusive_scissor_nv = 1000205001,
    fragment_shading_rate_khr = 1000226000,
    line_stipple = 1000259000,
    cull_mode = 1000267000,
    front_face = 1000267001,
    primitive_topology = 1000267002,
    viewport_with_count = 1000267003,
    scissor_with_count = 1000267004,
    vertex_input_binding_stride = 1000267005,
    depth_test_enable = 1000267006,
    depth_write_enable = 1000267007,
    depth_compare_op = 1000267008,
    depth_bounds_test_enable = 1000267009,
    stencil_test_enable = 1000267010,
    stencil_op = 1000267011,
    ray_tracing_pipeline_stack_size_khr = 1000347000,
    vertex_input_ext = 1000352000,
    patch_control_points_ext = 1000377000,
    rasterizer_discard_enable = 1000377001,
    depth_bias_enable = 1000377002,
    logic_op_ext = 1000377003,
    primitive_restart_enable = 1000377004,
    color_write_enable_ext = 1000381000,
    tessellation_domain_origin_ext = 1000455002,
    depth_clamp_enable_ext = 1000455003,
    polygon_mode_ext = 1000455004,
    rasterization_samples_ext = 1000455005,
    sample_mask_ext = 1000455006,
    alpha_to_coverage_enable_ext = 1000455007,
    alpha_to_one_enable_ext = 1000455008,
    logic_op_enable_ext = 1000455009,
    color_blend_enable_ext = 1000455010,
    color_blend_equation_ext = 1000455011,
    color_write_mask_ext = 1000455012,
    rasterization_stream_ext = 1000455013,
    conservative_rasterization_mode_ext = 1000455014,
    extra_primitive_overestimation_size_ext = 1000455015,
    depth_clip_enable_ext = 1000455016,
    sample_locations_enable_ext = 1000455017,
    color_blend_advanced_ext = 1000455018,
    provoking_vertex_mode_ext = 1000455019,
    line_rasterization_mode_ext = 1000455020,
    line_stipple_enable_ext = 1000455021,
    depth_clip_negative_one_to_one_ext = 1000455022,
    viewport_w_scaling_enable_nv = 1000455023,
    viewport_swizzle_nv = 1000455024,
    coverage_to_color_enable_nv = 1000455025,
    coverage_to_color_location_nv = 1000455026,
    coverage_modulation_mode_nv = 1000455027,
    coverage_modulation_table_enable_nv = 1000455028,
    coverage_modulation_table_nv = 1000455029,
    shading_rate_image_enable_nv = 1000455030,
    representative_fragment_test_enable_nv = 1000455031,
    coverage_reduction_mode_nv = 1000455032,
    attachment_feedback_loop_enable_ext = 1000524000,
    depth_clamp_range_ext = 1000582000,
    max_enum = 2147483647,
    const Self = @This();
    pub const line_stipple_ext = Self.line_stipple_khr;
    pub const line_stipple_khr = Self.line_stipple;
    pub const primitive_restart_enable_ext = Self.primitive_restart_enable;
    pub const depth_bias_enable_ext = Self.depth_bias_enable;
    pub const rasterizer_discard_enable_ext = Self.rasterizer_discard_enable;
    pub const stencil_op_ext = Self.stencil_op;
    pub const stencil_test_enable_ext = Self.stencil_test_enable;
    pub const depth_bounds_test_enable_ext = Self.depth_bounds_test_enable;
    pub const depth_compare_op_ext = Self.depth_compare_op;
    pub const depth_write_enable_ext = Self.depth_write_enable;
    pub const depth_test_enable_ext = Self.depth_test_enable;
    pub const vertex_input_binding_stride_ext = Self.vertex_input_binding_stride;
    pub const scissor_with_count_ext = Self.scissor_with_count;
    pub const viewport_with_count_ext = Self.viewport_with_count;
    pub const primitive_topology_ext = Self.primitive_topology;
    pub const front_face_ext = Self.front_face;
    pub const cull_mode_ext = Self.cull_mode;
};
pub const FrontFace = enum(u32) {
    counter_clockwise = 0,
    clockwise = 1,
    max_enum = 2147483647,
};
pub const VertexInputRate = enum(u32) {
    vertex = 0,
    instance = 1,
    max_enum = 2147483647,
};
pub const PrimitiveTopology = enum(u32) {
    point_list = 0,
    line_list = 1,
    line_strip = 2,
    triangle_list = 3,
    triangle_strip = 4,
    triangle_fan = 5,
    line_list_with_adjacency = 6,
    line_strip_with_adjacency = 7,
    triangle_list_with_adjacency = 8,
    triangle_strip_with_adjacency = 9,
    patch_list = 10,
    max_enum = 2147483647,
};
pub const PolygonMode = enum(u32) {
    fill = 0,
    line = 1,
    point = 2,
    fill_rectangle_nv = 1000153000,
    max_enum = 2147483647,
};
pub const StencilOp = enum(u32) {
    keep = 0,
    zero = 1,
    replace = 2,
    increment_and_clamp = 3,
    decrement_and_clamp = 4,
    invert = 5,
    increment_and_wrap = 6,
    decrement_and_wrap = 7,
    max_enum = 2147483647,
};
pub const LogicOp = enum(u32) {
    clear = 0,
    @"and" = 1,
    and_reverse = 2,
    copy = 3,
    and_inverted = 4,
    no_op = 5,
    xor = 6,
    @"or" = 7,
    nor = 8,
    equivalent = 9,
    invert = 10,
    or_reverse = 11,
    copy_inverted = 12,
    or_inverted = 13,
    nand = 14,
    set = 15,
    max_enum = 2147483647,
};
pub const BorderColor = enum(u32) {
    float_transparent_black = 0,
    int_transparent_black = 1,
    float_opaque_black = 2,
    int_opaque_black = 3,
    float_opaque_white = 4,
    int_opaque_white = 5,
    float_custom_ext = 1000287003,
    int_custom_ext = 1000287004,
    max_enum = 2147483647,
};
pub const Filter = enum(u32) {
    nearest = 0,
    linear = 1,
    cubic_img = 1000015000,
    max_enum = 2147483647,
    const Self = @This();
    pub const cubic_ext = Self.cubic_img;
};
pub const SamplerAddressMode = enum(u32) {
    repeat = 0,
    mirrored_repeat = 1,
    clamp_to_edge = 2,
    clamp_to_border = 3,
    mirror_clamp_to_edge = 4,
    max_enum = 2147483647,
    const Self = @This();
    pub const mirror_clamp_to_edge_khr = Self.mirror_clamp_to_edge;
};
pub const SamplerMipmapMode = enum(u32) {
    nearest = 0,
    linear = 1,
    max_enum = 2147483647,
};
pub const DescriptorType = enum(u32) {
    sampler = 0,
    combined_image_sampler = 1,
    sampled_image = 2,
    storage_image = 3,
    uniform_texel_buffer = 4,
    storage_texel_buffer = 5,
    uniform_buffer = 6,
    storage_buffer = 7,
    uniform_buffer_dynamic = 8,
    storage_buffer_dynamic = 9,
    input_attachment = 10,
    inline_uniform_block = 1000138000,
    acceleration_structure_khr = 1000150000,
    acceleration_structure_nv = 1000165000,
    mutable_ext = 1000351000,
    sample_weight_image_qcom = 1000440000,
    block_match_image_qcom = 1000440001,
    partitioned_acceleration_structure_nv = 1000570000,
    max_enum = 2147483647,
    const Self = @This();
    pub const mutable_valve = Self.mutable_ext;
    pub const inline_uniform_block_ext = Self.inline_uniform_block;
};
pub const AttachmentLoadOp = enum(u32) {
    load = 0,
    clear = 1,
    dont_care = 2,
    none = 1000400000,
    max_enum = 2147483647,
    const Self = @This();
    pub const none_ext = Self.none_khr;
    pub const none_khr = Self.none;
};
pub const AttachmentStoreOp = enum(u32) {
    store = 0,
    dont_care = 1,
    none = 1000301000,
    max_enum = 2147483647,
    const Self = @This();
    pub const none_qcom = Self.none_ext;
    pub const none_khr = Self.none_ext;
    pub const none_ext = Self.none;
};
pub const PipelineBindPoint = enum(u32) {
    graphics = 0,
    compute = 1,
    ray_tracing_nv = 1000165000,
    subpass_shading_huawei = 1000369003,
    max_enum = 2147483647,
    const Self = @This();
    pub const ray_tracing_khr = Self.ray_tracing_nv;
};
pub const CommandBufferLevel = enum(u32) {
    primary = 0,
    secondary = 1,
    max_enum = 2147483647,
};
pub const IndexType = enum(u32) {
    uint16 = 0,
    uint32 = 1,
    none_nv = 1000165000,
    uint8 = 1000265000,
    max_enum = 2147483647,
    const Self = @This();
    pub const uint8_ext = Self.uint8_khr;
    pub const none_khr = Self.none_nv;
    pub const uint8_khr = Self.uint8;
};
pub const SubpassContents = enum(u32) {
    @"inline" = 0,
    secondary_command_buffers = 1,
    inline_and_secondary_command_buffers_ext = 1000451000,
    max_enum = 2147483647,
    const Self = @This();
    pub const inline_and_secondary_command_buffers_khr = Self.inline_and_secondary_command_buffers_ext;
};
pub const AccessFlagBits = enum(u32) {
    none = 0,
    indirect_command_read_bit = 1,
    index_read_bit = 2,
    vertex_attribute_read_bit = 4,
    uniform_read_bit = 8,
    input_attachment_read_bit = 16,
    shader_read_bit = 32,
    shader_write_bit = 64,
    color_attachment_read_bit = 128,
    color_attachment_write_bit = 256,
    depth_stencil_attachment_read_bit = 512,
    depth_stencil_attachment_write_bit = 1024,
    transfer_read_bit = 2048,
    transfer_write_bit = 4096,
    host_read_bit = 8192,
    host_write_bit = 16384,
    memory_read_bit = 32768,
    memory_write_bit = 65536,
    command_preprocess_read_bit_nv = 131072,
    command_preprocess_write_bit_nv = 262144,
    color_attachment_read_noncoherent_bit_ext = 524288,
    conditional_rendering_read_bit_ext = 1048576,
    acceleration_structure_read_bit_nv = 2097152,
    acceleration_structure_write_bit_nv = 4194304,
    shading_rate_image_read_bit_nv = 8388608,
    fragment_density_map_read_bit_ext = 16777216,
    transform_feedback_write_bit_ext = 33554432,
    transform_feedback_counter_read_bit_ext = 67108864,
    transform_feedback_counter_write_bit_ext = 134217728,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const command_preprocess_write_bit_ext = Self.command_preprocess_write_bit_nv;
    pub const command_preprocess_read_bit_ext = Self.command_preprocess_read_bit_nv;
    pub const fragment_shading_rate_attachment_read_bit_khr = Self.shading_rate_image_read_bit_nv;
    pub const acceleration_structure_write_bit_khr = Self.acceleration_structure_write_bit_nv;
    pub const acceleration_structure_read_bit_khr = Self.acceleration_structure_read_bit_nv;
    pub const none_khr = Self.none;
};
pub const AccessFlags = PES(AccessFlagBits);
pub const ImageAspectFlagBits = enum(u32) {
    none = 0,
    color_bit = 1,
    depth_bit = 2,
    stencil_bit = 4,
    metadata_bit = 8,
    plane_0_bit = 16,
    plane_1_bit = 32,
    plane_2_bit = 64,
    memory_plane_0_bit_ext = 128,
    memory_plane_1_bit_ext = 256,
    memory_plane_2_bit_ext = 512,
    memory_plane_3_bit_ext = 1024,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const none_khr = Self.none;
    pub const plane_2_bit_khr = Self.plane_2_bit;
    pub const plane_1_bit_khr = Self.plane_1_bit;
    pub const plane_0_bit_khr = Self.plane_0_bit;
};
pub const ImageAspectFlags = PES(ImageAspectFlagBits);
pub const FormatFeatureFlagBits = enum(u32) {
    sampled_image_bit = 1,
    storage_image_bit = 2,
    storage_image_atomic_bit = 4,
    uniform_texel_buffer_bit = 8,
    storage_texel_buffer_bit = 16,
    storage_texel_buffer_atomic_bit = 32,
    vertex_buffer_bit = 64,
    color_attachment_bit = 128,
    color_attachment_blend_bit = 256,
    depth_stencil_attachment_bit = 512,
    blit_src_bit = 1024,
    blit_dst_bit = 2048,
    sampled_image_filter_linear_bit = 4096,
    sampled_image_filter_cubic_bit_img = 8192,
    transfer_src_bit = 16384,
    transfer_dst_bit = 32768,
    sampled_image_filter_minmax_bit = 65536,
    midpoint_chroma_samples_bit = 131072,
    sampled_image_ycbcr_conversion_linear_filter_bit = 262144,
    sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit = 524288,
    sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit = 1048576,
    sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit = 2097152,
    disjoint_bit = 4194304,
    cosited_chroma_samples_bit = 8388608,
    fragment_density_map_bit_ext = 16777216,
    video_decode_output_bit_khr = 33554432,
    video_decode_dpb_bit_khr = 67108864,
    video_encode_input_bit_khr = 134217728,
    video_encode_dpb_bit_khr = 268435456,
    acceleration_structure_vertex_buffer_bit_khr = 536870912,
    fragment_shading_rate_attachment_bit_khr = 1073741824,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const sampled_image_filter_cubic_bit_ext = Self.sampled_image_filter_cubic_bit_img;
    pub const sampled_image_filter_minmax_bit_ext = Self.sampled_image_filter_minmax_bit;
    pub const cosited_chroma_samples_bit_khr = Self.cosited_chroma_samples_bit;
    pub const disjoint_bit_khr = Self.disjoint_bit;
    pub const sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit_khr = Self.sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit;
    pub const sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit_khr = Self.sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit;
    pub const sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit_khr = Self.sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit;
    pub const sampled_image_ycbcr_conversion_linear_filter_bit_khr = Self.sampled_image_ycbcr_conversion_linear_filter_bit;
    pub const midpoint_chroma_samples_bit_khr = Self.midpoint_chroma_samples_bit;
    pub const transfer_dst_bit_khr = Self.transfer_dst_bit;
    pub const transfer_src_bit_khr = Self.transfer_src_bit;
};
pub const FormatFeatureFlags = PES(FormatFeatureFlagBits);
pub const ImageCreateFlagBits = enum(u32) {
    sparse_binding_bit = 1,
    sparse_residency_bit = 2,
    sparse_aliased_bit = 4,
    mutable_format_bit = 8,
    cube_compatible_bit = 16,
    @"2d_array_compatible_bit" = 32,
    split_instance_bind_regions_bit = 64,
    block_texel_view_compatible_bit = 128,
    extended_usage_bit = 256,
    disjoint_bit = 512,
    alias_bit = 1024,
    protected_bit = 2048,
    sample_locations_compatible_depth_bit_ext = 4096,
    corner_sampled_bit_nv = 8192,
    subsampled_bit_ext = 16384,
    fragment_density_map_offset_bit_qcom = 32768,
    descriptor_buffer_capture_replay_bit_ext = 65536,
    @"2d_view_compatible_bit_ext" = 131072,
    multisampled_render_to_single_sampled_bit_ext = 262144,
    video_profile_independent_bit_khr = 1048576,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const disjoint_bit_khr = Self.disjoint_bit;
    pub const extended_usage_bit_khr = Self.extended_usage_bit;
    pub const block_texel_view_compatible_bit_khr = Self.block_texel_view_compatible_bit;
    pub const @"2d_array_compatible_bit_khr" = Self.@"2d_array_compatible_bit";
    pub const split_instance_bind_regions_bit_khr = Self.split_instance_bind_regions_bit;
    pub const alias_bit_khr = Self.alias_bit;
};
pub const ImageCreateFlags = PES(ImageCreateFlagBits);
pub const SampleCountFlagBits = enum(u32) {
    @"1_bit" = 1,
    @"2_bit" = 2,
    @"4_bit" = 4,
    @"8_bit" = 8,
    @"16_bit" = 16,
    @"32_bit" = 32,
    @"64_bit" = 64,
    flag_bits_max_enum = 2147483647,
};
pub const SampleCountFlags = PES(SampleCountFlagBits);
pub const ImageUsageFlagBits = enum(u32) {
    transfer_src_bit = 1,
    transfer_dst_bit = 2,
    sampled_bit = 4,
    storage_bit = 8,
    color_attachment_bit = 16,
    depth_stencil_attachment_bit = 32,
    transient_attachment_bit = 64,
    input_attachment_bit = 128,
    shading_rate_image_bit_nv = 256,
    fragment_density_map_bit_ext = 512,
    video_decode_dst_bit_khr = 1024,
    video_decode_src_bit_khr = 2048,
    video_decode_dpb_bit_khr = 4096,
    video_encode_dst_bit_khr = 8192,
    video_encode_src_bit_khr = 16384,
    video_encode_dpb_bit_khr = 32768,
    invocation_mask_bit_huawei = 262144,
    attachment_feedback_loop_bit_ext = 524288,
    sample_weight_bit_qcom = 1048576,
    sample_block_match_bit_qcom = 2097152,
    host_transfer_bit = 4194304,
    video_encode_quantization_delta_map_bit_khr = 33554432,
    video_encode_emphasis_map_bit_khr = 67108864,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const fragment_shading_rate_attachment_bit_khr = Self.shading_rate_image_bit_nv;
    pub const host_transfer_bit_ext = Self.host_transfer_bit;
};
pub const ImageUsageFlags = PES(ImageUsageFlagBits);
pub const InstanceCreateFlagBits = enum(u32) {
    enumerate_portability_bit_khr = 1,
    flag_bits_max_enum = 2147483647,
};
pub const InstanceCreateFlags = PES(InstanceCreateFlagBits);
pub const MemoryHeapFlagBits = enum(u32) {
    device_local_bit = 1,
    multi_instance_bit = 2,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const multi_instance_bit_khr = Self.multi_instance_bit;
};
pub const MemoryHeapFlags = PES(MemoryHeapFlagBits);
pub const MemoryPropertyFlagBits = enum(u32) {
    device_local_bit = 1,
    host_visible_bit = 2,
    host_coherent_bit = 4,
    host_cached_bit = 8,
    lazily_allocated_bit = 16,
    protected_bit = 32,
    device_coherent_bit_amd = 64,
    device_uncached_bit_amd = 128,
    rdma_capable_bit_nv = 256,
    flag_bits_max_enum = 2147483647,
};
pub const MemoryPropertyFlags = PES(MemoryPropertyFlagBits);
pub const QueueFlagBits = enum(u32) {
    graphics_bit = 1,
    compute_bit = 2,
    transfer_bit = 4,
    sparse_binding_bit = 8,
    protected_bit = 16,
    video_decode_bit_khr = 32,
    video_encode_bit_khr = 64,
    optical_flow_bit_nv = 256,
    flag_bits_max_enum = 2147483647,
};
pub const QueueFlags = PES(QueueFlagBits);
pub const DeviceCreateFlags = Flags;
pub const DeviceQueueCreateFlagBits = enum(u32) {
    protected_bit = 1,
    flag_bits_max_enum = 2147483647,
};
pub const DeviceQueueCreateFlags = PES(DeviceQueueCreateFlagBits);
pub const PipelineStageFlagBits = enum(u32) {
    none = 0,
    top_of_pipe_bit = 1,
    draw_indirect_bit = 2,
    vertex_input_bit = 4,
    vertex_shader_bit = 8,
    tessellation_control_shader_bit = 16,
    tessellation_evaluation_shader_bit = 32,
    geometry_shader_bit = 64,
    fragment_shader_bit = 128,
    early_fragment_tests_bit = 256,
    late_fragment_tests_bit = 512,
    color_attachment_output_bit = 1024,
    compute_shader_bit = 2048,
    transfer_bit = 4096,
    bottom_of_pipe_bit = 8192,
    host_bit = 16384,
    all_graphics_bit = 32768,
    all_commands_bit = 65536,
    command_preprocess_bit_nv = 131072,
    conditional_rendering_bit_ext = 262144,
    task_shader_bit_nv = 524288,
    mesh_shader_bit_nv = 1048576,
    ray_tracing_shader_bit_nv = 2097152,
    shading_rate_image_bit_nv = 4194304,
    fragment_density_process_bit_ext = 8388608,
    transform_feedback_bit_ext = 16777216,
    acceleration_structure_build_bit_nv = 33554432,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const mesh_shader_bit_ext = Self.mesh_shader_bit_nv;
    pub const task_shader_bit_ext = Self.task_shader_bit_nv;
    pub const command_preprocess_bit_ext = Self.command_preprocess_bit_nv;
    pub const fragment_shading_rate_attachment_bit_khr = Self.shading_rate_image_bit_nv;
    pub const ray_tracing_shader_bit_khr = Self.ray_tracing_shader_bit_nv;
    pub const acceleration_structure_build_bit_khr = Self.acceleration_structure_build_bit_nv;
    pub const none_khr = Self.none;
};
pub const PipelineStageFlags = PES(PipelineStageFlagBits);
pub const MemoryMapFlagBits = enum(u32) {
    placed_bit_ext = 1,
    flag_bits_max_enum = 2147483647,
};
pub const MemoryMapFlags = PES(MemoryMapFlagBits);
pub const SparseMemoryBindFlagBits = enum(u32) {
    metadata_bit = 1,
    flag_bits_max_enum = 2147483647,
};
pub const SparseMemoryBindFlags = PES(SparseMemoryBindFlagBits);
pub const SparseImageFormatFlagBits = enum(u32) {
    single_miptail_bit = 1,
    aligned_mip_size_bit = 2,
    nonstandard_block_size_bit = 4,
    flag_bits_max_enum = 2147483647,
};
pub const SparseImageFormatFlags = PES(SparseImageFormatFlagBits);
pub const FenceCreateFlagBits = enum(u32) {
    signaled_bit = 1,
    flag_bits_max_enum = 2147483647,
};
pub const FenceCreateFlags = PES(FenceCreateFlagBits);
pub const SemaphoreCreateFlags = Flags;
pub const EventCreateFlagBits = enum(u32) {
    device_only_bit = 1,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const device_only_bit_khr = Self.device_only_bit;
};
pub const EventCreateFlags = PES(EventCreateFlagBits);
pub const QueryPipelineStatisticFlagBits = enum(u32) {
    input_assembly_vertices_bit = 1,
    input_assembly_primitives_bit = 2,
    vertex_shader_invocations_bit = 4,
    geometry_shader_invocations_bit = 8,
    geometry_shader_primitives_bit = 16,
    clipping_invocations_bit = 32,
    clipping_primitives_bit = 64,
    fragment_shader_invocations_bit = 128,
    tessellation_control_shader_patches_bit = 256,
    tessellation_evaluation_shader_invocations_bit = 512,
    compute_shader_invocations_bit = 1024,
    task_shader_invocations_bit_ext = 2048,
    mesh_shader_invocations_bit_ext = 4096,
    cluster_culling_shader_invocations_bit_huawei = 8192,
    flag_bits_max_enum = 2147483647,
};
pub const QueryPipelineStatisticFlags = PES(QueryPipelineStatisticFlagBits);
pub const QueryPoolCreateFlags = Flags;
pub const QueryResultFlagBits = enum(u32) {
    @"64_bit" = 1,
    wait_bit = 2,
    with_availability_bit = 4,
    partial_bit = 8,
    with_status_bit_khr = 16,
    flag_bits_max_enum = 2147483647,
};
pub const QueryResultFlags = PES(QueryResultFlagBits);
pub const BufferCreateFlagBits = enum(u32) {
    sparse_binding_bit = 1,
    sparse_residency_bit = 2,
    sparse_aliased_bit = 4,
    protected_bit = 8,
    device_address_capture_replay_bit = 16,
    descriptor_buffer_capture_replay_bit_ext = 32,
    video_profile_independent_bit_khr = 64,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const device_address_capture_replay_bit_ext = Self.device_address_capture_replay_bit_khr;
    pub const device_address_capture_replay_bit_khr = Self.device_address_capture_replay_bit;
};
pub const BufferCreateFlags = PES(BufferCreateFlagBits);
pub const BufferUsageFlagBits = enum(u32) {
    transfer_src_bit = 1,
    transfer_dst_bit = 2,
    uniform_texel_buffer_bit = 4,
    storage_texel_buffer_bit = 8,
    uniform_buffer_bit = 16,
    storage_buffer_bit = 32,
    index_buffer_bit = 64,
    vertex_buffer_bit = 128,
    indirect_buffer_bit = 256,
    conditional_rendering_bit_ext = 512,
    ray_tracing_bit_nv = 1024,
    transform_feedback_buffer_bit_ext = 2048,
    transform_feedback_counter_buffer_bit_ext = 4096,
    video_decode_src_bit_khr = 8192,
    video_decode_dst_bit_khr = 16384,
    video_encode_dst_bit_khr = 32768,
    video_encode_src_bit_khr = 65536,
    shader_device_address_bit = 131072,
    acceleration_structure_build_input_read_only_bit_khr = 524288,
    acceleration_structure_storage_bit_khr = 1048576,
    sampler_descriptor_buffer_bit_ext = 2097152,
    resource_descriptor_buffer_bit_ext = 4194304,
    micromap_build_input_read_only_bit_ext = 8388608,
    micromap_storage_bit_ext = 16777216,
    push_descriptors_descriptor_buffer_bit_ext = 67108864,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const shader_device_address_bit_ext = Self.shader_device_address_bit_khr;
    pub const shader_binding_table_bit_khr = Self.ray_tracing_bit_nv;
    pub const shader_device_address_bit_khr = Self.shader_device_address_bit;
};
pub const BufferUsageFlags = PES(BufferUsageFlagBits);
pub const BufferViewCreateFlags = Flags;
pub const ImageViewCreateFlagBits = enum(u32) {
    fragment_density_map_dynamic_bit_ext = 1,
    fragment_density_map_deferred_bit_ext = 2,
    descriptor_buffer_capture_replay_bit_ext = 4,
    flag_bits_max_enum = 2147483647,
};
pub const ImageViewCreateFlags = PES(ImageViewCreateFlagBits);
pub const ShaderModuleCreateFlags = Flags;
pub const PipelineCacheCreateFlagBits = enum(u32) {
    externally_synchronized_bit = 1,
    internally_synchronized_merge_bit_khr = 8,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const externally_synchronized_bit_ext = Self.externally_synchronized_bit;
};
pub const PipelineCacheCreateFlags = PES(PipelineCacheCreateFlagBits);
pub const ColorComponentFlagBits = enum(u32) {
    r_bit = 1,
    g_bit = 2,
    b_bit = 4,
    a_bit = 8,
    flag_bits_max_enum = 2147483647,
};
pub const ColorComponentFlags = PES(ColorComponentFlagBits);
pub const PipelineCreateFlagBits = enum(u32) {
    disable_optimization_bit = 1,
    allow_derivatives_bit = 2,
    derivative_bit = 4,
    view_index_from_device_index_bit = 8,
    dispatch_base = 16,
    defer_compile_bit_nv = 32,
    capture_statistics_bit_khr = 64,
    capture_internal_representations_bit_khr = 128,
    fail_on_pipeline_compile_required_bit = 256,
    early_return_on_failure_bit = 512,
    link_time_optimization_bit_ext = 1024,
    library_bit_khr = 2048,
    ray_tracing_skip_triangles_bit_khr = 4096,
    ray_tracing_skip_aabbs_bit_khr = 8192,
    ray_tracing_no_null_any_hit_shaders_bit_khr = 16384,
    ray_tracing_no_null_closest_hit_shaders_bit_khr = 32768,
    ray_tracing_no_null_miss_shaders_bit_khr = 65536,
    ray_tracing_no_null_intersection_shaders_bit_khr = 131072,
    indirect_bindable_bit_nv = 262144,
    ray_tracing_shader_group_handle_capture_replay_bit_khr = 524288,
    ray_tracing_allow_motion_bit_nv = 1048576,
    rendering_fragment_shading_rate_attachment_bit_khr = 2097152,
    rendering_fragment_density_map_attachment_bit_ext = 4194304,
    retain_link_time_optimization_info_bit_ext = 8388608,
    ray_tracing_opacity_micromap_bit_ext = 16777216,
    color_attachment_feedback_loop_bit_ext = 33554432,
    depth_stencil_attachment_feedback_loop_bit_ext = 67108864,
    no_protected_access_bit = 134217728,
    descriptor_buffer_bit_ext = 536870912,
    protected_access_only_bit = 1073741824,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const dispatch_base_khr = Self.dispatch_base;
    pub const rasterization_state_fragment_shading_rate_attachment_bit_khr = Self.rendering_fragment_shading_rate_attachment_bit_khr;
    pub const rasterization_state_fragment_density_map_attachment_bit_ext = Self.rendering_fragment_density_map_attachment_bit_ext;
    pub const protected_access_only_bit_ext = Self.protected_access_only_bit;
    pub const no_protected_access_bit_ext = Self.no_protected_access_bit;
    pub const early_return_on_failure_bit_ext = Self.early_return_on_failure_bit;
    pub const fail_on_pipeline_compile_required_bit_ext = Self.fail_on_pipeline_compile_required_bit;
    pub const dispatch_base_bit = Self.dispatch_base;
    pub const view_index_from_device_index_bit_khr = Self.view_index_from_device_index_bit;
};
pub const PipelineCreateFlags = PES(PipelineCreateFlagBits);
pub const PipelineShaderStageCreateFlagBits = enum(u32) {
    allow_varying_subgroup_size_bit = 1,
    require_full_subgroups_bit = 2,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const require_full_subgroups_bit_ext = Self.require_full_subgroups_bit;
    pub const allow_varying_subgroup_size_bit_ext = Self.allow_varying_subgroup_size_bit;
};
pub const PipelineShaderStageCreateFlags = PES(PipelineShaderStageCreateFlagBits);
pub const ShaderStageFlagBits = enum(u32) {
    vertex_bit = 1,
    tessellation_control_bit = 2,
    tessellation_evaluation_bit = 4,
    geometry_bit = 8,
    fragment_bit = 16,
    all_graphics = 31,
    compute_bit = 32,
    task_bit_nv = 64,
    mesh_bit_nv = 128,
    raygen_bit_nv = 256,
    any_hit_bit_nv = 512,
    closest_hit_bit_nv = 1024,
    miss_bit_nv = 2048,
    intersection_bit_nv = 4096,
    callable_bit_nv = 8192,
    subpass_shading_bit_huawei = 16384,
    cluster_culling_bit_huawei = 524288,
    all = 2147483647,
    const Self = @This();
    pub const mesh_bit_ext = Self.mesh_bit_nv;
    pub const task_bit_ext = Self.task_bit_nv;
    pub const callable_bit_khr = Self.callable_bit_nv;
    pub const intersection_bit_khr = Self.intersection_bit_nv;
    pub const miss_bit_khr = Self.miss_bit_nv;
    pub const closest_hit_bit_khr = Self.closest_hit_bit_nv;
    pub const any_hit_bit_khr = Self.any_hit_bit_nv;
    pub const raygen_bit_khr = Self.raygen_bit_nv;
    pub const flag_bits_max_enum = Self.all;
};
pub const ShaderStageFlags = PES(ShaderStageFlagBits);
pub const CullModeFlagBits = enum(u32) {
    none = 0,
    front_bit = 1,
    back_bit = 2,
    front_and_back = 3,
    flag_bits_max_enum = 2147483647,
};
pub const CullModeFlags = PES(CullModeFlagBits);
pub const PipelineVertexInputStateCreateFlags = Flags;
pub const PipelineInputAssemblyStateCreateFlags = Flags;
pub const PipelineTessellationStateCreateFlags = Flags;
pub const PipelineViewportStateCreateFlags = Flags;
pub const PipelineRasterizationStateCreateFlags = Flags;
pub const PipelineMultisampleStateCreateFlags = Flags;
pub const PipelineDepthStencilStateCreateFlagBits = enum(u32) {
    rasterization_order_attachment_depth_access_bit_arm = 1,
    rasterization_order_attachment_stencil_access_bit_arm = 2,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const rasterization_order_attachment_stencil_access_bit_ext = Self.rasterization_order_attachment_stencil_access_bit_arm;
    pub const rasterization_order_attachment_depth_access_bit_ext = Self.rasterization_order_attachment_depth_access_bit_arm;
};
pub const PipelineDepthStencilStateCreateFlags = PES(PipelineDepthStencilStateCreateFlagBits);
pub const PipelineColorBlendStateCreateFlagBits = enum(u32) {
    rasterization_order_attachment_access_bit_arm = 1,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const rasterization_order_attachment_access_bit_ext = Self.rasterization_order_attachment_access_bit_arm;
};
pub const PipelineColorBlendStateCreateFlags = PES(PipelineColorBlendStateCreateFlagBits);
pub const PipelineDynamicStateCreateFlags = Flags;
pub const PipelineLayoutCreateFlagBits = enum(u32) {
    independent_sets_bit_ext = 2,
    flag_bits_max_enum = 2147483647,
};
pub const PipelineLayoutCreateFlags = PES(PipelineLayoutCreateFlagBits);
pub const SamplerCreateFlagBits = enum(u32) {
    subsampled_bit_ext = 1,
    subsampled_coarse_reconstruction_bit_ext = 2,
    non_seamless_cube_map_bit_ext = 4,
    descriptor_buffer_capture_replay_bit_ext = 8,
    image_processing_bit_qcom = 16,
    flag_bits_max_enum = 2147483647,
};
pub const SamplerCreateFlags = PES(SamplerCreateFlagBits);
pub const DescriptorPoolCreateFlagBits = enum(u32) {
    free_descriptor_set_bit = 1,
    update_after_bind_bit = 2,
    host_only_bit_ext = 4,
    allow_overallocation_sets_bit_nv = 8,
    allow_overallocation_pools_bit_nv = 16,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const host_only_bit_valve = Self.host_only_bit_ext;
    pub const update_after_bind_bit_ext = Self.update_after_bind_bit;
};
pub const DescriptorPoolCreateFlags = PES(DescriptorPoolCreateFlagBits);
pub const DescriptorPoolResetFlags = Flags;
pub const DescriptorSetLayoutCreateFlagBits = enum(u32) {
    push_descriptor_bit = 1,
    update_after_bind_pool_bit = 2,
    host_only_pool_bit_ext = 4,
    descriptor_buffer_bit_ext = 16,
    embedded_immutable_samplers_bit_ext = 32,
    per_stage_bit_nv = 64,
    indirect_bindable_bit_nv = 128,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const host_only_pool_bit_valve = Self.host_only_pool_bit_ext;
    pub const push_descriptor_bit_khr = Self.push_descriptor_bit;
    pub const update_after_bind_pool_bit_ext = Self.update_after_bind_pool_bit;
};
pub const DescriptorSetLayoutCreateFlags = PES(DescriptorSetLayoutCreateFlagBits);
pub const AttachmentDescriptionFlagBits = enum(u32) {
    may_alias_bit = 1,
    flag_bits_max_enum = 2147483647,
};
pub const AttachmentDescriptionFlags = PES(AttachmentDescriptionFlagBits);
pub const DependencyFlagBits = enum(u32) {
    by_region_bit = 1,
    view_local_bit = 2,
    device_group_bit = 4,
    feedback_loop_bit_ext = 8,
    queue_family_ownership_transfer_use_all_stages_bit_khr = 32,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const view_local_bit_khr = Self.view_local_bit;
    pub const device_group_bit_khr = Self.device_group_bit;
};
pub const DependencyFlags = PES(DependencyFlagBits);
pub const FramebufferCreateFlagBits = enum(u32) {
    imageless_bit = 1,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const imageless_bit_khr = Self.imageless_bit;
};
pub const FramebufferCreateFlags = PES(FramebufferCreateFlagBits);
pub const RenderPassCreateFlagBits = enum(u32) {
    transform_bit_qcom = 2,
    flag_bits_max_enum = 2147483647,
};
pub const RenderPassCreateFlags = PES(RenderPassCreateFlagBits);
pub const SubpassDescriptionFlagBits = enum(u32) {
    per_view_attributes_bit_nvx = 1,
    per_view_position_x_only_bit_nvx = 2,
    fragment_region_bit_qcom = 4,
    shader_resolve_bit_qcom = 8,
    rasterization_order_attachment_color_access_bit_arm = 16,
    rasterization_order_attachment_depth_access_bit_arm = 32,
    rasterization_order_attachment_stencil_access_bit_arm = 64,
    enable_legacy_dithering_bit_ext = 128,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const rasterization_order_attachment_stencil_access_bit_ext = Self.rasterization_order_attachment_stencil_access_bit_arm;
    pub const rasterization_order_attachment_depth_access_bit_ext = Self.rasterization_order_attachment_depth_access_bit_arm;
    pub const rasterization_order_attachment_color_access_bit_ext = Self.rasterization_order_attachment_color_access_bit_arm;
};
pub const SubpassDescriptionFlags = PES(SubpassDescriptionFlagBits);
pub const CommandPoolCreateFlagBits = enum(u32) {
    transient_bit = 1,
    reset_command_buffer_bit = 2,
    protected_bit = 4,
    flag_bits_max_enum = 2147483647,
};
pub const CommandPoolCreateFlags = PES(CommandPoolCreateFlagBits);
pub const CommandPoolResetFlagBits = enum(u32) {
    release_resources_bit = 1,
    flag_bits_max_enum = 2147483647,
};
pub const CommandPoolResetFlags = PES(CommandPoolResetFlagBits);
pub const CommandBufferUsageFlagBits = enum(u32) {
    one_time_submit_bit = 1,
    render_pass_continue_bit = 2,
    simultaneous_use_bit = 4,
    flag_bits_max_enum = 2147483647,
};
pub const CommandBufferUsageFlags = PES(CommandBufferUsageFlagBits);
pub const QueryControlFlagBits = enum(u32) {
    precise_bit = 1,
    flag_bits_max_enum = 2147483647,
};
pub const QueryControlFlags = PES(QueryControlFlagBits);
pub const CommandBufferResetFlagBits = enum(u32) {
    release_resources_bit = 1,
    flag_bits_max_enum = 2147483647,
};
pub const CommandBufferResetFlags = PES(CommandBufferResetFlagBits);
pub const StencilFaceFlagBits = enum(u32) {
    front_bit = 1,
    back_bit = 2,
    front_and_back = 3,
    flag_bits_max_enum = 2147483647,
};
pub const StencilFaceFlags = PES(StencilFaceFlagBits);
pub const Extent2D = extern struct {
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
};
pub const Extent3D = extern struct {
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
    depth: u32 = @import("std").mem.zeroes(u32),
};
pub const Offset2D = extern struct {
    x: i32 = @import("std").mem.zeroes(i32),
    y: i32 = @import("std").mem.zeroes(i32),
};
pub const Offset3D = extern struct {
    x: i32 = @import("std").mem.zeroes(i32),
    y: i32 = @import("std").mem.zeroes(i32),
    z: i32 = @import("std").mem.zeroes(i32),
};
pub const Rect2D = extern struct {
    offset: Offset2D = @import("std").mem.zeroes(Offset2D),
    extent: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const BaseInStructure = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: [*c]const BaseInStructure = @import("std").mem.zeroes([*c]const BaseInStructure),
};
pub const BaseOutStructure = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: [*c]BaseOutStructure = @import("std").mem.zeroes([*c]BaseOutStructure),
};
pub const BufferMemoryBarrier = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dst_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    src_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    dst_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const DispatchIndirectCommand = extern struct {
    x: u32 = @import("std").mem.zeroes(u32),
    y: u32 = @import("std").mem.zeroes(u32),
    z: u32 = @import("std").mem.zeroes(u32),
};
pub const DrawIndexedIndirectCommand = extern struct {
    index_count: u32 = @import("std").mem.zeroes(u32),
    instance_count: u32 = @import("std").mem.zeroes(u32),
    first_index: u32 = @import("std").mem.zeroes(u32),
    vertex_offset: i32 = @import("std").mem.zeroes(i32),
    first_instance: u32 = @import("std").mem.zeroes(u32),
};
pub const DrawIndirectCommand = extern struct {
    vertex_count: u32 = @import("std").mem.zeroes(u32),
    instance_count: u32 = @import("std").mem.zeroes(u32),
    first_vertex: u32 = @import("std").mem.zeroes(u32),
    first_instance: u32 = @import("std").mem.zeroes(u32),
};
pub const ImageSubresourceRange = extern struct {
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
    base_mip_level: u32 = @import("std").mem.zeroes(u32),
    level_count: u32 = @import("std").mem.zeroes(u32),
    base_array_layer: u32 = @import("std").mem.zeroes(u32),
    layer_count: u32 = @import("std").mem.zeroes(u32),
};
pub const ImageMemoryBarrier = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dst_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    old_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    new_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    src_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    dst_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    image: Image = @import("std").mem.zeroes(Image),
    subresource_range: ImageSubresourceRange = @import("std").mem.zeroes(ImageSubresourceRange),
};
pub const MemoryBarrier = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dst_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
};
pub const PipelineCacheHeaderVersionOne = extern struct {
    header_size: u32 = @import("std").mem.zeroes(u32),
    header_version: PipelineCacheHeaderVersion = @import("std").mem.zeroes(PipelineCacheHeaderVersion),
    vendor_id: u32 = @import("std").mem.zeroes(u32),
    device_id: u32 = @import("std").mem.zeroes(u32),
    pipeline_cache_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const PFN_allocationFunction = ?*const fn (?*anyopaque, usize, usize, SystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_freeFunction = ?*const fn (?*anyopaque, ?*anyopaque) callconv(.c) void;
pub const PFN_internalAllocationNotification = ?*const fn (?*anyopaque, usize, InternalAllocationType, SystemAllocationScope) callconv(.c) void;
pub const PFN_internalFreeNotification = ?*const fn (?*anyopaque, usize, InternalAllocationType, SystemAllocationScope) callconv(.c) void;
pub const PFN_reallocationFunction = ?*const fn (?*anyopaque, ?*anyopaque, usize, usize, SystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_voidFunction = ?*const fn () callconv(.c) void;
pub const AllocationCallbacks = extern struct {
    p_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pfn_allocation: PFN_allocationFunction = @import("std").mem.zeroes(PFN_allocationFunction),
    pfn_reallocation: PFN_reallocationFunction = @import("std").mem.zeroes(PFN_reallocationFunction),
    pfn_free: PFN_freeFunction = @import("std").mem.zeroes(PFN_freeFunction),
    pfn_internal_allocation: PFN_internalAllocationNotification = @import("std").mem.zeroes(PFN_internalAllocationNotification),
    pfn_internal_free: PFN_internalFreeNotification = @import("std").mem.zeroes(PFN_internalFreeNotification),
};
pub const ApplicationInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_application_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    application_version: u32 = @import("std").mem.zeroes(u32),
    p_engine_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    engine_version: u32 = @import("std").mem.zeroes(u32),
    api_version: u32 = @import("std").mem.zeroes(u32),
};
pub const FormatProperties = extern struct {
    linear_tiling_features: FormatFeatureFlags = @import("std").mem.zeroes(FormatFeatureFlags),
    optimal_tiling_features: FormatFeatureFlags = @import("std").mem.zeroes(FormatFeatureFlags),
    buffer_features: FormatFeatureFlags = @import("std").mem.zeroes(FormatFeatureFlags),
};
pub const ImageFormatProperties = extern struct {
    max_extent: Extent3D = @import("std").mem.zeroes(Extent3D),
    max_mip_levels: u32 = @import("std").mem.zeroes(u32),
    max_array_layers: u32 = @import("std").mem.zeroes(u32),
    sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    max_resource_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const InstanceCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: InstanceCreateFlags = @import("std").mem.zeroes(InstanceCreateFlags),
    p_application_info: [*c]const ApplicationInfo = @import("std").mem.zeroes([*c]const ApplicationInfo),
    enabled_layer_count: u32 = @import("std").mem.zeroes(u32),
    pp_enabled_layer_names: [*c]const [*c]const u8 = @import("std").mem.zeroes([*c]const [*c]const u8),
    enabled_extension_count: u32 = @import("std").mem.zeroes(u32),
    pp_enabled_extension_names: [*c]const [*c]const u8 = @import("std").mem.zeroes([*c]const [*c]const u8),
};
pub const MemoryHeap = extern struct {
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    flags: MemoryHeapFlags = @import("std").mem.zeroes(MemoryHeapFlags),
};
pub const MemoryType = extern struct {
    property_flags: MemoryPropertyFlags = @import("std").mem.zeroes(MemoryPropertyFlags),
    heap_index: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceFeatures = extern struct {
    robust_buffer_access: Bool32 = @import("std").mem.zeroes(Bool32),
    full_draw_index_uint32: Bool32 = @import("std").mem.zeroes(Bool32),
    image_cube_array: Bool32 = @import("std").mem.zeroes(Bool32),
    independent_blend: Bool32 = @import("std").mem.zeroes(Bool32),
    geometry_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    tessellation_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    sample_rate_shading: Bool32 = @import("std").mem.zeroes(Bool32),
    dual_src_blend: Bool32 = @import("std").mem.zeroes(Bool32),
    logic_op: Bool32 = @import("std").mem.zeroes(Bool32),
    multi_draw_indirect: Bool32 = @import("std").mem.zeroes(Bool32),
    draw_indirect_first_instance: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_clamp: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_bias_clamp: Bool32 = @import("std").mem.zeroes(Bool32),
    fill_mode_non_solid: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_bounds: Bool32 = @import("std").mem.zeroes(Bool32),
    wide_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    large_points: Bool32 = @import("std").mem.zeroes(Bool32),
    alpha_to_one: Bool32 = @import("std").mem.zeroes(Bool32),
    multi_viewport: Bool32 = @import("std").mem.zeroes(Bool32),
    sampler_anisotropy: Bool32 = @import("std").mem.zeroes(Bool32),
    texture_compression_etc2: Bool32 = @import("std").mem.zeroes(Bool32),
    texture_compression_astc_ldr: Bool32 = @import("std").mem.zeroes(Bool32),
    texture_compression_bc: Bool32 = @import("std").mem.zeroes(Bool32),
    occlusion_query_precise: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_statistics_query: Bool32 = @import("std").mem.zeroes(Bool32),
    vertex_pipeline_stores_and_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_stores_and_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_tessellation_and_geometry_point_size: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_image_gather_extended: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_extended_formats: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_multisample: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_read_without_format: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_write_without_format: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_buffer_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_sampled_image_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_buffer_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_clip_distance: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_cull_distance: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_int64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_int16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_resource_residency: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_resource_min_lod: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_binding: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency_buffer: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency_image2_d: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency_image3_d: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency2_samples: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency4_samples: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency8_samples: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency16_samples: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency_aliased: Bool32 = @import("std").mem.zeroes(Bool32),
    variable_multisample_rate: Bool32 = @import("std").mem.zeroes(Bool32),
    inherited_queries: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceLimits = extern struct {
    max_image_dimension1_d: u32 = @import("std").mem.zeroes(u32),
    max_image_dimension2_d: u32 = @import("std").mem.zeroes(u32),
    max_image_dimension3_d: u32 = @import("std").mem.zeroes(u32),
    max_image_dimension_cube: u32 = @import("std").mem.zeroes(u32),
    max_image_array_layers: u32 = @import("std").mem.zeroes(u32),
    max_texel_buffer_elements: u32 = @import("std").mem.zeroes(u32),
    max_uniform_buffer_range: u32 = @import("std").mem.zeroes(u32),
    max_storage_buffer_range: u32 = @import("std").mem.zeroes(u32),
    max_push_constants_size: u32 = @import("std").mem.zeroes(u32),
    max_memory_allocation_count: u32 = @import("std").mem.zeroes(u32),
    max_sampler_allocation_count: u32 = @import("std").mem.zeroes(u32),
    buffer_image_granularity: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    sparse_address_space_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    max_bound_descriptor_sets: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_samplers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_uniform_buffers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_storage_buffers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_sampled_images: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_storage_images: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_input_attachments: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_resources: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_samplers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_uniform_buffers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_uniform_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_storage_buffers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_storage_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_sampled_images: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_storage_images: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_input_attachments: u32 = @import("std").mem.zeroes(u32),
    max_vertex_input_attributes: u32 = @import("std").mem.zeroes(u32),
    max_vertex_input_bindings: u32 = @import("std").mem.zeroes(u32),
    max_vertex_input_attribute_offset: u32 = @import("std").mem.zeroes(u32),
    max_vertex_input_binding_stride: u32 = @import("std").mem.zeroes(u32),
    max_vertex_output_components: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_generation_level: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_patch_size: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_control_per_vertex_input_components: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_control_per_vertex_output_components: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_control_per_patch_output_components: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_control_total_output_components: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_evaluation_input_components: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_evaluation_output_components: u32 = @import("std").mem.zeroes(u32),
    max_geometry_shader_invocations: u32 = @import("std").mem.zeroes(u32),
    max_geometry_input_components: u32 = @import("std").mem.zeroes(u32),
    max_geometry_output_components: u32 = @import("std").mem.zeroes(u32),
    max_geometry_output_vertices: u32 = @import("std").mem.zeroes(u32),
    max_geometry_total_output_components: u32 = @import("std").mem.zeroes(u32),
    max_fragment_input_components: u32 = @import("std").mem.zeroes(u32),
    max_fragment_output_attachments: u32 = @import("std").mem.zeroes(u32),
    max_fragment_dual_src_attachments: u32 = @import("std").mem.zeroes(u32),
    max_fragment_combined_output_resources: u32 = @import("std").mem.zeroes(u32),
    max_compute_shared_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_compute_work_group_count: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_compute_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    max_compute_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
    sub_pixel_precision_bits: u32 = @import("std").mem.zeroes(u32),
    sub_texel_precision_bits: u32 = @import("std").mem.zeroes(u32),
    mipmap_precision_bits: u32 = @import("std").mem.zeroes(u32),
    max_draw_indexed_index_value: u32 = @import("std").mem.zeroes(u32),
    max_draw_indirect_count: u32 = @import("std").mem.zeroes(u32),
    max_sampler_lod_bias: f32 = @import("std").mem.zeroes(f32),
    max_sampler_anisotropy: f32 = @import("std").mem.zeroes(f32),
    max_viewports: u32 = @import("std").mem.zeroes(u32),
    max_viewport_dimensions: [2]u32 = @import("std").mem.zeroes([2]u32),
    viewport_bounds_range: [2]f32 = @import("std").mem.zeroes([2]f32),
    viewport_sub_pixel_bits: u32 = @import("std").mem.zeroes(u32),
    min_memory_map_alignment: usize = @import("std").mem.zeroes(usize),
    min_texel_buffer_offset_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    min_uniform_buffer_offset_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    min_storage_buffer_offset_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    min_texel_offset: i32 = @import("std").mem.zeroes(i32),
    max_texel_offset: u32 = @import("std").mem.zeroes(u32),
    min_texel_gather_offset: i32 = @import("std").mem.zeroes(i32),
    max_texel_gather_offset: u32 = @import("std").mem.zeroes(u32),
    min_interpolation_offset: f32 = @import("std").mem.zeroes(f32),
    max_interpolation_offset: f32 = @import("std").mem.zeroes(f32),
    sub_pixel_interpolation_offset_bits: u32 = @import("std").mem.zeroes(u32),
    max_framebuffer_width: u32 = @import("std").mem.zeroes(u32),
    max_framebuffer_height: u32 = @import("std").mem.zeroes(u32),
    max_framebuffer_layers: u32 = @import("std").mem.zeroes(u32),
    framebuffer_color_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    framebuffer_depth_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    framebuffer_stencil_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    framebuffer_no_attachments_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    max_color_attachments: u32 = @import("std").mem.zeroes(u32),
    sampled_image_color_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    sampled_image_integer_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    sampled_image_depth_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    sampled_image_stencil_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    storage_image_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    max_sample_mask_words: u32 = @import("std").mem.zeroes(u32),
    timestamp_compute_and_graphics: Bool32 = @import("std").mem.zeroes(Bool32),
    timestamp_period: f32 = @import("std").mem.zeroes(f32),
    max_clip_distances: u32 = @import("std").mem.zeroes(u32),
    max_cull_distances: u32 = @import("std").mem.zeroes(u32),
    max_combined_clip_and_cull_distances: u32 = @import("std").mem.zeroes(u32),
    discrete_queue_priorities: u32 = @import("std").mem.zeroes(u32),
    point_size_range: [2]f32 = @import("std").mem.zeroes([2]f32),
    line_width_range: [2]f32 = @import("std").mem.zeroes([2]f32),
    point_size_granularity: f32 = @import("std").mem.zeroes(f32),
    line_width_granularity: f32 = @import("std").mem.zeroes(f32),
    strict_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    standard_sample_locations: Bool32 = @import("std").mem.zeroes(Bool32),
    optimal_buffer_copy_offset_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    optimal_buffer_copy_row_pitch_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    non_coherent_atom_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PhysicalDeviceMemoryProperties = extern struct {
    memory_type_count: u32 = @import("std").mem.zeroes(u32),
    memory_types: [32]MemoryType = @import("std").mem.zeroes([32]MemoryType),
    memory_heap_count: u32 = @import("std").mem.zeroes(u32),
    memory_heaps: [16]MemoryHeap = @import("std").mem.zeroes([16]MemoryHeap),
};
pub const PhysicalDeviceSparseProperties = extern struct {
    residency_standard2_dblock_shape: Bool32 = @import("std").mem.zeroes(Bool32),
    residency_standard2_dmultisample_block_shape: Bool32 = @import("std").mem.zeroes(Bool32),
    residency_standard3_dblock_shape: Bool32 = @import("std").mem.zeroes(Bool32),
    residency_aligned_mip_size: Bool32 = @import("std").mem.zeroes(Bool32),
    residency_non_resident_strict: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceProperties = extern struct {
    api_version: u32 = @import("std").mem.zeroes(u32),
    driver_version: u32 = @import("std").mem.zeroes(u32),
    vendor_id: u32 = @import("std").mem.zeroes(u32),
    device_id: u32 = @import("std").mem.zeroes(u32),
    device_type: PhysicalDeviceType = @import("std").mem.zeroes(PhysicalDeviceType),
    device_name: [256]u8 = @import("std").mem.zeroes([256]u8),
    pipeline_cache_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    limits: PhysicalDeviceLimits = @import("std").mem.zeroes(PhysicalDeviceLimits),
    sparse_properties: PhysicalDeviceSparseProperties = @import("std").mem.zeroes(PhysicalDeviceSparseProperties),
};
pub const QueueFamilyProperties = extern struct {
    queue_flags: QueueFlags = @import("std").mem.zeroes(QueueFlags),
    queue_count: u32 = @import("std").mem.zeroes(u32),
    timestamp_valid_bits: u32 = @import("std").mem.zeroes(u32),
    min_image_transfer_granularity: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const DeviceQueueCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DeviceQueueCreateFlags = @import("std").mem.zeroes(DeviceQueueCreateFlags),
    queue_family_index: u32 = @import("std").mem.zeroes(u32),
    queue_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_priorities: [*c]const f32 = @import("std").mem.zeroes([*c]const f32),
};
pub const DeviceCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DeviceCreateFlags = @import("std").mem.zeroes(DeviceCreateFlags),
    queue_create_info_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_create_infos: [*c]const DeviceQueueCreateInfo = @import("std").mem.zeroes([*c]const DeviceQueueCreateInfo),
    enabled_layer_count: u32 = @import("std").mem.zeroes(u32),
    pp_enabled_layer_names: [*c]const [*c]const u8 = @import("std").mem.zeroes([*c]const [*c]const u8),
    enabled_extension_count: u32 = @import("std").mem.zeroes(u32),
    pp_enabled_extension_names: [*c]const [*c]const u8 = @import("std").mem.zeroes([*c]const [*c]const u8),
    p_enabled_features: [*c]const PhysicalDeviceFeatures = @import("std").mem.zeroes([*c]const PhysicalDeviceFeatures),
};
pub const ExtensionProperties = extern struct {
    extension_name: [256]u8 = @import("std").mem.zeroes([256]u8),
    spec_version: u32 = @import("std").mem.zeroes(u32),
};
pub const LayerProperties = extern struct {
    layer_name: [256]u8 = @import("std").mem.zeroes([256]u8),
    spec_version: u32 = @import("std").mem.zeroes(u32),
    implementation_version: u32 = @import("std").mem.zeroes(u32),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const SubmitInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    wait_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_wait_semaphores: [*c]const Semaphore = @import("std").mem.zeroes([*c]const Semaphore),
    p_wait_dst_stage_mask: [*c]const PipelineStageFlags = @import("std").mem.zeroes([*c]const PipelineStageFlags),
    command_buffer_count: u32 = @import("std").mem.zeroes(u32),
    p_command_buffers: [*c]const CommandBuffer = @import("std").mem.zeroes([*c]const CommandBuffer),
    signal_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_signal_semaphores: [*c]const Semaphore = @import("std").mem.zeroes([*c]const Semaphore),
};
pub const MappedMemoryRange = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const MemoryAllocateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    allocation_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    memory_type_index: u32 = @import("std").mem.zeroes(u32),
};
pub const MemoryRequirements = extern struct {
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    memory_type_bits: u32 = @import("std").mem.zeroes(u32),
};
pub const SparseMemoryBind = extern struct {
    resource_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    memory_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    flags: SparseMemoryBindFlags = @import("std").mem.zeroes(SparseMemoryBindFlags),
};
pub const SparseBufferMemoryBindInfo = extern struct {
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    bind_count: u32 = @import("std").mem.zeroes(u32),
    p_binds: [*c]const SparseMemoryBind = @import("std").mem.zeroes([*c]const SparseMemoryBind),
};
pub const SparseImageOpaqueMemoryBindInfo = extern struct {
    image: Image = @import("std").mem.zeroes(Image),
    bind_count: u32 = @import("std").mem.zeroes(u32),
    p_binds: [*c]const SparseMemoryBind = @import("std").mem.zeroes([*c]const SparseMemoryBind),
};
pub const ImageSubresource = extern struct {
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
    mip_level: u32 = @import("std").mem.zeroes(u32),
    array_layer: u32 = @import("std").mem.zeroes(u32),
};
pub const SparseImageMemoryBind = extern struct {
    subresource: ImageSubresource = @import("std").mem.zeroes(ImageSubresource),
    offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    extent: Extent3D = @import("std").mem.zeroes(Extent3D),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    memory_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    flags: SparseMemoryBindFlags = @import("std").mem.zeroes(SparseMemoryBindFlags),
};
pub const SparseImageMemoryBindInfo = extern struct {
    image: Image = @import("std").mem.zeroes(Image),
    bind_count: u32 = @import("std").mem.zeroes(u32),
    p_binds: [*c]const SparseImageMemoryBind = @import("std").mem.zeroes([*c]const SparseImageMemoryBind),
};
pub const BindSparseInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    wait_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_wait_semaphores: [*c]const Semaphore = @import("std").mem.zeroes([*c]const Semaphore),
    buffer_bind_count: u32 = @import("std").mem.zeroes(u32),
    p_buffer_binds: [*c]const SparseBufferMemoryBindInfo = @import("std").mem.zeroes([*c]const SparseBufferMemoryBindInfo),
    image_opaque_bind_count: u32 = @import("std").mem.zeroes(u32),
    p_image_opaque_binds: [*c]const SparseImageOpaqueMemoryBindInfo = @import("std").mem.zeroes([*c]const SparseImageOpaqueMemoryBindInfo),
    image_bind_count: u32 = @import("std").mem.zeroes(u32),
    p_image_binds: [*c]const SparseImageMemoryBindInfo = @import("std").mem.zeroes([*c]const SparseImageMemoryBindInfo),
    signal_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_signal_semaphores: [*c]const Semaphore = @import("std").mem.zeroes([*c]const Semaphore),
};
pub const SparseImageFormatProperties = extern struct {
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
    image_granularity: Extent3D = @import("std").mem.zeroes(Extent3D),
    flags: SparseImageFormatFlags = @import("std").mem.zeroes(SparseImageFormatFlags),
};
pub const SparseImageMemoryRequirements = extern struct {
    format_properties: SparseImageFormatProperties = @import("std").mem.zeroes(SparseImageFormatProperties),
    image_mip_tail_first_lod: u32 = @import("std").mem.zeroes(u32),
    image_mip_tail_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    image_mip_tail_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    image_mip_tail_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const FenceCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: FenceCreateFlags = @import("std").mem.zeroes(FenceCreateFlags),
};
pub const SemaphoreCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: SemaphoreCreateFlags = @import("std").mem.zeroes(SemaphoreCreateFlags),
};
pub const EventCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: EventCreateFlags = @import("std").mem.zeroes(EventCreateFlags),
};
pub const QueryPoolCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: QueryPoolCreateFlags = @import("std").mem.zeroes(QueryPoolCreateFlags),
    query_type: QueryType = @import("std").mem.zeroes(QueryType),
    query_count: u32 = @import("std").mem.zeroes(u32),
    pipeline_statistics: QueryPipelineStatisticFlags = @import("std").mem.zeroes(QueryPipelineStatisticFlags),
};
pub const BufferCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: BufferCreateFlags = @import("std").mem.zeroes(BufferCreateFlags),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    usage: BufferUsageFlags = @import("std").mem.zeroes(BufferUsageFlags),
    sharing_mode: SharingMode = @import("std").mem.zeroes(SharingMode),
    queue_family_index_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_family_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const BufferViewCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: BufferViewCreateFlags = @import("std").mem.zeroes(BufferViewCreateFlags),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    format: Format = @import("std").mem.zeroes(Format),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    range: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const ImageCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ImageCreateFlags = @import("std").mem.zeroes(ImageCreateFlags),
    image_type: ImageType = @import("std").mem.zeroes(ImageType),
    format: Format = @import("std").mem.zeroes(Format),
    extent: Extent3D = @import("std").mem.zeroes(Extent3D),
    mip_levels: u32 = @import("std").mem.zeroes(u32),
    array_layers: u32 = @import("std").mem.zeroes(u32),
    samples: SampleCountFlagBits = @import("std").mem.zeroes(SampleCountFlagBits),
    tiling: ImageTiling = @import("std").mem.zeroes(ImageTiling),
    usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    sharing_mode: SharingMode = @import("std").mem.zeroes(SharingMode),
    queue_family_index_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_family_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    initial_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const SubresourceLayout = extern struct {
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    row_pitch: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    array_pitch: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    depth_pitch: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const ComponentMapping = extern struct {
    r: ComponentSwizzle = @import("std").mem.zeroes(ComponentSwizzle),
    g: ComponentSwizzle = @import("std").mem.zeroes(ComponentSwizzle),
    b: ComponentSwizzle = @import("std").mem.zeroes(ComponentSwizzle),
    a: ComponentSwizzle = @import("std").mem.zeroes(ComponentSwizzle),
};
pub const ImageViewCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ImageViewCreateFlags = @import("std").mem.zeroes(ImageViewCreateFlags),
    image: Image = @import("std").mem.zeroes(Image),
    view_type: ImageViewType = @import("std").mem.zeroes(ImageViewType),
    format: Format = @import("std").mem.zeroes(Format),
    components: ComponentMapping = @import("std").mem.zeroes(ComponentMapping),
    subresource_range: ImageSubresourceRange = @import("std").mem.zeroes(ImageSubresourceRange),
};
pub const ShaderModuleCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ShaderModuleCreateFlags = @import("std").mem.zeroes(ShaderModuleCreateFlags),
    code_size: usize = @import("std").mem.zeroes(usize),
    p_code: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const PipelineCacheCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCacheCreateFlags = @import("std").mem.zeroes(PipelineCacheCreateFlags),
    initial_data_size: usize = @import("std").mem.zeroes(usize),
    p_initial_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const SpecializationMapEntry = extern struct {
    constant_id: u32 = @import("std").mem.zeroes(u32),
    offset: u32 = @import("std").mem.zeroes(u32),
    size: usize = @import("std").mem.zeroes(usize),
};
pub const SpecializationInfo = extern struct {
    map_entry_count: u32 = @import("std").mem.zeroes(u32),
    p_map_entries: [*c]const SpecializationMapEntry = @import("std").mem.zeroes([*c]const SpecializationMapEntry),
    data_size: usize = @import("std").mem.zeroes(usize),
    p_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const PipelineShaderStageCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineShaderStageCreateFlags = @import("std").mem.zeroes(PipelineShaderStageCreateFlags),
    stage: ShaderStageFlagBits = @import("std").mem.zeroes(ShaderStageFlagBits),
    module: ShaderModule = @import("std").mem.zeroes(ShaderModule),
    p_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    p_specialization_info: [*c]const SpecializationInfo = @import("std").mem.zeroes([*c]const SpecializationInfo),
};
pub const ComputePipelineCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCreateFlags = @import("std").mem.zeroes(PipelineCreateFlags),
    stage: PipelineShaderStageCreateInfo = @import("std").mem.zeroes(PipelineShaderStageCreateInfo),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    base_pipeline_handle: Pipeline = @import("std").mem.zeroes(Pipeline),
    base_pipeline_index: i32 = @import("std").mem.zeroes(i32),
};
pub const VertexInputBindingDescription = extern struct {
    binding: u32 = @import("std").mem.zeroes(u32),
    stride: u32 = @import("std").mem.zeroes(u32),
    input_rate: VertexInputRate = @import("std").mem.zeroes(VertexInputRate),
};
pub const VertexInputAttributeDescription = extern struct {
    location: u32 = @import("std").mem.zeroes(u32),
    binding: u32 = @import("std").mem.zeroes(u32),
    format: Format = @import("std").mem.zeroes(Format),
    offset: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineVertexInputStateCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineVertexInputStateCreateFlags = @import("std").mem.zeroes(PipelineVertexInputStateCreateFlags),
    vertex_binding_description_count: u32 = @import("std").mem.zeroes(u32),
    p_vertex_binding_descriptions: [*c]const VertexInputBindingDescription = @import("std").mem.zeroes([*c]const VertexInputBindingDescription),
    vertex_attribute_description_count: u32 = @import("std").mem.zeroes(u32),
    p_vertex_attribute_descriptions: [*c]const VertexInputAttributeDescription = @import("std").mem.zeroes([*c]const VertexInputAttributeDescription),
};
pub const PipelineInputAssemblyStateCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineInputAssemblyStateCreateFlags = @import("std").mem.zeroes(PipelineInputAssemblyStateCreateFlags),
    topology: PrimitiveTopology = @import("std").mem.zeroes(PrimitiveTopology),
    primitive_restart_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineTessellationStateCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineTessellationStateCreateFlags = @import("std").mem.zeroes(PipelineTessellationStateCreateFlags),
    patch_control_points: u32 = @import("std").mem.zeroes(u32),
};
pub const Viewport = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    width: f32 = @import("std").mem.zeroes(f32),
    height: f32 = @import("std").mem.zeroes(f32),
    min_depth: f32 = @import("std").mem.zeroes(f32),
    max_depth: f32 = @import("std").mem.zeroes(f32),
};
pub const PipelineViewportStateCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineViewportStateCreateFlags = @import("std").mem.zeroes(PipelineViewportStateCreateFlags),
    viewport_count: u32 = @import("std").mem.zeroes(u32),
    p_viewports: [*c]const Viewport = @import("std").mem.zeroes([*c]const Viewport),
    scissor_count: u32 = @import("std").mem.zeroes(u32),
    p_scissors: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const PipelineRasterizationStateCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineRasterizationStateCreateFlags = @import("std").mem.zeroes(PipelineRasterizationStateCreateFlags),
    depth_clamp_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    rasterizer_discard_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    polygon_mode: PolygonMode = @import("std").mem.zeroes(PolygonMode),
    cull_mode: CullModeFlags = @import("std").mem.zeroes(CullModeFlags),
    front_face: FrontFace = @import("std").mem.zeroes(FrontFace),
    depth_bias_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_bias_constant_factor: f32 = @import("std").mem.zeroes(f32),
    depth_bias_clamp: f32 = @import("std").mem.zeroes(f32),
    depth_bias_slope_factor: f32 = @import("std").mem.zeroes(f32),
    line_width: f32 = @import("std").mem.zeroes(f32),
};
pub const PipelineMultisampleStateCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineMultisampleStateCreateFlags = @import("std").mem.zeroes(PipelineMultisampleStateCreateFlags),
    rasterization_samples: SampleCountFlagBits = @import("std").mem.zeroes(SampleCountFlagBits),
    sample_shading_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    min_sample_shading: f32 = @import("std").mem.zeroes(f32),
    p_sample_mask: [*c]const SampleMask = @import("std").mem.zeroes([*c]const SampleMask),
    alpha_to_coverage_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    alpha_to_one_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const StencilOpState = extern struct {
    fail_op: StencilOp = @import("std").mem.zeroes(StencilOp),
    pass_op: StencilOp = @import("std").mem.zeroes(StencilOp),
    depth_fail_op: StencilOp = @import("std").mem.zeroes(StencilOp),
    compare_op: CompareOp = @import("std").mem.zeroes(CompareOp),
    compare_mask: u32 = @import("std").mem.zeroes(u32),
    write_mask: u32 = @import("std").mem.zeroes(u32),
    reference: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineDepthStencilStateCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineDepthStencilStateCreateFlags = @import("std").mem.zeroes(PipelineDepthStencilStateCreateFlags),
    depth_test_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_write_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_compare_op: CompareOp = @import("std").mem.zeroes(CompareOp),
    depth_bounds_test_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    stencil_test_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    front: StencilOpState = @import("std").mem.zeroes(StencilOpState),
    back: StencilOpState = @import("std").mem.zeroes(StencilOpState),
    min_depth_bounds: f32 = @import("std").mem.zeroes(f32),
    max_depth_bounds: f32 = @import("std").mem.zeroes(f32),
};
pub const PipelineColorBlendAttachmentState = extern struct {
    blend_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    src_color_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    dst_color_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    color_blend_op: BlendOp = @import("std").mem.zeroes(BlendOp),
    src_alpha_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    dst_alpha_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    alpha_blend_op: BlendOp = @import("std").mem.zeroes(BlendOp),
    color_write_mask: ColorComponentFlags = @import("std").mem.zeroes(ColorComponentFlags),
};
pub const PipelineColorBlendStateCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineColorBlendStateCreateFlags = @import("std").mem.zeroes(PipelineColorBlendStateCreateFlags),
    logic_op_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    logic_op: LogicOp = @import("std").mem.zeroes(LogicOp),
    attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_attachments: [*c]const PipelineColorBlendAttachmentState = @import("std").mem.zeroes([*c]const PipelineColorBlendAttachmentState),
    blend_constants: [4]f32 = @import("std").mem.zeroes([4]f32),
};
pub const PipelineDynamicStateCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineDynamicStateCreateFlags = @import("std").mem.zeroes(PipelineDynamicStateCreateFlags),
    dynamic_state_count: u32 = @import("std").mem.zeroes(u32),
    p_dynamic_states: [*c]const DynamicState = @import("std").mem.zeroes([*c]const DynamicState),
};
pub const GraphicsPipelineCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCreateFlags = @import("std").mem.zeroes(PipelineCreateFlags),
    stage_count: u32 = @import("std").mem.zeroes(u32),
    p_stages: [*c]const PipelineShaderStageCreateInfo = @import("std").mem.zeroes([*c]const PipelineShaderStageCreateInfo),
    p_vertex_input_state: [*c]const PipelineVertexInputStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineVertexInputStateCreateInfo),
    p_input_assembly_state: [*c]const PipelineInputAssemblyStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineInputAssemblyStateCreateInfo),
    p_tessellation_state: [*c]const PipelineTessellationStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineTessellationStateCreateInfo),
    p_viewport_state: [*c]const PipelineViewportStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineViewportStateCreateInfo),
    p_rasterization_state: [*c]const PipelineRasterizationStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineRasterizationStateCreateInfo),
    p_multisample_state: [*c]const PipelineMultisampleStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineMultisampleStateCreateInfo),
    p_depth_stencil_state: [*c]const PipelineDepthStencilStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineDepthStencilStateCreateInfo),
    p_color_blend_state: [*c]const PipelineColorBlendStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineColorBlendStateCreateInfo),
    p_dynamic_state: [*c]const PipelineDynamicStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineDynamicStateCreateInfo),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    render_pass: RenderPass = @import("std").mem.zeroes(RenderPass),
    subpass: u32 = @import("std").mem.zeroes(u32),
    base_pipeline_handle: Pipeline = @import("std").mem.zeroes(Pipeline),
    base_pipeline_index: i32 = @import("std").mem.zeroes(i32),
};
pub const PushConstantRange = extern struct {
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    offset: u32 = @import("std").mem.zeroes(u32),
    size: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineLayoutCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineLayoutCreateFlags = @import("std").mem.zeroes(PipelineLayoutCreateFlags),
    set_layout_count: u32 = @import("std").mem.zeroes(u32),
    p_set_layouts: [*c]const DescriptorSetLayout = @import("std").mem.zeroes([*c]const DescriptorSetLayout),
    push_constant_range_count: u32 = @import("std").mem.zeroes(u32),
    p_push_constant_ranges: [*c]const PushConstantRange = @import("std").mem.zeroes([*c]const PushConstantRange),
};
pub const SamplerCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: SamplerCreateFlags = @import("std").mem.zeroes(SamplerCreateFlags),
    mag_filter: Filter = @import("std").mem.zeroes(Filter),
    min_filter: Filter = @import("std").mem.zeroes(Filter),
    mipmap_mode: SamplerMipmapMode = @import("std").mem.zeroes(SamplerMipmapMode),
    address_mode_u: SamplerAddressMode = @import("std").mem.zeroes(SamplerAddressMode),
    address_mode_v: SamplerAddressMode = @import("std").mem.zeroes(SamplerAddressMode),
    address_mode_w: SamplerAddressMode = @import("std").mem.zeroes(SamplerAddressMode),
    mip_lod_bias: f32 = @import("std").mem.zeroes(f32),
    anisotropy_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    max_anisotropy: f32 = @import("std").mem.zeroes(f32),
    compare_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    compare_op: CompareOp = @import("std").mem.zeroes(CompareOp),
    min_lod: f32 = @import("std").mem.zeroes(f32),
    max_lod: f32 = @import("std").mem.zeroes(f32),
    border_color: BorderColor = @import("std").mem.zeroes(BorderColor),
    unnormalized_coordinates: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const CopyDescriptorSet = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_set: DescriptorSet = @import("std").mem.zeroes(DescriptorSet),
    src_binding: u32 = @import("std").mem.zeroes(u32),
    src_array_element: u32 = @import("std").mem.zeroes(u32),
    dst_set: DescriptorSet = @import("std").mem.zeroes(DescriptorSet),
    dst_binding: u32 = @import("std").mem.zeroes(u32),
    dst_array_element: u32 = @import("std").mem.zeroes(u32),
    descriptor_count: u32 = @import("std").mem.zeroes(u32),
};
pub const DescriptorBufferInfo = extern struct {
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    range: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const DescriptorImageInfo = extern struct {
    sampler: Sampler = @import("std").mem.zeroes(Sampler),
    image_view: ImageView = @import("std").mem.zeroes(ImageView),
    image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const DescriptorPoolSize = extern struct {
    type: DescriptorType = @import("std").mem.zeroes(DescriptorType),
    descriptor_count: u32 = @import("std").mem.zeroes(u32),
};
pub const DescriptorPoolCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DescriptorPoolCreateFlags = @import("std").mem.zeroes(DescriptorPoolCreateFlags),
    max_sets: u32 = @import("std").mem.zeroes(u32),
    pool_size_count: u32 = @import("std").mem.zeroes(u32),
    p_pool_sizes: [*c]const DescriptorPoolSize = @import("std").mem.zeroes([*c]const DescriptorPoolSize),
};
pub const DescriptorSetAllocateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    descriptor_pool: DescriptorPool = @import("std").mem.zeroes(DescriptorPool),
    descriptor_set_count: u32 = @import("std").mem.zeroes(u32),
    p_set_layouts: [*c]const DescriptorSetLayout = @import("std").mem.zeroes([*c]const DescriptorSetLayout),
};
pub const DescriptorSetLayoutBinding = extern struct {
    binding: u32 = @import("std").mem.zeroes(u32),
    descriptor_type: DescriptorType = @import("std").mem.zeroes(DescriptorType),
    descriptor_count: u32 = @import("std").mem.zeroes(u32),
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    p_immutable_samplers: [*c]const Sampler = @import("std").mem.zeroes([*c]const Sampler),
};
pub const DescriptorSetLayoutCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DescriptorSetLayoutCreateFlags = @import("std").mem.zeroes(DescriptorSetLayoutCreateFlags),
    binding_count: u32 = @import("std").mem.zeroes(u32),
    p_bindings: [*c]const DescriptorSetLayoutBinding = @import("std").mem.zeroes([*c]const DescriptorSetLayoutBinding),
};
pub const WriteDescriptorSet = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    dst_set: DescriptorSet = @import("std").mem.zeroes(DescriptorSet),
    dst_binding: u32 = @import("std").mem.zeroes(u32),
    dst_array_element: u32 = @import("std").mem.zeroes(u32),
    descriptor_count: u32 = @import("std").mem.zeroes(u32),
    descriptor_type: DescriptorType = @import("std").mem.zeroes(DescriptorType),
    p_image_info: [*c]const DescriptorImageInfo = @import("std").mem.zeroes([*c]const DescriptorImageInfo),
    p_buffer_info: [*c]const DescriptorBufferInfo = @import("std").mem.zeroes([*c]const DescriptorBufferInfo),
    p_texel_buffer_view: [*c]const BufferView = @import("std").mem.zeroes([*c]const BufferView),
};
pub const AttachmentDescription = extern struct {
    flags: AttachmentDescriptionFlags = @import("std").mem.zeroes(AttachmentDescriptionFlags),
    format: Format = @import("std").mem.zeroes(Format),
    samples: SampleCountFlagBits = @import("std").mem.zeroes(SampleCountFlagBits),
    load_op: AttachmentLoadOp = @import("std").mem.zeroes(AttachmentLoadOp),
    store_op: AttachmentStoreOp = @import("std").mem.zeroes(AttachmentStoreOp),
    stencil_load_op: AttachmentLoadOp = @import("std").mem.zeroes(AttachmentLoadOp),
    stencil_store_op: AttachmentStoreOp = @import("std").mem.zeroes(AttachmentStoreOp),
    initial_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    final_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const AttachmentReference = extern struct {
    attachment: u32 = @import("std").mem.zeroes(u32),
    layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const FramebufferCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: FramebufferCreateFlags = @import("std").mem.zeroes(FramebufferCreateFlags),
    render_pass: RenderPass = @import("std").mem.zeroes(RenderPass),
    attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_attachments: [*c]const ImageView = @import("std").mem.zeroes([*c]const ImageView),
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
    layers: u32 = @import("std").mem.zeroes(u32),
};
pub const SubpassDescription = extern struct {
    flags: SubpassDescriptionFlags = @import("std").mem.zeroes(SubpassDescriptionFlags),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    input_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_input_attachments: [*c]const AttachmentReference = @import("std").mem.zeroes([*c]const AttachmentReference),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachments: [*c]const AttachmentReference = @import("std").mem.zeroes([*c]const AttachmentReference),
    p_resolve_attachments: [*c]const AttachmentReference = @import("std").mem.zeroes([*c]const AttachmentReference),
    p_depth_stencil_attachment: [*c]const AttachmentReference = @import("std").mem.zeroes([*c]const AttachmentReference),
    preserve_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_preserve_attachments: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const SubpassDependency = extern struct {
    src_subpass: u32 = @import("std").mem.zeroes(u32),
    dst_subpass: u32 = @import("std").mem.zeroes(u32),
    src_stage_mask: PipelineStageFlags = @import("std").mem.zeroes(PipelineStageFlags),
    dst_stage_mask: PipelineStageFlags = @import("std").mem.zeroes(PipelineStageFlags),
    src_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dst_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dependency_flags: DependencyFlags = @import("std").mem.zeroes(DependencyFlags),
};
pub const RenderPassCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: RenderPassCreateFlags = @import("std").mem.zeroes(RenderPassCreateFlags),
    attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_attachments: [*c]const AttachmentDescription = @import("std").mem.zeroes([*c]const AttachmentDescription),
    subpass_count: u32 = @import("std").mem.zeroes(u32),
    p_subpasses: [*c]const SubpassDescription = @import("std").mem.zeroes([*c]const SubpassDescription),
    dependency_count: u32 = @import("std").mem.zeroes(u32),
    p_dependencies: [*c]const SubpassDependency = @import("std").mem.zeroes([*c]const SubpassDependency),
};
pub const CommandPoolCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: CommandPoolCreateFlags = @import("std").mem.zeroes(CommandPoolCreateFlags),
    queue_family_index: u32 = @import("std").mem.zeroes(u32),
};
pub const CommandBufferAllocateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    command_pool: CommandPool = @import("std").mem.zeroes(CommandPool),
    level: CommandBufferLevel = @import("std").mem.zeroes(CommandBufferLevel),
    command_buffer_count: u32 = @import("std").mem.zeroes(u32),
};
pub const CommandBufferInheritanceInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    render_pass: RenderPass = @import("std").mem.zeroes(RenderPass),
    subpass: u32 = @import("std").mem.zeroes(u32),
    framebuffer: Framebuffer = @import("std").mem.zeroes(Framebuffer),
    occlusion_query_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    query_flags: QueryControlFlags = @import("std").mem.zeroes(QueryControlFlags),
    pipeline_statistics: QueryPipelineStatisticFlags = @import("std").mem.zeroes(QueryPipelineStatisticFlags),
};
pub const CommandBufferBeginInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: CommandBufferUsageFlags = @import("std").mem.zeroes(CommandBufferUsageFlags),
    p_inheritance_info: [*c]const CommandBufferInheritanceInfo = @import("std").mem.zeroes([*c]const CommandBufferInheritanceInfo),
};
pub const BufferCopy = extern struct {
    src_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    dst_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const ImageSubresourceLayers = extern struct {
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
    mip_level: u32 = @import("std").mem.zeroes(u32),
    base_array_layer: u32 = @import("std").mem.zeroes(u32),
    layer_count: u32 = @import("std").mem.zeroes(u32),
};
pub const BufferImageCopy = extern struct {
    buffer_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    buffer_row_length: u32 = @import("std").mem.zeroes(u32),
    buffer_image_height: u32 = @import("std").mem.zeroes(u32),
    image_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    image_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    image_extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const ClearColorValue = extern union {
    float32: [4]f32,
    int32: [4]i32,
    uint32: [4]u32,
};
pub const ClearDepthStencilValue = extern struct {
    depth: f32 = @import("std").mem.zeroes(f32),
    stencil: u32 = @import("std").mem.zeroes(u32),
};
pub const ClearValue = extern union {
    color: ClearColorValue,
    depthStencil: ClearDepthStencilValue,
};
pub const ClearAttachment = extern struct {
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
    color_attachment: u32 = @import("std").mem.zeroes(u32),
    clear_value: ClearValue = @import("std").mem.zeroes(ClearValue),
};
pub const ClearRect = extern struct {
    rect: Rect2D = @import("std").mem.zeroes(Rect2D),
    base_array_layer: u32 = @import("std").mem.zeroes(u32),
    layer_count: u32 = @import("std").mem.zeroes(u32),
};
pub const ImageBlit = extern struct {
    src_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    src_offsets: [2]Offset3D = @import("std").mem.zeroes([2]Offset3D),
    dst_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    dst_offsets: [2]Offset3D = @import("std").mem.zeroes([2]Offset3D),
};
pub const ImageCopy = extern struct {
    src_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    src_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    dst_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    dst_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const ImageResolve = extern struct {
    src_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    src_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    dst_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    dst_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const RenderPassBeginInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    render_pass: RenderPass = @import("std").mem.zeroes(RenderPass),
    framebuffer: Framebuffer = @import("std").mem.zeroes(Framebuffer),
    render_area: Rect2D = @import("std").mem.zeroes(Rect2D),
    clear_value_count: u32 = @import("std").mem.zeroes(u32),
    p_clear_values: [*c]const ClearValue = @import("std").mem.zeroes([*c]const ClearValue),
};
pub const PFN_createInstance = ?*const fn ([*c]const InstanceCreateInfo, [*c]const AllocationCallbacks, [*c]Instance) callconv(.c) Result;
pub const PFN_destroyInstance = ?*const fn (Instance, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_enumeratePhysicalDevices = ?*const fn (Instance, [*c]u32, [*c]PhysicalDevice) callconv(.c) Result;
pub const PFN_getPhysicalDeviceFeatures = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceFeatures) callconv(.c) void;
pub const PFN_getPhysicalDeviceFormatProperties = ?*const fn (PhysicalDevice, Format, [*c]FormatProperties) callconv(.c) void;
pub const PFN_getPhysicalDeviceImageFormatProperties = ?*const fn (PhysicalDevice, Format, ImageType, ImageTiling, ImageUsageFlags, ImageCreateFlags, [*c]ImageFormatProperties) callconv(.c) Result;
pub const PFN_getPhysicalDeviceProperties = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceProperties) callconv(.c) void;
pub const PFN_getPhysicalDeviceQueueFamilyProperties = ?*const fn (PhysicalDevice, [*c]u32, [*c]QueueFamilyProperties) callconv(.c) void;
pub const PFN_getPhysicalDeviceMemoryProperties = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceMemoryProperties) callconv(.c) void;
pub const PFN_getInstanceProcAddr = ?*const fn (Instance, [*c]const u8) callconv(.c) PFN_voidFunction;
pub const PFN_getDeviceProcAddr = ?*const fn (Device, [*c]const u8) callconv(.c) PFN_voidFunction;
pub const PFN_createDevice = ?*const fn (PhysicalDevice, [*c]const DeviceCreateInfo, [*c]const AllocationCallbacks, [*c]Device) callconv(.c) Result;
pub const PFN_destroyDevice = ?*const fn (Device, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_enumerateInstanceExtensionProperties = ?*const fn ([*c]const u8, [*c]u32, [*c]ExtensionProperties) callconv(.c) Result;
pub const PFN_enumerateDeviceExtensionProperties = ?*const fn (PhysicalDevice, [*c]const u8, [*c]u32, [*c]ExtensionProperties) callconv(.c) Result;
pub const PFN_enumerateInstanceLayerProperties = ?*const fn ([*c]u32, [*c]LayerProperties) callconv(.c) Result;
pub const PFN_enumerateDeviceLayerProperties = ?*const fn (PhysicalDevice, [*c]u32, [*c]LayerProperties) callconv(.c) Result;
pub const PFN_getDeviceQueue = ?*const fn (Device, u32, u32, [*c]Queue) callconv(.c) void;
pub const PFN_queueSubmit = ?*const fn (Queue, u32, [*c]const SubmitInfo, Fence) callconv(.c) Result;
pub const PFN_queueWaitIdle = ?*const fn (Queue) callconv(.c) Result;
pub const PFN_deviceWaitIdle = ?*const fn (Device) callconv(.c) Result;
pub const PFN_allocateMemory = ?*const fn (Device, [*c]const MemoryAllocateInfo, [*c]const AllocationCallbacks, [*c]DeviceMemory) callconv(.c) Result;
pub const PFN_freeMemory = ?*const fn (Device, DeviceMemory, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_mapMemory = ?*const fn (Device, DeviceMemory, DeviceSize, DeviceSize, MemoryMapFlags, [*c]?*anyopaque) callconv(.c) Result;
pub const PFN_unmapMemory = ?*const fn (Device, DeviceMemory) callconv(.c) void;
pub const PFN_flushMappedMemoryRanges = ?*const fn (Device, u32, [*c]const MappedMemoryRange) callconv(.c) Result;
pub const PFN_invalidateMappedMemoryRanges = ?*const fn (Device, u32, [*c]const MappedMemoryRange) callconv(.c) Result;
pub const PFN_getDeviceMemoryCommitment = ?*const fn (Device, DeviceMemory, [*c]DeviceSize) callconv(.c) void;
pub const PFN_bindBufferMemory = ?*const fn (Device, Buffer, DeviceMemory, DeviceSize) callconv(.c) Result;
pub const PFN_bindImageMemory = ?*const fn (Device, Image, DeviceMemory, DeviceSize) callconv(.c) Result;
pub const PFN_getBufferMemoryRequirements = ?*const fn (Device, Buffer, [*c]MemoryRequirements) callconv(.c) void;
pub const PFN_getImageMemoryRequirements = ?*const fn (Device, Image, [*c]MemoryRequirements) callconv(.c) void;
pub const PFN_getImageSparseMemoryRequirements = ?*const fn (Device, Image, [*c]u32, [*c]SparseImageMemoryRequirements) callconv(.c) void;
pub const PFN_getPhysicalDeviceSparseImageFormatProperties = ?*const fn (PhysicalDevice, Format, ImageType, SampleCountFlagBits, ImageUsageFlags, ImageTiling, [*c]u32, [*c]SparseImageFormatProperties) callconv(.c) void;
pub const PFN_queueBindSparse = ?*const fn (Queue, u32, [*c]const BindSparseInfo, Fence) callconv(.c) Result;
pub const PFN_createFence = ?*const fn (Device, [*c]const FenceCreateInfo, [*c]const AllocationCallbacks, [*c]Fence) callconv(.c) Result;
pub const PFN_destroyFence = ?*const fn (Device, Fence, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_resetFences = ?*const fn (Device, u32, [*c]const Fence) callconv(.c) Result;
pub const PFN_getFenceStatus = ?*const fn (Device, Fence) callconv(.c) Result;
pub const PFN_waitForFences = ?*const fn (Device, u32, [*c]const Fence, Bool32, u64) callconv(.c) Result;
pub const PFN_createSemaphore = ?*const fn (Device, [*c]const SemaphoreCreateInfo, [*c]const AllocationCallbacks, [*c]Semaphore) callconv(.c) Result;
pub const PFN_destroySemaphore = ?*const fn (Device, Semaphore, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createEvent = ?*const fn (Device, [*c]const EventCreateInfo, [*c]const AllocationCallbacks, [*c]Event) callconv(.c) Result;
pub const PFN_destroyEvent = ?*const fn (Device, Event, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getEventStatus = ?*const fn (Device, Event) callconv(.c) Result;
pub const PFN_setEvent = ?*const fn (Device, Event) callconv(.c) Result;
pub const PFN_resetEvent = ?*const fn (Device, Event) callconv(.c) Result;
pub const PFN_createQueryPool = ?*const fn (Device, [*c]const QueryPoolCreateInfo, [*c]const AllocationCallbacks, [*c]QueryPool) callconv(.c) Result;
pub const PFN_destroyQueryPool = ?*const fn (Device, QueryPool, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getQueryPoolResults = ?*const fn (Device, QueryPool, u32, u32, usize, ?*anyopaque, DeviceSize, QueryResultFlags) callconv(.c) Result;
pub const PFN_createBuffer = ?*const fn (Device, [*c]const BufferCreateInfo, [*c]const AllocationCallbacks, [*c]Buffer) callconv(.c) Result;
pub const PFN_destroyBuffer = ?*const fn (Device, Buffer, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createBufferView = ?*const fn (Device, [*c]const BufferViewCreateInfo, [*c]const AllocationCallbacks, [*c]BufferView) callconv(.c) Result;
pub const PFN_destroyBufferView = ?*const fn (Device, BufferView, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createImage = ?*const fn (Device, [*c]const ImageCreateInfo, [*c]const AllocationCallbacks, [*c]Image) callconv(.c) Result;
pub const PFN_destroyImage = ?*const fn (Device, Image, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getImageSubresourceLayout = ?*const fn (Device, Image, [*c]const ImageSubresource, [*c]SubresourceLayout) callconv(.c) void;
pub const PFN_createImageView = ?*const fn (Device, [*c]const ImageViewCreateInfo, [*c]const AllocationCallbacks, [*c]ImageView) callconv(.c) Result;
pub const PFN_destroyImageView = ?*const fn (Device, ImageView, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createShaderModule = ?*const fn (Device, [*c]const ShaderModuleCreateInfo, [*c]const AllocationCallbacks, [*c]ShaderModule) callconv(.c) Result;
pub const PFN_destroyShaderModule = ?*const fn (Device, ShaderModule, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createPipelineCache = ?*const fn (Device, [*c]const PipelineCacheCreateInfo, [*c]const AllocationCallbacks, [*c]PipelineCache) callconv(.c) Result;
pub const PFN_destroyPipelineCache = ?*const fn (Device, PipelineCache, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getPipelineCacheData = ?*const fn (Device, PipelineCache, [*c]usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_mergePipelineCaches = ?*const fn (Device, PipelineCache, u32, [*c]const PipelineCache) callconv(.c) Result;
pub const PFN_createGraphicsPipelines = ?*const fn (Device, PipelineCache, u32, [*c]const GraphicsPipelineCreateInfo, [*c]const AllocationCallbacks, [*c]Pipeline) callconv(.c) Result;
pub const PFN_createComputePipelines = ?*const fn (Device, PipelineCache, u32, [*c]const ComputePipelineCreateInfo, [*c]const AllocationCallbacks, [*c]Pipeline) callconv(.c) Result;
pub const PFN_destroyPipeline = ?*const fn (Device, Pipeline, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createPipelineLayout = ?*const fn (Device, [*c]const PipelineLayoutCreateInfo, [*c]const AllocationCallbacks, [*c]PipelineLayout) callconv(.c) Result;
pub const PFN_destroyPipelineLayout = ?*const fn (Device, PipelineLayout, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createSampler = ?*const fn (Device, [*c]const SamplerCreateInfo, [*c]const AllocationCallbacks, [*c]Sampler) callconv(.c) Result;
pub const PFN_destroySampler = ?*const fn (Device, Sampler, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createDescriptorSetLayout = ?*const fn (Device, [*c]const DescriptorSetLayoutCreateInfo, [*c]const AllocationCallbacks, [*c]DescriptorSetLayout) callconv(.c) Result;
pub const PFN_destroyDescriptorSetLayout = ?*const fn (Device, DescriptorSetLayout, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createDescriptorPool = ?*const fn (Device, [*c]const DescriptorPoolCreateInfo, [*c]const AllocationCallbacks, [*c]DescriptorPool) callconv(.c) Result;
pub const PFN_destroyDescriptorPool = ?*const fn (Device, DescriptorPool, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_resetDescriptorPool = ?*const fn (Device, DescriptorPool, DescriptorPoolResetFlags) callconv(.c) Result;
pub const PFN_allocateDescriptorSets = ?*const fn (Device, [*c]const DescriptorSetAllocateInfo, [*c]DescriptorSet) callconv(.c) Result;
pub const PFN_freeDescriptorSets = ?*const fn (Device, DescriptorPool, u32, [*c]const DescriptorSet) callconv(.c) Result;
pub const PFN_updateDescriptorSets = ?*const fn (Device, u32, [*c]const WriteDescriptorSet, u32, [*c]const CopyDescriptorSet) callconv(.c) void;
pub const PFN_createFramebuffer = ?*const fn (Device, [*c]const FramebufferCreateInfo, [*c]const AllocationCallbacks, [*c]Framebuffer) callconv(.c) Result;
pub const PFN_destroyFramebuffer = ?*const fn (Device, Framebuffer, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createRenderPass = ?*const fn (Device, [*c]const RenderPassCreateInfo, [*c]const AllocationCallbacks, [*c]RenderPass) callconv(.c) Result;
pub const PFN_destroyRenderPass = ?*const fn (Device, RenderPass, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getRenderAreaGranularity = ?*const fn (Device, RenderPass, [*c]Extent2D) callconv(.c) void;
pub const PFN_createCommandPool = ?*const fn (Device, [*c]const CommandPoolCreateInfo, [*c]const AllocationCallbacks, [*c]CommandPool) callconv(.c) Result;
pub const PFN_destroyCommandPool = ?*const fn (Device, CommandPool, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_resetCommandPool = ?*const fn (Device, CommandPool, CommandPoolResetFlags) callconv(.c) Result;
pub const PFN_allocateCommandBuffers = ?*const fn (Device, [*c]const CommandBufferAllocateInfo, [*c]CommandBuffer) callconv(.c) Result;
pub const PFN_freeCommandBuffers = ?*const fn (Device, CommandPool, u32, [*c]const CommandBuffer) callconv(.c) void;
pub const PFN_beginCommandBuffer = ?*const fn (CommandBuffer, [*c]const CommandBufferBeginInfo) callconv(.c) Result;
pub const PFN_endCommandBuffer = ?*const fn (CommandBuffer) callconv(.c) Result;
pub const PFN_resetCommandBuffer = ?*const fn (CommandBuffer, CommandBufferResetFlags) callconv(.c) Result;
pub const PFN_cmdBindPipeline = ?*const fn (CommandBuffer, PipelineBindPoint, Pipeline) callconv(.c) void;
pub const PFN_cmdSetViewport = ?*const fn (CommandBuffer, u32, u32, [*c]const Viewport) callconv(.c) void;
pub const PFN_cmdSetScissor = ?*const fn (CommandBuffer, u32, u32, [*c]const Rect2D) callconv(.c) void;
pub const PFN_cmdSetLineWidth = ?*const fn (CommandBuffer, f32) callconv(.c) void;
pub const PFN_cmdSetDepthBias = ?*const fn (CommandBuffer, f32, f32, f32) callconv(.c) void;
pub const PFN_cmdSetBlendConstants = ?*const fn (CommandBuffer, [*c]const f32) callconv(.c) void;
pub const PFN_cmdSetDepthBounds = ?*const fn (CommandBuffer, f32, f32) callconv(.c) void;
pub const PFN_cmdSetStencilCompareMask = ?*const fn (CommandBuffer, StencilFaceFlags, u32) callconv(.c) void;
pub const PFN_cmdSetStencilWriteMask = ?*const fn (CommandBuffer, StencilFaceFlags, u32) callconv(.c) void;
pub const PFN_cmdSetStencilReference = ?*const fn (CommandBuffer, StencilFaceFlags, u32) callconv(.c) void;
pub const PFN_cmdBindDescriptorSets = ?*const fn (CommandBuffer, PipelineBindPoint, PipelineLayout, u32, u32, [*c]const DescriptorSet, u32, [*c]const u32) callconv(.c) void;
pub const PFN_cmdBindIndexBuffer = ?*const fn (CommandBuffer, Buffer, DeviceSize, IndexType) callconv(.c) void;
pub const PFN_cmdBindVertexBuffers = ?*const fn (CommandBuffer, u32, u32, [*c]const Buffer, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdDraw = ?*const fn (CommandBuffer, u32, u32, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndexed = ?*const fn (CommandBuffer, u32, u32, u32, i32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndirect = ?*const fn (CommandBuffer, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndexedIndirect = ?*const fn (CommandBuffer, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDispatch = ?*const fn (CommandBuffer, u32, u32, u32) callconv(.c) void;
pub const PFN_cmdDispatchIndirect = ?*const fn (CommandBuffer, Buffer, DeviceSize) callconv(.c) void;
pub const PFN_cmdCopyBuffer = ?*const fn (CommandBuffer, Buffer, Buffer, u32, [*c]const BufferCopy) callconv(.c) void;
pub const PFN_cmdCopyImage = ?*const fn (CommandBuffer, Image, ImageLayout, Image, ImageLayout, u32, [*c]const ImageCopy) callconv(.c) void;
pub const PFN_cmdBlitImage = ?*const fn (CommandBuffer, Image, ImageLayout, Image, ImageLayout, u32, [*c]const ImageBlit, Filter) callconv(.c) void;
pub const PFN_cmdCopyBufferToImage = ?*const fn (CommandBuffer, Buffer, Image, ImageLayout, u32, [*c]const BufferImageCopy) callconv(.c) void;
pub const PFN_cmdCopyImageToBuffer = ?*const fn (CommandBuffer, Image, ImageLayout, Buffer, u32, [*c]const BufferImageCopy) callconv(.c) void;
pub const PFN_cmdUpdateBuffer = ?*const fn (CommandBuffer, Buffer, DeviceSize, DeviceSize, ?*const anyopaque) callconv(.c) void;
pub const PFN_cmdFillBuffer = ?*const fn (CommandBuffer, Buffer, DeviceSize, DeviceSize, u32) callconv(.c) void;
pub const PFN_cmdClearColorImage = ?*const fn (CommandBuffer, Image, ImageLayout, [*c]const ClearColorValue, u32, [*c]const ImageSubresourceRange) callconv(.c) void;
pub const PFN_cmdClearDepthStencilImage = ?*const fn (CommandBuffer, Image, ImageLayout, [*c]const ClearDepthStencilValue, u32, [*c]const ImageSubresourceRange) callconv(.c) void;
pub const PFN_cmdClearAttachments = ?*const fn (CommandBuffer, u32, [*c]const ClearAttachment, u32, [*c]const ClearRect) callconv(.c) void;
pub const PFN_cmdResolveImage = ?*const fn (CommandBuffer, Image, ImageLayout, Image, ImageLayout, u32, [*c]const ImageResolve) callconv(.c) void;
pub const PFN_cmdSetEvent = ?*const fn (CommandBuffer, Event, PipelineStageFlags) callconv(.c) void;
pub const PFN_cmdResetEvent = ?*const fn (CommandBuffer, Event, PipelineStageFlags) callconv(.c) void;
pub const PFN_cmdWaitEvents = ?*const fn (CommandBuffer, u32, [*c]const Event, PipelineStageFlags, PipelineStageFlags, u32, [*c]const MemoryBarrier, u32, [*c]const BufferMemoryBarrier, u32, [*c]const ImageMemoryBarrier) callconv(.c) void;
pub const PFN_cmdPipelineBarrier = ?*const fn (CommandBuffer, PipelineStageFlags, PipelineStageFlags, DependencyFlags, u32, [*c]const MemoryBarrier, u32, [*c]const BufferMemoryBarrier, u32, [*c]const ImageMemoryBarrier) callconv(.c) void;
pub const PFN_cmdBeginQuery = ?*const fn (CommandBuffer, QueryPool, u32, QueryControlFlags) callconv(.c) void;
pub const PFN_cmdEndQuery = ?*const fn (CommandBuffer, QueryPool, u32) callconv(.c) void;
pub const PFN_cmdResetQueryPool = ?*const fn (CommandBuffer, QueryPool, u32, u32) callconv(.c) void;
pub const PFN_cmdWriteTimestamp = ?*const fn (CommandBuffer, PipelineStageFlagBits, QueryPool, u32) callconv(.c) void;
pub const PFN_cmdCopyQueryPoolResults = ?*const fn (CommandBuffer, QueryPool, u32, u32, Buffer, DeviceSize, DeviceSize, QueryResultFlags) callconv(.c) void;
pub const PFN_cmdPushConstants = ?*const fn (CommandBuffer, PipelineLayout, ShaderStageFlags, u32, u32, ?*const anyopaque) callconv(.c) void;
pub const PFN_cmdBeginRenderPass = ?*const fn (CommandBuffer, [*c]const RenderPassBeginInfo, SubpassContents) callconv(.c) void;
pub const PFN_cmdNextSubpass = ?*const fn (CommandBuffer, SubpassContents) callconv(.c) void;
pub const PFN_cmdEndRenderPass = ?*const fn (CommandBuffer) callconv(.c) void;
pub const PFN_cmdExecuteCommands = ?*const fn (CommandBuffer, u32, [*c]const CommandBuffer) callconv(.c) void;
pub extern fn createInstance(p_create_info: [*c]const InstanceCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_instance: [*c]Instance) Result;
pub extern fn destroyInstance(instance: Instance, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn enumeratePhysicalDevices(instance: Instance, p_physical_device_count: [*c]u32, p_physical_devices: [*c]PhysicalDevice) Result;
pub extern fn getPhysicalDeviceFeatures(physical_device: PhysicalDevice, p_features: [*c]PhysicalDeviceFeatures) void;
pub extern fn getPhysicalDeviceFormatProperties(physical_device: PhysicalDevice, format: Format, p_format_properties: [*c]FormatProperties) void;
pub extern fn getPhysicalDeviceImageFormatProperties(physical_device: PhysicalDevice, format: Format, @"type": ImageType, tiling: ImageTiling, usage: ImageUsageFlags, flags: ImageCreateFlags, p_image_format_properties: [*c]ImageFormatProperties) Result;
pub extern fn getPhysicalDeviceProperties(physical_device: PhysicalDevice, p_properties: [*c]PhysicalDeviceProperties) void;
pub extern fn getPhysicalDeviceQueueFamilyProperties(physical_device: PhysicalDevice, p_queue_family_property_count: [*c]u32, p_queue_family_properties: [*c]QueueFamilyProperties) void;
pub extern fn getPhysicalDeviceMemoryProperties(physical_device: PhysicalDevice, p_memory_properties: [*c]PhysicalDeviceMemoryProperties) void;
pub extern fn getInstanceProcAddr(instance: Instance, p_name: [*c]const u8) PFN_voidFunction;
pub extern fn getDeviceProcAddr(device: Device, p_name: [*c]const u8) PFN_voidFunction;
pub extern fn createDevice(physical_device: PhysicalDevice, p_create_info: [*c]const DeviceCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_device: [*c]Device) Result;
pub extern fn destroyDevice(device: Device, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn enumerateInstanceExtensionProperties(p_layer_name: [*c]const u8, p_property_count: [*c]u32, p_properties: [*c]ExtensionProperties) Result;
pub extern fn enumerateDeviceExtensionProperties(physical_device: PhysicalDevice, p_layer_name: [*c]const u8, p_property_count: [*c]u32, p_properties: [*c]ExtensionProperties) Result;
pub extern fn enumerateInstanceLayerProperties(p_property_count: [*c]u32, p_properties: [*c]LayerProperties) Result;
pub extern fn enumerateDeviceLayerProperties(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]LayerProperties) Result;
pub extern fn getDeviceQueue(device: Device, queue_family_index: u32, queue_index: u32, p_queue: [*c]Queue) void;
pub extern fn queueSubmit(queue: Queue, submit_count: u32, p_submits: [*c]const SubmitInfo, fence: Fence) Result;
pub extern fn queueWaitIdle(queue: Queue) Result;
pub extern fn deviceWaitIdle(device: Device) Result;
pub extern fn allocateMemory(device: Device, p_allocate_info: [*c]const MemoryAllocateInfo, p_allocator: [*c]const AllocationCallbacks, p_memory: [*c]DeviceMemory) Result;
pub extern fn freeMemory(device: Device, memory: DeviceMemory, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn mapMemory(device: Device, memory: DeviceMemory, offset: DeviceSize, size: DeviceSize, flags: MemoryMapFlags, pp_data: [*c]?*anyopaque) Result;
pub extern fn unmapMemory(device: Device, memory: DeviceMemory) void;
pub extern fn flushMappedMemoryRanges(device: Device, memory_range_count: u32, p_memory_ranges: [*c]const MappedMemoryRange) Result;
pub extern fn invalidateMappedMemoryRanges(device: Device, memory_range_count: u32, p_memory_ranges: [*c]const MappedMemoryRange) Result;
pub extern fn getDeviceMemoryCommitment(device: Device, memory: DeviceMemory, p_committed_memory_in_bytes: [*c]DeviceSize) void;
pub extern fn bindBufferMemory(device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize) Result;
pub extern fn bindImageMemory(device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize) Result;
pub extern fn getBufferMemoryRequirements(device: Device, buffer: Buffer, p_memory_requirements: [*c]MemoryRequirements) void;
pub extern fn getImageMemoryRequirements(device: Device, image: Image, p_memory_requirements: [*c]MemoryRequirements) void;
pub extern fn getImageSparseMemoryRequirements(device: Device, image: Image, p_sparse_memory_requirement_count: [*c]u32, p_sparse_memory_requirements: [*c]SparseImageMemoryRequirements) void;
pub extern fn getPhysicalDeviceSparseImageFormatProperties(physical_device: PhysicalDevice, format: Format, @"type": ImageType, samples: SampleCountFlagBits, usage: ImageUsageFlags, tiling: ImageTiling, p_property_count: [*c]u32, p_properties: [*c]SparseImageFormatProperties) void;
pub extern fn queueBindSparse(queue: Queue, bind_info_count: u32, p_bind_info: [*c]const BindSparseInfo, fence: Fence) Result;
pub extern fn createFence(device: Device, p_create_info: [*c]const FenceCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_fence: [*c]Fence) Result;
pub extern fn destroyFence(device: Device, fence: Fence, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn resetFences(device: Device, fence_count: u32, p_fences: [*c]const Fence) Result;
pub extern fn getFenceStatus(device: Device, fence: Fence) Result;
pub extern fn waitForFences(device: Device, fence_count: u32, p_fences: [*c]const Fence, wait_all: Bool32, timeout: u64) Result;
pub extern fn createSemaphore(device: Device, p_create_info: [*c]const SemaphoreCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_semaphore: [*c]Semaphore) Result;
pub extern fn destroySemaphore(device: Device, semaphore: Semaphore, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createEvent(device: Device, p_create_info: [*c]const EventCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_event: [*c]Event) Result;
pub extern fn destroyEvent(device: Device, event: Event, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getEventStatus(device: Device, event: Event) Result;
pub extern fn setEvent(device: Device, event: Event) Result;
pub extern fn resetEvent(device: Device, event: Event) Result;
pub extern fn createQueryPool(device: Device, p_create_info: [*c]const QueryPoolCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_query_pool: [*c]QueryPool) Result;
pub extern fn destroyQueryPool(device: Device, query_pool: QueryPool, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getQueryPoolResults(device: Device, query_pool: QueryPool, first_query: u32, query_count: u32, data_size: usize, p_data: ?*anyopaque, stride: DeviceSize, flags: QueryResultFlags) Result;
pub extern fn createBuffer(device: Device, p_create_info: [*c]const BufferCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_buffer: [*c]Buffer) Result;
pub extern fn destroyBuffer(device: Device, buffer: Buffer, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createBufferView(device: Device, p_create_info: [*c]const BufferViewCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_view: [*c]BufferView) Result;
pub extern fn destroyBufferView(device: Device, buffer_view: BufferView, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createImage(device: Device, p_create_info: [*c]const ImageCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_image: [*c]Image) Result;
pub extern fn destroyImage(device: Device, image: Image, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getImageSubresourceLayout(device: Device, image: Image, p_subresource: [*c]const ImageSubresource, p_layout: [*c]SubresourceLayout) void;
pub extern fn createImageView(device: Device, p_create_info: [*c]const ImageViewCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_view: [*c]ImageView) Result;
pub extern fn destroyImageView(device: Device, image_view: ImageView, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createShaderModule(device: Device, p_create_info: [*c]const ShaderModuleCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_shader_module: [*c]ShaderModule) Result;
pub extern fn destroyShaderModule(device: Device, shader_module: ShaderModule, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createPipelineCache(device: Device, p_create_info: [*c]const PipelineCacheCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_pipeline_cache: [*c]PipelineCache) Result;
pub extern fn destroyPipelineCache(device: Device, pipeline_cache: PipelineCache, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getPipelineCacheData(device: Device, pipeline_cache: PipelineCache, p_data_size: [*c]usize, p_data: ?*anyopaque) Result;
pub extern fn mergePipelineCaches(device: Device, dst_cache: PipelineCache, src_cache_count: u32, p_src_caches: [*c]const PipelineCache) Result;
pub extern fn createGraphicsPipelines(device: Device, pipeline_cache: PipelineCache, create_info_count: u32, p_create_infos: [*c]const GraphicsPipelineCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_pipelines: [*c]Pipeline) Result;
pub extern fn createComputePipelines(device: Device, pipeline_cache: PipelineCache, create_info_count: u32, p_create_infos: [*c]const ComputePipelineCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_pipelines: [*c]Pipeline) Result;
pub extern fn destroyPipeline(device: Device, pipeline: Pipeline, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createPipelineLayout(device: Device, p_create_info: [*c]const PipelineLayoutCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_pipeline_layout: [*c]PipelineLayout) Result;
pub extern fn destroyPipelineLayout(device: Device, pipeline_layout: PipelineLayout, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createSampler(device: Device, p_create_info: [*c]const SamplerCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_sampler: [*c]Sampler) Result;
pub extern fn destroySampler(device: Device, sampler: Sampler, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createDescriptorSetLayout(device: Device, p_create_info: [*c]const DescriptorSetLayoutCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_set_layout: [*c]DescriptorSetLayout) Result;
pub extern fn destroyDescriptorSetLayout(device: Device, descriptor_set_layout: DescriptorSetLayout, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createDescriptorPool(device: Device, p_create_info: [*c]const DescriptorPoolCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_descriptor_pool: [*c]DescriptorPool) Result;
pub extern fn destroyDescriptorPool(device: Device, descriptor_pool: DescriptorPool, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn resetDescriptorPool(device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags) Result;
pub extern fn allocateDescriptorSets(device: Device, p_allocate_info: [*c]const DescriptorSetAllocateInfo, p_descriptor_sets: [*c]DescriptorSet) Result;
pub extern fn freeDescriptorSets(device: Device, descriptor_pool: DescriptorPool, descriptor_set_count: u32, p_descriptor_sets: [*c]const DescriptorSet) Result;
pub extern fn updateDescriptorSets(device: Device, descriptor_write_count: u32, p_descriptor_writes: [*c]const WriteDescriptorSet, descriptor_copy_count: u32, p_descriptor_copies: [*c]const CopyDescriptorSet) void;
pub extern fn createFramebuffer(device: Device, p_create_info: [*c]const FramebufferCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_framebuffer: [*c]Framebuffer) Result;
pub extern fn destroyFramebuffer(device: Device, framebuffer: Framebuffer, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createRenderPass(device: Device, p_create_info: [*c]const RenderPassCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_render_pass: [*c]RenderPass) Result;
pub extern fn destroyRenderPass(device: Device, render_pass: RenderPass, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getRenderAreaGranularity(device: Device, render_pass: RenderPass, p_granularity: [*c]Extent2D) void;
pub extern fn createCommandPool(device: Device, p_create_info: [*c]const CommandPoolCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_command_pool: [*c]CommandPool) Result;
pub extern fn destroyCommandPool(device: Device, command_pool: CommandPool, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn resetCommandPool(device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags) Result;
pub extern fn allocateCommandBuffers(device: Device, p_allocate_info: [*c]const CommandBufferAllocateInfo, p_command_buffers: [*c]CommandBuffer) Result;
pub extern fn freeCommandBuffers(device: Device, command_pool: CommandPool, command_buffer_count: u32, p_command_buffers: [*c]const CommandBuffer) void;
pub extern fn beginCommandBuffer(command_buffer: CommandBuffer, p_begin_info: [*c]const CommandBufferBeginInfo) Result;
pub extern fn endCommandBuffer(command_buffer: CommandBuffer) Result;
pub extern fn resetCommandBuffer(command_buffer: CommandBuffer, flags: CommandBufferResetFlags) Result;
pub extern fn cmdBindPipeline(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, pipeline: Pipeline) void;
pub extern fn cmdSetViewport(command_buffer: CommandBuffer, first_viewport: u32, viewport_count: u32, p_viewports: [*c]const Viewport) void;
pub extern fn cmdSetScissor(command_buffer: CommandBuffer, first_scissor: u32, scissor_count: u32, p_scissors: [*c]const Rect2D) void;
pub extern fn cmdSetLineWidth(command_buffer: CommandBuffer, line_width: f32) void;
pub extern fn cmdSetDepthBias(command_buffer: CommandBuffer, depth_bias_constant_factor: f32, depth_bias_clamp: f32, depth_bias_slope_factor: f32) void;
pub extern fn cmdSetBlendConstants(command_buffer: CommandBuffer, blend_constants: [*c]const f32) void;
pub extern fn cmdSetDepthBounds(command_buffer: CommandBuffer, min_depth_bounds: f32, max_depth_bounds: f32) void;
pub extern fn cmdSetStencilCompareMask(command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: u32) void;
pub extern fn cmdSetStencilWriteMask(command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: u32) void;
pub extern fn cmdSetStencilReference(command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: u32) void;
pub extern fn cmdBindDescriptorSets(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, layout: PipelineLayout, first_set: u32, descriptor_set_count: u32, p_descriptor_sets: [*c]const DescriptorSet, dynamic_offset_count: u32, p_dynamic_offsets: [*c]const u32) void;
pub extern fn cmdBindIndexBuffer(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, index_type: IndexType) void;
pub extern fn cmdBindVertexBuffers(command_buffer: CommandBuffer, first_binding: u32, binding_count: u32, p_buffers: [*c]const Buffer, p_offsets: [*c]const DeviceSize) void;
pub extern fn cmdDraw(command_buffer: CommandBuffer, vertex_count: u32, instance_count: u32, first_vertex: u32, first_instance: u32) void;
pub extern fn cmdDrawIndexed(command_buffer: CommandBuffer, index_count: u32, instance_count: u32, first_index: u32, vertex_offset: i32, first_instance: u32) void;
pub extern fn cmdDrawIndirect(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, draw_count: u32, stride: u32) void;
pub extern fn cmdDrawIndexedIndirect(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, draw_count: u32, stride: u32) void;
pub extern fn cmdDispatch(command_buffer: CommandBuffer, group_count_x: u32, group_count_y: u32, group_count_z: u32) void;
pub extern fn cmdDispatchIndirect(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize) void;
pub extern fn cmdCopyBuffer(command_buffer: CommandBuffer, src_buffer: Buffer, dst_buffer: Buffer, region_count: u32, p_regions: [*c]const BufferCopy) void;
pub extern fn cmdCopyImage(command_buffer: CommandBuffer, src_image: Image, src_imageLayout: ImageLayout, dst_image: Image, dst_imageLayout: ImageLayout, region_count: u32, p_regions: [*c]const ImageCopy) void;
pub extern fn cmdBlitImage(command_buffer: CommandBuffer, src_image: Image, src_imageLayout: ImageLayout, dst_image: Image, dst_imageLayout: ImageLayout, region_count: u32, p_regions: [*c]const ImageBlit, filter: Filter) void;
pub extern fn cmdCopyBufferToImage(command_buffer: CommandBuffer, src_buffer: Buffer, dst_image: Image, dst_imageLayout: ImageLayout, region_count: u32, p_regions: [*c]const BufferImageCopy) void;
pub extern fn cmdCopyImageToBuffer(command_buffer: CommandBuffer, src_image: Image, src_imageLayout: ImageLayout, dst_buffer: Buffer, region_count: u32, p_regions: [*c]const BufferImageCopy) void;
pub extern fn cmdUpdateBuffer(command_buffer: CommandBuffer, dst_buffer: Buffer, dst_offset: DeviceSize, data_size: DeviceSize, p_data: ?*const anyopaque) void;
pub extern fn cmdFillBuffer(command_buffer: CommandBuffer, dst_buffer: Buffer, dst_offset: DeviceSize, size: DeviceSize, data: u32) void;
pub extern fn cmdClearColorImage(command_buffer: CommandBuffer, image: Image, image_layout: ImageLayout, p_color: [*c]const ClearColorValue, range_count: u32, p_ranges: [*c]const ImageSubresourceRange) void;
pub extern fn cmdClearDepthStencilImage(command_buffer: CommandBuffer, image: Image, image_layout: ImageLayout, p_depth_stencil: [*c]const ClearDepthStencilValue, range_count: u32, p_ranges: [*c]const ImageSubresourceRange) void;
pub extern fn cmdClearAttachments(command_buffer: CommandBuffer, attachment_count: u32, p_attachments: [*c]const ClearAttachment, rect_count: u32, p_rects: [*c]const ClearRect) void;
pub extern fn cmdResolveImage(command_buffer: CommandBuffer, src_image: Image, src_imageLayout: ImageLayout, dst_image: Image, dst_imageLayout: ImageLayout, region_count: u32, p_regions: [*c]const ImageResolve) void;
pub extern fn cmdSetEvent(command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags) void;
pub extern fn cmdResetEvent(command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags) void;
pub extern fn cmdWaitEvents(command_buffer: CommandBuffer, event_count: u32, p_events: [*c]const Event, src_stage_mask: PipelineStageFlags, dst_stage_mask: PipelineStageFlags, memory_barrier_count: u32, p_memory_barriers: [*c]const MemoryBarrier, buffer_memory_barrier_count: u32, p_buffer_memory_barriers: [*c]const BufferMemoryBarrier, image_memory_barrier_count: u32, p_image_memory_barriers: [*c]const ImageMemoryBarrier) void;
pub extern fn cmdPipelineBarrier(command_buffer: CommandBuffer, src_stage_mask: PipelineStageFlags, dst_stage_mask: PipelineStageFlags, dependency_flags: DependencyFlags, memory_barrier_count: u32, p_memory_barriers: [*c]const MemoryBarrier, buffer_memory_barrier_count: u32, p_buffer_memory_barriers: [*c]const BufferMemoryBarrier, image_memory_barrier_count: u32, p_image_memory_barriers: [*c]const ImageMemoryBarrier) void;
pub extern fn cmdBeginQuery(command_buffer: CommandBuffer, query_pool: QueryPool, query: u32, flags: QueryControlFlags) void;
pub extern fn cmdEndQuery(command_buffer: CommandBuffer, query_pool: QueryPool, query: u32) void;
pub extern fn cmdResetQueryPool(command_buffer: CommandBuffer, query_pool: QueryPool, first_query: u32, query_count: u32) void;
pub extern fn cmdWriteTimestamp(command_buffer: CommandBuffer, pipeline_stage: PipelineStageFlagBits, query_pool: QueryPool, query: u32) void;
pub extern fn cmdCopyQueryPoolResults(command_buffer: CommandBuffer, query_pool: QueryPool, first_query: u32, query_count: u32, dst_buffer: Buffer, dst_offset: DeviceSize, stride: DeviceSize, flags: QueryResultFlags) void;
pub extern fn cmdPushConstants(command_buffer: CommandBuffer, layout: PipelineLayout, stage_flags: ShaderStageFlags, offset: u32, size: u32, p_values: ?*const anyopaque) void;
pub extern fn cmdBeginRenderPass(command_buffer: CommandBuffer, p_render_pass_begin: [*c]const RenderPassBeginInfo, contents: SubpassContents) void;
pub extern fn cmdNextSubpass(command_buffer: CommandBuffer, contents: SubpassContents) void;
pub extern fn cmdEndRenderPass(command_buffer: CommandBuffer) void;
pub extern fn cmdExecuteCommands(command_buffer: CommandBuffer, command_bufferCount: u32, p_command_buffers: [*c]const CommandBuffer) void;
pub const SamplerYcbcrConversion = enum(u64) { null = 0, _ };
pub const DescriptorUpdateTemplate = enum(u64) { null = 0, _ };
pub const PointClippingBehavior = enum(u32) {
    all_clip_planes = 0,
    user_clip_planes_only = 1,
    max_enum = 2147483647,
    const Self = @This();
    pub const user_clip_planes_only_khr = Self.user_clip_planes_only;
    pub const all_clip_planes_khr = Self.all_clip_planes;
};
pub const TessellationDomainOrigin = enum(u32) {
    upper_left = 0,
    lower_left = 1,
    max_enum = 2147483647,
    const Self = @This();
    pub const lower_left_khr = Self.lower_left;
    pub const upper_left_khr = Self.upper_left;
};
pub const SamplerYcbcrModelConversion = enum(u32) {
    rgb_identity = 0,
    ycbcr_identity = 1,
    ycbcr_709 = 2,
    ycbcr_601 = 3,
    ycbcr_2020 = 4,
    max_enum = 2147483647,
    const Self = @This();
    pub const ycbcr_2020_khr = Self.ycbcr_2020;
    pub const ycbcr_601_khr = Self.ycbcr_601;
    pub const ycbcr_709_khr = Self.ycbcr_709;
    pub const ycbcr_identity_khr = Self.ycbcr_identity;
    pub const rgb_identity_khr = Self.rgb_identity;
};
pub const SamplerYcbcrRange = enum(u32) {
    itu_full = 0,
    itu_narrow = 1,
    max_enum = 2147483647,
    const Self = @This();
    pub const itu_narrow_khr = Self.itu_narrow;
    pub const itu_full_khr = Self.itu_full;
};
pub const ChromaLocation = enum(u32) {
    cosited_even = 0,
    midpoint = 1,
    max_enum = 2147483647,
    const Self = @This();
    pub const midpoint_khr = Self.midpoint;
    pub const cosited_even_khr = Self.cosited_even;
};
pub const DescriptorUpdateTemplateType = enum(u32) {
    descriptor_set = 0,
    push_descriptors = 1,
    max_enum = 2147483647,
    const Self = @This();
    pub const push_descriptors_khr = Self.push_descriptors;
    pub const descriptor_set_khr = Self.descriptor_set;
};
pub const SubgroupFeatureFlagBits = enum(u32) {
    basic_bit = 1,
    vote_bit = 2,
    arithmetic_bit = 4,
    ballot_bit = 8,
    shuffle_bit = 16,
    shuffle_relative_bit = 32,
    clustered_bit = 64,
    quad_bit = 128,
    partitioned_bit_nv = 256,
    rotate_bit = 512,
    rotate_clustered_bit = 1024,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const rotate_clustered_bit_khr = Self.rotate_clustered_bit;
    pub const rotate_bit_khr = Self.rotate_bit;
};
pub const SubgroupFeatureFlags = PES(SubgroupFeatureFlagBits);
pub const PeerMemoryFeatureFlagBits = enum(u32) {
    copy_src_bit = 1,
    copy_dst_bit = 2,
    generic_src_bit = 4,
    generic_dst_bit = 8,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const generic_dst_bit_khr = Self.generic_dst_bit;
    pub const generic_src_bit_khr = Self.generic_src_bit;
    pub const copy_dst_bit_khr = Self.copy_dst_bit;
    pub const copy_src_bit_khr = Self.copy_src_bit;
};
pub const PeerMemoryFeatureFlags = PES(PeerMemoryFeatureFlagBits);
pub const MemoryAllocateFlagBits = enum(u32) {
    device_mask_bit = 1,
    device_address_bit = 2,
    device_address_capture_replay_bit = 4,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const device_address_capture_replay_bit_khr = Self.device_address_capture_replay_bit;
    pub const device_address_bit_khr = Self.device_address_bit;
    pub const device_mask_bit_khr = Self.device_mask_bit;
};
pub const MemoryAllocateFlags = PES(MemoryAllocateFlagBits);
pub const CommandPoolTrimFlags = Flags;
pub const DescriptorUpdateTemplateCreateFlags = Flags;
pub const ExternalMemoryHandleTypeFlagBits = enum(u32) {
    opaque_fd_bit = 1,
    opaque_win32_bit = 2,
    opaque_win32_kmt_bit = 4,
    d3d11_texture_bit = 8,
    d3d11_texture_kmt_bit = 16,
    d3d12_heap_bit = 32,
    d3d12_resource_bit = 64,
    host_allocation_bit_ext = 128,
    host_mapped_foreign_memory_bit_ext = 256,
    dma_buf_bit_ext = 512,
    android_hardware_buffer_bit_android = 1024,
    zircon_vmo_bit_fuchsia = 2048,
    rdma_address_bit_nv = 4096,
    screen_buffer_bit_qnx = 16384,
    mtlbuffer_bit_ext = 65536,
    mtltexture_bit_ext = 131072,
    mtlheap_bit_ext = 262144,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const d3d12_resource_bit_khr = Self.d3d12_resource_bit;
    pub const d3d12_heap_bit_khr = Self.d3d12_heap_bit;
    pub const d3d11_texture_kmt_bit_khr = Self.d3d11_texture_kmt_bit;
    pub const d3d11_texture_bit_khr = Self.d3d11_texture_bit;
    pub const opaque_win32_kmt_bit_khr = Self.opaque_win32_kmt_bit;
    pub const opaque_win32_bit_khr = Self.opaque_win32_bit;
    pub const opaque_fd_bit_khr = Self.opaque_fd_bit;
};
pub const ExternalMemoryHandleTypeFlags = PES(ExternalMemoryHandleTypeFlagBits);
pub const ExternalMemoryFeatureFlagBits = enum(u32) {
    dedicated_only_bit = 1,
    exportable_bit = 2,
    importable_bit = 4,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const importable_bit_khr = Self.importable_bit;
    pub const exportable_bit_khr = Self.exportable_bit;
    pub const dedicated_only_bit_khr = Self.dedicated_only_bit;
};
pub const ExternalMemoryFeatureFlags = PES(ExternalMemoryFeatureFlagBits);
pub const ExternalFenceHandleTypeFlagBits = enum(u32) {
    opaque_fd_bit = 1,
    opaque_win32_bit = 2,
    opaque_win32_kmt_bit = 4,
    sync_fd_bit = 8,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const sync_fd_bit_khr = Self.sync_fd_bit;
    pub const opaque_win32_kmt_bit_khr = Self.opaque_win32_kmt_bit;
    pub const opaque_win32_bit_khr = Self.opaque_win32_bit;
    pub const opaque_fd_bit_khr = Self.opaque_fd_bit;
};
pub const ExternalFenceHandleTypeFlags = PES(ExternalFenceHandleTypeFlagBits);
pub const ExternalFenceFeatureFlagBits = enum(u32) {
    exportable_bit = 1,
    importable_bit = 2,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const importable_bit_khr = Self.importable_bit;
    pub const exportable_bit_khr = Self.exportable_bit;
};
pub const ExternalFenceFeatureFlags = PES(ExternalFenceFeatureFlagBits);
pub const FenceImportFlagBits = enum(u32) {
    temporary_bit = 1,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const temporary_bit_khr = Self.temporary_bit;
};
pub const FenceImportFlags = PES(FenceImportFlagBits);
pub const SemaphoreImportFlagBits = enum(u32) {
    temporary_bit = 1,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const temporary_bit_khr = Self.temporary_bit;
};
pub const SemaphoreImportFlags = PES(SemaphoreImportFlagBits);
pub const ExternalSemaphoreHandleTypeFlagBits = enum(u32) {
    opaque_fd_bit = 1,
    opaque_win32_bit = 2,
    opaque_win32_kmt_bit = 4,
    d3d11_fence_bit = 8,
    sync_fd_bit = 16,
    zircon_event_bit_fuchsia = 128,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const d3d12_fence_bit_khr = Self.d3d11_fence_bit;
    pub const sync_fd_bit_khr = Self.sync_fd_bit;
    pub const d3d12_fence_bit = Self.d3d11_fence_bit;
    pub const opaque_win32_kmt_bit_khr = Self.opaque_win32_kmt_bit;
    pub const opaque_win32_bit_khr = Self.opaque_win32_bit;
    pub const opaque_fd_bit_khr = Self.opaque_fd_bit;
};
pub const ExternalSemaphoreHandleTypeFlags = PES(ExternalSemaphoreHandleTypeFlagBits);
pub const ExternalSemaphoreFeatureFlagBits = enum(u32) {
    exportable_bit = 1,
    importable_bit = 2,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const importable_bit_khr = Self.importable_bit;
    pub const exportable_bit_khr = Self.exportable_bit;
};
pub const ExternalSemaphoreFeatureFlags = PES(ExternalSemaphoreFeatureFlagBits);
pub const PhysicalDeviceSubgroupProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    subgroup_size: u32 = @import("std").mem.zeroes(u32),
    supported_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    supported_operations: SubgroupFeatureFlags = @import("std").mem.zeroes(SubgroupFeatureFlags),
    quad_operations_in_all_stages: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const BindBufferMemoryInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    memory_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const BindImageMemoryInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    memory_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PhysicalDevice16BitStorageFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    storage_buffer16_bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_and_storage_buffer16_bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_push_constant16: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_input_output16: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MemoryDedicatedRequirements = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    prefers_dedicated_allocation: Bool32 = @import("std").mem.zeroes(Bool32),
    requires_dedicated_allocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MemoryDedicatedAllocateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
};
pub const MemoryAllocateFlagsInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: MemoryAllocateFlags = @import("std").mem.zeroes(MemoryAllocateFlags),
    device_mask: u32 = @import("std").mem.zeroes(u32),
};
pub const DeviceGroupRenderPassBeginInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_mask: u32 = @import("std").mem.zeroes(u32),
    device_render_area_count: u32 = @import("std").mem.zeroes(u32),
    p_device_render_areas: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const DeviceGroupCommandBufferBeginInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_mask: u32 = @import("std").mem.zeroes(u32),
};
pub const DeviceGroupSubmitInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    wait_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_wait_semaphore_device_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    command_buffer_count: u32 = @import("std").mem.zeroes(u32),
    p_command_buffer_device_masks: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    signal_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_signal_semaphore_device_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const DeviceGroupBindSparseInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    resource_device_index: u32 = @import("std").mem.zeroes(u32),
    memory_device_index: u32 = @import("std").mem.zeroes(u32),
};
pub const BindBufferMemoryDeviceGroupInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_index_count: u32 = @import("std").mem.zeroes(u32),
    p_device_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const BindImageMemoryDeviceGroupInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_index_count: u32 = @import("std").mem.zeroes(u32),
    p_device_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    split_instance_bind_region_count: u32 = @import("std").mem.zeroes(u32),
    p_split_instance_bind_regions: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const PhysicalDeviceGroupProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    physical_device_count: u32 = @import("std").mem.zeroes(u32),
    physical_devices: [32]PhysicalDevice = @import("std").mem.zeroes([32]PhysicalDevice),
    subset_allocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceGroupDeviceCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    physical_device_count: u32 = @import("std").mem.zeroes(u32),
    p_physical_devices: [*c]const PhysicalDevice = @import("std").mem.zeroes([*c]const PhysicalDevice),
};
pub const BufferMemoryRequirementsInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
};
pub const ImageMemoryRequirementsInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
};
pub const ImageSparseMemoryRequirementsInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
};
pub const MemoryRequirements2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_requirements: MemoryRequirements = @import("std").mem.zeroes(MemoryRequirements),
};
pub const SparseImageMemoryRequirements2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_requirements: SparseImageMemoryRequirements = @import("std").mem.zeroes(SparseImageMemoryRequirements),
};
pub const PhysicalDeviceFeatures2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    features: PhysicalDeviceFeatures = @import("std").mem.zeroes(PhysicalDeviceFeatures),
};
pub const PhysicalDeviceProperties2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    properties: PhysicalDeviceProperties = @import("std").mem.zeroes(PhysicalDeviceProperties),
};
pub const FormatProperties2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    format_properties: FormatProperties = @import("std").mem.zeroes(FormatProperties),
};
pub const ImageFormatProperties2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_format_properties: ImageFormatProperties = @import("std").mem.zeroes(ImageFormatProperties),
};
pub const PhysicalDeviceImageFormatInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    format: Format = @import("std").mem.zeroes(Format),
    type: ImageType = @import("std").mem.zeroes(ImageType),
    tiling: ImageTiling = @import("std").mem.zeroes(ImageTiling),
    usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    flags: ImageCreateFlags = @import("std").mem.zeroes(ImageCreateFlags),
};
pub const QueueFamilyProperties2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    queue_family_properties: QueueFamilyProperties = @import("std").mem.zeroes(QueueFamilyProperties),
};
pub const PhysicalDeviceMemoryProperties2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_properties: PhysicalDeviceMemoryProperties = @import("std").mem.zeroes(PhysicalDeviceMemoryProperties),
};
pub const SparseImageFormatProperties2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    properties: SparseImageFormatProperties = @import("std").mem.zeroes(SparseImageFormatProperties),
};
pub const PhysicalDeviceSparseImageFormatInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    format: Format = @import("std").mem.zeroes(Format),
    type: ImageType = @import("std").mem.zeroes(ImageType),
    samples: SampleCountFlagBits = @import("std").mem.zeroes(SampleCountFlagBits),
    usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    tiling: ImageTiling = @import("std").mem.zeroes(ImageTiling),
};
pub const PhysicalDevicePointClippingProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    point_clipping_behavior: PointClippingBehavior = @import("std").mem.zeroes(PointClippingBehavior),
};
pub const InputAttachmentAspectReference = extern struct {
    subpass: u32 = @import("std").mem.zeroes(u32),
    input_attachment_index: u32 = @import("std").mem.zeroes(u32),
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
};
pub const RenderPassInputAttachmentAspectCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    aspect_reference_count: u32 = @import("std").mem.zeroes(u32),
    p_aspect_references: [*c]const InputAttachmentAspectReference = @import("std").mem.zeroes([*c]const InputAttachmentAspectReference),
};
pub const ImageViewUsageCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
};
pub const PipelineTessellationDomainOriginStateCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    domain_origin: TessellationDomainOrigin = @import("std").mem.zeroes(TessellationDomainOrigin),
};
pub const RenderPassMultiviewCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    subpass_count: u32 = @import("std").mem.zeroes(u32),
    p_view_masks: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    dependency_count: u32 = @import("std").mem.zeroes(u32),
    p_view_offsets: [*c]const i32 = @import("std").mem.zeroes([*c]const i32),
    correlation_mask_count: u32 = @import("std").mem.zeroes(u32),
    p_correlation_masks: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const PhysicalDeviceMultiviewFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    multiview: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview_geometry_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview_tessellation_shader: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMultiviewProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_multiview_view_count: u32 = @import("std").mem.zeroes(u32),
    max_multiview_instance_index: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceVariablePointersFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    variable_pointers_storage_buffer: Bool32 = @import("std").mem.zeroes(Bool32),
    variable_pointers: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVariablePointerFeatures = PhysicalDeviceVariablePointersFeatures;
pub const PhysicalDeviceProtectedMemoryFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    protected_memory: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceProtectedMemoryProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    protected_no_fault: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceQueueInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DeviceQueueCreateFlags = @import("std").mem.zeroes(DeviceQueueCreateFlags),
    queue_family_index: u32 = @import("std").mem.zeroes(u32),
    queue_index: u32 = @import("std").mem.zeroes(u32),
};
pub const ProtectedSubmitInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    protected_submit: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SamplerYcbcrConversionCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    format: Format = @import("std").mem.zeroes(Format),
    ycbcr_model: SamplerYcbcrModelConversion = @import("std").mem.zeroes(SamplerYcbcrModelConversion),
    ycbcr_range: SamplerYcbcrRange = @import("std").mem.zeroes(SamplerYcbcrRange),
    components: ComponentMapping = @import("std").mem.zeroes(ComponentMapping),
    x_chroma_offset: ChromaLocation = @import("std").mem.zeroes(ChromaLocation),
    y_chroma_offset: ChromaLocation = @import("std").mem.zeroes(ChromaLocation),
    chroma_filter: Filter = @import("std").mem.zeroes(Filter),
    force_explicit_reconstruction: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SamplerYcbcrConversionInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    conversion: SamplerYcbcrConversion = @import("std").mem.zeroes(SamplerYcbcrConversion),
};
pub const BindImagePlaneMemoryInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    plane_aspect: ImageAspectFlagBits = @import("std").mem.zeroes(ImageAspectFlagBits),
};
pub const ImagePlaneMemoryRequirementsInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    plane_aspect: ImageAspectFlagBits = @import("std").mem.zeroes(ImageAspectFlagBits),
};
pub const PhysicalDeviceSamplerYcbcrConversionFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    sampler_ycbcr_conversion: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SamplerYcbcrConversionImageFormatProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    combined_image_sampler_descriptor_count: u32 = @import("std").mem.zeroes(u32),
};
pub const DescriptorUpdateTemplateEntry = extern struct {
    dst_binding: u32 = @import("std").mem.zeroes(u32),
    dst_array_element: u32 = @import("std").mem.zeroes(u32),
    descriptor_count: u32 = @import("std").mem.zeroes(u32),
    descriptor_type: DescriptorType = @import("std").mem.zeroes(DescriptorType),
    offset: usize = @import("std").mem.zeroes(usize),
    stride: usize = @import("std").mem.zeroes(usize),
};
pub const DescriptorUpdateTemplateCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DescriptorUpdateTemplateCreateFlags = @import("std").mem.zeroes(DescriptorUpdateTemplateCreateFlags),
    descriptor_update_entry_count: u32 = @import("std").mem.zeroes(u32),
    p_descriptor_update_entries: [*c]const DescriptorUpdateTemplateEntry = @import("std").mem.zeroes([*c]const DescriptorUpdateTemplateEntry),
    template_type: DescriptorUpdateTemplateType = @import("std").mem.zeroes(DescriptorUpdateTemplateType),
    descriptor_set_layout: DescriptorSetLayout = @import("std").mem.zeroes(DescriptorSetLayout),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    pipeline_layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    set: u32 = @import("std").mem.zeroes(u32),
};
pub const ExternalMemoryProperties = extern struct {
    external_memory_features: ExternalMemoryFeatureFlags = @import("std").mem.zeroes(ExternalMemoryFeatureFlags),
    export_from_imported_handle_types: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
    compatible_handle_types: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
};
pub const PhysicalDeviceExternalImageFormatInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_type: ExternalMemoryHandleTypeFlagBits = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagBits),
};
pub const ExternalImageFormatProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    external_memory_properties: ExternalMemoryProperties = @import("std").mem.zeroes(ExternalMemoryProperties),
};
pub const PhysicalDeviceExternalBufferInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: BufferCreateFlags = @import("std").mem.zeroes(BufferCreateFlags),
    usage: BufferUsageFlags = @import("std").mem.zeroes(BufferUsageFlags),
    handle_type: ExternalMemoryHandleTypeFlagBits = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagBits),
};
pub const ExternalBufferProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    external_memory_properties: ExternalMemoryProperties = @import("std").mem.zeroes(ExternalMemoryProperties),
};
pub const PhysicalDeviceIDProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    driver_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    device_luid: [8]u8 = @import("std").mem.zeroes([8]u8),
    device_node_mask: u32 = @import("std").mem.zeroes(u32),
    device_luidvalid: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ExternalMemoryImageCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
};
pub const ExternalMemoryBufferCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
};
pub const ExportMemoryAllocateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
};
pub const PhysicalDeviceExternalFenceInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_type: ExternalFenceHandleTypeFlagBits = @import("std").mem.zeroes(ExternalFenceHandleTypeFlagBits),
};
pub const ExternalFenceProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    export_from_imported_handle_types: ExternalFenceHandleTypeFlags = @import("std").mem.zeroes(ExternalFenceHandleTypeFlags),
    compatible_handle_types: ExternalFenceHandleTypeFlags = @import("std").mem.zeroes(ExternalFenceHandleTypeFlags),
    external_fence_features: ExternalFenceFeatureFlags = @import("std").mem.zeroes(ExternalFenceFeatureFlags),
};
pub const ExportFenceCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalFenceHandleTypeFlags = @import("std").mem.zeroes(ExternalFenceHandleTypeFlags),
};
pub const ExportSemaphoreCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalSemaphoreHandleTypeFlags = @import("std").mem.zeroes(ExternalSemaphoreHandleTypeFlags),
};
pub const PhysicalDeviceExternalSemaphoreInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_type: ExternalSemaphoreHandleTypeFlagBits = @import("std").mem.zeroes(ExternalSemaphoreHandleTypeFlagBits),
};
pub const ExternalSemaphoreProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    export_from_imported_handle_types: ExternalSemaphoreHandleTypeFlags = @import("std").mem.zeroes(ExternalSemaphoreHandleTypeFlags),
    compatible_handle_types: ExternalSemaphoreHandleTypeFlags = @import("std").mem.zeroes(ExternalSemaphoreHandleTypeFlags),
    external_semaphore_features: ExternalSemaphoreFeatureFlags = @import("std").mem.zeroes(ExternalSemaphoreFeatureFlags),
};
pub const PhysicalDeviceMaintenance3Properties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_per_set_descriptors: u32 = @import("std").mem.zeroes(u32),
    max_memory_allocation_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const DescriptorSetLayoutSupport = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supported: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderDrawParametersFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_draw_parameters: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderDrawParameterFeatures = PhysicalDeviceShaderDrawParametersFeatures;
pub const PFN_enumerateInstanceVersion = ?*const fn ([*c]u32) callconv(.c) Result;
pub const PFN_bindBufferMemory2 = ?*const fn (Device, u32, [*c]const BindBufferMemoryInfo) callconv(.c) Result;
pub const PFN_bindImageMemory2 = ?*const fn (Device, u32, [*c]const BindImageMemoryInfo) callconv(.c) Result;
pub const PFN_getDeviceGroupPeerMemoryFeatures = ?*const fn (Device, u32, u32, u32, [*c]PeerMemoryFeatureFlags) callconv(.c) void;
pub const PFN_cmdSetDeviceMask = ?*const fn (CommandBuffer, u32) callconv(.c) void;
pub const PFN_cmdDispatchBase = ?*const fn (CommandBuffer, u32, u32, u32, u32, u32, u32) callconv(.c) void;
pub const PFN_enumeratePhysicalDeviceGroups = ?*const fn (Instance, [*c]u32, [*c]PhysicalDeviceGroupProperties) callconv(.c) Result;
pub const PFN_getImageMemoryRequirements2 = ?*const fn (Device, [*c]const ImageMemoryRequirementsInfo2, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getBufferMemoryRequirements2 = ?*const fn (Device, [*c]const BufferMemoryRequirementsInfo2, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getImageSparseMemoryRequirements2 = ?*const fn (Device, [*c]const ImageSparseMemoryRequirementsInfo2, [*c]u32, [*c]SparseImageMemoryRequirements2) callconv(.c) void;
pub const PFN_getPhysicalDeviceFeatures2 = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceFeatures2) callconv(.c) void;
pub const PFN_getPhysicalDeviceProperties2 = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceFormatProperties2 = ?*const fn (PhysicalDevice, Format, [*c]FormatProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceImageFormatProperties2 = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceImageFormatInfo2, [*c]ImageFormatProperties2) callconv(.c) Result;
pub const PFN_getPhysicalDeviceQueueFamilyProperties2 = ?*const fn (PhysicalDevice, [*c]u32, [*c]QueueFamilyProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceMemoryProperties2 = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceMemoryProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceSparseImageFormatProperties2 = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceSparseImageFormatInfo2, [*c]u32, [*c]SparseImageFormatProperties2) callconv(.c) void;
pub const PFN_trimCommandPool = ?*const fn (Device, CommandPool, CommandPoolTrimFlags) callconv(.c) void;
pub const PFN_getDeviceQueue2 = ?*const fn (Device, [*c]const DeviceQueueInfo2, [*c]Queue) callconv(.c) void;
pub const PFN_createSamplerYcbcrConversion = ?*const fn (Device, [*c]const SamplerYcbcrConversionCreateInfo, [*c]const AllocationCallbacks, [*c]SamplerYcbcrConversion) callconv(.c) Result;
pub const PFN_destroySamplerYcbcrConversion = ?*const fn (Device, SamplerYcbcrConversion, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createDescriptorUpdateTemplate = ?*const fn (Device, [*c]const DescriptorUpdateTemplateCreateInfo, [*c]const AllocationCallbacks, [*c]DescriptorUpdateTemplate) callconv(.c) Result;
pub const PFN_destroyDescriptorUpdateTemplate = ?*const fn (Device, DescriptorUpdateTemplate, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_updateDescriptorSetWithTemplate = ?*const fn (Device, DescriptorSet, DescriptorUpdateTemplate, ?*const anyopaque) callconv(.c) void;
pub const PFN_getPhysicalDeviceExternalBufferProperties = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceExternalBufferInfo, [*c]ExternalBufferProperties) callconv(.c) void;
pub const PFN_getPhysicalDeviceExternalFenceProperties = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceExternalFenceInfo, [*c]ExternalFenceProperties) callconv(.c) void;
pub const PFN_getPhysicalDeviceExternalSemaphoreProperties = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceExternalSemaphoreInfo, [*c]ExternalSemaphoreProperties) callconv(.c) void;
pub const PFN_getDescriptorSetLayoutSupport = ?*const fn (Device, [*c]const DescriptorSetLayoutCreateInfo, [*c]DescriptorSetLayoutSupport) callconv(.c) void;
pub extern fn enumerateInstanceVersion(p_api_version: [*c]u32) Result;
pub extern fn bindBufferMemory2(device: Device, bind_info_count: u32, p_bind_infos: [*c]const BindBufferMemoryInfo) Result;
pub extern fn bindImageMemory2(device: Device, bind_info_count: u32, p_bind_infos: [*c]const BindImageMemoryInfo) Result;
pub extern fn getDeviceGroup_peer_memory_features(device: Device, heap_index: u32, local_device_index: u32, remote_device_index: u32, p_peer_memory_features: [*c]PeerMemoryFeatureFlags) void;
pub extern fn cmdSetDeviceMask(command_buffer: CommandBuffer, device_mask: u32) void;
pub extern fn cmdDispatchBase(command_buffer: CommandBuffer, base_group_x: u32, base_group_y: u32, base_group_z: u32, group_count_x: u32, group_count_y: u32, group_count_z: u32) void;
pub extern fn enumeratePhysicalDeviceGroups(instance: Instance, p_physical_device_group_count: [*c]u32, p_physical_device_group_properties: [*c]PhysicalDeviceGroupProperties) Result;
pub extern fn getImageMemoryRequirements2(device: Device, p_info: [*c]const ImageMemoryRequirementsInfo2, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getBufferMemoryRequirements2(device: Device, p_info: [*c]const BufferMemoryRequirementsInfo2, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getImageSparseMemoryRequirements2(device: Device, p_info: [*c]const ImageSparseMemoryRequirementsInfo2, p_sparse_memory_requirement_count: [*c]u32, p_sparse_memory_requirements: [*c]SparseImageMemoryRequirements2) void;
pub extern fn getPhysicalDeviceFeatures2(physical_device: PhysicalDevice, p_features: [*c]PhysicalDeviceFeatures2) void;
pub extern fn getPhysicalDeviceProperties2(physical_device: PhysicalDevice, p_properties: [*c]PhysicalDeviceProperties2) void;
pub extern fn getPhysicalDeviceFormatProperties2(physical_device: PhysicalDevice, format: Format, p_format_properties: [*c]FormatProperties2) void;
pub extern fn getPhysicalDeviceImageFormatProperties2(physical_device: PhysicalDevice, p_image_format_info: [*c]const PhysicalDeviceImageFormatInfo2, p_image_format_properties: [*c]ImageFormatProperties2) Result;
pub extern fn getPhysicalDeviceQueueFamilyProperties2(physical_device: PhysicalDevice, p_queue_family_property_count: [*c]u32, p_queue_family_properties: [*c]QueueFamilyProperties2) void;
pub extern fn getPhysicalDeviceMemoryProperties2(physical_device: PhysicalDevice, p_memory_properties: [*c]PhysicalDeviceMemoryProperties2) void;
pub extern fn getPhysicalDeviceSparseImageFormatProperties2(physical_device: PhysicalDevice, p_format_info: [*c]const PhysicalDeviceSparseImageFormatInfo2, p_property_count: [*c]u32, p_properties: [*c]SparseImageFormatProperties2) void;
pub extern fn trimCommandPool(device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags) void;
pub extern fn getDeviceQueue2(device: Device, p_queue_info: [*c]const DeviceQueueInfo2, p_queue: [*c]Queue) void;
pub extern fn createSamplerYcbcrConversion(device: Device, p_create_info: [*c]const SamplerYcbcrConversionCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_ycbcr_conversion: [*c]SamplerYcbcrConversion) Result;
pub extern fn destroySamplerYcbcrConversion(device: Device, ycbcr_conversion: SamplerYcbcrConversion, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createDescriptorUpdateTemplate(device: Device, p_create_info: [*c]const DescriptorUpdateTemplateCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_descriptor_update_template: [*c]DescriptorUpdateTemplate) Result;
pub extern fn destroyDescriptorUpdateTemplate(device: Device, descriptor_update_template: DescriptorUpdateTemplate, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn updateDescriptorSetWithTemplate(device: Device, descriptor_set: DescriptorSet, descriptor_update_template: DescriptorUpdateTemplate, p_data: ?*const anyopaque) void;
pub extern fn getPhysicalDeviceExternalBufferProperties(physical_device: PhysicalDevice, p_external_buffer_info: [*c]const PhysicalDeviceExternalBufferInfo, p_external_buffer_properties: [*c]ExternalBufferProperties) void;
pub extern fn getPhysicalDeviceExternalFenceProperties(physical_device: PhysicalDevice, p_external_fence_info: [*c]const PhysicalDeviceExternalFenceInfo, p_external_fence_properties: [*c]ExternalFenceProperties) void;
pub extern fn getPhysicalDeviceExternalSemaphoreProperties(physical_device: PhysicalDevice, p_external_semaphore_info: [*c]const PhysicalDeviceExternalSemaphoreInfo, p_external_semaphore_properties: [*c]ExternalSemaphoreProperties) void;
pub extern fn getDescriptorSetLayoutSupport(device: Device, p_create_info: [*c]const DescriptorSetLayoutCreateInfo, p_support: [*c]DescriptorSetLayoutSupport) void;
pub const DriverId = enum(u32) {
    amd_proprietary = 1,
    amd_open_source = 2,
    mesa_radv = 3,
    nvidia_proprietary = 4,
    intel_proprietary_windows = 5,
    intel_open_source_mesa = 6,
    imagination_proprietary = 7,
    qualcomm_proprietary = 8,
    arm_proprietary = 9,
    google_swiftshader = 10,
    ggp_proprietary = 11,
    broadcom_proprietary = 12,
    mesa_llvmpipe = 13,
    moltenvk = 14,
    coreavi_proprietary = 15,
    juice_proprietary = 16,
    verisilicon_proprietary = 17,
    mesa_turnip = 18,
    mesa_v3dv = 19,
    mesa_panvk = 20,
    samsung_proprietary = 21,
    mesa_venus = 22,
    mesa_dozen = 23,
    mesa_nvk = 24,
    imagination_open_source_mesa = 25,
    mesa_honeykrisp = 26,
    vulkan_sc_emulation_on_vulkan = 27,
    max_enum = 2147483647,
    const Self = @This();
    pub const broadcom_proprietary_khr = Self.broadcom_proprietary;
    pub const ggp_proprietary_khr = Self.ggp_proprietary;
    pub const google_swiftshader_khr = Self.google_swiftshader;
    pub const arm_proprietary_khr = Self.arm_proprietary;
    pub const qualcomm_proprietary_khr = Self.qualcomm_proprietary;
    pub const imagination_proprietary_khr = Self.imagination_proprietary;
    pub const intel_open_source_mesa_khr = Self.intel_open_source_mesa;
    pub const intel_proprietary_windows_khr = Self.intel_proprietary_windows;
    pub const nvidia_proprietary_khr = Self.nvidia_proprietary;
    pub const mesa_radv_khr = Self.mesa_radv;
    pub const amd_open_source_khr = Self.amd_open_source;
    pub const amd_proprietary_khr = Self.amd_proprietary;
};
pub const ShaderFloatControlsIndependence = enum(u32) {
    @"32_bit_only" = 0,
    all = 1,
    none = 2,
    max_enum = 2147483647,
    const Self = @This();
    pub const none_khr = Self.none;
    pub const all_khr = Self.all;
    pub const @"32_bit_only_khr" = Self.@"32_bit_only";
};
pub const SamplerReductionMode = enum(u32) {
    weighted_average = 0,
    min = 1,
    max = 2,
    weighted_average_rangeclamp_qcom = 1000521000,
    max_enum = 2147483647,
    const Self = @This();
    pub const max_ext = Self.max;
    pub const min_ext = Self.min;
    pub const weighted_average_ext = Self.weighted_average;
};
pub const SemaphoreType = enum(u32) {
    binary = 0,
    timeline = 1,
    max_enum = 2147483647,
    const Self = @This();
    pub const timeline_khr = Self.timeline;
    pub const binary_khr = Self.binary;
};
pub const ResolveModeFlagBits = enum(u32) {
    none = 0,
    sample_zero_bit = 1,
    average_bit = 2,
    min_bit = 4,
    max_bit = 8,
    external_format_downsample_android = 16,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const max_bit_khr = Self.max_bit;
    pub const min_bit_khr = Self.min_bit;
    pub const average_bit_khr = Self.average_bit;
    pub const sample_zero_bit_khr = Self.sample_zero_bit;
    pub const none_khr = Self.none;
};
pub const ResolveModeFlags = PES(ResolveModeFlagBits);
pub const DescriptorBindingFlagBits = enum(u32) {
    update_after_bind_bit = 1,
    update_unused_while_pending_bit = 2,
    partially_bound_bit = 4,
    variable_descriptor_count_bit = 8,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const variable_descriptor_count_bit_ext = Self.variable_descriptor_count_bit;
    pub const partially_bound_bit_ext = Self.partially_bound_bit;
    pub const update_unused_while_pending_bit_ext = Self.update_unused_while_pending_bit;
    pub const update_after_bind_bit_ext = Self.update_after_bind_bit;
};
pub const DescriptorBindingFlags = PES(DescriptorBindingFlagBits);
pub const SemaphoreWaitFlagBits = enum(u32) {
    any_bit = 1,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const any_bit_khr = Self.any_bit;
};
pub const SemaphoreWaitFlags = PES(SemaphoreWaitFlagBits);
pub const PhysicalDeviceVulkan11Features = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    storage_buffer16_bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_and_storage_buffer16_bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_push_constant16: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_input_output16: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview_geometry_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview_tessellation_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    variable_pointers_storage_buffer: Bool32 = @import("std").mem.zeroes(Bool32),
    variable_pointers: Bool32 = @import("std").mem.zeroes(Bool32),
    protected_memory: Bool32 = @import("std").mem.zeroes(Bool32),
    sampler_ycbcr_conversion: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_draw_parameters: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVulkan11Properties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    driver_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    device_luid: [8]u8 = @import("std").mem.zeroes([8]u8),
    device_node_mask: u32 = @import("std").mem.zeroes(u32),
    device_luidvalid: Bool32 = @import("std").mem.zeroes(Bool32),
    subgroup_size: u32 = @import("std").mem.zeroes(u32),
    subgroup_supported_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    subgroup_supported_operations: SubgroupFeatureFlags = @import("std").mem.zeroes(SubgroupFeatureFlags),
    subgroup_quad_operations_in_all_stages: Bool32 = @import("std").mem.zeroes(Bool32),
    point_clipping_behavior: PointClippingBehavior = @import("std").mem.zeroes(PointClippingBehavior),
    max_multiview_view_count: u32 = @import("std").mem.zeroes(u32),
    max_multiview_instance_index: u32 = @import("std").mem.zeroes(u32),
    protected_no_fault: Bool32 = @import("std").mem.zeroes(Bool32),
    max_per_set_descriptors: u32 = @import("std").mem.zeroes(u32),
    max_memory_allocation_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PhysicalDeviceVulkan12Features = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    sampler_mirror_clamp_to_edge: Bool32 = @import("std").mem.zeroes(Bool32),
    draw_indirect_count: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_buffer8_bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_and_storage_buffer8_bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_push_constant8: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_int64_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_int64_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_int8: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_input_attachment_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_texel_buffer_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_texel_buffer_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_sampled_image_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_input_attachment_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_texel_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_texel_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_uniform_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_sampled_image_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_storage_image_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_storage_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_uniform_texel_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_storage_texel_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_update_unused_while_pending: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_partially_bound: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_variable_descriptor_count: Bool32 = @import("std").mem.zeroes(Bool32),
    runtime_descriptor_array: Bool32 = @import("std").mem.zeroes(Bool32),
    sampler_filter_minmax: Bool32 = @import("std").mem.zeroes(Bool32),
    scalar_block_layout: Bool32 = @import("std").mem.zeroes(Bool32),
    imageless_framebuffer: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_buffer_standard_layout: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_subgroup_extended_types: Bool32 = @import("std").mem.zeroes(Bool32),
    separate_depth_stencil_layouts: Bool32 = @import("std").mem.zeroes(Bool32),
    host_query_reset: Bool32 = @import("std").mem.zeroes(Bool32),
    timeline_semaphore: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address_multi_device: Bool32 = @import("std").mem.zeroes(Bool32),
    vulkan_memory_model: Bool32 = @import("std").mem.zeroes(Bool32),
    vulkan_memory_model_device_scope: Bool32 = @import("std").mem.zeroes(Bool32),
    vulkan_memory_model_availability_visibility_chains: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_output_viewport_index: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_output_layer: Bool32 = @import("std").mem.zeroes(Bool32),
    subgroup_broadcast_dynamic_id: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ConformanceVersion = extern struct {
    major: u8 = @import("std").mem.zeroes(u8),
    minor: u8 = @import("std").mem.zeroes(u8),
    subminor: u8 = @import("std").mem.zeroes(u8),
    patch: u8 = @import("std").mem.zeroes(u8),
};
pub const PhysicalDeviceVulkan12Properties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    driver_id: DriverId = @import("std").mem.zeroes(DriverId),
    driver_name: [256]u8 = @import("std").mem.zeroes([256]u8),
    driver_info: [256]u8 = @import("std").mem.zeroes([256]u8),
    conformance_version: ConformanceVersion = @import("std").mem.zeroes(ConformanceVersion),
    denorm_behavior_independence: ShaderFloatControlsIndependence = @import("std").mem.zeroes(ShaderFloatControlsIndependence),
    rounding_mode_independence: ShaderFloatControlsIndependence = @import("std").mem.zeroes(ShaderFloatControlsIndependence),
    shader_signed_zero_inf_nan_preserve_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_signed_zero_inf_nan_preserve_float32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_signed_zero_inf_nan_preserve_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_preserve_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_preserve_float32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_preserve_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_flush_to_zero_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_flush_to_zero_float32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_flush_to_zero_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtefloat16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtefloat32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtefloat64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtzfloat16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtzfloat32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtzfloat64: Bool32 = @import("std").mem.zeroes(Bool32),
    max_update_after_bind_descriptors_in_all_pools: u32 = @import("std").mem.zeroes(u32),
    shader_uniform_buffer_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_sampled_image_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_buffer_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_input_attachment_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    robust_buffer_access_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    quad_divergent_implicit_lod: Bool32 = @import("std").mem.zeroes(Bool32),
    max_per_stage_descriptor_update_after_bind_samplers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_uniform_buffers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_storage_buffers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_sampled_images: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_storage_images: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_input_attachments: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_update_after_bind_resources: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_samplers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_uniform_buffers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_uniform_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_storage_buffers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_storage_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_sampled_images: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_storage_images: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_input_attachments: u32 = @import("std").mem.zeroes(u32),
    supported_depth_resolve_modes: ResolveModeFlags = @import("std").mem.zeroes(ResolveModeFlags),
    supported_stencil_resolve_modes: ResolveModeFlags = @import("std").mem.zeroes(ResolveModeFlags),
    independent_resolve_none: Bool32 = @import("std").mem.zeroes(Bool32),
    independent_resolve: Bool32 = @import("std").mem.zeroes(Bool32),
    filter_minmax_single_component_formats: Bool32 = @import("std").mem.zeroes(Bool32),
    filter_minmax_image_component_mapping: Bool32 = @import("std").mem.zeroes(Bool32),
    max_timeline_semaphore_value_difference: u64 = @import("std").mem.zeroes(u64),
    framebuffer_integer_color_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
};
pub const ImageFormatListCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    view_format_count: u32 = @import("std").mem.zeroes(u32),
    p_view_formats: [*c]const Format = @import("std").mem.zeroes([*c]const Format),
};
pub const AttachmentDescription2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: AttachmentDescriptionFlags = @import("std").mem.zeroes(AttachmentDescriptionFlags),
    format: Format = @import("std").mem.zeroes(Format),
    samples: SampleCountFlagBits = @import("std").mem.zeroes(SampleCountFlagBits),
    load_op: AttachmentLoadOp = @import("std").mem.zeroes(AttachmentLoadOp),
    store_op: AttachmentStoreOp = @import("std").mem.zeroes(AttachmentStoreOp),
    stencil_load_op: AttachmentLoadOp = @import("std").mem.zeroes(AttachmentLoadOp),
    stencil_store_op: AttachmentStoreOp = @import("std").mem.zeroes(AttachmentStoreOp),
    initial_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    final_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const AttachmentReference2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    attachment: u32 = @import("std").mem.zeroes(u32),
    layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
};
pub const SubpassDescription2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: SubpassDescriptionFlags = @import("std").mem.zeroes(SubpassDescriptionFlags),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    view_mask: u32 = @import("std").mem.zeroes(u32),
    input_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_input_attachments: [*c]const AttachmentReference2 = @import("std").mem.zeroes([*c]const AttachmentReference2),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachments: [*c]const AttachmentReference2 = @import("std").mem.zeroes([*c]const AttachmentReference2),
    p_resolve_attachments: [*c]const AttachmentReference2 = @import("std").mem.zeroes([*c]const AttachmentReference2),
    p_depth_stencil_attachment: [*c]const AttachmentReference2 = @import("std").mem.zeroes([*c]const AttachmentReference2),
    preserve_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_preserve_attachments: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const SubpassDependency2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_subpass: u32 = @import("std").mem.zeroes(u32),
    dst_subpass: u32 = @import("std").mem.zeroes(u32),
    src_stage_mask: PipelineStageFlags = @import("std").mem.zeroes(PipelineStageFlags),
    dst_stage_mask: PipelineStageFlags = @import("std").mem.zeroes(PipelineStageFlags),
    src_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dst_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dependency_flags: DependencyFlags = @import("std").mem.zeroes(DependencyFlags),
    view_offset: i32 = @import("std").mem.zeroes(i32),
};
pub const RenderPassCreateInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: RenderPassCreateFlags = @import("std").mem.zeroes(RenderPassCreateFlags),
    attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_attachments: [*c]const AttachmentDescription2 = @import("std").mem.zeroes([*c]const AttachmentDescription2),
    subpass_count: u32 = @import("std").mem.zeroes(u32),
    p_subpasses: [*c]const SubpassDescription2 = @import("std").mem.zeroes([*c]const SubpassDescription2),
    dependency_count: u32 = @import("std").mem.zeroes(u32),
    p_dependencies: [*c]const SubpassDependency2 = @import("std").mem.zeroes([*c]const SubpassDependency2),
    correlated_view_mask_count: u32 = @import("std").mem.zeroes(u32),
    p_correlated_view_masks: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const SubpassBeginInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    contents: SubpassContents = @import("std").mem.zeroes(SubpassContents),
};
pub const SubpassEndInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const PhysicalDevice8BitStorageFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    storage_buffer8_bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_and_storage_buffer8_bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_push_constant8: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceDriverProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    driver_id: DriverId = @import("std").mem.zeroes(DriverId),
    driver_name: [256]u8 = @import("std").mem.zeroes([256]u8),
    driver_info: [256]u8 = @import("std").mem.zeroes([256]u8),
    conformance_version: ConformanceVersion = @import("std").mem.zeroes(ConformanceVersion),
};
pub const PhysicalDeviceShaderAtomicInt64Features = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_buffer_int64_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_int64_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderFloat16Int8Features = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_int8: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFloatControlsProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    denorm_behavior_independence: ShaderFloatControlsIndependence = @import("std").mem.zeroes(ShaderFloatControlsIndependence),
    rounding_mode_independence: ShaderFloatControlsIndependence = @import("std").mem.zeroes(ShaderFloatControlsIndependence),
    shader_signed_zero_inf_nan_preserve_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_signed_zero_inf_nan_preserve_float32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_signed_zero_inf_nan_preserve_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_preserve_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_preserve_float32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_preserve_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_flush_to_zero_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_flush_to_zero_float32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_flush_to_zero_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtefloat16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtefloat32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtefloat64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtzfloat16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtzfloat32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtzfloat64: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DescriptorSetLayoutBindingFlagsCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    binding_count: u32 = @import("std").mem.zeroes(u32),
    p_binding_flags: [*c]const DescriptorBindingFlags = @import("std").mem.zeroes([*c]const DescriptorBindingFlags),
};
pub const PhysicalDeviceDescriptorIndexingFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_input_attachment_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_texel_buffer_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_texel_buffer_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_sampled_image_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_input_attachment_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_texel_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_texel_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_uniform_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_sampled_image_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_storage_image_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_storage_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_uniform_texel_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_storage_texel_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_update_unused_while_pending: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_partially_bound: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_variable_descriptor_count: Bool32 = @import("std").mem.zeroes(Bool32),
    runtime_descriptor_array: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceDescriptorIndexingProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_update_after_bind_descriptors_in_all_pools: u32 = @import("std").mem.zeroes(u32),
    shader_uniform_buffer_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_sampled_image_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_buffer_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_input_attachment_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    robust_buffer_access_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    quad_divergent_implicit_lod: Bool32 = @import("std").mem.zeroes(Bool32),
    max_per_stage_descriptor_update_after_bind_samplers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_uniform_buffers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_storage_buffers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_sampled_images: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_storage_images: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_input_attachments: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_update_after_bind_resources: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_samplers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_uniform_buffers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_uniform_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_storage_buffers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_storage_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_sampled_images: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_storage_images: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_input_attachments: u32 = @import("std").mem.zeroes(u32),
};
pub const DescriptorSetVariableDescriptorCountAllocateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    descriptor_set_count: u32 = @import("std").mem.zeroes(u32),
    p_descriptor_counts: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const DescriptorSetVariableDescriptorCountLayoutSupport = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_variable_descriptor_count: u32 = @import("std").mem.zeroes(u32),
};
pub const SubpassDescriptionDepthStencilResolve = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    depth_resolve_mode: ResolveModeFlagBits = @import("std").mem.zeroes(ResolveModeFlagBits),
    stencil_resolve_mode: ResolveModeFlagBits = @import("std").mem.zeroes(ResolveModeFlagBits),
    p_depth_stencil_resolve_attachment: [*c]const AttachmentReference2 = @import("std").mem.zeroes([*c]const AttachmentReference2),
};
pub const PhysicalDeviceDepthStencilResolveProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supported_depth_resolve_modes: ResolveModeFlags = @import("std").mem.zeroes(ResolveModeFlags),
    supported_stencil_resolve_modes: ResolveModeFlags = @import("std").mem.zeroes(ResolveModeFlags),
    independent_resolve_none: Bool32 = @import("std").mem.zeroes(Bool32),
    independent_resolve: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceScalarBlockLayoutFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    scalar_block_layout: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ImageStencilUsageCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stencil_usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
};
pub const SamplerReductionModeCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    reduction_mode: SamplerReductionMode = @import("std").mem.zeroes(SamplerReductionMode),
};
pub const PhysicalDeviceSamplerFilterMinmaxProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    filter_minmax_single_component_formats: Bool32 = @import("std").mem.zeroes(Bool32),
    filter_minmax_image_component_mapping: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVulkanMemoryModelFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    vulkan_memory_model: Bool32 = @import("std").mem.zeroes(Bool32),
    vulkan_memory_model_device_scope: Bool32 = @import("std").mem.zeroes(Bool32),
    vulkan_memory_model_availability_visibility_chains: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImagelessFramebufferFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    imageless_framebuffer: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const FramebufferAttachmentImageInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ImageCreateFlags = @import("std").mem.zeroes(ImageCreateFlags),
    usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
    layer_count: u32 = @import("std").mem.zeroes(u32),
    view_format_count: u32 = @import("std").mem.zeroes(u32),
    p_view_formats: [*c]const Format = @import("std").mem.zeroes([*c]const Format),
};
pub const FramebufferAttachmentsCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    attachment_image_info_count: u32 = @import("std").mem.zeroes(u32),
    p_attachment_image_infos: [*c]const FramebufferAttachmentImageInfo = @import("std").mem.zeroes([*c]const FramebufferAttachmentImageInfo),
};
pub const RenderPassAttachmentBeginInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_attachments: [*c]const ImageView = @import("std").mem.zeroes([*c]const ImageView),
};
pub const PhysicalDeviceUniformBufferStandardLayoutFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    uniform_buffer_standard_layout: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderSubgroupExtendedTypesFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_subgroup_extended_types: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceSeparateDepthStencilLayoutsFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    separate_depth_stencil_layouts: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const AttachmentReferenceStencilLayout = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    stencil_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const AttachmentDescriptionStencilLayout = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    stencil_initial_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    stencil_final_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const PhysicalDeviceHostQueryResetFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    host_query_reset: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceTimelineSemaphoreFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    timeline_semaphore: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceTimelineSemaphoreProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_timeline_semaphore_value_difference: u64 = @import("std").mem.zeroes(u64),
};
pub const SemaphoreTypeCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    semaphore_type: SemaphoreType = @import("std").mem.zeroes(SemaphoreType),
    initial_value: u64 = @import("std").mem.zeroes(u64),
};
pub const TimelineSemaphoreSubmitInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    wait_semaphore_value_count: u32 = @import("std").mem.zeroes(u32),
    p_wait_semaphore_values: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
    signal_semaphore_value_count: u32 = @import("std").mem.zeroes(u32),
    p_signal_semaphore_values: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
};
pub const SemaphoreWaitInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: SemaphoreWaitFlags = @import("std").mem.zeroes(SemaphoreWaitFlags),
    semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_semaphores: [*c]const Semaphore = @import("std").mem.zeroes([*c]const Semaphore),
    p_values: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
};
pub const SemaphoreSignalInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    semaphore: Semaphore = @import("std").mem.zeroes(Semaphore),
    value: u64 = @import("std").mem.zeroes(u64),
};
pub const PhysicalDeviceBufferDeviceAddressFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    buffer_device_address: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address_multi_device: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const BufferDeviceAddressInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
};
pub const BufferOpaqueCaptureAddressCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    opaque_capture_address: u64 = @import("std").mem.zeroes(u64),
};
pub const MemoryOpaqueCaptureAddressAllocateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    opaque_capture_address: u64 = @import("std").mem.zeroes(u64),
};
pub const DeviceMemoryOpaqueCaptureAddressInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
};
pub const PFN_cmdDrawIndirectCount = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndexedIndirectCount = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_createRenderPass2 = ?*const fn (Device, [*c]const RenderPassCreateInfo2, [*c]const AllocationCallbacks, [*c]RenderPass) callconv(.c) Result;
pub const PFN_cmdBeginRenderPass2 = ?*const fn (CommandBuffer, [*c]const RenderPassBeginInfo, [*c]const SubpassBeginInfo) callconv(.c) void;
pub const PFN_cmdNextSubpass2 = ?*const fn (CommandBuffer, [*c]const SubpassBeginInfo, [*c]const SubpassEndInfo) callconv(.c) void;
pub const PFN_cmdEndRenderPass2 = ?*const fn (CommandBuffer, [*c]const SubpassEndInfo) callconv(.c) void;
pub const PFN_resetQueryPool = ?*const fn (Device, QueryPool, u32, u32) callconv(.c) void;
pub const PFN_getSemaphoreCounterValue = ?*const fn (Device, Semaphore, [*c]u64) callconv(.c) Result;
pub const PFN_waitSemaphores = ?*const fn (Device, [*c]const SemaphoreWaitInfo, u64) callconv(.c) Result;
pub const PFN_signalSemaphore = ?*const fn (Device, [*c]const SemaphoreSignalInfo) callconv(.c) Result;
pub const PFN_getBufferDeviceAddress = ?*const fn (Device, [*c]const BufferDeviceAddressInfo) callconv(.c) DeviceAddress;
pub const PFN_getBufferOpaqueCaptureAddress = ?*const fn (Device, [*c]const BufferDeviceAddressInfo) callconv(.c) u64;
pub const PFN_getDeviceMemoryOpaqueCaptureAddress = ?*const fn (Device, [*c]const DeviceMemoryOpaqueCaptureAddressInfo) callconv(.c) u64;
pub extern fn cmdDrawIndirectCount(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_bufferOffset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub extern fn cmdDrawIndexedIndirectCount(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_bufferOffset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub extern fn createRenderPass2(device: Device, p_create_info: [*c]const RenderPassCreateInfo2, p_allocator: [*c]const AllocationCallbacks, p_render_pass: [*c]RenderPass) Result;
pub extern fn cmdBeginRenderPass2(command_buffer: CommandBuffer, p_render_pass_begin: [*c]const RenderPassBeginInfo, p_subpass_begin_info: [*c]const SubpassBeginInfo) void;
pub extern fn cmdNextSubpass2(command_buffer: CommandBuffer, p_subpass_begin_info: [*c]const SubpassBeginInfo, p_subpass_end_info: [*c]const SubpassEndInfo) void;
pub extern fn cmdEndRenderPass2(command_buffer: CommandBuffer, p_subpass_end_info: [*c]const SubpassEndInfo) void;
pub extern fn resetQueryPool(device: Device, query_pool: QueryPool, first_query: u32, query_count: u32) void;
pub extern fn getSemaphoreCounterValue(device: Device, semaphore: Semaphore, p_value: [*c]u64) Result;
pub extern fn waitSemaphores(device: Device, p_wait_info: [*c]const SemaphoreWaitInfo, timeout: u64) Result;
pub extern fn signalSemaphore(device: Device, p_signal_info: [*c]const SemaphoreSignalInfo) Result;
pub extern fn getBufferDeviceAddress(device: Device, p_info: [*c]const BufferDeviceAddressInfo) DeviceAddress;
pub extern fn getBufferOpaqueCaptureAddress(device: Device, p_info: [*c]const BufferDeviceAddressInfo) u64;
pub extern fn getDeviceMemoryOpaqueCaptureAddress(device: Device, p_info: [*c]const DeviceMemoryOpaqueCaptureAddressInfo) u64;
pub const Flags64 = u64;
pub const PrivateDataSlot = enum(u64) { null = 0, _ };
pub const PipelineCreationFeedbackFlagBits = enum(u32) {
    valid_bit = 1,
    application_pipeline_cache_hit_bit = 2,
    base_pipeline_acceleration_bit = 4,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const base_pipeline_acceleration_bit_ext = Self.base_pipeline_acceleration_bit;
    pub const application_pipeline_cache_hit_bit_ext = Self.application_pipeline_cache_hit_bit;
    pub const valid_bit_ext = Self.valid_bit;
};
pub const PipelineCreationFeedbackFlags = PES(PipelineCreationFeedbackFlagBits);
pub const ToolPurposeFlagBits = enum(u32) {
    validation_bit = 1,
    profiling_bit = 2,
    tracing_bit = 4,
    additional_features_bit = 8,
    modifying_features_bit = 16,
    debug_reporting_bit_ext = 32,
    debug_markers_bit_ext = 64,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const modifying_features_bit_ext = Self.modifying_features_bit;
    pub const additional_features_bit_ext = Self.additional_features_bit;
    pub const tracing_bit_ext = Self.tracing_bit;
    pub const profiling_bit_ext = Self.profiling_bit;
    pub const validation_bit_ext = Self.validation_bit;
};
pub const ToolPurposeFlags = PES(ToolPurposeFlagBits);
pub const PrivateDataSlotCreateFlags = Flags;
pub const PipelineStageFlagBits2 = enum(u64) {
    @"2_none" = 0,
    @"2_top_of_pipe_bit" = 1,
    @"2_draw_indirect_bit" = 2,
    @"2_vertex_input_bit" = 4,
    @"2_vertex_shader_bit" = 8,
    @"2_tessellation_control_shader_bit" = 16,
    @"2_tessellation_evaluation_shader_bit" = 32,
    @"2_geometry_shader_bit" = 64,
    @"2_fragment_shader_bit" = 128,
    @"2_early_fragment_tests_bit" = 256,
    @"2_late_fragment_tests_bit" = 512,
    @"2_color_attachment_output_bit" = 1024,
    @"2_compute_shader_bit" = 2048,
    @"2_transfer_bit" = 4096,
    @"2_bottom_of_pipe_bit" = 8192,
    @"2_host_bit" = 16384,
    @"2_all_graphics_bit" = 32768,
    @"2_all_commands_bit" = 65536,
    @"2_command_preprocess_bit_nv" = 131072,
    @"2_conditional_rendering_bit_ext" = 262144,
    @"2_task_shader_bit_nv" = 524288,
    @"2_mesh_shader_bit_nv" = 1048576,
    @"2_ray_tracing_shader_bit_nv" = 2097152,
    @"2_shading_rate_image_bit_nv" = 4194304,
    @"2_fragment_density_process_bit_ext" = 8388608,
    @"2_transform_feedback_bit_ext" = 16777216,
    @"2_acceleration_structure_build_bit_nv" = 33554432,
    @"2_video_decode_bit_khr" = 67108864,
    @"2_video_encode_bit_khr" = 134217728,
    @"2_acceleration_structure_copy_bit_khr" = 268435456,
    @"2_optical_flow_bit_nv" = 536870912,
    @"2_micromap_build_bit_ext" = 1073741824,
    @"2_copy_bit" = 4294967296,
    @"2_resolve_bit" = 8589934592,
    @"2_blit_bit" = 17179869184,
    @"2_clear_bit" = 34359738368,
    @"2_index_input_bit" = 68719476736,
    @"2_vertex_attribute_input_bit" = 137438953472,
    @"2_pre_rasterization_shaders_bit" = 274877906944,
    @"2_subpass_shader_bit_huawei" = 549755813888,
    @"2_invocation_mask_bit_huawei" = 1099511627776,
    @"2_cluster_culling_shader_bit_huawei" = 2199023255552,
    @"2_convert_cooperative_vector_matrix_bit_nv" = 17592186044416,
    const Self = @This();
    pub const @"2_all_transfer_bit" = Self.@"2_transfer_bit";
    pub const @"2_none_khr" = Self.@"2_none";
    pub const @"2_top_of_pipe_bit_khr" = Self.@"2_top_of_pipe_bit";
    pub const @"2_draw_indirect_bit_khr" = Self.@"2_draw_indirect_bit";
    pub const @"2_vertex_input_bit_khr" = Self.@"2_vertex_input_bit";
    pub const @"2_vertex_shader_bit_khr" = Self.@"2_vertex_shader_bit";
    pub const @"2_tessellation_control_shader_bit_khr" = Self.@"2_tessellation_control_shader_bit";
    pub const @"2_tessellation_evaluation_shader_bit_khr" = Self.@"2_tessellation_evaluation_shader_bit";
    pub const @"2_geometry_shader_bit_khr" = Self.@"2_geometry_shader_bit";
    pub const @"2_fragment_shader_bit_khr" = Self.@"2_fragment_shader_bit";
    pub const @"2_early_fragment_tests_bit_khr" = Self.@"2_early_fragment_tests_bit";
    pub const @"2_late_fragment_tests_bit_khr" = Self.@"2_late_fragment_tests_bit";
    pub const @"2_color_attachment_output_bit_khr" = Self.@"2_color_attachment_output_bit";
    pub const @"2_compute_shader_bit_khr" = Self.@"2_compute_shader_bit";
    pub const @"2_all_transfer_bit_khr" = Self.@"2_transfer_bit";
    pub const @"2_transfer_bit_khr" = Self.@"2_transfer_bit";
    pub const @"2_bottom_of_pipe_bit_khr" = Self.@"2_bottom_of_pipe_bit";
    pub const @"2_host_bit_khr" = Self.@"2_host_bit";
    pub const @"2_all_graphics_bit_khr" = Self.@"2_all_graphics_bit";
    pub const @"2_all_commands_bit_khr" = Self.@"2_all_commands_bit";
    pub const @"2_copy_bit_khr" = Self.@"2_copy_bit";
    pub const @"2_resolve_bit_khr" = Self.@"2_resolve_bit";
    pub const @"2_blit_bit_khr" = Self.@"2_blit_bit";
    pub const @"2_clear_bit_khr" = Self.@"2_clear_bit";
    pub const @"2_index_input_bit_khr" = Self.@"2_index_input_bit";
    pub const @"2_vertex_attribute_input_bit_khr" = Self.@"2_vertex_attribute_input_bit";
    pub const @"2_pre_rasterization_shaders_bit_khr" = Self.@"2_pre_rasterization_shaders_bit";
    pub const @"2_command_preprocess_bit_ext" = Self.@"2_command_preprocess_bit_nv";
    pub const @"2_fragment_shading_rate_attachment_bit_khr" = Self.@"2_shading_rate_image_bit_nv";
    pub const @"2_ray_tracing_shader_bit_khr" = Self.@"2_ray_tracing_shader_bit_nv";
    pub const @"2_acceleration_structure_build_bit_khr" = Self.@"2_acceleration_structure_build_bit_nv";
    pub const @"2_task_shader_bit_ext" = Self.@"2_task_shader_bit_nv";
    pub const @"2_mesh_shader_bit_ext" = Self.@"2_mesh_shader_bit_nv";
    pub const @"2_subpass_shading_bit_huawei" = Self.@"2_subpass_shader_bit_huawei";
};
pub const PipelineStageFlags2 = PES(PipelineStageFlagBits2);
pub const AccessFlagBits2 = enum(u64) {
    @"2_none" = 0,
    @"2_indirect_command_read_bit" = 1,
    @"2_index_read_bit" = 2,
    @"2_vertex_attribute_read_bit" = 4,
    @"2_uniform_read_bit" = 8,
    @"2_input_attachment_read_bit" = 16,
    @"2_shader_read_bit" = 32,
    @"2_shader_write_bit" = 64,
    @"2_color_attachment_read_bit" = 128,
    @"2_color_attachment_write_bit" = 256,
    @"2_depth_stencil_attachment_read_bit" = 512,
    @"2_depth_stencil_attachment_write_bit" = 1024,
    @"2_transfer_read_bit" = 2048,
    @"2_transfer_write_bit" = 4096,
    @"2_host_read_bit" = 8192,
    @"2_host_write_bit" = 16384,
    @"2_memory_read_bit" = 32768,
    @"2_memory_write_bit" = 65536,
    @"2_command_preprocess_read_bit_nv" = 131072,
    @"2_command_preprocess_write_bit_nv" = 262144,
    @"2_color_attachment_read_noncoherent_bit_ext" = 524288,
    @"2_conditional_rendering_read_bit_ext" = 1048576,
    @"2_acceleration_structure_read_bit_nv" = 2097152,
    @"2_acceleration_structure_write_bit_nv" = 4194304,
    @"2_shading_rate_image_read_bit_nv" = 8388608,
    @"2_fragment_density_map_read_bit_ext" = 16777216,
    @"2_transform_feedback_write_bit_ext" = 33554432,
    @"2_transform_feedback_counter_read_bit_ext" = 67108864,
    @"2_transform_feedback_counter_write_bit_ext" = 134217728,
    @"2_shader_sampled_read_bit" = 4294967296,
    @"2_shader_storage_read_bit" = 8589934592,
    @"2_shader_storage_write_bit" = 17179869184,
    @"2_video_decode_read_bit_khr" = 34359738368,
    @"2_video_decode_write_bit_khr" = 68719476736,
    @"2_video_encode_read_bit_khr" = 137438953472,
    @"2_video_encode_write_bit_khr" = 274877906944,
    @"2_invocation_mask_read_bit_huawei" = 549755813888,
    @"2_shader_binding_table_read_bit_khr" = 1099511627776,
    @"2_descriptor_buffer_read_bit_ext" = 2199023255552,
    @"2_optical_flow_read_bit_nv" = 4398046511104,
    @"2_optical_flow_write_bit_nv" = 8796093022208,
    @"2_micromap_read_bit_ext" = 17592186044416,
    @"2_micromap_write_bit_ext" = 35184372088832,
    const Self = @This();
    pub const @"2_none_khr" = Self.@"2_none";
    pub const @"2_indirect_command_read_bit_khr" = Self.@"2_indirect_command_read_bit";
    pub const @"2_index_read_bit_khr" = Self.@"2_index_read_bit";
    pub const @"2_vertex_attribute_read_bit_khr" = Self.@"2_vertex_attribute_read_bit";
    pub const @"2_uniform_read_bit_khr" = Self.@"2_uniform_read_bit";
    pub const @"2_input_attachment_read_bit_khr" = Self.@"2_input_attachment_read_bit";
    pub const @"2_shader_read_bit_khr" = Self.@"2_shader_read_bit";
    pub const @"2_shader_write_bit_khr" = Self.@"2_shader_write_bit";
    pub const @"2_color_attachment_read_bit_khr" = Self.@"2_color_attachment_read_bit";
    pub const @"2_color_attachment_write_bit_khr" = Self.@"2_color_attachment_write_bit";
    pub const @"2_depth_stencil_attachment_read_bit_khr" = Self.@"2_depth_stencil_attachment_read_bit";
    pub const @"2_depth_stencil_attachment_write_bit_khr" = Self.@"2_depth_stencil_attachment_write_bit";
    pub const @"2_transfer_read_bit_khr" = Self.@"2_transfer_read_bit";
    pub const @"2_transfer_write_bit_khr" = Self.@"2_transfer_write_bit";
    pub const @"2_host_read_bit_khr" = Self.@"2_host_read_bit";
    pub const @"2_host_write_bit_khr" = Self.@"2_host_write_bit";
    pub const @"2_memory_read_bit_khr" = Self.@"2_memory_read_bit";
    pub const @"2_memory_write_bit_khr" = Self.@"2_memory_write_bit";
    pub const @"2_shader_sampled_read_bit_khr" = Self.@"2_shader_sampled_read_bit";
    pub const @"2_shader_storage_read_bit_khr" = Self.@"2_shader_storage_read_bit";
    pub const @"2_shader_storage_write_bit_khr" = Self.@"2_shader_storage_write_bit";
    pub const @"2_command_preprocess_read_bit_ext" = Self.@"2_command_preprocess_read_bit_nv";
    pub const @"2_command_preprocess_write_bit_ext" = Self.@"2_command_preprocess_write_bit_nv";
    pub const @"2_fragment_shading_rate_attachment_read_bit_khr" = Self.@"2_shading_rate_image_read_bit_nv";
    pub const @"2_acceleration_structure_read_bit_khr" = Self.@"2_acceleration_structure_read_bit_nv";
    pub const @"2_acceleration_structure_write_bit_khr" = Self.@"2_acceleration_structure_write_bit_nv";
};
pub const AccessFlags2 = PES(AccessFlagBits2);
pub const SubmitFlagBits = enum(u32) {
    protected_bit = 1,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const protected_bit_khr = Self.protected_bit;
};
pub const SubmitFlags = PES(SubmitFlagBits);
pub const RenderingFlagBits = enum(u32) {
    contents_secondary_command_buffers_bit = 1,
    suspending_bit = 2,
    resuming_bit = 4,
    enable_legacy_dithering_bit_ext = 8,
    contents_inline_bit_ext = 16,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const contents_inline_bit_khr = Self.contents_inline_bit_ext;
    pub const resuming_bit_khr = Self.resuming_bit;
    pub const suspending_bit_khr = Self.suspending_bit;
    pub const contents_secondary_command_buffers_bit_khr = Self.contents_secondary_command_buffers_bit;
};
pub const RenderingFlags = PES(RenderingFlagBits);
pub const FormatFeatureFlagBits2 = enum(u64) {
    @"2_sampled_image_bit" = 1,
    @"2_storage_image_bit" = 2,
    @"2_storage_image_atomic_bit" = 4,
    @"2_uniform_texel_buffer_bit" = 8,
    @"2_storage_texel_buffer_bit" = 16,
    @"2_storage_texel_buffer_atomic_bit" = 32,
    @"2_vertex_buffer_bit" = 64,
    @"2_color_attachment_bit" = 128,
    @"2_color_attachment_blend_bit" = 256,
    @"2_depth_stencil_attachment_bit" = 512,
    @"2_blit_src_bit" = 1024,
    @"2_blit_dst_bit" = 2048,
    @"2_sampled_image_filter_linear_bit" = 4096,
    @"2_sampled_image_filter_cubic_bit" = 8192,
    @"2_transfer_src_bit" = 16384,
    @"2_transfer_dst_bit" = 32768,
    @"2_sampled_image_filter_minmax_bit" = 65536,
    @"2_midpoint_chroma_samples_bit" = 131072,
    @"2_sampled_image_ycbcr_conversion_linear_filter_bit" = 262144,
    @"2_sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit" = 524288,
    @"2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit" = 1048576,
    @"2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit" = 2097152,
    @"2_disjoint_bit" = 4194304,
    @"2_cosited_chroma_samples_bit" = 8388608,
    @"2_fragment_density_map_bit_ext" = 16777216,
    @"2_video_decode_output_bit_khr" = 33554432,
    @"2_video_decode_dpb_bit_khr" = 67108864,
    @"2_video_encode_input_bit_khr" = 134217728,
    @"2_video_encode_dpb_bit_khr" = 268435456,
    @"2_acceleration_structure_vertex_buffer_bit_khr" = 536870912,
    @"2_fragment_shading_rate_attachment_bit_khr" = 1073741824,
    @"2_storage_read_without_format_bit" = 2147483648,
    @"2_storage_write_without_format_bit" = 4294967296,
    @"2_sampled_image_depth_comparison_bit" = 8589934592,
    @"2_weight_image_bit_qcom" = 17179869184,
    @"2_weight_sampled_image_bit_qcom" = 34359738368,
    @"2_block_matching_bit_qcom" = 68719476736,
    @"2_box_filter_sampled_bit_qcom" = 137438953472,
    @"2_linear_color_attachment_bit_nv" = 274877906944,
    @"2_optical_flow_image_bit_nv" = 1099511627776,
    @"2_optical_flow_vector_bit_nv" = 2199023255552,
    @"2_optical_flow_cost_bit_nv" = 4398046511104,
    @"2_host_image_transfer_bit" = 70368744177664,
    @"2_video_encode_quantization_delta_map_bit_khr" = 562949953421312,
    @"2_video_encode_emphasis_map_bit_khr" = 1125899906842624,
    @"2_acceleration_structure_radius_buffer_bit_nv" = 2251799813685248,
    const Self = @This();
    pub const @"2_host_image_transfer_bit_ext" = Self.@"2_host_image_transfer_bit";
    pub const @"2_sampled_image_bit_khr" = Self.@"2_sampled_image_bit";
    pub const @"2_storage_image_bit_khr" = Self.@"2_storage_image_bit";
    pub const @"2_storage_image_atomic_bit_khr" = Self.@"2_storage_image_atomic_bit";
    pub const @"2_uniform_texel_buffer_bit_khr" = Self.@"2_uniform_texel_buffer_bit";
    pub const @"2_storage_texel_buffer_bit_khr" = Self.@"2_storage_texel_buffer_bit";
    pub const @"2_storage_texel_buffer_atomic_bit_khr" = Self.@"2_storage_texel_buffer_atomic_bit";
    pub const @"2_vertex_buffer_bit_khr" = Self.@"2_vertex_buffer_bit";
    pub const @"2_color_attachment_bit_khr" = Self.@"2_color_attachment_bit";
    pub const @"2_color_attachment_blend_bit_khr" = Self.@"2_color_attachment_blend_bit";
    pub const @"2_depth_stencil_attachment_bit_khr" = Self.@"2_depth_stencil_attachment_bit";
    pub const @"2_blit_src_bit_khr" = Self.@"2_blit_src_bit";
    pub const @"2_blit_dst_bit_khr" = Self.@"2_blit_dst_bit";
    pub const @"2_sampled_image_filter_linear_bit_khr" = Self.@"2_sampled_image_filter_linear_bit";
    pub const @"2_transfer_src_bit_khr" = Self.@"2_transfer_src_bit";
    pub const @"2_transfer_dst_bit_khr" = Self.@"2_transfer_dst_bit";
    pub const @"2_midpoint_chroma_samples_bit_khr" = Self.@"2_midpoint_chroma_samples_bit";
    pub const @"2_sampled_image_ycbcr_conversion_linear_filter_bit_khr" = Self.@"2_sampled_image_ycbcr_conversion_linear_filter_bit";
    pub const @"2_sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit_khr" = Self.@"2_sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit";
    pub const @"2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit_khr" = Self.@"2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit";
    pub const @"2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit_khr" = Self.@"2_sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit";
    pub const @"2_disjoint_bit_khr" = Self.@"2_disjoint_bit";
    pub const @"2_cosited_chroma_samples_bit_khr" = Self.@"2_cosited_chroma_samples_bit";
    pub const @"2_storage_read_without_format_bit_khr" = Self.@"2_storage_read_without_format_bit";
    pub const @"2_storage_write_without_format_bit_khr" = Self.@"2_storage_write_without_format_bit";
    pub const @"2_sampled_image_depth_comparison_bit_khr" = Self.@"2_sampled_image_depth_comparison_bit";
    pub const @"2_sampled_image_filter_minmax_bit_khr" = Self.@"2_sampled_image_filter_minmax_bit";
    pub const @"2_sampled_image_filter_cubic_bit_ext" = Self.@"2_sampled_image_filter_cubic_bit";
};
pub const FormatFeatureFlags2 = PES(FormatFeatureFlagBits2);
pub const PhysicalDeviceVulkan13Features = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    robust_image_access: Bool32 = @import("std").mem.zeroes(Bool32),
    inline_uniform_block: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_inline_uniform_block_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_creation_cache_control: Bool32 = @import("std").mem.zeroes(Bool32),
    private_data: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_demote_to_helper_invocation: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_terminate_invocation: Bool32 = @import("std").mem.zeroes(Bool32),
    subgroup_size_control: Bool32 = @import("std").mem.zeroes(Bool32),
    compute_full_subgroups: Bool32 = @import("std").mem.zeroes(Bool32),
    synchronization2: Bool32 = @import("std").mem.zeroes(Bool32),
    texture_compression_astc_hdr: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_zero_initialize_workgroup_memory: Bool32 = @import("std").mem.zeroes(Bool32),
    dynamic_rendering: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_integer_dot_product: Bool32 = @import("std").mem.zeroes(Bool32),
    maintenance4: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVulkan13Properties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_subgroup_size: u32 = @import("std").mem.zeroes(u32),
    max_subgroup_size: u32 = @import("std").mem.zeroes(u32),
    max_compute_workgroup_subgroups: u32 = @import("std").mem.zeroes(u32),
    required_subgroup_size_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    max_inline_uniform_block_size: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_inline_uniform_total_size: u32 = @import("std").mem.zeroes(u32),
    integer_dot_product8_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product8_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product8_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product4x8_bit_packed_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product4x8_bit_packed_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product4x8_bit_packed_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product16_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product16_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product16_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product32_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product32_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product32_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product64_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product64_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product64_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating8_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating8_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating8_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating4x8_bit_packed_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating4x8_bit_packed_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating4x8_bit_packed_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating16_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating16_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating16_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating32_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating32_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating32_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating64_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating64_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating64_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_texel_buffer_offset_alignment_bytes: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    storage_texel_buffer_offset_single_texel_alignment: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_texel_buffer_offset_alignment_bytes: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    uniform_texel_buffer_offset_single_texel_alignment: Bool32 = @import("std").mem.zeroes(Bool32),
    max_buffer_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PipelineCreationFeedback = extern struct {
    flags: PipelineCreationFeedbackFlags = @import("std").mem.zeroes(PipelineCreationFeedbackFlags),
    duration: u64 = @import("std").mem.zeroes(u64),
};
pub const PipelineCreationFeedbackCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_pipeline_creation_feedback: [*c]PipelineCreationFeedback = @import("std").mem.zeroes([*c]PipelineCreationFeedback),
    pipeline_stage_creation_feedback_count: u32 = @import("std").mem.zeroes(u32),
    p_pipeline_stage_creation_feedbacks: [*c]PipelineCreationFeedback = @import("std").mem.zeroes([*c]PipelineCreationFeedback),
};
pub const PhysicalDeviceShaderTerminateInvocationFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_terminate_invocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceToolProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    name: [256]u8 = @import("std").mem.zeroes([256]u8),
    version: [256]u8 = @import("std").mem.zeroes([256]u8),
    purposes: ToolPurposeFlags = @import("std").mem.zeroes(ToolPurposeFlags),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    layer: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const PhysicalDeviceShaderDemoteToHelperInvocationFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_demote_to_helper_invocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePrivateDataFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    private_data: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DevicePrivateDataCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    private_data_slot_request_count: u32 = @import("std").mem.zeroes(u32),
};
pub const PrivateDataSlotCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PrivateDataSlotCreateFlags = @import("std").mem.zeroes(PrivateDataSlotCreateFlags),
};
pub const PhysicalDevicePipelineCreationCacheControlFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_creation_cache_control: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MemoryBarrier2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    src_access_mask: AccessFlags2 = @import("std").mem.zeroes(AccessFlags2),
    dst_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    dst_access_mask: AccessFlags2 = @import("std").mem.zeroes(AccessFlags2),
};
pub const BufferMemoryBarrier2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    src_access_mask: AccessFlags2 = @import("std").mem.zeroes(AccessFlags2),
    dst_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    dst_access_mask: AccessFlags2 = @import("std").mem.zeroes(AccessFlags2),
    src_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    dst_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const ImageMemoryBarrier2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    src_access_mask: AccessFlags2 = @import("std").mem.zeroes(AccessFlags2),
    dst_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    dst_access_mask: AccessFlags2 = @import("std").mem.zeroes(AccessFlags2),
    old_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    new_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    src_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    dst_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    image: Image = @import("std").mem.zeroes(Image),
    subresource_range: ImageSubresourceRange = @import("std").mem.zeroes(ImageSubresourceRange),
};
pub const DependencyInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    dependency_flags: DependencyFlags = @import("std").mem.zeroes(DependencyFlags),
    memory_barrier_count: u32 = @import("std").mem.zeroes(u32),
    p_memory_barriers: [*c]const MemoryBarrier2 = @import("std").mem.zeroes([*c]const MemoryBarrier2),
    buffer_memory_barrier_count: u32 = @import("std").mem.zeroes(u32),
    p_buffer_memory_barriers: [*c]const BufferMemoryBarrier2 = @import("std").mem.zeroes([*c]const BufferMemoryBarrier2),
    image_memory_barrier_count: u32 = @import("std").mem.zeroes(u32),
    p_image_memory_barriers: [*c]const ImageMemoryBarrier2 = @import("std").mem.zeroes([*c]const ImageMemoryBarrier2),
};
pub const SemaphoreSubmitInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    semaphore: Semaphore = @import("std").mem.zeroes(Semaphore),
    value: u64 = @import("std").mem.zeroes(u64),
    stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    device_index: u32 = @import("std").mem.zeroes(u32),
};
pub const CommandBufferSubmitInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    command_buffer: CommandBuffer = @import("std").mem.zeroes(CommandBuffer),
    device_mask: u32 = @import("std").mem.zeroes(u32),
};
pub const SubmitInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: SubmitFlags = @import("std").mem.zeroes(SubmitFlags),
    wait_semaphore_info_count: u32 = @import("std").mem.zeroes(u32),
    p_wait_semaphore_infos: [*c]const SemaphoreSubmitInfo = @import("std").mem.zeroes([*c]const SemaphoreSubmitInfo),
    command_buffer_info_count: u32 = @import("std").mem.zeroes(u32),
    p_command_buffer_infos: [*c]const CommandBufferSubmitInfo = @import("std").mem.zeroes([*c]const CommandBufferSubmitInfo),
    signal_semaphore_info_count: u32 = @import("std").mem.zeroes(u32),
    p_signal_semaphore_infos: [*c]const SemaphoreSubmitInfo = @import("std").mem.zeroes([*c]const SemaphoreSubmitInfo),
};
pub const PhysicalDeviceSynchronization2Features = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    synchronization2: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceZeroInitializeWorkgroupMemoryFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_zero_initialize_workgroup_memory: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImageRobustnessFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    robust_image_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const BufferCopy2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    dst_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const CopyBufferInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    dst_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const BufferCopy2 = @import("std").mem.zeroes([*c]const BufferCopy2),
};
pub const ImageCopy2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    src_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    dst_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    dst_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const CopyImageInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_image: Image = @import("std").mem.zeroes(Image),
    src_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    dst_image: Image = @import("std").mem.zeroes(Image),
    dst_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const ImageCopy2 = @import("std").mem.zeroes([*c]const ImageCopy2),
};
pub const BufferImageCopy2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    buffer_row_length: u32 = @import("std").mem.zeroes(u32),
    buffer_image_height: u32 = @import("std").mem.zeroes(u32),
    image_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    image_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    image_extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const CopyBufferToImageInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    dst_image: Image = @import("std").mem.zeroes(Image),
    dst_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const BufferImageCopy2 = @import("std").mem.zeroes([*c]const BufferImageCopy2),
};
pub const CopyImageToBufferInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_image: Image = @import("std").mem.zeroes(Image),
    src_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    dst_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const BufferImageCopy2 = @import("std").mem.zeroes([*c]const BufferImageCopy2),
};
pub const ImageBlit2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    src_offsets: [2]Offset3D = @import("std").mem.zeroes([2]Offset3D),
    dst_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    dst_offsets: [2]Offset3D = @import("std").mem.zeroes([2]Offset3D),
};
pub const BlitImageInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_image: Image = @import("std").mem.zeroes(Image),
    src_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    dst_image: Image = @import("std").mem.zeroes(Image),
    dst_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const ImageBlit2 = @import("std").mem.zeroes([*c]const ImageBlit2),
    filter: Filter = @import("std").mem.zeroes(Filter),
};
pub const ImageResolve2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    src_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    dst_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    dst_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const ResolveImageInfo2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_image: Image = @import("std").mem.zeroes(Image),
    src_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    dst_image: Image = @import("std").mem.zeroes(Image),
    dst_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const ImageResolve2 = @import("std").mem.zeroes([*c]const ImageResolve2),
};
pub const PhysicalDeviceSubgroupSizeControlFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    subgroup_size_control: Bool32 = @import("std").mem.zeroes(Bool32),
    compute_full_subgroups: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceSubgroupSizeControlProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_subgroup_size: u32 = @import("std").mem.zeroes(u32),
    max_subgroup_size: u32 = @import("std").mem.zeroes(u32),
    max_compute_workgroup_subgroups: u32 = @import("std").mem.zeroes(u32),
    required_subgroup_size_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
};
pub const PipelineShaderStageRequiredSubgroupSizeCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    required_subgroup_size: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceInlineUniformBlockFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    inline_uniform_block: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_inline_uniform_block_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceInlineUniformBlockProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_inline_uniform_block_size: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
};
pub const WriteDescriptorSetInlineUniformBlock = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    data_size: u32 = @import("std").mem.zeroes(u32),
    p_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const DescriptorPoolInlineUniformBlockCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    max_inline_uniform_block_bindings: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceTextureCompressionASTCHDRFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    texture_compression_astc_hdr: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RenderingAttachmentInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image_view: ImageView = @import("std").mem.zeroes(ImageView),
    image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    resolve_mode: ResolveModeFlagBits = @import("std").mem.zeroes(ResolveModeFlagBits),
    resolve_image_view: ImageView = @import("std").mem.zeroes(ImageView),
    resolve_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    load_op: AttachmentLoadOp = @import("std").mem.zeroes(AttachmentLoadOp),
    store_op: AttachmentStoreOp = @import("std").mem.zeroes(AttachmentStoreOp),
    clear_value: ClearValue = @import("std").mem.zeroes(ClearValue),
};
pub const RenderingInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: RenderingFlags = @import("std").mem.zeroes(RenderingFlags),
    render_area: Rect2D = @import("std").mem.zeroes(Rect2D),
    layer_count: u32 = @import("std").mem.zeroes(u32),
    view_mask: u32 = @import("std").mem.zeroes(u32),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachments: [*c]const RenderingAttachmentInfo = @import("std").mem.zeroes([*c]const RenderingAttachmentInfo),
    p_depth_attachment: [*c]const RenderingAttachmentInfo = @import("std").mem.zeroes([*c]const RenderingAttachmentInfo),
    p_stencil_attachment: [*c]const RenderingAttachmentInfo = @import("std").mem.zeroes([*c]const RenderingAttachmentInfo),
};
pub const PipelineRenderingCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    view_mask: u32 = @import("std").mem.zeroes(u32),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachment_formats: [*c]const Format = @import("std").mem.zeroes([*c]const Format),
    depth_attachment_format: Format = @import("std").mem.zeroes(Format),
    stencil_attachment_format: Format = @import("std").mem.zeroes(Format),
};
pub const PhysicalDeviceDynamicRenderingFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    dynamic_rendering: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const CommandBufferInheritanceRenderingInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: RenderingFlags = @import("std").mem.zeroes(RenderingFlags),
    view_mask: u32 = @import("std").mem.zeroes(u32),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachment_formats: [*c]const Format = @import("std").mem.zeroes([*c]const Format),
    depth_attachment_format: Format = @import("std").mem.zeroes(Format),
    stencil_attachment_format: Format = @import("std").mem.zeroes(Format),
    rasterization_samples: SampleCountFlagBits = @import("std").mem.zeroes(SampleCountFlagBits),
};
pub const PhysicalDeviceShaderIntegerDotProductFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_integer_dot_product: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderIntegerDotProductProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    integer_dot_product8_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product8_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product8_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product4x8_bit_packed_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product4x8_bit_packed_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product4x8_bit_packed_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product16_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product16_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product16_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product32_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product32_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product32_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product64_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product64_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product64_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating8_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating8_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating8_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating4x8_bit_packed_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating4x8_bit_packed_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating4x8_bit_packed_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating16_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating16_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating16_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating32_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating32_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating32_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating64_bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating64_bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating64_bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceTexelBufferAlignmentProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    storage_texel_buffer_offset_alignment_bytes: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    storage_texel_buffer_offset_single_texel_alignment: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_texel_buffer_offset_alignment_bytes: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    uniform_texel_buffer_offset_single_texel_alignment: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const FormatProperties3 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    linear_tiling_features: FormatFeatureFlags2 = @import("std").mem.zeroes(FormatFeatureFlags2),
    optimal_tiling_features: FormatFeatureFlags2 = @import("std").mem.zeroes(FormatFeatureFlags2),
    buffer_features: FormatFeatureFlags2 = @import("std").mem.zeroes(FormatFeatureFlags2),
};
pub const PhysicalDeviceMaintenance4Features = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    maintenance4: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMaintenance4Properties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_buffer_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const DeviceBufferMemoryRequirements = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_create_info: [*c]const BufferCreateInfo = @import("std").mem.zeroes([*c]const BufferCreateInfo),
};
pub const DeviceImageMemoryRequirements = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_create_info: [*c]const ImageCreateInfo = @import("std").mem.zeroes([*c]const ImageCreateInfo),
    plane_aspect: ImageAspectFlagBits = @import("std").mem.zeroes(ImageAspectFlagBits),
};
pub const PFN_getPhysicalDeviceToolProperties = ?*const fn (PhysicalDevice, [*c]u32, [*c]PhysicalDeviceToolProperties) callconv(.c) Result;
pub const PFN_createPrivateDataSlot = ?*const fn (Device, [*c]const PrivateDataSlotCreateInfo, [*c]const AllocationCallbacks, [*c]PrivateDataSlot) callconv(.c) Result;
pub const PFN_destroyPrivateDataSlot = ?*const fn (Device, PrivateDataSlot, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_setPrivateData = ?*const fn (Device, ObjectType, u64, PrivateDataSlot, u64) callconv(.c) Result;
pub const PFN_getPrivateData = ?*const fn (Device, ObjectType, u64, PrivateDataSlot, [*c]u64) callconv(.c) void;
pub const PFN_cmdSetEvent2 = ?*const fn (CommandBuffer, Event, [*c]const DependencyInfo) callconv(.c) void;
pub const PFN_cmdResetEvent2 = ?*const fn (CommandBuffer, Event, PipelineStageFlags2) callconv(.c) void;
pub const PFN_cmdWaitEvents2 = ?*const fn (CommandBuffer, u32, [*c]const Event, [*c]const DependencyInfo) callconv(.c) void;
pub const PFN_cmdPipelineBarrier2 = ?*const fn (CommandBuffer, [*c]const DependencyInfo) callconv(.c) void;
pub const PFN_cmdWriteTimestamp2 = ?*const fn (CommandBuffer, PipelineStageFlags2, QueryPool, u32) callconv(.c) void;
pub const PFN_queueSubmit2 = ?*const fn (Queue, u32, [*c]const SubmitInfo2, Fence) callconv(.c) Result;
pub const PFN_cmdCopyBuffer2 = ?*const fn (CommandBuffer, [*c]const CopyBufferInfo2) callconv(.c) void;
pub const PFN_cmdCopyImage2 = ?*const fn (CommandBuffer, [*c]const CopyImageInfo2) callconv(.c) void;
pub const PFN_cmdCopyBufferToImage2 = ?*const fn (CommandBuffer, [*c]const CopyBufferToImageInfo2) callconv(.c) void;
pub const PFN_cmdCopyImageToBuffer2 = ?*const fn (CommandBuffer, [*c]const CopyImageToBufferInfo2) callconv(.c) void;
pub const PFN_cmdBlitImage2 = ?*const fn (CommandBuffer, [*c]const BlitImageInfo2) callconv(.c) void;
pub const PFN_cmdResolveImage2 = ?*const fn (CommandBuffer, [*c]const ResolveImageInfo2) callconv(.c) void;
pub const PFN_cmdBeginRendering = ?*const fn (CommandBuffer, [*c]const RenderingInfo) callconv(.c) void;
pub const PFN_cmdEndRendering = ?*const fn (CommandBuffer) callconv(.c) void;
pub const PFN_cmdSetCullMode = ?*const fn (CommandBuffer, CullModeFlags) callconv(.c) void;
pub const PFN_cmdSetFrontFace = ?*const fn (CommandBuffer, FrontFace) callconv(.c) void;
pub const PFN_cmdSetPrimitiveTopology = ?*const fn (CommandBuffer, PrimitiveTopology) callconv(.c) void;
pub const PFN_cmdSetViewportWithCount = ?*const fn (CommandBuffer, u32, [*c]const Viewport) callconv(.c) void;
pub const PFN_cmdSetScissorWithCount = ?*const fn (CommandBuffer, u32, [*c]const Rect2D) callconv(.c) void;
pub const PFN_cmdBindVertexBuffers2 = ?*const fn (CommandBuffer, u32, u32, [*c]const Buffer, [*c]const DeviceSize, [*c]const DeviceSize, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdSetDepthTestEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthWriteEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthCompareOp = ?*const fn (CommandBuffer, CompareOp) callconv(.c) void;
pub const PFN_cmdSetDepthBoundsTestEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetStencilTestEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetStencilOp = ?*const fn (CommandBuffer, StencilFaceFlags, StencilOp, StencilOp, StencilOp, CompareOp) callconv(.c) void;
pub const PFN_cmdSetRasterizerDiscardEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthBiasEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetPrimitiveRestartEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_getDeviceBufferMemoryRequirements = ?*const fn (Device, [*c]const DeviceBufferMemoryRequirements, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getDeviceImageMemoryRequirements = ?*const fn (Device, [*c]const DeviceImageMemoryRequirements, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getDeviceImageSparseMemoryRequirements = ?*const fn (Device, [*c]const DeviceImageMemoryRequirements, [*c]u32, [*c]SparseImageMemoryRequirements2) callconv(.c) void;
pub extern fn getPhysicalDeviceToolProperties(physical_device: PhysicalDevice, p_tool_count: [*c]u32, p_tool_properties: [*c]PhysicalDeviceToolProperties) Result;
pub extern fn createPrivateDataSlot(device: Device, p_create_info: [*c]const PrivateDataSlotCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_private_data_slot: [*c]PrivateDataSlot) Result;
pub extern fn destroyPrivateDataSlot(device: Device, private_data_slot: PrivateDataSlot, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn setPrivateData(device: Device, object_type: ObjectType, object_handle: u64, private_data_slot: PrivateDataSlot, data: u64) Result;
pub extern fn getPrivateData(device: Device, object_type: ObjectType, object_handle: u64, private_data_slot: PrivateDataSlot, p_data: [*c]u64) void;
pub extern fn cmdSetEvent2(command_buffer: CommandBuffer, event: Event, p_dependency_info: [*c]const DependencyInfo) void;
pub extern fn cmdResetEvent2(command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2) void;
pub extern fn cmdWaitEvents2(command_buffer: CommandBuffer, event_count: u32, p_events: [*c]const Event, p_dependency_infos: [*c]const DependencyInfo) void;
pub extern fn cmdPipelineBarrier2(command_buffer: CommandBuffer, p_dependency_info: [*c]const DependencyInfo) void;
pub extern fn cmdWriteTimestamp2(command_buffer: CommandBuffer, stage: PipelineStageFlags2, query_pool: QueryPool, query: u32) void;
pub extern fn queueSubmit2(queue: Queue, submit_count: u32, p_submits: [*c]const SubmitInfo2, fence: Fence) Result;
pub extern fn cmdCopyBuffer2(command_buffer: CommandBuffer, p_copy_buffer_info: [*c]const CopyBufferInfo2) void;
pub extern fn cmdCopyImage2(command_buffer: CommandBuffer, p_copy_image_info: [*c]const CopyImageInfo2) void;
pub extern fn cmdCopyBufferToImage2(command_buffer: CommandBuffer, p_copy_buffer_to_image_info: [*c]const CopyBufferToImageInfo2) void;
pub extern fn cmdCopyImageToBuffer2(command_buffer: CommandBuffer, p_copy_image_to_buffer_info: [*c]const CopyImageToBufferInfo2) void;
pub extern fn cmdBlitImage2(command_buffer: CommandBuffer, p_blit_image_info: [*c]const BlitImageInfo2) void;
pub extern fn cmdResolveImage2(command_buffer: CommandBuffer, p_resolve_image_info: [*c]const ResolveImageInfo2) void;
pub extern fn cmdBeginRendering(command_buffer: CommandBuffer, p_rendering_info: [*c]const RenderingInfo) void;
pub extern fn cmdEndRendering(command_buffer: CommandBuffer) void;
pub extern fn cmdSetCullMode(command_buffer: CommandBuffer, cull_mode: CullModeFlags) void;
pub extern fn cmdSetFrontFace(command_buffer: CommandBuffer, front_face: FrontFace) void;
pub extern fn cmdSetPrimitiveTopology(command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology) void;
pub extern fn cmdSetViewportWithCount(command_buffer: CommandBuffer, viewport_count: u32, p_viewports: [*c]const Viewport) void;
pub extern fn cmdSetScissorWithCount(command_buffer: CommandBuffer, scissor_count: u32, p_scissors: [*c]const Rect2D) void;
pub extern fn cmdBindVertexBuffers2(command_buffer: CommandBuffer, first_binding: u32, binding_count: u32, p_buffers: [*c]const Buffer, p_offsets: [*c]const DeviceSize, p_sizes: [*c]const DeviceSize, p_strides: [*c]const DeviceSize) void;
pub extern fn cmdSetDepthTestEnable(command_buffer: CommandBuffer, depth_test_enable: Bool32) void;
pub extern fn cmdSetDepthWriteEnable(command_buffer: CommandBuffer, depth_write_enable: Bool32) void;
pub extern fn cmdSetDepthCompareOp(command_buffer: CommandBuffer, depth_compare_op: CompareOp) void;
pub extern fn cmdSetDepthBoundsTestEnable(command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32) void;
pub extern fn cmdSetStencilTestEnable(command_buffer: CommandBuffer, stencil_test_enable: Bool32) void;
pub extern fn cmdSetStencilOp(command_buffer: CommandBuffer, face_mask: StencilFaceFlags, fail_op: StencilOp, pass_op: StencilOp, depth_fail_op: StencilOp, compare_op: CompareOp) void;
pub extern fn cmdSetRasterizerDiscardEnable(command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32) void;
pub extern fn cmdSetDepthBiasEnable(command_buffer: CommandBuffer, depth_bias_enable: Bool32) void;
pub extern fn cmdSetPrimitiveRestartEnable(command_buffer: CommandBuffer, primitive_restart_enable: Bool32) void;
pub extern fn getDeviceBufferMemoryRequirements(device: Device, p_info: [*c]const DeviceBufferMemoryRequirements, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getDeviceImageMemoryRequirements(device: Device, p_info: [*c]const DeviceImageMemoryRequirements, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getDeviceImageSparseMemoryRequirements(device: Device, p_info: [*c]const DeviceImageMemoryRequirements, p_sparse_memory_requirement_count: [*c]u32, p_sparse_memory_requirements: [*c]SparseImageMemoryRequirements2) void;
pub const PipelineRobustnessBufferBehavior = enum(u32) {
    device_default = 0,
    disabled = 1,
    robust_buffer_access = 2,
    robust_buffer_access_2 = 3,
    max_enum = 2147483647,
    const Self = @This();
    pub const robust_buffer_access_2_ext = Self.robust_buffer_access_2;
    pub const robust_buffer_access_ext = Self.robust_buffer_access;
    pub const disabled_ext = Self.disabled;
    pub const device_default_ext = Self.device_default;
};
pub const PipelineRobustnessImageBehavior = enum(u32) {
    device_default = 0,
    disabled = 1,
    robust_image_access = 2,
    robust_image_access_2 = 3,
    max_enum = 2147483647,
    const Self = @This();
    pub const robust_image_access_2_ext = Self.robust_image_access_2;
    pub const robust_image_access_ext = Self.robust_image_access;
    pub const disabled_ext = Self.disabled;
    pub const device_default_ext = Self.device_default;
};
pub const QueueGlobalPriority = enum(u32) {
    low = 128,
    medium = 256,
    high = 512,
    realtime = 1024,
    max_enum = 2147483647,
    const Self = @This();
    pub const realtime_ext = Self.realtime_khr;
    pub const high_ext = Self.high_khr;
    pub const medium_ext = Self.medium_khr;
    pub const low_ext = Self.low_khr;
    pub const realtime_khr = Self.realtime;
    pub const high_khr = Self.high;
    pub const medium_khr = Self.medium;
    pub const low_khr = Self.low;
};
pub const LineRasterizationMode = enum(u32) {
    default = 0,
    rectangular = 1,
    bresenham = 2,
    rectangular_smooth = 3,
    max_enum = 2147483647,
    const Self = @This();
    pub const rectangular_smooth_ext = Self.rectangular_smooth_khr;
    pub const bresenham_ext = Self.bresenham_khr;
    pub const rectangular_ext = Self.rectangular_khr;
    pub const default_ext = Self.default_khr;
    pub const rectangular_smooth_khr = Self.rectangular_smooth;
    pub const bresenham_khr = Self.bresenham;
    pub const rectangular_khr = Self.rectangular;
    pub const default_khr = Self.default;
};
pub const MemoryUnmapFlagBits = enum(u32) {
    reserve_bit_ext = 1,
    flag_bits_max_enum = 2147483647,
};
pub const MemoryUnmapFlags = PES(MemoryUnmapFlagBits);
pub const PipelineCreateFlagBits2 = enum(u64) {
    @"2_disable_optimization_bit" = 1,
    @"2_allow_derivatives_bit" = 2,
    @"2_derivative_bit" = 4,
    @"2_view_index_from_device_index_bit" = 8,
    @"2_dispatch_base_bit" = 16,
    @"2_defer_compile_bit_nv" = 32,
    @"2_capture_statistics_bit_khr" = 64,
    @"2_capture_internal_representations_bit_khr" = 128,
    @"2_fail_on_pipeline_compile_required_bit" = 256,
    @"2_early_return_on_failure_bit" = 512,
    @"2_link_time_optimization_bit_ext" = 1024,
    @"2_library_bit_khr" = 2048,
    @"2_ray_tracing_skip_triangles_bit_khr" = 4096,
    @"2_ray_tracing_skip_aabbs_bit_khr" = 8192,
    @"2_ray_tracing_no_null_any_hit_shaders_bit_khr" = 16384,
    @"2_ray_tracing_no_null_closest_hit_shaders_bit_khr" = 32768,
    @"2_ray_tracing_no_null_miss_shaders_bit_khr" = 65536,
    @"2_ray_tracing_no_null_intersection_shaders_bit_khr" = 131072,
    @"2_indirect_bindable_bit_nv" = 262144,
    @"2_ray_tracing_shader_group_handle_capture_replay_bit_khr" = 524288,
    @"2_ray_tracing_allow_motion_bit_nv" = 1048576,
    @"2_rendering_fragment_shading_rate_attachment_bit_khr" = 2097152,
    @"2_rendering_fragment_density_map_attachment_bit_ext" = 4194304,
    @"2_retain_link_time_optimization_info_bit_ext" = 8388608,
    @"2_ray_tracing_opacity_micromap_bit_ext" = 16777216,
    @"2_color_attachment_feedback_loop_bit_ext" = 33554432,
    @"2_depth_stencil_attachment_feedback_loop_bit_ext" = 67108864,
    @"2_no_protected_access_bit" = 134217728,
    @"2_ray_tracing_displacement_micromap_bit_nv" = 268435456,
    @"2_descriptor_buffer_bit_ext" = 536870912,
    @"2_protected_access_only_bit" = 1073741824,
    @"2_capture_data_bit_khr" = 2147483648,
    @"2_ray_tracing_allow_spheres_and_linear_swept_spheres_bit_nv" = 8589934592,
    @"2_enable_legacy_dithering_bit_ext" = 17179869184,
    @"2_disallow_opacity_micromap_bit_arm" = 137438953472,
    @"2_indirect_bindable_bit_ext" = 274877906944,
    const Self = @This();
    pub const @"2_disable_optimization_bit_khr" = Self.@"2_disable_optimization_bit";
    pub const @"2_allow_derivatives_bit_khr" = Self.@"2_allow_derivatives_bit";
    pub const @"2_derivative_bit_khr" = Self.@"2_derivative_bit";
    pub const @"2_view_index_from_device_index_bit_khr" = Self.@"2_view_index_from_device_index_bit";
    pub const @"2_dispatch_base_bit_khr" = Self.@"2_dispatch_base_bit";
    pub const @"2_fail_on_pipeline_compile_required_bit_khr" = Self.@"2_fail_on_pipeline_compile_required_bit";
    pub const @"2_early_return_on_failure_bit_khr" = Self.@"2_early_return_on_failure_bit";
    pub const @"2_ray_tracing_skip_built_in_primitives_bit_khr" = Self.@"2_ray_tracing_skip_triangles_bit_khr";
    pub const @"2_no_protected_access_bit_ext" = Self.@"2_no_protected_access_bit";
    pub const @"2_protected_access_only_bit_ext" = Self.@"2_protected_access_only_bit";
};
pub const PipelineCreateFlags2 = PES(PipelineCreateFlagBits2);
pub const BufferUsageFlagBits2 = enum(u64) {
    @"2_transfer_src_bit" = 1,
    @"2_transfer_dst_bit" = 2,
    @"2_uniform_texel_buffer_bit" = 4,
    @"2_storage_texel_buffer_bit" = 8,
    @"2_uniform_buffer_bit" = 16,
    @"2_storage_buffer_bit" = 32,
    @"2_index_buffer_bit" = 64,
    @"2_vertex_buffer_bit" = 128,
    @"2_indirect_buffer_bit" = 256,
    @"2_conditional_rendering_bit_ext" = 512,
    @"2_ray_tracing_bit_nv" = 1024,
    @"2_transform_feedback_buffer_bit_ext" = 2048,
    @"2_transform_feedback_counter_buffer_bit_ext" = 4096,
    @"2_video_decode_src_bit_khr" = 8192,
    @"2_video_decode_dst_bit_khr" = 16384,
    @"2_video_encode_dst_bit_khr" = 32768,
    @"2_video_encode_src_bit_khr" = 65536,
    @"2_shader_device_address_bit" = 131072,
    @"2_acceleration_structure_build_input_read_only_bit_khr" = 524288,
    @"2_acceleration_structure_storage_bit_khr" = 1048576,
    @"2_sampler_descriptor_buffer_bit_ext" = 2097152,
    @"2_resource_descriptor_buffer_bit_ext" = 4194304,
    @"2_micromap_build_input_read_only_bit_ext" = 8388608,
    @"2_micromap_storage_bit_ext" = 16777216,
    @"2_push_descriptors_descriptor_buffer_bit_ext" = 67108864,
    @"2_preprocess_buffer_bit_ext" = 2147483648,
    const Self = @This();
    pub const @"2_transfer_src_bit_khr" = Self.@"2_transfer_src_bit";
    pub const @"2_transfer_dst_bit_khr" = Self.@"2_transfer_dst_bit";
    pub const @"2_uniform_texel_buffer_bit_khr" = Self.@"2_uniform_texel_buffer_bit";
    pub const @"2_storage_texel_buffer_bit_khr" = Self.@"2_storage_texel_buffer_bit";
    pub const @"2_uniform_buffer_bit_khr" = Self.@"2_uniform_buffer_bit";
    pub const @"2_storage_buffer_bit_khr" = Self.@"2_storage_buffer_bit";
    pub const @"2_index_buffer_bit_khr" = Self.@"2_index_buffer_bit";
    pub const @"2_vertex_buffer_bit_khr" = Self.@"2_vertex_buffer_bit";
    pub const @"2_indirect_buffer_bit_khr" = Self.@"2_indirect_buffer_bit";
    pub const @"2_shader_binding_table_bit_khr" = Self.@"2_ray_tracing_bit_nv";
    pub const @"2_shader_device_address_bit_khr" = Self.@"2_shader_device_address_bit";
};
pub const BufferUsageFlags2 = PES(BufferUsageFlagBits2);
pub const HostImageCopyFlagBits = enum(u32) {
    memcpy = 1,
    flag_bits_max_enum = 2147483647,
    const Self = @This();
    pub const memcpy_ext = Self.memcpy;
};
pub const HostImageCopyFlags = PES(HostImageCopyFlagBits);
pub const PhysicalDeviceVulkan14Features = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    global_priority_query: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_subgroup_rotate: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_subgroup_rotate_clustered: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_float_controls2: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_expect_assume: Bool32 = @import("std").mem.zeroes(Bool32),
    rectangular_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    bresenham_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    smooth_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    stippled_rectangular_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    stippled_bresenham_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    stippled_smooth_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    vertex_attribute_instance_rate_divisor: Bool32 = @import("std").mem.zeroes(Bool32),
    vertex_attribute_instance_rate_zero_divisor: Bool32 = @import("std").mem.zeroes(Bool32),
    index_type_uint8: Bool32 = @import("std").mem.zeroes(Bool32),
    dynamic_rendering_local_read: Bool32 = @import("std").mem.zeroes(Bool32),
    maintenance5: Bool32 = @import("std").mem.zeroes(Bool32),
    maintenance6: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_protected_access: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_robustness: Bool32 = @import("std").mem.zeroes(Bool32),
    host_image_copy: Bool32 = @import("std").mem.zeroes(Bool32),
    push_descriptor: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVulkan14Properties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    line_sub_pixel_precision_bits: u32 = @import("std").mem.zeroes(u32),
    max_vertex_attrib_divisor: u32 = @import("std").mem.zeroes(u32),
    supports_non_zero_first_instance: Bool32 = @import("std").mem.zeroes(Bool32),
    max_push_descriptors: u32 = @import("std").mem.zeroes(u32),
    dynamic_rendering_local_read_depth_stencil_attachments: Bool32 = @import("std").mem.zeroes(Bool32),
    dynamic_rendering_local_read_multisampled_attachments: Bool32 = @import("std").mem.zeroes(Bool32),
    early_fragment_multisample_coverage_after_sample_counting: Bool32 = @import("std").mem.zeroes(Bool32),
    early_fragment_sample_mask_test_before_sample_counting: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_stencil_swizzle_one_support: Bool32 = @import("std").mem.zeroes(Bool32),
    polygon_mode_point_size: Bool32 = @import("std").mem.zeroes(Bool32),
    non_strict_single_pixel_wide_lines_use_parallelogram: Bool32 = @import("std").mem.zeroes(Bool32),
    non_strict_wide_lines_use_parallelogram: Bool32 = @import("std").mem.zeroes(Bool32),
    block_texel_view_compatible_multiple_layers: Bool32 = @import("std").mem.zeroes(Bool32),
    max_combined_image_sampler_descriptor_count: u32 = @import("std").mem.zeroes(u32),
    fragment_shading_rate_clamp_combiner_inputs: Bool32 = @import("std").mem.zeroes(Bool32),
    default_robustness_storage_buffers: PipelineRobustnessBufferBehavior = @import("std").mem.zeroes(PipelineRobustnessBufferBehavior),
    default_robustness_uniform_buffers: PipelineRobustnessBufferBehavior = @import("std").mem.zeroes(PipelineRobustnessBufferBehavior),
    default_robustness_vertex_inputs: PipelineRobustnessBufferBehavior = @import("std").mem.zeroes(PipelineRobustnessBufferBehavior),
    default_robustness_images: PipelineRobustnessImageBehavior = @import("std").mem.zeroes(PipelineRobustnessImageBehavior),
    copy_src_layout_count: u32 = @import("std").mem.zeroes(u32),
    p_copy_src_layouts: [*c]ImageLayout = @import("std").mem.zeroes([*c]ImageLayout),
    copy_dst_layout_count: u32 = @import("std").mem.zeroes(u32),
    p_copy_dst_layouts: [*c]ImageLayout = @import("std").mem.zeroes([*c]ImageLayout),
    optimal_tiling_layout_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    identical_memory_type_requirements: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceQueueGlobalPriorityCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    global_priority: QueueGlobalPriority = @import("std").mem.zeroes(QueueGlobalPriority),
};
pub const PhysicalDeviceGlobalPriorityQueryFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    global_priority_query: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const QueueFamilyGlobalPriorityProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    priority_count: u32 = @import("std").mem.zeroes(u32),
    priorities: [16]QueueGlobalPriority = @import("std").mem.zeroes([16]QueueGlobalPriority),
};
pub const PhysicalDeviceShaderSubgroupRotateFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_subgroup_rotate: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_subgroup_rotate_clustered: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderFloatControls2Features = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_float_controls2: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderExpectAssumeFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_expect_assume: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceLineRasterizationFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    rectangular_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    bresenham_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    smooth_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    stippled_rectangular_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    stippled_bresenham_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    stippled_smooth_lines: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceLineRasterizationProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    line_sub_pixel_precision_bits: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineRasterizationLineStateCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    line_rasterization_mode: LineRasterizationMode = @import("std").mem.zeroes(LineRasterizationMode),
    stippled_line_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    line_stipple_factor: u32 = @import("std").mem.zeroes(u32),
    line_stipple_pattern: u16 = @import("std").mem.zeroes(u16),
};
pub const PhysicalDeviceVertexAttributeDivisorProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_vertex_attrib_divisor: u32 = @import("std").mem.zeroes(u32),
    supports_non_zero_first_instance: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const VertexInputBindingDivisorDescription = extern struct {
    binding: u32 = @import("std").mem.zeroes(u32),
    divisor: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineVertexInputDivisorStateCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    vertex_binding_divisor_count: u32 = @import("std").mem.zeroes(u32),
    p_vertex_binding_divisors: [*c]const VertexInputBindingDivisorDescription = @import("std").mem.zeroes([*c]const VertexInputBindingDivisorDescription),
};
pub const PhysicalDeviceVertexAttributeDivisorFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    vertex_attribute_instance_rate_divisor: Bool32 = @import("std").mem.zeroes(Bool32),
    vertex_attribute_instance_rate_zero_divisor: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceIndexTypeUint8Features = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    index_type_uint8: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MemoryMapInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: MemoryMapFlags = @import("std").mem.zeroes(MemoryMapFlags),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const MemoryUnmapInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: MemoryUnmapFlags = @import("std").mem.zeroes(MemoryUnmapFlags),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
};
pub const PhysicalDeviceMaintenance5Features = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    maintenance5: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMaintenance5Properties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    early_fragment_multisample_coverage_after_sample_counting: Bool32 = @import("std").mem.zeroes(Bool32),
    early_fragment_sample_mask_test_before_sample_counting: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_stencil_swizzle_one_support: Bool32 = @import("std").mem.zeroes(Bool32),
    polygon_mode_point_size: Bool32 = @import("std").mem.zeroes(Bool32),
    non_strict_single_pixel_wide_lines_use_parallelogram: Bool32 = @import("std").mem.zeroes(Bool32),
    non_strict_wide_lines_use_parallelogram: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RenderingAreaInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    view_mask: u32 = @import("std").mem.zeroes(u32),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachment_formats: [*c]const Format = @import("std").mem.zeroes([*c]const Format),
    depth_attachment_format: Format = @import("std").mem.zeroes(Format),
    stencil_attachment_format: Format = @import("std").mem.zeroes(Format),
};
pub const ImageSubresource2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_subresource: ImageSubresource = @import("std").mem.zeroes(ImageSubresource),
};
pub const DeviceImageSubresourceInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_create_info: [*c]const ImageCreateInfo = @import("std").mem.zeroes([*c]const ImageCreateInfo),
    p_subresource: [*c]const ImageSubresource2 = @import("std").mem.zeroes([*c]const ImageSubresource2),
};
pub const SubresourceLayout2 = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    subresource_layout: SubresourceLayout = @import("std").mem.zeroes(SubresourceLayout),
};
pub const PipelineCreateFlags2CreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCreateFlags2 = @import("std").mem.zeroes(PipelineCreateFlags2),
};
pub const BufferUsageFlags2CreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    usage: BufferUsageFlags2 = @import("std").mem.zeroes(BufferUsageFlags2),
};
pub const PhysicalDevicePushDescriptorProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_push_descriptors: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceDynamicRenderingLocalReadFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    dynamic_rendering_local_read: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RenderingAttachmentLocationInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachment_locations: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const RenderingInputAttachmentIndexInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachment_input_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    p_depth_input_attachment_index: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    p_stencil_input_attachment_index: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const PhysicalDeviceMaintenance6Features = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    maintenance6: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMaintenance6Properties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    block_texel_view_compatible_multiple_layers: Bool32 = @import("std").mem.zeroes(Bool32),
    max_combined_image_sampler_descriptor_count: u32 = @import("std").mem.zeroes(u32),
    fragment_shading_rate_clamp_combiner_inputs: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const BindMemoryStatus = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_result: [*c]Result = @import("std").mem.zeroes([*c]Result),
};
pub const BindDescriptorSetsInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    first_set: u32 = @import("std").mem.zeroes(u32),
    descriptor_set_count: u32 = @import("std").mem.zeroes(u32),
    p_descriptor_sets: [*c]const DescriptorSet = @import("std").mem.zeroes([*c]const DescriptorSet),
    dynamic_offset_count: u32 = @import("std").mem.zeroes(u32),
    p_dynamic_offsets: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const PushConstantsInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    offset: u32 = @import("std").mem.zeroes(u32),
    size: u32 = @import("std").mem.zeroes(u32),
    p_values: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const PushDescriptorSetInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    set: u32 = @import("std").mem.zeroes(u32),
    descriptor_write_count: u32 = @import("std").mem.zeroes(u32),
    p_descriptor_writes: [*c]const WriteDescriptorSet = @import("std").mem.zeroes([*c]const WriteDescriptorSet),
};
pub const PushDescriptorSetWithTemplateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    descriptor_update_template: DescriptorUpdateTemplate = @import("std").mem.zeroes(DescriptorUpdateTemplate),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    set: u32 = @import("std").mem.zeroes(u32),
    p_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const PhysicalDevicePipelineProtectedAccessFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_protected_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePipelineRobustnessFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_robustness: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePipelineRobustnessProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    default_robustness_storage_buffers: PipelineRobustnessBufferBehavior = @import("std").mem.zeroes(PipelineRobustnessBufferBehavior),
    default_robustness_uniform_buffers: PipelineRobustnessBufferBehavior = @import("std").mem.zeroes(PipelineRobustnessBufferBehavior),
    default_robustness_vertex_inputs: PipelineRobustnessBufferBehavior = @import("std").mem.zeroes(PipelineRobustnessBufferBehavior),
    default_robustness_images: PipelineRobustnessImageBehavior = @import("std").mem.zeroes(PipelineRobustnessImageBehavior),
};
pub const PipelineRobustnessCreateInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    storage_buffers: PipelineRobustnessBufferBehavior = @import("std").mem.zeroes(PipelineRobustnessBufferBehavior),
    uniform_buffers: PipelineRobustnessBufferBehavior = @import("std").mem.zeroes(PipelineRobustnessBufferBehavior),
    vertex_inputs: PipelineRobustnessBufferBehavior = @import("std").mem.zeroes(PipelineRobustnessBufferBehavior),
    images: PipelineRobustnessImageBehavior = @import("std").mem.zeroes(PipelineRobustnessImageBehavior),
};
pub const PhysicalDeviceHostImageCopyFeatures = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    host_image_copy: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceHostImageCopyProperties = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    copy_src_layout_count: u32 = @import("std").mem.zeroes(u32),
    p_copy_src_layouts: [*c]ImageLayout = @import("std").mem.zeroes([*c]ImageLayout),
    copy_dst_layout_count: u32 = @import("std").mem.zeroes(u32),
    p_copy_dst_layouts: [*c]ImageLayout = @import("std").mem.zeroes([*c]ImageLayout),
    optimal_tiling_layout_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    identical_memory_type_requirements: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MemoryToImageCopy = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_host_pointer: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    memory_row_length: u32 = @import("std").mem.zeroes(u32),
    memory_image_height: u32 = @import("std").mem.zeroes(u32),
    image_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    image_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    image_extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const ImageToMemoryCopy = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_host_pointer: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_row_length: u32 = @import("std").mem.zeroes(u32),
    memory_image_height: u32 = @import("std").mem.zeroes(u32),
    image_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    image_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    image_extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const CopyMemoryToImageInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: HostImageCopyFlags = @import("std").mem.zeroes(HostImageCopyFlags),
    dst_image: Image = @import("std").mem.zeroes(Image),
    dst_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const MemoryToImageCopy = @import("std").mem.zeroes([*c]const MemoryToImageCopy),
};
pub const CopyImageToMemoryInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: HostImageCopyFlags = @import("std").mem.zeroes(HostImageCopyFlags),
    src_image: Image = @import("std").mem.zeroes(Image),
    src_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const ImageToMemoryCopy = @import("std").mem.zeroes([*c]const ImageToMemoryCopy),
};
pub const CopyImageToImageInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: HostImageCopyFlags = @import("std").mem.zeroes(HostImageCopyFlags),
    src_image: Image = @import("std").mem.zeroes(Image),
    src_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    dst_image: Image = @import("std").mem.zeroes(Image),
    dst_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const ImageCopy2 = @import("std").mem.zeroes([*c]const ImageCopy2),
};
pub const HostImageLayoutTransitionInfo = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
    old_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    new_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    subresource_range: ImageSubresourceRange = @import("std").mem.zeroes(ImageSubresourceRange),
};
pub const SubresourceHostMemcpySize = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const HostImageCopyDevicePerformanceQuery = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    optimal_device_access: Bool32 = @import("std").mem.zeroes(Bool32),
    identical_memory_layout: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdSetLineStipple = ?*const fn (CommandBuffer, u32, u16) callconv(.c) void;
pub const PFN_mapMemory2 = ?*const fn (Device, [*c]const MemoryMapInfo, [*c]?*anyopaque) callconv(.c) Result;
pub const PFN_unmapMemory2 = ?*const fn (Device, [*c]const MemoryUnmapInfo) callconv(.c) Result;
pub const PFN_cmdBindIndexBuffer2 = ?*const fn (CommandBuffer, Buffer, DeviceSize, DeviceSize, IndexType) callconv(.c) void;
pub const PFN_getRenderingAreaGranularity = ?*const fn (Device, [*c]const RenderingAreaInfo, [*c]Extent2D) callconv(.c) void;
pub const PFN_getDeviceImageSubresourceLayout = ?*const fn (Device, [*c]const DeviceImageSubresourceInfo, [*c]SubresourceLayout2) callconv(.c) void;
pub const PFN_getImageSubresourceLayout2 = ?*const fn (Device, Image, [*c]const ImageSubresource2, [*c]SubresourceLayout2) callconv(.c) void;
pub const PFN_cmdPushDescriptorSet = ?*const fn (CommandBuffer, PipelineBindPoint, PipelineLayout, u32, u32, [*c]const WriteDescriptorSet) callconv(.c) void;
pub const PFN_cmdPushDescriptorSetWithTemplate = ?*const fn (CommandBuffer, DescriptorUpdateTemplate, PipelineLayout, u32, ?*const anyopaque) callconv(.c) void;
pub const PFN_cmdSetRenderingAttachmentLocations = ?*const fn (CommandBuffer, [*c]const RenderingAttachmentLocationInfo) callconv(.c) void;
pub const PFN_cmdSetRenderingInputAttachmentIndices = ?*const fn (CommandBuffer, [*c]const RenderingInputAttachmentIndexInfo) callconv(.c) void;
pub const PFN_cmdBindDescriptorSets2 = ?*const fn (CommandBuffer, [*c]const BindDescriptorSetsInfo) callconv(.c) void;
pub const PFN_cmdPushConstants2 = ?*const fn (CommandBuffer, [*c]const PushConstantsInfo) callconv(.c) void;
pub const PFN_cmdPushDescriptorSet2 = ?*const fn (CommandBuffer, [*c]const PushDescriptorSetInfo) callconv(.c) void;
pub const PFN_cmdPushDescriptorSetWithTemplate2 = ?*const fn (CommandBuffer, [*c]const PushDescriptorSetWithTemplateInfo) callconv(.c) void;
pub const PFN_copyMemoryToImage = ?*const fn (Device, [*c]const CopyMemoryToImageInfo) callconv(.c) Result;
pub const PFN_copyImageToMemory = ?*const fn (Device, [*c]const CopyImageToMemoryInfo) callconv(.c) Result;
pub const PFN_copyImageToImage = ?*const fn (Device, [*c]const CopyImageToImageInfo) callconv(.c) Result;
pub const PFN_transitionImageLayout = ?*const fn (Device, u32, [*c]const HostImageLayoutTransitionInfo) callconv(.c) Result;
pub extern fn cmdSetLineStipple(command_buffer: CommandBuffer, line_stipple_factor: u32, line_stipple_pattern: u16) void;
pub extern fn mapMemory2(device: Device, p_memory_map_info: [*c]const MemoryMapInfo, pp_data: [*c]?*anyopaque) Result;
pub extern fn unmapMemory2(device: Device, p_memory_unmap_info: [*c]const MemoryUnmapInfo) Result;
pub extern fn cmdBindIndexBuffer2(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, size: DeviceSize, index_type: IndexType) void;
pub extern fn getRenderingAreaGranularity(device: Device, p_rendering_area_info: [*c]const RenderingAreaInfo, p_granularity: [*c]Extent2D) void;
pub extern fn getDeviceImageSubresourceLayout(device: Device, p_info: [*c]const DeviceImageSubresourceInfo, p_layout: [*c]SubresourceLayout2) void;
pub extern fn getImageSubresourceLayout2(device: Device, image: Image, p_subresource: [*c]const ImageSubresource2, p_layout: [*c]SubresourceLayout2) void;
pub extern fn cmdPushDescriptorSet(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, layout: PipelineLayout, set: u32, descriptor_write_count: u32, p_descriptor_writes: [*c]const WriteDescriptorSet) void;
pub extern fn cmdPushDescriptorSetWithTemplate(command_buffer: CommandBuffer, descriptor_update_template: DescriptorUpdateTemplate, layout: PipelineLayout, set: u32, p_data: ?*const anyopaque) void;
pub extern fn cmdSetRenderingAttachmentLocations(command_buffer: CommandBuffer, p_location_info: [*c]const RenderingAttachmentLocationInfo) void;
pub extern fn cmdSetRenderingInputAttachmentIndices(command_buffer: CommandBuffer, p_input_attachment_index_info: [*c]const RenderingInputAttachmentIndexInfo) void;
pub extern fn cmdBindDescriptorSets2(command_buffer: CommandBuffer, p_bind_descriptor_sets_info: [*c]const BindDescriptorSetsInfo) void;
pub extern fn cmdPushConstants2(command_buffer: CommandBuffer, p_push_constants_info: [*c]const PushConstantsInfo) void;
pub extern fn cmdPushDescriptorSet2(command_buffer: CommandBuffer, p_push_descriptor_set_info: [*c]const PushDescriptorSetInfo) void;
pub extern fn cmdPushDescriptorSetWithTemplate2(command_buffer: CommandBuffer, p_push_descriptor_set_with_template_info: [*c]const PushDescriptorSetWithTemplateInfo) void;
pub extern fn copyMemoryToImage(device: Device, p_copy_memory_to_image_info: [*c]const CopyMemoryToImageInfo) Result;
pub extern fn copyImageToMemory(device: Device, p_copy_image_to_memory_info: [*c]const CopyImageToMemoryInfo) Result;
pub extern fn copyImageToImage(device: Device, p_copy_image_to_image_info: [*c]const CopyImageToImageInfo) Result;
pub extern fn transitionImageLayout(device: Device, transition_count: u32, p_transitions: [*c]const HostImageLayoutTransitionInfo) Result;
pub const SurfaceKHR = enum(u64) { null = 0, _ };
pub const PresentModeKHR = enum(u32) {
    immediate = 0,
    mailbox = 1,
    fifo = 2,
    fifo_relaxed = 3,
    shared_demand_refresh = 1000111000,
    shared_continuous_refresh = 1000111001,
    fifo_latest_ready_ext = 1000361000,
    max_enum = 2147483647,
};
pub const ColorSpaceKHR = enum(u32) {
    srgb_nonlinear = 0,
    display_p3_nonlinear_ext = 1000104001,
    extended_srgb_linear_ext = 1000104002,
    dci_p3_linear_ext = 1000104003,
    dci_p3_nonlinear_ext = 1000104004,
    bt709_linear_ext = 1000104005,
    bt709_nonlinear_ext = 1000104006,
    bt2020_linear_ext = 1000104007,
    hdr10_st2084_ext = 1000104008,
    dolbyvision_ext = 1000104009,
    hdr10_hlg_ext = 1000104010,
    adobergb_linear_ext = 1000104011,
    adobergb_nonlinear_ext = 1000104012,
    pass_through_ext = 1000104013,
    extended_srgb_nonlinear_ext = 1000104014,
    display_native_amd = 1000213000,
    max_enum = 2147483647,
    const Self = @This();
    pub const display_p3_linear_ext = Self.dci_p3_linear_ext;
    pub const colorspace_srgb_nonlinear = Self.srgb_nonlinear;
};
pub const SurfaceTransformFlagBits = enum(u32) {
    identity_bit_khr = 1,
    rotate_90_bit_khr = 2,
    rotate_180_bit_khr = 4,
    rotate_270_bit_khr = 8,
    horizontal_mirror_bit_khr = 16,
    horizontal_mirror_rotate_90_bit_khr = 32,
    horizontal_mirror_rotate_180_bit_khr = 64,
    horizontal_mirror_rotate_270_bit_khr = 128,
    inherit_bit_khr = 256,
    flag_bits_max_enum_khr = 2147483647,
};
pub const SurfaceTransformFlags = PES(SurfaceTransformFlagBits);
pub const CompositeAlphaFlagBits = enum(u32) {
    opaque_bit_khr = 1,
    pre_multiplied_bit_khr = 2,
    post_multiplied_bit_khr = 4,
    inherit_bit_khr = 8,
    flag_bits_max_enum_khr = 2147483647,
};
pub const CompositeAlphaFlags = PES(CompositeAlphaFlagBits);
pub const SurfaceTransformFlagsKHR = Flags;
pub const SurfaceCapabilitiesKHR = extern struct {
    min_image_count: u32 = @import("std").mem.zeroes(u32),
    max_image_count: u32 = @import("std").mem.zeroes(u32),
    current_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    min_image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_image_array_layers: u32 = @import("std").mem.zeroes(u32),
    supported_transforms: SurfaceTransformFlagsKHR = @import("std").mem.zeroes(SurfaceTransformFlagsKHR),
    current_transform: SurfaceTransformFlagBits = @import("std").mem.zeroes(SurfaceTransformFlagBits),
    supported_composite_alpha: CompositeAlphaFlags = @import("std").mem.zeroes(CompositeAlphaFlags),
    supported_usage_flags: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
};
pub const SurfaceFormatKHR = extern struct {
    format: Format = @import("std").mem.zeroes(Format),
    color_space: ColorSpaceKHR = @import("std").mem.zeroes(ColorSpaceKHR),
};
pub const PFN_destroySurfaceKHR = ?*const fn (Instance, SurfaceKHR, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getPhysicalDeviceSurfaceSupportKHR = ?*const fn (PhysicalDevice, u32, SurfaceKHR, [*c]Bool32) callconv(.c) Result;
pub const PFN_getPhysicalDeviceSurfaceCapabilitiesKHR = ?*const fn (PhysicalDevice, SurfaceKHR, [*c]SurfaceCapabilitiesKHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceSurfaceFormatsKHR = ?*const fn (PhysicalDevice, SurfaceKHR, [*c]u32, [*c]SurfaceFormatKHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceSurfacePresentModesKHR = ?*const fn (PhysicalDevice, SurfaceKHR, [*c]u32, [*c]PresentModeKHR) callconv(.c) Result;
pub extern fn destroySurfaceKhr(instance: Instance, surface: SurfaceKHR, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getPhysicalDeviceSurfaceSupportKhr(physical_device: PhysicalDevice, queue_family_index: u32, surface: SurfaceKHR, p_supported: [*c]Bool32) Result;
pub extern fn getPhysicalDeviceSurfaceCapabilitiesKhr(physical_device: PhysicalDevice, surface: SurfaceKHR, p_surface_capabilities: [*c]SurfaceCapabilitiesKHR) Result;
pub extern fn getPhysicalDeviceSurfaceFormatsKhr(physical_device: PhysicalDevice, surface: SurfaceKHR, p_surface_format_count: [*c]u32, p_surface_formats: [*c]SurfaceFormatKHR) Result;
pub extern fn getPhysicalDeviceSurfacePresentModesKhr(physical_device: PhysicalDevice, surface: SurfaceKHR, p_present_mode_count: [*c]u32, p_present_modes: [*c]PresentModeKHR) Result;
pub const SwapchainKHR = enum(u64) { null = 0, _ };
pub const SwapchainCreateFlagBits = enum(u32) {
    split_instance_bind_regions_bit_khr = 1,
    protected_bit_khr = 2,
    mutable_format_bit_khr = 4,
    deferred_memory_allocation_bit_ext = 8,
    flag_bits_max_enum_khr = 2147483647,
};
pub const SwapchainCreateFlags = PES(SwapchainCreateFlagBits);
pub const DeviceGroupPresentModeFlagBits = enum(u32) {
    local_bit_khr = 1,
    remote_bit_khr = 2,
    sum_bit_khr = 4,
    local_multi_device_bit_khr = 8,
    flag_bits_max_enum_khr = 2147483647,
};
pub const DeviceGroupPresentModeFlags = PES(DeviceGroupPresentModeFlagBits);
pub const SwapchainCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: SwapchainCreateFlags = @import("std").mem.zeroes(SwapchainCreateFlags),
    surface: SurfaceKHR = @import("std").mem.zeroes(SurfaceKHR),
    min_image_count: u32 = @import("std").mem.zeroes(u32),
    image_format: Format = @import("std").mem.zeroes(Format),
    image_color_space: ColorSpaceKHR = @import("std").mem.zeroes(ColorSpaceKHR),
    image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    image_array_layers: u32 = @import("std").mem.zeroes(u32),
    image_usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    image_sharing_mode: SharingMode = @import("std").mem.zeroes(SharingMode),
    queue_family_index_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_family_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    pre_transform: SurfaceTransformFlagBits = @import("std").mem.zeroes(SurfaceTransformFlagBits),
    composite_alpha: CompositeAlphaFlagBits = @import("std").mem.zeroes(CompositeAlphaFlagBits),
    present_mode: PresentModeKHR = @import("std").mem.zeroes(PresentModeKHR),
    clipped: Bool32 = @import("std").mem.zeroes(Bool32),
    old_swapchain: SwapchainKHR = @import("std").mem.zeroes(SwapchainKHR),
};
pub const PresentInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    wait_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_wait_semaphores: [*c]const Semaphore = @import("std").mem.zeroes([*c]const Semaphore),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_swapchains: [*c]const SwapchainKHR = @import("std").mem.zeroes([*c]const SwapchainKHR),
    p_image_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    p_results: [*c]Result = @import("std").mem.zeroes([*c]Result),
};
pub const ImageSwapchainCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain: SwapchainKHR = @import("std").mem.zeroes(SwapchainKHR),
};
pub const BindImageMemorySwapchainInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain: SwapchainKHR = @import("std").mem.zeroes(SwapchainKHR),
    image_index: u32 = @import("std").mem.zeroes(u32),
};
pub const AcquireNextImageInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain: SwapchainKHR = @import("std").mem.zeroes(SwapchainKHR),
    timeout: u64 = @import("std").mem.zeroes(u64),
    semaphore: Semaphore = @import("std").mem.zeroes(Semaphore),
    fence: Fence = @import("std").mem.zeroes(Fence),
    device_mask: u32 = @import("std").mem.zeroes(u32),
};
pub const DeviceGroupPresentCapabilitiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_mask: [32]u32 = @import("std").mem.zeroes([32]u32),
    modes: DeviceGroupPresentModeFlags = @import("std").mem.zeroes(DeviceGroupPresentModeFlags),
};
pub const DeviceGroupPresentInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_device_masks: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    mode: DeviceGroupPresentModeFlagBits = @import("std").mem.zeroes(DeviceGroupPresentModeFlagBits),
};
pub const DeviceGroupSwapchainCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    modes: DeviceGroupPresentModeFlags = @import("std").mem.zeroes(DeviceGroupPresentModeFlags),
};
pub const PFN_createSwapchainKHR = ?*const fn (Device, [*c]const SwapchainCreateInfoKHR, [*c]const AllocationCallbacks, [*c]SwapchainKHR) callconv(.c) Result;
pub const PFN_destroySwapchainKHR = ?*const fn (Device, SwapchainKHR, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getSwapchainImagesKHR = ?*const fn (Device, SwapchainKHR, [*c]u32, [*c]Image) callconv(.c) Result;
pub const PFN_acquireNextImageKHR = ?*const fn (Device, SwapchainKHR, u64, Semaphore, Fence, [*c]u32) callconv(.c) Result;
pub const PFN_queuePresentKHR = ?*const fn (Queue, [*c]const PresentInfoKHR) callconv(.c) Result;
pub const PFN_getDeviceGroupPresentCapabilitiesKHR = ?*const fn (Device, [*c]DeviceGroupPresentCapabilitiesKHR) callconv(.c) Result;
pub const PFN_getDeviceGroupSurfacePresentModesKHR = ?*const fn (Device, SurfaceKHR, [*c]DeviceGroupPresentModeFlags) callconv(.c) Result;
pub const PFN_getPhysicalDevicePresentRectanglesKHR = ?*const fn (PhysicalDevice, SurfaceKHR, [*c]u32, [*c]Rect2D) callconv(.c) Result;
pub const PFN_acquireNextImage2KHR = ?*const fn (Device, [*c]const AcquireNextImageInfoKHR, [*c]u32) callconv(.c) Result;
pub extern fn createSwapchainKhr(device: Device, p_create_info: [*c]const SwapchainCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_swapchain: [*c]SwapchainKHR) Result;
pub extern fn destroySwapchainKhr(device: Device, swapchain: SwapchainKHR, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getSwapchainImagesKhr(device: Device, swapchain: SwapchainKHR, p_swapchain_image_count: [*c]u32, p_swapchain_images: [*c]Image) Result;
pub extern fn acquireNextImageKhr(device: Device, swapchain: SwapchainKHR, timeout: u64, semaphore: Semaphore, fence: Fence, p_image_index: [*c]u32) Result;
pub extern fn queuePresentKhr(queue: Queue, p_present_info: [*c]const PresentInfoKHR) Result;
pub extern fn getDeviceGroupPresentCapabilitiesKhr(device: Device, p_device_group_present_capabilities: [*c]DeviceGroupPresentCapabilitiesKHR) Result;
pub extern fn getDeviceGroupSurfacePresentModesKhr(device: Device, surface: SurfaceKHR, p_modes: [*c]DeviceGroupPresentModeFlags) Result;
pub extern fn getPhysicalDevicePresentRectanglesKhr(physical_device: PhysicalDevice, surface: SurfaceKHR, p_rect_count: [*c]u32, p_rects: [*c]Rect2D) Result;
pub extern fn acquireNextImage2Khr(device: Device, p_acquire_info: [*c]const AcquireNextImageInfoKHR, p_image_index: [*c]u32) Result;
pub const DisplayKHR = enum(u64) { null = 0, _ };
pub const DisplayModeKHR = enum(u64) { null = 0, _ };
pub const DisplayModeCreateFlagsKHR = Flags;
pub const DisplayPlaneAlphaFlagBits = enum(u32) {
    opaque_bit_khr = 1,
    global_bit_khr = 2,
    per_pixel_bit_khr = 4,
    per_pixel_premultiplied_bit_khr = 8,
    flag_bits_max_enum_khr = 2147483647,
};
pub const DisplayPlaneAlphaFlags = PES(DisplayPlaneAlphaFlagBits);
pub const DisplaySurfaceCreateFlagsKHR = Flags;
pub const DisplayModeParametersKHR = extern struct {
    visible_region: Extent2D = @import("std").mem.zeroes(Extent2D),
    refresh_rate: u32 = @import("std").mem.zeroes(u32),
};
pub const DisplayModeCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DisplayModeCreateFlagsKHR = @import("std").mem.zeroes(DisplayModeCreateFlagsKHR),
    parameters: DisplayModeParametersKHR = @import("std").mem.zeroes(DisplayModeParametersKHR),
};
pub const DisplayModePropertiesKHR = extern struct {
    display_mode: DisplayModeKHR = @import("std").mem.zeroes(DisplayModeKHR),
    parameters: DisplayModeParametersKHR = @import("std").mem.zeroes(DisplayModeParametersKHR),
};
pub const DisplayPlaneCapabilitiesKHR = extern struct {
    supported_alpha: DisplayPlaneAlphaFlags = @import("std").mem.zeroes(DisplayPlaneAlphaFlags),
    min_src_position: Offset2D = @import("std").mem.zeroes(Offset2D),
    max_src_position: Offset2D = @import("std").mem.zeroes(Offset2D),
    min_src_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_src_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    min_dst_position: Offset2D = @import("std").mem.zeroes(Offset2D),
    max_dst_position: Offset2D = @import("std").mem.zeroes(Offset2D),
    min_dst_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_dst_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const DisplayPlanePropertiesKHR = extern struct {
    current_display: DisplayKHR = @import("std").mem.zeroes(DisplayKHR),
    current_stack_index: u32 = @import("std").mem.zeroes(u32),
};
pub const DisplayPropertiesKHR = extern struct {
    display: DisplayKHR = @import("std").mem.zeroes(DisplayKHR),
    display_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    physical_dimensions: Extent2D = @import("std").mem.zeroes(Extent2D),
    physical_resolution: Extent2D = @import("std").mem.zeroes(Extent2D),
    supported_transforms: SurfaceTransformFlagsKHR = @import("std").mem.zeroes(SurfaceTransformFlagsKHR),
    plane_reorder_possible: Bool32 = @import("std").mem.zeroes(Bool32),
    persistent_content: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DisplaySurfaceCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DisplaySurfaceCreateFlagsKHR = @import("std").mem.zeroes(DisplaySurfaceCreateFlagsKHR),
    display_mode: DisplayModeKHR = @import("std").mem.zeroes(DisplayModeKHR),
    plane_index: u32 = @import("std").mem.zeroes(u32),
    plane_stack_index: u32 = @import("std").mem.zeroes(u32),
    transform: SurfaceTransformFlagBits = @import("std").mem.zeroes(SurfaceTransformFlagBits),
    global_alpha: f32 = @import("std").mem.zeroes(f32),
    alpha_mode: DisplayPlaneAlphaFlagBits = @import("std").mem.zeroes(DisplayPlaneAlphaFlagBits),
    image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const PFN_getPhysicalDeviceDisplayPropertiesKHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]DisplayPropertiesKHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceDisplayPlanePropertiesKHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]DisplayPlanePropertiesKHR) callconv(.c) Result;
pub const PFN_getDisplayPlaneSupportedDisplaysKHR = ?*const fn (PhysicalDevice, u32, [*c]u32, [*c]DisplayKHR) callconv(.c) Result;
pub const PFN_getDisplayModePropertiesKHR = ?*const fn (PhysicalDevice, DisplayKHR, [*c]u32, [*c]DisplayModePropertiesKHR) callconv(.c) Result;
pub const PFN_createDisplayModeKHR = ?*const fn (PhysicalDevice, DisplayKHR, [*c]const DisplayModeCreateInfoKHR, [*c]const AllocationCallbacks, [*c]DisplayModeKHR) callconv(.c) Result;
pub const PFN_getDisplayPlaneCapabilitiesKHR = ?*const fn (PhysicalDevice, DisplayModeKHR, u32, [*c]DisplayPlaneCapabilitiesKHR) callconv(.c) Result;
pub const PFN_createDisplayPlaneSurfaceKHR = ?*const fn (Instance, [*c]const DisplaySurfaceCreateInfoKHR, [*c]const AllocationCallbacks, [*c]SurfaceKHR) callconv(.c) Result;
pub extern fn getPhysicalDeviceDisplayPropertiesKhr(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]DisplayPropertiesKHR) Result;
pub extern fn getPhysicalDeviceDisplayPlanePropertiesKhr(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]DisplayPlanePropertiesKHR) Result;
pub extern fn getDisplayPlaneSupportedDisplaysKhr(physical_device: PhysicalDevice, plane_index: u32, p_display_count: [*c]u32, p_displays: [*c]DisplayKHR) Result;
pub extern fn getDisplayModePropertiesKhr(physical_device: PhysicalDevice, display: DisplayKHR, p_property_count: [*c]u32, p_properties: [*c]DisplayModePropertiesKHR) Result;
pub extern fn createDisplayModeKhr(physical_device: PhysicalDevice, display: DisplayKHR, p_create_info: [*c]const DisplayModeCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_mode: [*c]DisplayModeKHR) Result;
pub extern fn getDisplayPlaneCapabilitiesKhr(physical_device: PhysicalDevice, mode: DisplayModeKHR, plane_index: u32, p_capabilities: [*c]DisplayPlaneCapabilitiesKHR) Result;
pub extern fn createDisplayPlaneSurfaceKhr(instance: Instance, p_create_info: [*c]const DisplaySurfaceCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_surface: [*c]SurfaceKHR) Result;
pub const DisplayPresentInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_rect: Rect2D = @import("std").mem.zeroes(Rect2D),
    dst_rect: Rect2D = @import("std").mem.zeroes(Rect2D),
    persistent: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_createSharedSwapchainsKHR = ?*const fn (Device, u32, [*c]const SwapchainCreateInfoKHR, [*c]const AllocationCallbacks, [*c]SwapchainKHR) callconv(.c) Result;
pub extern fn createSharedSwapchainsKhr(device: Device, swapchain_count: u32, p_create_infos: [*c]const SwapchainCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_swapchains: [*c]SwapchainKHR) Result;
pub const QueryResultStatusKHR = enum(i32) {
    insufficient_bitstream_buffer_range = -1000299000,
    @"error" = -1,
    not_ready = 0,
    complete = 1,
    max_enum = 2147483647,
};
pub const QueueFamilyQueryResultStatusPropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    query_result_status_support: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVideoFormatInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image_usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
};
pub const BindVideoSessionMemoryInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    memory_bind_index: u32 = @import("std").mem.zeroes(u32),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    memory_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    memory_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const RenderingFlagsKHR = RenderingFlags;
pub const RenderingFlagBitsKHR = RenderingFlagBits;
pub const RenderingInfoKHR = RenderingInfo;
pub const RenderingAttachmentInfoKHR = RenderingAttachmentInfo;
pub const PipelineRenderingCreateInfoKHR = PipelineRenderingCreateInfo;
pub const PhysicalDeviceDynamicRenderingFeaturesKHR = PhysicalDeviceDynamicRenderingFeatures;
pub const CommandBufferInheritanceRenderingInfoKHR = CommandBufferInheritanceRenderingInfo;
pub const PFN_cmdBeginRenderingKHR = ?*const fn (CommandBuffer, [*c]const RenderingInfo) callconv(.c) void;
pub const PFN_cmdEndRenderingKHR = ?*const fn (CommandBuffer) callconv(.c) void;
pub extern fn cmdBeginRenderingKhr(command_buffer: CommandBuffer, p_rendering_info: [*c]const RenderingInfo) void;
pub extern fn cmdEndRenderingKhr(command_buffer: CommandBuffer) void;
pub const RenderPassMultiviewCreateInfoKHR = RenderPassMultiviewCreateInfo;
pub const PhysicalDeviceMultiviewFeaturesKHR = PhysicalDeviceMultiviewFeatures;
pub const PhysicalDeviceMultiviewPropertiesKHR = PhysicalDeviceMultiviewProperties;
pub const PhysicalDeviceFeatures2KHR = PhysicalDeviceFeatures2;
pub const PhysicalDeviceProperties2KHR = PhysicalDeviceProperties2;
pub const FormatProperties2KHR = FormatProperties2;
pub const ImageFormatProperties2KHR = ImageFormatProperties2;
pub const PhysicalDeviceImageFormatInfo2KHR = PhysicalDeviceImageFormatInfo2;
pub const QueueFamilyProperties2KHR = QueueFamilyProperties2;
pub const PhysicalDeviceMemoryProperties2KHR = PhysicalDeviceMemoryProperties2;
pub const SparseImageFormatProperties2KHR = SparseImageFormatProperties2;
pub const PhysicalDeviceSparseImageFormatInfo2KHR = PhysicalDeviceSparseImageFormatInfo2;
pub const PFN_getPhysicalDeviceFeatures2KHR = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceFeatures2) callconv(.c) void;
pub const PFN_getPhysicalDeviceProperties2KHR = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceFormatProperties2KHR = ?*const fn (PhysicalDevice, Format, [*c]FormatProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceImageFormatProperties2KHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceImageFormatInfo2, [*c]ImageFormatProperties2) callconv(.c) Result;
pub const PFN_getPhysicalDeviceQueueFamilyProperties2KHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]QueueFamilyProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceMemoryProperties2KHR = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceMemoryProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceSparseImageFormatProperties2KHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceSparseImageFormatInfo2, [*c]u32, [*c]SparseImageFormatProperties2) callconv(.c) void;
pub extern fn getPhysicalDeviceFeatures2Khr(physical_device: PhysicalDevice, p_features: [*c]PhysicalDeviceFeatures2) void;
pub extern fn getPhysicalDeviceProperties2Khr(physical_device: PhysicalDevice, p_properties: [*c]PhysicalDeviceProperties2) void;
pub extern fn getPhysicalDeviceFormatProperties2Khr(physical_device: PhysicalDevice, format: Format, p_format_properties: [*c]FormatProperties2) void;
pub extern fn getPhysicalDeviceImageFormatProperties2Khr(physical_device: PhysicalDevice, p_image_format_info: [*c]const PhysicalDeviceImageFormatInfo2, p_image_format_properties: [*c]ImageFormatProperties2) Result;
pub extern fn getPhysicalDeviceQueueFamilyProperties2Khr(physical_device: PhysicalDevice, p_queue_family_property_count: [*c]u32, p_queue_family_properties: [*c]QueueFamilyProperties2) void;
pub extern fn getPhysicalDeviceMemoryProperties2Khr(physical_device: PhysicalDevice, p_memory_properties: [*c]PhysicalDeviceMemoryProperties2) void;
pub extern fn getPhysicalDeviceSparseImageFormatProperties2Khr(physical_device: PhysicalDevice, p_format_info: [*c]const PhysicalDeviceSparseImageFormatInfo2, p_property_count: [*c]u32, p_properties: [*c]SparseImageFormatProperties2) void;
pub const PeerMemoryFeatureFlagsKHR = PeerMemoryFeatureFlags;
pub const PeerMemoryFeatureFlagBitsKHR = PeerMemoryFeatureFlagBits;
pub const MemoryAllocateFlagsKHR = MemoryAllocateFlags;
pub const MemoryAllocateFlagBitsKHR = MemoryAllocateFlagBits;
pub const MemoryAllocateFlagsInfoKHR = MemoryAllocateFlagsInfo;
pub const DeviceGroupRenderPassBeginInfoKHR = DeviceGroupRenderPassBeginInfo;
pub const DeviceGroupCommandBufferBeginInfoKHR = DeviceGroupCommandBufferBeginInfo;
pub const DeviceGroupSubmitInfoKHR = DeviceGroupSubmitInfo;
pub const DeviceGroupBindSparseInfoKHR = DeviceGroupBindSparseInfo;
pub const BindBufferMemoryDeviceGroupInfoKHR = BindBufferMemoryDeviceGroupInfo;
pub const BindImageMemoryDeviceGroupInfoKHR = BindImageMemoryDeviceGroupInfo;
pub const PFN_getDeviceGroupPeerMemoryFeaturesKHR = ?*const fn (Device, u32, u32, u32, [*c]PeerMemoryFeatureFlags) callconv(.c) void;
pub const PFN_cmdSetDeviceMaskKHR = ?*const fn (CommandBuffer, u32) callconv(.c) void;
pub const PFN_cmdDispatchBaseKHR = ?*const fn (CommandBuffer, u32, u32, u32, u32, u32, u32) callconv(.c) void;
pub extern fn getDeviceGroup_peer_memory_featuresKhr(device: Device, heap_index: u32, local_device_index: u32, remote_device_index: u32, p_peer_memory_features: [*c]PeerMemoryFeatureFlags) void;
pub extern fn cmdSetDeviceMaskKhr(command_buffer: CommandBuffer, device_mask: u32) void;
pub extern fn cmdDispatchBaseKhr(command_buffer: CommandBuffer, base_group_x: u32, base_group_y: u32, base_group_z: u32, group_count_x: u32, group_count_y: u32, group_count_z: u32) void;
pub const CommandPoolTrimFlagsKHR = CommandPoolTrimFlags;
pub const PFN_trimCommandPoolKHR = ?*const fn (Device, CommandPool, CommandPoolTrimFlags) callconv(.c) void;
pub extern fn trimCommandPoolKhr(device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags) void;
pub const PhysicalDeviceGroupPropertiesKHR = PhysicalDeviceGroupProperties;
pub const DeviceGroupDeviceCreateInfoKHR = DeviceGroupDeviceCreateInfo;
pub const PFN_enumeratePhysicalDeviceGroupsKHR = ?*const fn (Instance, [*c]u32, [*c]PhysicalDeviceGroupProperties) callconv(.c) Result;
pub extern fn enumeratePhysicalDeviceGroupsKhr(instance: Instance, p_physical_device_group_count: [*c]u32, p_physical_device_group_properties: [*c]PhysicalDeviceGroupProperties) Result;
pub const ExternalMemoryHandleTypeFlagsKHR = ExternalMemoryHandleTypeFlags;
pub const ExternalMemoryHandleTypeFlagBitsKHR = ExternalMemoryHandleTypeFlagBits;
pub const ExternalMemoryFeatureFlagsKHR = ExternalMemoryFeatureFlags;
pub const ExternalMemoryFeatureFlagBitsKHR = ExternalMemoryFeatureFlagBits;
pub const ExternalMemoryPropertiesKHR = ExternalMemoryProperties;
pub const PhysicalDeviceExternalImageFormatInfoKHR = PhysicalDeviceExternalImageFormatInfo;
pub const ExternalImageFormatPropertiesKHR = ExternalImageFormatProperties;
pub const PhysicalDeviceExternalBufferInfoKHR = PhysicalDeviceExternalBufferInfo;
pub const ExternalBufferPropertiesKHR = ExternalBufferProperties;
pub const PhysicalDeviceIDPropertiesKHR = PhysicalDeviceIDProperties;
pub const PFN_getPhysicalDeviceExternalBufferPropertiesKHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceExternalBufferInfo, [*c]ExternalBufferProperties) callconv(.c) void;
pub extern fn getPhysicalDeviceExternalBufferPropertiesKhr(physical_device: PhysicalDevice, p_external_buffer_info: [*c]const PhysicalDeviceExternalBufferInfo, p_external_buffer_properties: [*c]ExternalBufferProperties) void;
pub const ExternalMemoryImageCreateInfoKHR = ExternalMemoryImageCreateInfo;
pub const ExternalMemoryBufferCreateInfoKHR = ExternalMemoryBufferCreateInfo;
pub const ExportMemoryAllocateInfoKHR = ExportMemoryAllocateInfo;
pub const ImportMemoryFdInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_type: ExternalMemoryHandleTypeFlagBits = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagBits),
    fd: c_int = @import("std").mem.zeroes(c_int),
};
pub const MemoryFdPropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_type_bits: u32 = @import("std").mem.zeroes(u32),
};
pub const MemoryGetFdInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    handle_type: ExternalMemoryHandleTypeFlagBits = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagBits),
};
pub const PFN_getMemoryFdKHR = ?*const fn (Device, [*c]const MemoryGetFdInfoKHR, [*c]c_int) callconv(.c) Result;
pub const PFN_getMemoryFdPropertiesKHR = ?*const fn (Device, ExternalMemoryHandleTypeFlagBits, c_int, [*c]MemoryFdPropertiesKHR) callconv(.c) Result;
pub extern fn getMemoryFdKhr(device: Device, p_get_fd_info: [*c]const MemoryGetFdInfoKHR, p_fd: [*c]c_int) Result;
pub extern fn getMemoryFdPropertiesKhr(device: Device, handle_type: ExternalMemoryHandleTypeFlagBits, fd: c_int, p_memory_fd_properties: [*c]MemoryFdPropertiesKHR) Result;
pub const ExternalSemaphoreHandleTypeFlagsKHR = ExternalSemaphoreHandleTypeFlags;
pub const ExternalSemaphoreHandleTypeFlagBitsKHR = ExternalSemaphoreHandleTypeFlagBits;
pub const ExternalSemaphoreFeatureFlagsKHR = ExternalSemaphoreFeatureFlags;
pub const ExternalSemaphoreFeatureFlagBitsKHR = ExternalSemaphoreFeatureFlagBits;
pub const PhysicalDeviceExternalSemaphoreInfoKHR = PhysicalDeviceExternalSemaphoreInfo;
pub const ExternalSemaphorePropertiesKHR = ExternalSemaphoreProperties;
pub const PFN_getPhysicalDeviceExternalSemaphorePropertiesKHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceExternalSemaphoreInfo, [*c]ExternalSemaphoreProperties) callconv(.c) void;
pub extern fn getPhysicalDeviceExternalSemaphorePropertiesKhr(physical_device: PhysicalDevice, p_external_semaphore_info: [*c]const PhysicalDeviceExternalSemaphoreInfo, p_external_semaphore_properties: [*c]ExternalSemaphoreProperties) void;
pub const SemaphoreImportFlagsKHR = SemaphoreImportFlags;
pub const SemaphoreImportFlagBitsKHR = SemaphoreImportFlagBits;
pub const ExportSemaphoreCreateInfoKHR = ExportSemaphoreCreateInfo;
pub const ImportSemaphoreFdInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    semaphore: Semaphore = @import("std").mem.zeroes(Semaphore),
    flags: SemaphoreImportFlags = @import("std").mem.zeroes(SemaphoreImportFlags),
    handle_type: ExternalSemaphoreHandleTypeFlagBits = @import("std").mem.zeroes(ExternalSemaphoreHandleTypeFlagBits),
    fd: c_int = @import("std").mem.zeroes(c_int),
};
pub const SemaphoreGetFdInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    semaphore: Semaphore = @import("std").mem.zeroes(Semaphore),
    handle_type: ExternalSemaphoreHandleTypeFlagBits = @import("std").mem.zeroes(ExternalSemaphoreHandleTypeFlagBits),
};
pub const PFN_importSemaphoreFdKHR = ?*const fn (Device, [*c]const ImportSemaphoreFdInfoKHR) callconv(.c) Result;
pub const PFN_getSemaphoreFdKHR = ?*const fn (Device, [*c]const SemaphoreGetFdInfoKHR, [*c]c_int) callconv(.c) Result;
pub extern fn importSemaphoreFdKhr(device: Device, p_import_semaphore_fd_info: [*c]const ImportSemaphoreFdInfoKHR) Result;
pub extern fn getSemaphoreFdKhr(device: Device, p_get_fd_info: [*c]const SemaphoreGetFdInfoKHR, p_fd: [*c]c_int) Result;
pub const PhysicalDevicePushDescriptorPropertiesKHR = PhysicalDevicePushDescriptorProperties;
pub const PFN_cmdPushDescriptorSetKHR = ?*const fn (CommandBuffer, PipelineBindPoint, PipelineLayout, u32, u32, [*c]const WriteDescriptorSet) callconv(.c) void;
pub const PFN_cmdPushDescriptorSetWithTemplateKHR = ?*const fn (CommandBuffer, DescriptorUpdateTemplate, PipelineLayout, u32, ?*const anyopaque) callconv(.c) void;
pub extern fn cmdPushDescriptorSetKhr(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, layout: PipelineLayout, set: u32, descriptor_write_count: u32, p_descriptor_writes: [*c]const WriteDescriptorSet) void;
pub extern fn cmdPushDescriptorSetWithTemplateKhr(command_buffer: CommandBuffer, descriptor_update_template: DescriptorUpdateTemplate, layout: PipelineLayout, set: u32, p_data: ?*const anyopaque) void;
pub const PhysicalDeviceShaderFloat16Int8FeaturesKHR = PhysicalDeviceShaderFloat16Int8Features;
pub const PhysicalDeviceFloat16Int8FeaturesKHR = PhysicalDeviceShaderFloat16Int8Features;
pub const PhysicalDevice16BitStorageFeaturesKHR = PhysicalDevice16BitStorageFeatures;
pub const RectLayerKHR = extern struct {
    offset: Offset2D = @import("std").mem.zeroes(Offset2D),
    extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    layer: u32 = @import("std").mem.zeroes(u32),
};
pub const PresentRegionKHR = extern struct {
    rectangle_count: u32 = @import("std").mem.zeroes(u32),
    p_rectangles: [*c]const RectLayerKHR = @import("std").mem.zeroes([*c]const RectLayerKHR),
};
pub const PresentRegionsKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const PresentRegionKHR = @import("std").mem.zeroes([*c]const PresentRegionKHR),
};
pub const DescriptorUpdateTemplateKHR = DescriptorUpdateTemplate;
pub const DescriptorUpdateTemplateTypeKHR = DescriptorUpdateTemplateType;
pub const DescriptorUpdateTemplateCreateFlagsKHR = DescriptorUpdateTemplateCreateFlags;
pub const DescriptorUpdateTemplateEntryKHR = DescriptorUpdateTemplateEntry;
pub const DescriptorUpdateTemplateCreateInfoKHR = DescriptorUpdateTemplateCreateInfo;
pub const PFN_createDescriptorUpdateTemplateKHR = ?*const fn (Device, [*c]const DescriptorUpdateTemplateCreateInfo, [*c]const AllocationCallbacks, [*c]DescriptorUpdateTemplate) callconv(.c) Result;
pub const PFN_destroyDescriptorUpdateTemplateKHR = ?*const fn (Device, DescriptorUpdateTemplate, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_updateDescriptorSetWithTemplateKHR = ?*const fn (Device, DescriptorSet, DescriptorUpdateTemplate, ?*const anyopaque) callconv(.c) void;
pub extern fn createDescriptorUpdateTemplateKhr(device: Device, p_create_info: [*c]const DescriptorUpdateTemplateCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_descriptor_update_template: [*c]DescriptorUpdateTemplate) Result;
pub extern fn destroyDescriptorUpdateTemplateKhr(device: Device, descriptor_update_template: DescriptorUpdateTemplate, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn updateDescriptorSetWithTemplateKhr(device: Device, descriptor_set: DescriptorSet, descriptor_update_template: DescriptorUpdateTemplate, p_data: ?*const anyopaque) void;
pub const PhysicalDeviceImagelessFramebufferFeaturesKHR = PhysicalDeviceImagelessFramebufferFeatures;
pub const FramebufferAttachmentsCreateInfoKHR = FramebufferAttachmentsCreateInfo;
pub const FramebufferAttachmentImageInfoKHR = FramebufferAttachmentImageInfo;
pub const RenderPassAttachmentBeginInfoKHR = RenderPassAttachmentBeginInfo;
pub const RenderPassCreateInfo2KHR = RenderPassCreateInfo2;
pub const AttachmentDescription2KHR = AttachmentDescription2;
pub const AttachmentReference2KHR = AttachmentReference2;
pub const SubpassDescription2KHR = SubpassDescription2;
pub const SubpassDependency2KHR = SubpassDependency2;
pub const SubpassBeginInfoKHR = SubpassBeginInfo;
pub const SubpassEndInfoKHR = SubpassEndInfo;
pub const PFN_createRenderPass2KHR = ?*const fn (Device, [*c]const RenderPassCreateInfo2, [*c]const AllocationCallbacks, [*c]RenderPass) callconv(.c) Result;
pub const PFN_cmdBeginRenderPass2KHR = ?*const fn (CommandBuffer, [*c]const RenderPassBeginInfo, [*c]const SubpassBeginInfo) callconv(.c) void;
pub const PFN_cmdNextSubpass2KHR = ?*const fn (CommandBuffer, [*c]const SubpassBeginInfo, [*c]const SubpassEndInfo) callconv(.c) void;
pub const PFN_cmdEndRenderPass2KHR = ?*const fn (CommandBuffer, [*c]const SubpassEndInfo) callconv(.c) void;
pub extern fn createRenderPass2Khr(device: Device, p_create_info: [*c]const RenderPassCreateInfo2, p_allocator: [*c]const AllocationCallbacks, p_render_pass: [*c]RenderPass) Result;
pub extern fn cmdBeginRenderPass2Khr(command_buffer: CommandBuffer, p_render_pass_begin: [*c]const RenderPassBeginInfo, p_subpass_begin_info: [*c]const SubpassBeginInfo) void;
pub extern fn cmdNextSubpass2Khr(command_buffer: CommandBuffer, p_subpass_begin_info: [*c]const SubpassBeginInfo, p_subpass_end_info: [*c]const SubpassEndInfo) void;
pub extern fn cmdEndRenderPass2Khr(command_buffer: CommandBuffer, p_subpass_end_info: [*c]const SubpassEndInfo) void;
pub const SharedPresentSurfaceCapabilitiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shared_present_supported_usage_flags: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
};
pub const PFN_getSwapchainStatusKHR = ?*const fn (Device, SwapchainKHR) callconv(.c) Result;
pub extern fn getSwapchainStatusKhr(device: Device, swapchain: SwapchainKHR) Result;
pub const ExternalFenceHandleTypeFlagsKHR = ExternalFenceHandleTypeFlags;
pub const ExternalFenceHandleTypeFlagBitsKHR = ExternalFenceHandleTypeFlagBits;
pub const ExternalFenceFeatureFlagsKHR = ExternalFenceFeatureFlags;
pub const ExternalFenceFeatureFlagBitsKHR = ExternalFenceFeatureFlagBits;
pub const PhysicalDeviceExternalFenceInfoKHR = PhysicalDeviceExternalFenceInfo;
pub const ExternalFencePropertiesKHR = ExternalFenceProperties;
pub const PFN_getPhysicalDeviceExternalFencePropertiesKHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceExternalFenceInfo, [*c]ExternalFenceProperties) callconv(.c) void;
pub extern fn getPhysicalDeviceExternalFencePropertiesKhr(physical_device: PhysicalDevice, p_external_fence_info: [*c]const PhysicalDeviceExternalFenceInfo, p_external_fence_properties: [*c]ExternalFenceProperties) void;
pub const FenceImportFlagsKHR = FenceImportFlags;
pub const FenceImportFlagBitsKHR = FenceImportFlagBits;
pub const ExportFenceCreateInfoKHR = ExportFenceCreateInfo;
pub const ImportFenceFdInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    fence: Fence = @import("std").mem.zeroes(Fence),
    flags: FenceImportFlags = @import("std").mem.zeroes(FenceImportFlags),
    handle_type: ExternalFenceHandleTypeFlagBits = @import("std").mem.zeroes(ExternalFenceHandleTypeFlagBits),
    fd: c_int = @import("std").mem.zeroes(c_int),
};
pub const FenceGetFdInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    fence: Fence = @import("std").mem.zeroes(Fence),
    handle_type: ExternalFenceHandleTypeFlagBits = @import("std").mem.zeroes(ExternalFenceHandleTypeFlagBits),
};
pub const PFN_importFenceFdKHR = ?*const fn (Device, [*c]const ImportFenceFdInfoKHR) callconv(.c) Result;
pub const PFN_getFenceFdKHR = ?*const fn (Device, [*c]const FenceGetFdInfoKHR, [*c]c_int) callconv(.c) Result;
pub extern fn importFenceFdKhr(device: Device, p_import_fence_fd_info: [*c]const ImportFenceFdInfoKHR) Result;
pub extern fn getFenceFdKhr(device: Device, p_get_fd_info: [*c]const FenceGetFdInfoKHR, p_fd: [*c]c_int) Result;
pub const PerformanceCounterUnitKHR = enum(u32) {
    generic = 0,
    percentage = 1,
    nanoseconds = 2,
    bytes = 3,
    bytes_per_second = 4,
    kelvin = 5,
    watts = 6,
    volts = 7,
    amps = 8,
    hertz = 9,
    cycles = 10,
    max_enum = 2147483647,
};
pub const PerformanceCounterScopeKHR = enum(u32) {
    command_buffer = 0,
    render_pass = 1,
    command = 2,
    max_enum = 2147483647,
    const Self = @This();
    pub const query_command = Self.command;
    pub const query_render_pass = Self.render_pass;
    pub const query_command_buffer = Self.command_buffer;
};
pub const PerformanceCounterStorageKHR = enum(u32) {
    int32 = 0,
    int64 = 1,
    uint32 = 2,
    uint64 = 3,
    float32 = 4,
    float64 = 5,
    max_enum = 2147483647,
};
pub const PerformanceCounterDescriptionFlagBits = enum(u32) {
    performance_impacting_khr = 1,
    concurrently_impacted_khr = 2,
    flag_bits_max_enum_khr = 2147483647,
    const Self = @This();
    pub const concurrently_impacted_bit_khr = Self.concurrently_impacted_khr;
    pub const performance_impacting_bit_khr = Self.performance_impacting_khr;
};
pub const PerformanceCounterDescriptionFlags = PES(PerformanceCounterDescriptionFlagBits);
pub const AcquireProfilingLockFlagBits = enum(u32) {
    flag_bits_max_enum_khr = 2147483647,
};
pub const AcquireProfilingLockFlags = PES(AcquireProfilingLockFlagBits);
pub const PhysicalDevicePerformanceQueryFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    performance_counter_query_pools: Bool32 = @import("std").mem.zeroes(Bool32),
    performance_counter_multiple_query_pools: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePerformanceQueryPropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    allow_command_buffer_query_copies: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PerformanceCounterKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    unit: PerformanceCounterUnitKHR = @import("std").mem.zeroes(PerformanceCounterUnitKHR),
    scope: PerformanceCounterScopeKHR = @import("std").mem.zeroes(PerformanceCounterScopeKHR),
    storage: PerformanceCounterStorageKHR = @import("std").mem.zeroes(PerformanceCounterStorageKHR),
    uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const PerformanceCounterDescriptionKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: PerformanceCounterDescriptionFlags = @import("std").mem.zeroes(PerformanceCounterDescriptionFlags),
    name: [256]u8 = @import("std").mem.zeroes([256]u8),
    category: [256]u8 = @import("std").mem.zeroes([256]u8),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const QueryPoolPerformanceCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    queue_family_index: u32 = @import("std").mem.zeroes(u32),
    counter_index_count: u32 = @import("std").mem.zeroes(u32),
    p_counter_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const PerformanceCounterResultKHR = extern union {
    int32: i32,
    int64: i64,
    uint32: u32,
    uint64: u64,
    float32: f32,
    float64: f64,
};
pub const AcquireProfilingLockInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: AcquireProfilingLockFlags = @import("std").mem.zeroes(AcquireProfilingLockFlags),
    timeout: u64 = @import("std").mem.zeroes(u64),
};
pub const PerformanceQuerySubmitInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    counter_pass_index: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR = ?*const fn (PhysicalDevice, u32, [*c]u32, [*c]PerformanceCounterKHR, [*c]PerformanceCounterDescriptionKHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR = ?*const fn (PhysicalDevice, [*c]const QueryPoolPerformanceCreateInfoKHR, [*c]u32) callconv(.c) void;
pub const PFN_acquireProfilingLockKHR = ?*const fn (Device, [*c]const AcquireProfilingLockInfoKHR) callconv(.c) Result;
pub const PFN_releaseProfilingLockKHR = ?*const fn (Device) callconv(.c) void;
pub extern fn enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKhr(physical_device: PhysicalDevice, queue_family_index: u32, p_counter_count: [*c]u32, p_counters: [*c]PerformanceCounterKHR, p_counter_descriptions: [*c]PerformanceCounterDescriptionKHR) Result;
pub extern fn getPhysicalDeviceQueueFamilyPerformanceQueryPassesKhr(physical_device: PhysicalDevice, p_performance_query_create_info: [*c]const QueryPoolPerformanceCreateInfoKHR, p_num_passes: [*c]u32) void;
pub extern fn acquireProfilingLockKhr(device: Device, p_info: [*c]const AcquireProfilingLockInfoKHR) Result;
pub extern fn releaseProfilingLockKhr(device: Device) void;
pub const PointClippingBehaviorKHR = PointClippingBehavior;
pub const TessellationDomainOriginKHR = TessellationDomainOrigin;
pub const PhysicalDevicePointClippingPropertiesKHR = PhysicalDevicePointClippingProperties;
pub const RenderPassInputAttachmentAspectCreateInfoKHR = RenderPassInputAttachmentAspectCreateInfo;
pub const InputAttachmentAspectReferenceKHR = InputAttachmentAspectReference;
pub const ImageViewUsageCreateInfoKHR = ImageViewUsageCreateInfo;
pub const PipelineTessellationDomainOriginStateCreateInfoKHR = PipelineTessellationDomainOriginStateCreateInfo;
pub const PhysicalDeviceSurfaceInfo2KHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    surface: SurfaceKHR = @import("std").mem.zeroes(SurfaceKHR),
};
pub const SurfaceCapabilities2KHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    surface_capabilities: SurfaceCapabilitiesKHR = @import("std").mem.zeroes(SurfaceCapabilitiesKHR),
};
pub const SurfaceFormat2KHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    surface_format: SurfaceFormatKHR = @import("std").mem.zeroes(SurfaceFormatKHR),
};
pub const PFN_getPhysicalDeviceSurfaceCapabilities2KHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceSurfaceInfo2KHR, [*c]SurfaceCapabilities2KHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceSurfaceFormats2KHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceSurfaceInfo2KHR, [*c]u32, [*c]SurfaceFormat2KHR) callconv(.c) Result;
pub extern fn getPhysicalDeviceSurfaceCapabilities2Khr(physical_device: PhysicalDevice, p_surface_info: [*c]const PhysicalDeviceSurfaceInfo2KHR, p_surface_capabilities: [*c]SurfaceCapabilities2KHR) Result;
pub extern fn getPhysicalDeviceSurfaceFormats2Khr(physical_device: PhysicalDevice, p_surface_info: [*c]const PhysicalDeviceSurfaceInfo2KHR, p_surface_format_count: [*c]u32, p_surface_formats: [*c]SurfaceFormat2KHR) Result;
pub const PhysicalDeviceVariablePointerFeaturesKHR = PhysicalDeviceVariablePointersFeatures;
pub const PhysicalDeviceVariablePointersFeaturesKHR = PhysicalDeviceVariablePointersFeatures;
pub const DisplayProperties2KHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    display_properties: DisplayPropertiesKHR = @import("std").mem.zeroes(DisplayPropertiesKHR),
};
pub const DisplayPlaneProperties2KHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    display_plane_properties: DisplayPlanePropertiesKHR = @import("std").mem.zeroes(DisplayPlanePropertiesKHR),
};
pub const DisplayModeProperties2KHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    display_mode_properties: DisplayModePropertiesKHR = @import("std").mem.zeroes(DisplayModePropertiesKHR),
};
pub const DisplayPlaneInfo2KHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    mode: DisplayModeKHR = @import("std").mem.zeroes(DisplayModeKHR),
    plane_index: u32 = @import("std").mem.zeroes(u32),
};
pub const DisplayPlaneCapabilities2KHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    capabilities: DisplayPlaneCapabilitiesKHR = @import("std").mem.zeroes(DisplayPlaneCapabilitiesKHR),
};
pub const PFN_getPhysicalDeviceDisplayProperties2KHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]DisplayProperties2KHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceDisplayPlaneProperties2KHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]DisplayPlaneProperties2KHR) callconv(.c) Result;
pub const PFN_getDisplayModeProperties2KHR = ?*const fn (PhysicalDevice, DisplayKHR, [*c]u32, [*c]DisplayModeProperties2KHR) callconv(.c) Result;
pub const PFN_getDisplayPlaneCapabilities2KHR = ?*const fn (PhysicalDevice, [*c]const DisplayPlaneInfo2KHR, [*c]DisplayPlaneCapabilities2KHR) callconv(.c) Result;
pub extern fn getPhysicalDeviceDisplayProperties2Khr(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]DisplayProperties2KHR) Result;
pub extern fn getPhysicalDeviceDisplayPlaneProperties2Khr(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]DisplayPlaneProperties2KHR) Result;
pub extern fn getDisplayModeProperties2Khr(physical_device: PhysicalDevice, display: DisplayKHR, p_property_count: [*c]u32, p_properties: [*c]DisplayModeProperties2KHR) Result;
pub extern fn getDisplayPlaneCapabilities2Khr(physical_device: PhysicalDevice, p_display_plane_info: [*c]const DisplayPlaneInfo2KHR, p_capabilities: [*c]DisplayPlaneCapabilities2KHR) Result;
pub const MemoryDedicatedRequirementsKHR = MemoryDedicatedRequirements;
pub const MemoryDedicatedAllocateInfoKHR = MemoryDedicatedAllocateInfo;
pub const BufferMemoryRequirementsInfo2KHR = BufferMemoryRequirementsInfo2;
pub const ImageMemoryRequirementsInfo2KHR = ImageMemoryRequirementsInfo2;
pub const ImageSparseMemoryRequirementsInfo2KHR = ImageSparseMemoryRequirementsInfo2;
pub const MemoryRequirements2KHR = MemoryRequirements2;
pub const SparseImageMemoryRequirements2KHR = SparseImageMemoryRequirements2;
pub const PFN_getImageMemoryRequirements2KHR = ?*const fn (Device, [*c]const ImageMemoryRequirementsInfo2, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getBufferMemoryRequirements2KHR = ?*const fn (Device, [*c]const BufferMemoryRequirementsInfo2, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getImageSparseMemoryRequirements2KHR = ?*const fn (Device, [*c]const ImageSparseMemoryRequirementsInfo2, [*c]u32, [*c]SparseImageMemoryRequirements2) callconv(.c) void;
pub extern fn getImageMemoryRequirements2Khr(device: Device, p_info: [*c]const ImageMemoryRequirementsInfo2, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getBufferMemoryRequirements2Khr(device: Device, p_info: [*c]const BufferMemoryRequirementsInfo2, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getImageSparseMemoryRequirements2Khr(device: Device, p_info: [*c]const ImageSparseMemoryRequirementsInfo2, p_sparse_memory_requirement_count: [*c]u32, p_sparse_memory_requirements: [*c]SparseImageMemoryRequirements2) void;
pub const ImageFormatListCreateInfoKHR = ImageFormatListCreateInfo;
pub const SamplerYcbcrConversionKHR = SamplerYcbcrConversion;
pub const SamplerYcbcrModelConversionKHR = SamplerYcbcrModelConversion;
pub const SamplerYcbcrRangeKHR = SamplerYcbcrRange;
pub const ChromaLocationKHR = ChromaLocation;
pub const SamplerYcbcrConversionCreateInfoKHR = SamplerYcbcrConversionCreateInfo;
pub const SamplerYcbcrConversionInfoKHR = SamplerYcbcrConversionInfo;
pub const BindImagePlaneMemoryInfoKHR = BindImagePlaneMemoryInfo;
pub const ImagePlaneMemoryRequirementsInfoKHR = ImagePlaneMemoryRequirementsInfo;
pub const PhysicalDeviceSamplerYcbcrConversionFeaturesKHR = PhysicalDeviceSamplerYcbcrConversionFeatures;
pub const SamplerYcbcrConversionImageFormatPropertiesKHR = SamplerYcbcrConversionImageFormatProperties;
pub const PFN_createSamplerYcbcrConversionKHR = ?*const fn (Device, [*c]const SamplerYcbcrConversionCreateInfo, [*c]const AllocationCallbacks, [*c]SamplerYcbcrConversion) callconv(.c) Result;
pub const PFN_destroySamplerYcbcrConversionKHR = ?*const fn (Device, SamplerYcbcrConversion, [*c]const AllocationCallbacks) callconv(.c) void;
pub extern fn createSamplerYcbcrConversionKhr(device: Device, p_create_info: [*c]const SamplerYcbcrConversionCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_ycbcr_conversion: [*c]SamplerYcbcrConversion) Result;
pub extern fn destroySamplerYcbcrConversionKhr(device: Device, ycbcr_conversion: SamplerYcbcrConversion, p_allocator: [*c]const AllocationCallbacks) void;
pub const BindBufferMemoryInfoKHR = BindBufferMemoryInfo;
pub const BindImageMemoryInfoKHR = BindImageMemoryInfo;
pub const PFN_bindBufferMemory2KHR = ?*const fn (Device, u32, [*c]const BindBufferMemoryInfo) callconv(.c) Result;
pub const PFN_bindImageMemory2KHR = ?*const fn (Device, u32, [*c]const BindImageMemoryInfo) callconv(.c) Result;
pub extern fn bindBufferMemory2Khr(device: Device, bind_info_count: u32, p_bind_infos: [*c]const BindBufferMemoryInfo) Result;
pub extern fn bindImageMemory2Khr(device: Device, bind_info_count: u32, p_bind_infos: [*c]const BindImageMemoryInfo) Result;
pub const PhysicalDeviceMaintenance3PropertiesKHR = PhysicalDeviceMaintenance3Properties;
pub const DescriptorSetLayoutSupportKHR = DescriptorSetLayoutSupport;
pub const PFN_getDescriptorSetLayoutSupportKHR = ?*const fn (Device, [*c]const DescriptorSetLayoutCreateInfo, [*c]DescriptorSetLayoutSupport) callconv(.c) void;
pub extern fn getDescriptorSetLayoutSupportKhr(device: Device, p_create_info: [*c]const DescriptorSetLayoutCreateInfo, p_support: [*c]DescriptorSetLayoutSupport) void;
pub const PFN_cmdDrawIndirectCountKHR = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndexedIndirectCountKHR = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub extern fn cmdDrawIndirectCountKhr(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_bufferOffset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub extern fn cmdDrawIndexedIndirectCountKhr(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_bufferOffset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub const PhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR = PhysicalDeviceShaderSubgroupExtendedTypesFeatures;
pub const PhysicalDevice8BitStorageFeaturesKHR = PhysicalDevice8BitStorageFeatures;
pub const PhysicalDeviceShaderAtomicInt64FeaturesKHR = PhysicalDeviceShaderAtomicInt64Features;
pub const PhysicalDeviceShaderClockFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_subgroup_clock: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_device_clock: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const QueueGlobalPriorityKHR = QueueGlobalPriority;
pub const DeviceQueueGlobalPriorityCreateInfoKHR = DeviceQueueGlobalPriorityCreateInfo;
pub const PhysicalDeviceGlobalPriorityQueryFeaturesKHR = PhysicalDeviceGlobalPriorityQueryFeatures;
pub const QueueFamilyGlobalPriorityPropertiesKHR = QueueFamilyGlobalPriorityProperties;
pub const DriverIdKHR = DriverId;
pub const ConformanceVersionKHR = ConformanceVersion;
pub const PhysicalDeviceDriverPropertiesKHR = PhysicalDeviceDriverProperties;
pub const ShaderFloatControlsIndependenceKHR = ShaderFloatControlsIndependence;
pub const PhysicalDeviceFloatControlsPropertiesKHR = PhysicalDeviceFloatControlsProperties;
pub const ResolveModeFlagBitsKHR = ResolveModeFlagBits;
pub const ResolveModeFlagsKHR = ResolveModeFlags;
pub const SubpassDescriptionDepthStencilResolveKHR = SubpassDescriptionDepthStencilResolve;
pub const PhysicalDeviceDepthStencilResolvePropertiesKHR = PhysicalDeviceDepthStencilResolveProperties;
pub const SemaphoreTypeKHR = SemaphoreType;
pub const SemaphoreWaitFlagBitsKHR = SemaphoreWaitFlagBits;
pub const SemaphoreWaitFlagsKHR = SemaphoreWaitFlags;
pub const PhysicalDeviceTimelineSemaphoreFeaturesKHR = PhysicalDeviceTimelineSemaphoreFeatures;
pub const PhysicalDeviceTimelineSemaphorePropertiesKHR = PhysicalDeviceTimelineSemaphoreProperties;
pub const SemaphoreTypeCreateInfoKHR = SemaphoreTypeCreateInfo;
pub const TimelineSemaphoreSubmitInfoKHR = TimelineSemaphoreSubmitInfo;
pub const SemaphoreWaitInfoKHR = SemaphoreWaitInfo;
pub const SemaphoreSignalInfoKHR = SemaphoreSignalInfo;
pub const PFN_getSemaphoreCounterValueKHR = ?*const fn (Device, Semaphore, [*c]u64) callconv(.c) Result;
pub const PFN_waitSemaphoresKHR = ?*const fn (Device, [*c]const SemaphoreWaitInfo, u64) callconv(.c) Result;
pub const PFN_signalSemaphoreKHR = ?*const fn (Device, [*c]const SemaphoreSignalInfo) callconv(.c) Result;
pub extern fn getSemaphoreCounterValueKhr(device: Device, semaphore: Semaphore, p_value: [*c]u64) Result;
pub extern fn waitSemaphoresKhr(device: Device, p_wait_info: [*c]const SemaphoreWaitInfo, timeout: u64) Result;
pub extern fn signalSemaphoreKhr(device: Device, p_signal_info: [*c]const SemaphoreSignalInfo) Result;
pub const PhysicalDeviceVulkanMemoryModelFeaturesKHR = PhysicalDeviceVulkanMemoryModelFeatures;
pub const PhysicalDeviceShaderTerminateInvocationFeaturesKHR = PhysicalDeviceShaderTerminateInvocationFeatures;
pub const FragmentShadingRateCombinerOpKHR = enum(u32) {
    keep = 0,
    replace = 1,
    min = 2,
    max = 3,
    mul = 4,
    max_enum = 2147483647,
};
pub const FragmentShadingRateAttachmentInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_fragment_shading_rate_attachment: [*c]const AttachmentReference2 = @import("std").mem.zeroes([*c]const AttachmentReference2),
    shading_rate_attachment_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const PipelineFragmentShadingRateStateCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    fragment_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    combiner_ops: [2]FragmentShadingRateCombinerOpKHR = @import("std").mem.zeroes([2]FragmentShadingRateCombinerOpKHR),
};
pub const PhysicalDeviceFragmentShadingRateFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_fragment_shading_rate: Bool32 = @import("std").mem.zeroes(Bool32),
    primitive_fragment_shading_rate: Bool32 = @import("std").mem.zeroes(Bool32),
    attachment_fragment_shading_rate: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentShadingRatePropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_fragment_shading_rate_attachment_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_fragment_shading_rate_attachment_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_fragment_shading_rate_attachment_texel_size_aspect_ratio: u32 = @import("std").mem.zeroes(u32),
    primitive_fragment_shading_rate_with_multiple_viewports: Bool32 = @import("std").mem.zeroes(Bool32),
    layered_shading_rate_attachments: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_non_trivial_combiner_ops: Bool32 = @import("std").mem.zeroes(Bool32),
    max_fragment_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_fragment_size_aspect_ratio: u32 = @import("std").mem.zeroes(u32),
    max_fragment_shading_rate_coverage_samples: u32 = @import("std").mem.zeroes(u32),
    max_fragment_shading_rate_rasterization_samples: SampleCountFlagBits = @import("std").mem.zeroes(SampleCountFlagBits),
    fragment_shading_rate_with_shader_depth_stencil_writes: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_with_sample_mask: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_with_shader_sample_mask: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_with_conservative_rasterization: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_with_fragment_shader_interlock: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_with_custom_sample_locations: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_strict_multiply_combiner: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentShadingRateKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    fragment_size: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const RenderingFragmentShadingRateAttachmentInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image_view: ImageView = @import("std").mem.zeroes(ImageView),
    image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    shading_rate_attachment_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const PFN_getPhysicalDeviceFragmentShadingRatesKHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]PhysicalDeviceFragmentShadingRateKHR) callconv(.c) Result;
pub const PFN_cmdSetFragmentShadingRateKHR = ?*const fn (CommandBuffer, [*c]const Extent2D, [*c]const FragmentShadingRateCombinerOpKHR) callconv(.c) void;
pub extern fn getPhysicalDeviceFragmentShadingRatesKhr(physical_device: PhysicalDevice, p_fragment_shading_rate_count: [*c]u32, p_fragment_shading_rates: [*c]PhysicalDeviceFragmentShadingRateKHR) Result;
pub extern fn cmdSetFragmentShadingRateKhr(command_buffer: CommandBuffer, p_fragment_size: [*c]const Extent2D, combiner_ops: [*c]const FragmentShadingRateCombinerOpKHR) void;
pub const PhysicalDeviceDynamicRenderingLocalReadFeaturesKHR = PhysicalDeviceDynamicRenderingLocalReadFeatures;
pub const RenderingAttachmentLocationInfoKHR = RenderingAttachmentLocationInfo;
pub const RenderingInputAttachmentIndexInfoKHR = RenderingInputAttachmentIndexInfo;
pub const PFN_cmdSetRenderingAttachmentLocationsKHR = ?*const fn (CommandBuffer, [*c]const RenderingAttachmentLocationInfo) callconv(.c) void;
pub const PFN_cmdSetRenderingInputAttachmentIndicesKHR = ?*const fn (CommandBuffer, [*c]const RenderingInputAttachmentIndexInfo) callconv(.c) void;
pub extern fn cmdSetRenderingAttachmentLocationsKhr(command_buffer: CommandBuffer, p_location_info: [*c]const RenderingAttachmentLocationInfo) void;
pub extern fn cmdSetRenderingInputAttachmentIndicesKhr(command_buffer: CommandBuffer, p_input_attachment_index_info: [*c]const RenderingInputAttachmentIndexInfo) void;
pub const PhysicalDeviceShaderQuadControlFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_quad_control: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SurfaceProtectedCapabilitiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    supports_protected: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR = PhysicalDeviceSeparateDepthStencilLayoutsFeatures;
pub const AttachmentReferenceStencilLayoutKHR = AttachmentReferenceStencilLayout;
pub const AttachmentDescriptionStencilLayoutKHR = AttachmentDescriptionStencilLayout;
pub const PhysicalDevicePresentWaitFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_wait: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_waitForPresentKHR = ?*const fn (Device, SwapchainKHR, u64, u64) callconv(.c) Result;
pub extern fn waitForPresentKhr(device: Device, swapchain: SwapchainKHR, present_id: u64, timeout: u64) Result;
pub const PhysicalDeviceUniformBufferStandardLayoutFeaturesKHR = PhysicalDeviceUniformBufferStandardLayoutFeatures;
pub const PhysicalDeviceBufferDeviceAddressFeaturesKHR = PhysicalDeviceBufferDeviceAddressFeatures;
pub const BufferDeviceAddressInfoKHR = BufferDeviceAddressInfo;
pub const BufferOpaqueCaptureAddressCreateInfoKHR = BufferOpaqueCaptureAddressCreateInfo;
pub const MemoryOpaqueCaptureAddressAllocateInfoKHR = MemoryOpaqueCaptureAddressAllocateInfo;
pub const DeviceMemoryOpaqueCaptureAddressInfoKHR = DeviceMemoryOpaqueCaptureAddressInfo;
pub const PFN_getBufferDeviceAddressKHR = ?*const fn (Device, [*c]const BufferDeviceAddressInfo) callconv(.c) DeviceAddress;
pub const PFN_getBufferOpaqueCaptureAddressKHR = ?*const fn (Device, [*c]const BufferDeviceAddressInfo) callconv(.c) u64;
pub const PFN_getDeviceMemoryOpaqueCaptureAddressKHR = ?*const fn (Device, [*c]const DeviceMemoryOpaqueCaptureAddressInfo) callconv(.c) u64;
pub extern fn getBufferDeviceAddressKhr(device: Device, p_info: [*c]const BufferDeviceAddressInfo) DeviceAddress;
pub extern fn getBufferOpaqueCaptureAddressKhr(device: Device, p_info: [*c]const BufferDeviceAddressInfo) u64;
pub extern fn getDeviceMemoryOpaqueCaptureAddressKhr(device: Device, p_info: [*c]const DeviceMemoryOpaqueCaptureAddressInfo) u64;
pub const DeferredOperationKHR = enum(u64) { null = 0, _ };
pub const PFN_createDeferredOperationKHR = ?*const fn (Device, [*c]const AllocationCallbacks, [*c]DeferredOperationKHR) callconv(.c) Result;
pub const PFN_destroyDeferredOperationKHR = ?*const fn (Device, DeferredOperationKHR, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getDeferredOperationMaxConcurrencyKHR = ?*const fn (Device, DeferredOperationKHR) callconv(.c) u32;
pub const PFN_getDeferredOperationResultKHR = ?*const fn (Device, DeferredOperationKHR) callconv(.c) Result;
pub const PFN_deferredOperationJoinKHR = ?*const fn (Device, DeferredOperationKHR) callconv(.c) Result;
pub extern fn createDeferredOperationKhr(device: Device, p_allocator: [*c]const AllocationCallbacks, p_deferred_operation: [*c]DeferredOperationKHR) Result;
pub extern fn destroyDeferredOperationKhr(device: Device, operation: DeferredOperationKHR, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getDeferredOperationMaxConcurrencyKhr(device: Device, operation: DeferredOperationKHR) u32;
pub extern fn getDeferredOperationResultKhr(device: Device, operation: DeferredOperationKHR) Result;
pub extern fn deferredOperationJoinKhr(device: Device, operation: DeferredOperationKHR) Result;
pub const PipelineExecutableStatisticFormatKHR = enum(u32) {
    bool32 = 0,
    int64 = 1,
    uint64 = 2,
    float64 = 3,
    max_enum = 2147483647,
};
pub const PhysicalDevicePipelineExecutablePropertiesFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_executable_info: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
};
pub const PipelineExecutablePropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    name: [256]u8 = @import("std").mem.zeroes([256]u8),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    subgroup_size: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineExecutableInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
    executable_index: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineExecutableStatisticValueKHR = extern union {
    b32: Bool32,
    i64: i64,
    u64: u64,
    f64: f64,
};
pub const PipelineExecutableStatisticKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    name: [256]u8 = @import("std").mem.zeroes([256]u8),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    format: PipelineExecutableStatisticFormatKHR = @import("std").mem.zeroes(PipelineExecutableStatisticFormatKHR),
    value: PipelineExecutableStatisticValueKHR = @import("std").mem.zeroes(PipelineExecutableStatisticValueKHR),
};
pub const PipelineExecutableInternalRepresentationKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    name: [256]u8 = @import("std").mem.zeroes([256]u8),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    is_text: Bool32 = @import("std").mem.zeroes(Bool32),
    data_size: usize = @import("std").mem.zeroes(usize),
    p_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PFN_getPipelineExecutablePropertiesKHR = ?*const fn (Device, [*c]const PipelineInfoKHR, [*c]u32, [*c]PipelineExecutablePropertiesKHR) callconv(.c) Result;
pub const PFN_getPipelineExecutableStatisticsKHR = ?*const fn (Device, [*c]const PipelineExecutableInfoKHR, [*c]u32, [*c]PipelineExecutableStatisticKHR) callconv(.c) Result;
pub const PFN_getPipelineExecutableInternalRepresentationsKHR = ?*const fn (Device, [*c]const PipelineExecutableInfoKHR, [*c]u32, [*c]PipelineExecutableInternalRepresentationKHR) callconv(.c) Result;
pub extern fn getPipelineExecutablePropertiesKhr(device: Device, p_pipeline_info: [*c]const PipelineInfoKHR, p_executable_count: [*c]u32, p_properties: [*c]PipelineExecutablePropertiesKHR) Result;
pub extern fn getPipelineExecutableStatisticsKhr(device: Device, p_executable_info: [*c]const PipelineExecutableInfoKHR, p_statistic_count: [*c]u32, p_statistics: [*c]PipelineExecutableStatisticKHR) Result;
pub extern fn getPipelineExecutableInternalRepresentationsKhr(device: Device, p_executable_info: [*c]const PipelineExecutableInfoKHR, p_internal_representation_count: [*c]u32, p_internal_representations: [*c]PipelineExecutableInternalRepresentationKHR) Result;
pub const MemoryUnmapFlagBitsKHR = MemoryUnmapFlagBits;
pub const MemoryUnmapFlagsKHR = MemoryUnmapFlags;
pub const MemoryMapInfoKHR = MemoryMapInfo;
pub const MemoryUnmapInfoKHR = MemoryUnmapInfo;
pub const PFN_mapMemory2KHR = ?*const fn (Device, [*c]const MemoryMapInfo, [*c]?*anyopaque) callconv(.c) Result;
pub const PFN_unmapMemory2KHR = ?*const fn (Device, [*c]const MemoryUnmapInfo) callconv(.c) Result;
pub extern fn mapMemory2Khr(device: Device, p_memory_map_info: [*c]const MemoryMapInfo, pp_data: [*c]?*anyopaque) Result;
pub extern fn unmapMemory2Khr(device: Device, p_memory_unmap_info: [*c]const MemoryUnmapInfo) Result;
pub const PhysicalDeviceShaderIntegerDotProductFeaturesKHR = PhysicalDeviceShaderIntegerDotProductFeatures;
pub const PhysicalDeviceShaderIntegerDotProductPropertiesKHR = PhysicalDeviceShaderIntegerDotProductProperties;
pub const PipelineLibraryCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    library_count: u32 = @import("std").mem.zeroes(u32),
    p_libraries: [*c]const Pipeline = @import("std").mem.zeroes([*c]const Pipeline),
};
pub const PresentIdKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_present_ids: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
};
pub const PhysicalDevicePresentIdFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_id: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineStageFlags2KHR = PipelineStageFlags2;
pub const PipelineStageFlagBits2KHR = PipelineStageFlagBits2;
pub const AccessFlags2KHR = AccessFlags2;
pub const AccessFlagBits2KHR = AccessFlagBits2;
pub const SubmitFlagBitsKHR = SubmitFlagBits;
pub const SubmitFlagsKHR = SubmitFlags;
pub const MemoryBarrier2KHR = MemoryBarrier2;
pub const BufferMemoryBarrier2KHR = BufferMemoryBarrier2;
pub const ImageMemoryBarrier2KHR = ImageMemoryBarrier2;
pub const DependencyInfoKHR = DependencyInfo;
pub const SubmitInfo2KHR = SubmitInfo2;
pub const SemaphoreSubmitInfoKHR = SemaphoreSubmitInfo;
pub const CommandBufferSubmitInfoKHR = CommandBufferSubmitInfo;
pub const PhysicalDeviceSynchronization2FeaturesKHR = PhysicalDeviceSynchronization2Features;
pub const PFN_cmdSetEvent2KHR = ?*const fn (CommandBuffer, Event, [*c]const DependencyInfo) callconv(.c) void;
pub const PFN_cmdResetEvent2KHR = ?*const fn (CommandBuffer, Event, PipelineStageFlags2) callconv(.c) void;
pub const PFN_cmdWaitEvents2KHR = ?*const fn (CommandBuffer, u32, [*c]const Event, [*c]const DependencyInfo) callconv(.c) void;
pub const PFN_cmdPipelineBarrier2KHR = ?*const fn (CommandBuffer, [*c]const DependencyInfo) callconv(.c) void;
pub const PFN_cmdWriteTimestamp2KHR = ?*const fn (CommandBuffer, PipelineStageFlags2, QueryPool, u32) callconv(.c) void;
pub const PFN_queueSubmit2KHR = ?*const fn (Queue, u32, [*c]const SubmitInfo2, Fence) callconv(.c) Result;
pub extern fn cmdSetEvent2Khr(command_buffer: CommandBuffer, event: Event, p_dependency_info: [*c]const DependencyInfo) void;
pub extern fn cmdResetEvent2Khr(command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2) void;
pub extern fn cmdWaitEvents2Khr(command_buffer: CommandBuffer, event_count: u32, p_events: [*c]const Event, p_dependency_infos: [*c]const DependencyInfo) void;
pub extern fn cmdPipelineBarrier2Khr(command_buffer: CommandBuffer, p_dependency_info: [*c]const DependencyInfo) void;
pub extern fn cmdWriteTimestamp2Khr(command_buffer: CommandBuffer, stage: PipelineStageFlags2, query_pool: QueryPool, query: u32) void;
pub extern fn queueSubmit2Khr(queue: Queue, submit_count: u32, p_submits: [*c]const SubmitInfo2, fence: Fence) Result;
pub const PhysicalDeviceFragmentShaderBarycentricFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_shader_barycentric: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentShaderBarycentricPropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    tri_strip_vertex_order_independent_of_provoking_vertex: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderSubgroupUniformControlFlowFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_subgroup_uniform_control_flow: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR = PhysicalDeviceZeroInitializeWorkgroupMemoryFeatures;
pub const PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    workgroup_memory_explicit_layout: Bool32 = @import("std").mem.zeroes(Bool32),
    workgroup_memory_explicit_layout_scalar_block_layout: Bool32 = @import("std").mem.zeroes(Bool32),
    workgroup_memory_explicit_layout8_bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    workgroup_memory_explicit_layout16_bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const CopyBufferInfo2KHR = CopyBufferInfo2;
pub const CopyImageInfo2KHR = CopyImageInfo2;
pub const CopyBufferToImageInfo2KHR = CopyBufferToImageInfo2;
pub const CopyImageToBufferInfo2KHR = CopyImageToBufferInfo2;
pub const BlitImageInfo2KHR = BlitImageInfo2;
pub const ResolveImageInfo2KHR = ResolveImageInfo2;
pub const BufferCopy2KHR = BufferCopy2;
pub const ImageCopy2KHR = ImageCopy2;
pub const ImageBlit2KHR = ImageBlit2;
pub const BufferImageCopy2KHR = BufferImageCopy2;
pub const ImageResolve2KHR = ImageResolve2;
pub const PFN_cmdCopyBuffer2KHR = ?*const fn (CommandBuffer, [*c]const CopyBufferInfo2) callconv(.c) void;
pub const PFN_cmdCopyImage2KHR = ?*const fn (CommandBuffer, [*c]const CopyImageInfo2) callconv(.c) void;
pub const PFN_cmdCopyBufferToImage2KHR = ?*const fn (CommandBuffer, [*c]const CopyBufferToImageInfo2) callconv(.c) void;
pub const PFN_cmdCopyImageToBuffer2KHR = ?*const fn (CommandBuffer, [*c]const CopyImageToBufferInfo2) callconv(.c) void;
pub const PFN_cmdBlitImage2KHR = ?*const fn (CommandBuffer, [*c]const BlitImageInfo2) callconv(.c) void;
pub const PFN_cmdResolveImage2KHR = ?*const fn (CommandBuffer, [*c]const ResolveImageInfo2) callconv(.c) void;
pub extern fn cmdCopyBuffer2Khr(command_buffer: CommandBuffer, p_copy_buffer_info: [*c]const CopyBufferInfo2) void;
pub extern fn cmdCopyImage2Khr(command_buffer: CommandBuffer, p_copy_image_info: [*c]const CopyImageInfo2) void;
pub extern fn cmdCopyBufferToImage2Khr(command_buffer: CommandBuffer, p_copy_buffer_to_image_info: [*c]const CopyBufferToImageInfo2) void;
pub extern fn cmdCopyImageToBuffer2Khr(command_buffer: CommandBuffer, p_copy_image_to_buffer_info: [*c]const CopyImageToBufferInfo2) void;
pub extern fn cmdBlitImage2Khr(command_buffer: CommandBuffer, p_blit_image_info: [*c]const BlitImageInfo2) void;
pub extern fn cmdResolveImage2Khr(command_buffer: CommandBuffer, p_resolve_image_info: [*c]const ResolveImageInfo2) void;
pub const FormatFeatureFlags2KHR = FormatFeatureFlags2;
pub const FormatFeatureFlagBits2KHR = FormatFeatureFlagBits2;
pub const FormatProperties3KHR = FormatProperties3;
pub const PhysicalDeviceRayTracingMaintenance1FeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_maintenance1: Bool32 = @import("std").mem.zeroes(Bool32),
    ray_tracing_pipeline_trace_rays_indirect2: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const TraceRaysIndirectCommand2KHR = extern struct {
    raygen_shader_record_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    raygen_shader_record_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    miss_shader_binding_table_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    miss_shader_binding_table_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    miss_shader_binding_table_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    hit_shader_binding_table_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    hit_shader_binding_table_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    hit_shader_binding_table_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    callable_shader_binding_table_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    callable_shader_binding_table_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    callable_shader_binding_table_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
    depth: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdTraceRaysIndirect2KHR = ?*const fn (CommandBuffer, DeviceAddress) callconv(.c) void;
pub extern fn cmdTraceRaysIndirect2Khr(command_buffer: CommandBuffer, indirect_device_address: DeviceAddress) void;
pub const PhysicalDeviceMaintenance4FeaturesKHR = PhysicalDeviceMaintenance4Features;
pub const PhysicalDeviceMaintenance4PropertiesKHR = PhysicalDeviceMaintenance4Properties;
pub const DeviceBufferMemoryRequirementsKHR = DeviceBufferMemoryRequirements;
pub const DeviceImageMemoryRequirementsKHR = DeviceImageMemoryRequirements;
pub const PFN_getDeviceBufferMemoryRequirementsKHR = ?*const fn (Device, [*c]const DeviceBufferMemoryRequirements, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getDeviceImageMemoryRequirementsKHR = ?*const fn (Device, [*c]const DeviceImageMemoryRequirements, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getDeviceImageSparseMemoryRequirementsKHR = ?*const fn (Device, [*c]const DeviceImageMemoryRequirements, [*c]u32, [*c]SparseImageMemoryRequirements2) callconv(.c) void;
pub extern fn getDeviceBufferMemoryRequirementsKhr(device: Device, p_info: [*c]const DeviceBufferMemoryRequirements, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getDeviceImageMemoryRequirementsKhr(device: Device, p_info: [*c]const DeviceImageMemoryRequirements, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getDeviceImageSparseMemoryRequirementsKhr(device: Device, p_info: [*c]const DeviceImageMemoryRequirements, p_sparse_memory_requirement_count: [*c]u32, p_sparse_memory_requirements: [*c]SparseImageMemoryRequirements2) void;
pub const PhysicalDeviceShaderSubgroupRotateFeaturesKHR = PhysicalDeviceShaderSubgroupRotateFeatures;
pub const PhysicalDeviceShaderMaximalReconvergenceFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_maximal_reconvergence: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineCreateFlags2KHR = PipelineCreateFlags2;
pub const PipelineCreateFlagBits2KHR = PipelineCreateFlagBits2;
pub const BufferUsageFlags2KHR = BufferUsageFlags2;
pub const BufferUsageFlagBits2KHR = BufferUsageFlagBits2;
pub const PhysicalDeviceMaintenance5FeaturesKHR = PhysicalDeviceMaintenance5Features;
pub const PhysicalDeviceMaintenance5PropertiesKHR = PhysicalDeviceMaintenance5Properties;
pub const RenderingAreaInfoKHR = RenderingAreaInfo;
pub const DeviceImageSubresourceInfoKHR = DeviceImageSubresourceInfo;
pub const ImageSubresource2KHR = ImageSubresource2;
pub const SubresourceLayout2KHR = SubresourceLayout2;
pub const PipelineCreateFlags2CreateInfoKHR = PipelineCreateFlags2CreateInfo;
pub const BufferUsageFlags2CreateInfoKHR = BufferUsageFlags2CreateInfo;
pub const PFN_cmdBindIndexBuffer2KHR = ?*const fn (CommandBuffer, Buffer, DeviceSize, DeviceSize, IndexType) callconv(.c) void;
pub const PFN_getRenderingAreaGranularityKHR = ?*const fn (Device, [*c]const RenderingAreaInfo, [*c]Extent2D) callconv(.c) void;
pub const PFN_getDeviceImageSubresourceLayoutKHR = ?*const fn (Device, [*c]const DeviceImageSubresourceInfo, [*c]SubresourceLayout2) callconv(.c) void;
pub const PFN_getImageSubresourceLayout2KHR = ?*const fn (Device, Image, [*c]const ImageSubresource2, [*c]SubresourceLayout2) callconv(.c) void;
pub extern fn cmdBindIndexBuffer2Khr(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, size: DeviceSize, index_type: IndexType) void;
pub extern fn getRenderingAreaGranularityKhr(device: Device, p_rendering_area_info: [*c]const RenderingAreaInfo, p_granularity: [*c]Extent2D) void;
pub extern fn getDeviceImageSubresourceLayoutKhr(device: Device, p_info: [*c]const DeviceImageSubresourceInfo, p_layout: [*c]SubresourceLayout2) void;
pub extern fn getImageSubresourceLayout2Khr(device: Device, image: Image, p_subresource: [*c]const ImageSubresource2, p_layout: [*c]SubresourceLayout2) void;
pub const PhysicalDeviceRayTracingPositionFetchFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_position_fetch: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineBinaryKHR = enum(u64) { null = 0, _ };
pub const PhysicalDevicePipelineBinaryFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_binaries: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePipelineBinaryPropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_binary_internal_cache: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_binary_internal_cache_control: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_binary_prefers_internal_cache: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_binary_precompiled_internal_cache: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_binary_compressed_data: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DevicePipelineBinaryInternalCacheControlKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    disable_internal_cache: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineBinaryKeyKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    key_size: u32 = @import("std").mem.zeroes(u32),
    key: [32]u8 = @import("std").mem.zeroes([32]u8),
};
pub const PipelineBinaryDataKHR = extern struct {
    data_size: usize = @import("std").mem.zeroes(usize),
    p_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PipelineBinaryKeysAndDataKHR = extern struct {
    binary_count: u32 = @import("std").mem.zeroes(u32),
    p_pipeline_binary_keys: [*c]const PipelineBinaryKeyKHR = @import("std").mem.zeroes([*c]const PipelineBinaryKeyKHR),
    p_pipeline_binary_data: [*c]const PipelineBinaryDataKHR = @import("std").mem.zeroes([*c]const PipelineBinaryDataKHR),
};
pub const PipelineCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PipelineBinaryCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_keys_and_data_info: [*c]const PipelineBinaryKeysAndDataKHR = @import("std").mem.zeroes([*c]const PipelineBinaryKeysAndDataKHR),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
    p_pipeline_create_info: [*c]const PipelineCreateInfoKHR = @import("std").mem.zeroes([*c]const PipelineCreateInfoKHR),
};
pub const PipelineBinaryInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    binary_count: u32 = @import("std").mem.zeroes(u32),
    p_pipeline_binaries: [*c]const PipelineBinaryKHR = @import("std").mem.zeroes([*c]const PipelineBinaryKHR),
};
pub const ReleaseCapturedPipelineDataInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
};
pub const PipelineBinaryDataInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_binary: PipelineBinaryKHR = @import("std").mem.zeroes(PipelineBinaryKHR),
};
pub const PipelineBinaryHandlesInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    pipeline_binary_count: u32 = @import("std").mem.zeroes(u32),
    p_pipeline_binaries: [*c]PipelineBinaryKHR = @import("std").mem.zeroes([*c]PipelineBinaryKHR),
};
pub const PFN_createPipelineBinariesKHR = ?*const fn (Device, [*c]const PipelineBinaryCreateInfoKHR, [*c]const AllocationCallbacks, [*c]PipelineBinaryHandlesInfoKHR) callconv(.c) Result;
pub const PFN_destroyPipelineBinaryKHR = ?*const fn (Device, PipelineBinaryKHR, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getPipelineKeyKHR = ?*const fn (Device, [*c]const PipelineCreateInfoKHR, [*c]PipelineBinaryKeyKHR) callconv(.c) Result;
pub const PFN_getPipelineBinaryDataKHR = ?*const fn (Device, [*c]const PipelineBinaryDataInfoKHR, [*c]PipelineBinaryKeyKHR, [*c]usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_releaseCapturedPipelineDataKHR = ?*const fn (Device, [*c]const ReleaseCapturedPipelineDataInfoKHR, [*c]const AllocationCallbacks) callconv(.c) Result;
pub extern fn createPipelineBinariesKhr(device: Device, p_create_info: [*c]const PipelineBinaryCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_binaries: [*c]PipelineBinaryHandlesInfoKHR) Result;
pub extern fn destroyPipelineBinaryKhr(device: Device, pipeline_binary: PipelineBinaryKHR, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getPipelineKeyKhr(device: Device, p_pipeline_create_info: [*c]const PipelineCreateInfoKHR, p_pipeline_key: [*c]PipelineBinaryKeyKHR) Result;
pub extern fn getPipelineBinaryDataKhr(device: Device, p_info: [*c]const PipelineBinaryDataInfoKHR, p_pipeline_binary_key: [*c]PipelineBinaryKeyKHR, p_pipeline_binary_data_size: [*c]usize, p_pipeline_binary_data: ?*anyopaque) Result;
pub extern fn releaseCapturedPipelineDataKhr(device: Device, p_info: [*c]const ReleaseCapturedPipelineDataInfoKHR, p_allocator: [*c]const AllocationCallbacks) Result;
pub const ComponentTypeKHR = enum(u32) {
    float16 = 0,
    float32 = 1,
    float64 = 2,
    sint8 = 3,
    sint16 = 4,
    sint32 = 5,
    sint64 = 6,
    uint8 = 7,
    uint16 = 8,
    uint32 = 9,
    uint64 = 10,
    sint8_packed_nv = 1000491000,
    uint8_packed_nv = 1000491001,
    float_e4m3_nv = 1000491002,
    float_e5m2_nv = 1000491003,
    max_enum = 2147483647,
    const Self = @This();
    pub const uint64_nv = Self.uint64;
    pub const uint32_nv = Self.uint32;
    pub const uint16_nv = Self.uint16;
    pub const uint8_nv = Self.uint8;
    pub const sint64_nv = Self.sint64;
    pub const sint32_nv = Self.sint32;
    pub const sint16_nv = Self.sint16;
    pub const sint8_nv = Self.sint8;
    pub const float64_nv = Self.float64;
    pub const float32_nv = Self.float32;
    pub const float16_nv = Self.float16;
};
pub const ScopeKHR = enum(u32) {
    device = 1,
    workgroup = 2,
    subgroup = 3,
    queue_family = 5,
    max_enum = 2147483647,
    const Self = @This();
    pub const queue_family_nv = Self.queue_family;
    pub const subgroup_nv = Self.subgroup;
    pub const workgroup_nv = Self.workgroup;
    pub const device_nv = Self.device;
};
pub const CooperativeMatrixPropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    msize: u32 = @import("std").mem.zeroes(u32),
    nsize: u32 = @import("std").mem.zeroes(u32),
    ksize: u32 = @import("std").mem.zeroes(u32),
    atype: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    btype: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    ctype: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    result_type: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    saturating_accumulation: Bool32 = @import("std").mem.zeroes(Bool32),
    scope: ScopeKHR = @import("std").mem.zeroes(ScopeKHR),
};
pub const PhysicalDeviceCooperativeMatrixFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cooperative_matrix: Bool32 = @import("std").mem.zeroes(Bool32),
    cooperative_matrix_robust_buffer_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceCooperativeMatrixPropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cooperative_matrix_supported_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
};
pub const PFN_getPhysicalDeviceCooperativeMatrixPropertiesKHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]CooperativeMatrixPropertiesKHR) callconv(.c) Result;
pub extern fn getPhysicalDeviceCooperativeMatrixPropertiesKhr(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]CooperativeMatrixPropertiesKHR) Result;
pub const PhysicalDeviceComputeShaderDerivativesFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    compute_derivative_group_quads: Bool32 = @import("std").mem.zeroes(Bool32),
    compute_derivative_group_linear: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceComputeShaderDerivativesPropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    mesh_and_task_shader_derivatives: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVideoEncodeAV1FeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    video_encode_av1: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVideoMaintenance1FeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    video_maintenance1: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVertexAttributeDivisorPropertiesKHR = PhysicalDeviceVertexAttributeDivisorProperties;
pub const VertexInputBindingDivisorDescriptionKHR = VertexInputBindingDivisorDescription;
pub const PipelineVertexInputDivisorStateCreateInfoKHR = PipelineVertexInputDivisorStateCreateInfo;
pub const PhysicalDeviceVertexAttributeDivisorFeaturesKHR = PhysicalDeviceVertexAttributeDivisorFeatures;
pub const PhysicalDeviceShaderFloatControls2FeaturesKHR = PhysicalDeviceShaderFloatControls2Features;
pub const PhysicalDeviceIndexTypeUint8FeaturesKHR = PhysicalDeviceIndexTypeUint8Features;
pub const LineRasterizationModeKHR = LineRasterizationMode;
pub const PhysicalDeviceLineRasterizationFeaturesKHR = PhysicalDeviceLineRasterizationFeatures;
pub const PhysicalDeviceLineRasterizationPropertiesKHR = PhysicalDeviceLineRasterizationProperties;
pub const PipelineRasterizationLineStateCreateInfoKHR = PipelineRasterizationLineStateCreateInfo;
pub const PFN_cmdSetLineStippleKHR = ?*const fn (CommandBuffer, u32, u16) callconv(.c) void;
pub extern fn cmdSetLineStippleKhr(command_buffer: CommandBuffer, line_stipple_factor: u32, line_stipple_pattern: u16) void;
pub const TimeDomainKHR = enum(u32) {
    device = 0,
    clock_monotonic = 1,
    clock_monotonic_raw = 2,
    query_performance_counter = 3,
    max_enum = 2147483647,
    const Self = @This();
    pub const query_performance_counter_ext = Self.query_performance_counter;
    pub const clock_monotonic_raw_ext = Self.clock_monotonic_raw;
    pub const clock_monotonic_ext = Self.clock_monotonic;
    pub const device_ext = Self.device;
};
pub const CalibratedTimestampInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    time_domain: TimeDomainKHR = @import("std").mem.zeroes(TimeDomainKHR),
};
pub const PFN_getPhysicalDeviceCalibrateableTimeDomainsKHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]TimeDomainKHR) callconv(.c) Result;
pub const PFN_getCalibratedTimestampsKHR = ?*const fn (Device, u32, [*c]const CalibratedTimestampInfoKHR, [*c]u64, [*c]u64) callconv(.c) Result;
pub extern fn getPhysicalDeviceCalibrateableTimeDomainsKhr(physical_device: PhysicalDevice, p_time_domain_count: [*c]u32, p_time_domains: [*c]TimeDomainKHR) Result;
pub extern fn getCalibratedTimestampsKhr(device: Device, timestamp_count: u32, p_timestamp_infos: [*c]const CalibratedTimestampInfoKHR, p_timestamps: [*c]u64, p_max_deviation: [*c]u64) Result;
pub const PhysicalDeviceShaderExpectAssumeFeaturesKHR = PhysicalDeviceShaderExpectAssumeFeatures;
pub const PhysicalDeviceMaintenance6FeaturesKHR = PhysicalDeviceMaintenance6Features;
pub const PhysicalDeviceMaintenance6PropertiesKHR = PhysicalDeviceMaintenance6Properties;
pub const BindMemoryStatusKHR = BindMemoryStatus;
pub const BindDescriptorSetsInfoKHR = BindDescriptorSetsInfo;
pub const PushConstantsInfoKHR = PushConstantsInfo;
pub const PushDescriptorSetInfoKHR = PushDescriptorSetInfo;
pub const PushDescriptorSetWithTemplateInfoKHR = PushDescriptorSetWithTemplateInfo;
pub const SetDescriptorBufferOffsetsInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    first_set: u32 = @import("std").mem.zeroes(u32),
    set_count: u32 = @import("std").mem.zeroes(u32),
    p_buffer_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    p_offsets: [*c]const DeviceSize = @import("std").mem.zeroes([*c]const DeviceSize),
};
pub const BindDescriptorBufferEmbeddedSamplersInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    set: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdBindDescriptorSets2KHR = ?*const fn (CommandBuffer, [*c]const BindDescriptorSetsInfo) callconv(.c) void;
pub const PFN_cmdPushConstants2KHR = ?*const fn (CommandBuffer, [*c]const PushConstantsInfo) callconv(.c) void;
pub const PFN_cmdPushDescriptorSet2KHR = ?*const fn (CommandBuffer, [*c]const PushDescriptorSetInfo) callconv(.c) void;
pub const PFN_cmdPushDescriptorSetWithTemplate2KHR = ?*const fn (CommandBuffer, [*c]const PushDescriptorSetWithTemplateInfo) callconv(.c) void;
pub const PFN_cmdSetDescriptorBufferOffsets2EXT = ?*const fn (CommandBuffer, [*c]const SetDescriptorBufferOffsetsInfoEXT) callconv(.c) void;
pub const PFN_cmdBindDescriptorBufferEmbeddedSamplers2EXT = ?*const fn (CommandBuffer, [*c]const BindDescriptorBufferEmbeddedSamplersInfoEXT) callconv(.c) void;
pub extern fn cmdBindDescriptorSets2Khr(command_buffer: CommandBuffer, p_bind_descriptor_sets_info: [*c]const BindDescriptorSetsInfo) void;
pub extern fn cmdPushConstants2Khr(command_buffer: CommandBuffer, p_push_constants_info: [*c]const PushConstantsInfo) void;
pub extern fn cmdPushDescriptorSet2Khr(command_buffer: CommandBuffer, p_push_descriptor_set_info: [*c]const PushDescriptorSetInfo) void;
pub extern fn cmdPushDescriptorSetWithTemplate2Khr(command_buffer: CommandBuffer, p_push_descriptor_set_with_template_info: [*c]const PushDescriptorSetWithTemplateInfo) void;
pub extern fn cmdSetDescriptorBufferOffsets2Ext(command_buffer: CommandBuffer, p_set_descriptor_buffer_offsets_info: [*c]const SetDescriptorBufferOffsetsInfoEXT) void;
pub extern fn cmdBindDescriptorBufferEmbeddedSamplers2Ext(command_buffer: CommandBuffer, p_bind_descriptor_buffer_embedded_samplers_info: [*c]const BindDescriptorBufferEmbeddedSamplersInfoEXT) void;
pub const PhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    video_encode_quantization_map: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_relaxed_extended_instruction: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceLayeredApiKHR = enum(u32) {
    vulkan = 0,
    d3d12 = 1,
    metal = 2,
    opengl = 3,
    opengles = 4,
    max_enum = 2147483647,
};
pub const PhysicalDeviceMaintenance7FeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    maintenance7: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMaintenance7PropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    robust_fragment_shading_rate_attachment_access: Bool32 = @import("std").mem.zeroes(Bool32),
    separate_depth_stencil_attachment_access: Bool32 = @import("std").mem.zeroes(Bool32),
    max_descriptor_set_total_uniform_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_total_storage_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_total_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_total_uniform_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_total_storage_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_total_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceLayeredApiPropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    vendor_id: u32 = @import("std").mem.zeroes(u32),
    device_id: u32 = @import("std").mem.zeroes(u32),
    layered_api: PhysicalDeviceLayeredApiKHR = @import("std").mem.zeroes(PhysicalDeviceLayeredApiKHR),
    device_name: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const PhysicalDeviceLayeredApiPropertiesListKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    layered_api_count: u32 = @import("std").mem.zeroes(u32),
    p_layered_apis: [*c]PhysicalDeviceLayeredApiPropertiesKHR = @import("std").mem.zeroes([*c]PhysicalDeviceLayeredApiPropertiesKHR),
};
pub const PhysicalDeviceLayeredApiVulkanPropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    properties: PhysicalDeviceProperties2 = @import("std").mem.zeroes(PhysicalDeviceProperties2),
};
pub const AccessFlags3KHR = Flags64;
pub const AccessFlagBits3KHR = Flags64;
pub const PhysicalDeviceMaintenance8FeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    maintenance8: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MemoryBarrierAccessFlags3KHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_access_mask3: AccessFlags3KHR = @import("std").mem.zeroes(AccessFlags3KHR),
    dst_access_mask3: AccessFlags3KHR = @import("std").mem.zeroes(AccessFlags3KHR),
};
pub const PhysicalDeviceVideoMaintenance2FeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    video_maintenance2: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceDepthClampZeroOneFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    depth_clamp_zero_one: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DebugReportCallbackEXT = enum(u64) { null = 0, _ };
pub const DebugReportObjectTypeEXT = enum(u32) {
    unknown = 0,
    instance = 1,
    physical_device = 2,
    device = 3,
    queue = 4,
    semaphore = 5,
    command_buffer = 6,
    fence = 7,
    device_memory = 8,
    buffer = 9,
    image = 10,
    event = 11,
    query_pool = 12,
    buffer_view = 13,
    image_view = 14,
    shader_module = 15,
    pipeline_cache = 16,
    pipeline_layout = 17,
    render_pass = 18,
    pipeline = 19,
    descriptor_set_layout = 20,
    sampler = 21,
    descriptor_pool = 22,
    descriptor_set = 23,
    framebuffer = 24,
    command_pool = 25,
    surface_khr = 26,
    swapchain_khr = 27,
    debug_report = 28,
    display_khr = 29,
    display_mode_khr = 30,
    validation_cache = 33,
    cu_module_nvx = 1000029000,
    cu_function_nvx = 1000029001,
    descriptor_update_template = 1000085000,
    acceleration_structure_khr = 1000150000,
    sampler_ycbcr_conversion = 1000156000,
    acceleration_structure_nv = 1000165000,
    cuda_module_nv = 1000307000,
    cuda_function_nv = 1000307001,
    buffer_collection_fuchsia = 1000366000,
    max_enum = 2147483647,
    const Self = @This();
    pub const descriptor_update_template_khr = Self.descriptor_update_template;
    pub const sampler_ycbcr_conversion_khr = Self.sampler_ycbcr_conversion;
    pub const validation_cache_ext = Self.validation_cache;
    pub const debug_report_callback_ext = Self.debug_report;
};
pub const DebugReportFlagBitsEXT = enum(u32) {
    information_bit = 1,
    warning_bit = 2,
    performance_warning_bit = 4,
    error_bit = 8,
    debug_bit = 16,
    max_enum = 2147483647,
};
pub const DebugReportFlagsEXT = Flags;
pub const PFN_debugReportCallbackEXT = ?*const fn (DebugReportFlagsEXT, DebugReportObjectTypeEXT, u64, usize, i32, [*c]const u8, [*c]const u8, ?*anyopaque) callconv(.c) Bool32;
pub const DebugReportCallbackCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DebugReportFlagsEXT = @import("std").mem.zeroes(DebugReportFlagsEXT),
    pfn_callback: PFN_debugReportCallbackEXT = @import("std").mem.zeroes(PFN_debugReportCallbackEXT),
    p_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PFN_createDebugReportCallbackEXT = ?*const fn (Instance, [*c]const DebugReportCallbackCreateInfoEXT, [*c]const AllocationCallbacks, [*c]DebugReportCallbackEXT) callconv(.c) Result;
pub const PFN_destroyDebugReportCallbackEXT = ?*const fn (Instance, DebugReportCallbackEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_debugReportMessageEXT = ?*const fn (Instance, DebugReportFlagsEXT, DebugReportObjectTypeEXT, u64, usize, i32, [*c]const u8, [*c]const u8) callconv(.c) void;
pub extern fn createDebugReportCallbackExt(instance: Instance, p_create_info: [*c]const DebugReportCallbackCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_callback: [*c]DebugReportCallbackEXT) Result;
pub extern fn destroyDebugReportCallbackExt(instance: Instance, callback: DebugReportCallbackEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn debugReportMessageExt(instance: Instance, flags: DebugReportFlagsEXT, object_type: DebugReportObjectTypeEXT, object: u64, location: usize, message_code: i32, p_layer_prefix: [*c]const u8, p_message: [*c]const u8) void;
pub const RasterizationOrderAMD = enum(u32) {
    strict = 0,
    relaxed = 1,
    max_enum = 2147483647,
};
pub const PipelineRasterizationStateRasterizationOrderAMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    rasterization_order: RasterizationOrderAMD = @import("std").mem.zeroes(RasterizationOrderAMD),
};
pub const DebugMarkerObjectNameInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    object_type: DebugReportObjectTypeEXT = @import("std").mem.zeroes(DebugReportObjectTypeEXT),
    object: u64 = @import("std").mem.zeroes(u64),
    p_object_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const DebugMarkerObjectTagInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    object_type: DebugReportObjectTypeEXT = @import("std").mem.zeroes(DebugReportObjectTypeEXT),
    object: u64 = @import("std").mem.zeroes(u64),
    tag_name: u64 = @import("std").mem.zeroes(u64),
    tag_size: usize = @import("std").mem.zeroes(usize),
    p_tag: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const DebugMarkerMarkerInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_marker_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    color: [4]f32 = @import("std").mem.zeroes([4]f32),
};
pub const PFN_debugMarkerSetObjectTagEXT = ?*const fn (Device, [*c]const DebugMarkerObjectTagInfoEXT) callconv(.c) Result;
pub const PFN_debugMarkerSetObjectNameEXT = ?*const fn (Device, [*c]const DebugMarkerObjectNameInfoEXT) callconv(.c) Result;
pub const PFN_cmdDebugMarkerBeginEXT = ?*const fn (CommandBuffer, [*c]const DebugMarkerMarkerInfoEXT) callconv(.c) void;
pub const PFN_cmdDebugMarkerEndEXT = ?*const fn (CommandBuffer) callconv(.c) void;
pub const PFN_cmdDebugMarkerInsertEXT = ?*const fn (CommandBuffer, [*c]const DebugMarkerMarkerInfoEXT) callconv(.c) void;
pub extern fn debugMarkerSetObjectTagExt(device: Device, p_tag_info: [*c]const DebugMarkerObjectTagInfoEXT) Result;
pub extern fn debugMarkerSetObjectNameExt(device: Device, p_name_info: [*c]const DebugMarkerObjectNameInfoEXT) Result;
pub extern fn cmdDebugMarkerBeginExt(command_buffer: CommandBuffer, p_marker_info: [*c]const DebugMarkerMarkerInfoEXT) void;
pub extern fn cmdDebugMarkerEndExt(command_buffer: CommandBuffer) void;
pub extern fn cmdDebugMarkerInsertExt(command_buffer: CommandBuffer, p_marker_info: [*c]const DebugMarkerMarkerInfoEXT) void;
pub const DedicatedAllocationImageCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    dedicated_allocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DedicatedAllocationBufferCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    dedicated_allocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DedicatedAllocationMemoryAllocateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
};
pub const PipelineRasterizationStateStreamCreateFlagsEXT = Flags;
pub const PhysicalDeviceTransformFeedbackFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    transform_feedback: Bool32 = @import("std").mem.zeroes(Bool32),
    geometry_streams: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceTransformFeedbackPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_transform_feedback_streams: u32 = @import("std").mem.zeroes(u32),
    max_transform_feedback_buffers: u32 = @import("std").mem.zeroes(u32),
    max_transform_feedback_buffer_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    max_transform_feedback_stream_data_size: u32 = @import("std").mem.zeroes(u32),
    max_transform_feedback_buffer_data_size: u32 = @import("std").mem.zeroes(u32),
    max_transform_feedback_buffer_data_stride: u32 = @import("std").mem.zeroes(u32),
    transform_feedback_queries: Bool32 = @import("std").mem.zeroes(Bool32),
    transform_feedback_streams_lines_triangles: Bool32 = @import("std").mem.zeroes(Bool32),
    transform_feedback_rasterization_stream_select: Bool32 = @import("std").mem.zeroes(Bool32),
    transform_feedback_draw: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineRasterizationStateStreamCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineRasterizationStateStreamCreateFlagsEXT = @import("std").mem.zeroes(PipelineRasterizationStateStreamCreateFlagsEXT),
    rasterization_stream: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdBindTransformFeedbackBuffersEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const Buffer, [*c]const DeviceSize, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdBeginTransformFeedbackEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const Buffer, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdEndTransformFeedbackEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const Buffer, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdBeginQueryIndexedEXT = ?*const fn (CommandBuffer, QueryPool, u32, QueryControlFlags, u32) callconv(.c) void;
pub const PFN_cmdEndQueryIndexedEXT = ?*const fn (CommandBuffer, QueryPool, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndirectByteCountEXT = ?*const fn (CommandBuffer, u32, u32, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub extern fn cmdBindTransformFeedbackBuffersExt(command_buffer: CommandBuffer, first_binding: u32, binding_count: u32, p_buffers: [*c]const Buffer, p_offsets: [*c]const DeviceSize, p_sizes: [*c]const DeviceSize) void;
pub extern fn cmdBeginTransformFeedbackExt(command_buffer: CommandBuffer, first_counter_buffer: u32, counter_buffer_count: u32, p_counter_buffers: [*c]const Buffer, p_counter_buffer_offsets: [*c]const DeviceSize) void;
pub extern fn cmdEndTransformFeedbackExt(command_buffer: CommandBuffer, first_counter_buffer: u32, counter_buffer_count: u32, p_counter_buffers: [*c]const Buffer, p_counter_buffer_offsets: [*c]const DeviceSize) void;
pub extern fn cmdBeginQueryIndexedExt(command_buffer: CommandBuffer, query_pool: QueryPool, query: u32, flags: QueryControlFlags, index: u32) void;
pub extern fn cmdEndQueryIndexedExt(command_buffer: CommandBuffer, query_pool: QueryPool, query: u32, index: u32) void;
pub extern fn cmdDrawIndirectByteCountExt(command_buffer: CommandBuffer, instance_count: u32, first_instance: u32, counter_buffer: Buffer, counter_bufferOffset: DeviceSize, counter_offset: u32, vertex_stride: u32) void;
pub const CuModuleNVX = enum(u64) { null = 0, _ };
pub const CuFunctionNVX = enum(u64) { null = 0, _ };
pub const CuModuleCreateInfoNVX = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    data_size: usize = @import("std").mem.zeroes(usize),
    p_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const CuModuleTexturingModeCreateInfoNVX = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    use64bit_texturing: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const CuFunctionCreateInfoNVX = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    module: CuModuleNVX = @import("std").mem.zeroes(CuModuleNVX),
    p_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const CuLaunchInfoNVX = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    function: CuFunctionNVX = @import("std").mem.zeroes(CuFunctionNVX),
    grid_dim_x: u32 = @import("std").mem.zeroes(u32),
    grid_dim_y: u32 = @import("std").mem.zeroes(u32),
    grid_dim_z: u32 = @import("std").mem.zeroes(u32),
    block_dim_x: u32 = @import("std").mem.zeroes(u32),
    block_dim_y: u32 = @import("std").mem.zeroes(u32),
    block_dim_z: u32 = @import("std").mem.zeroes(u32),
    shared_mem_bytes: u32 = @import("std").mem.zeroes(u32),
    param_count: usize = @import("std").mem.zeroes(usize),
    p_params: [*c]const ?*const anyopaque = @import("std").mem.zeroes([*c]const ?*const anyopaque),
    extra_count: usize = @import("std").mem.zeroes(usize),
    p_extras: [*c]const ?*const anyopaque = @import("std").mem.zeroes([*c]const ?*const anyopaque),
};
pub const PFN_createCuModuleNVX = ?*const fn (Device, [*c]const CuModuleCreateInfoNVX, [*c]const AllocationCallbacks, [*c]CuModuleNVX) callconv(.c) Result;
pub const PFN_createCuFunctionNVX = ?*const fn (Device, [*c]const CuFunctionCreateInfoNVX, [*c]const AllocationCallbacks, [*c]CuFunctionNVX) callconv(.c) Result;
pub const PFN_destroyCuModuleNVX = ?*const fn (Device, CuModuleNVX, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_destroyCuFunctionNVX = ?*const fn (Device, CuFunctionNVX, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_cmdCuLaunchKernelNVX = ?*const fn (CommandBuffer, [*c]const CuLaunchInfoNVX) callconv(.c) void;
pub extern fn createCuModuleNvx(device: Device, p_create_info: [*c]const CuModuleCreateInfoNVX, p_allocator: [*c]const AllocationCallbacks, p_module: [*c]CuModuleNVX) Result;
pub extern fn createCuFunctionNvx(device: Device, p_create_info: [*c]const CuFunctionCreateInfoNVX, p_allocator: [*c]const AllocationCallbacks, p_function: [*c]CuFunctionNVX) Result;
pub extern fn destroyCuModuleNvx(device: Device, module: CuModuleNVX, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn destroyCuFunctionNvx(device: Device, function: CuFunctionNVX, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn cmdCuLaunchKernelNvx(command_buffer: CommandBuffer, p_launch_info: [*c]const CuLaunchInfoNVX) void;
pub const ImageViewHandleInfoNVX = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image_view: ImageView = @import("std").mem.zeroes(ImageView),
    descriptor_type: DescriptorType = @import("std").mem.zeroes(DescriptorType),
    sampler: Sampler = @import("std").mem.zeroes(Sampler),
};
pub const ImageViewAddressPropertiesNVX = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PFN_getImageViewHandleNVX = ?*const fn (Device, [*c]const ImageViewHandleInfoNVX) callconv(.c) u32;
pub const PFN_getImageViewHandle64NVX = ?*const fn (Device, [*c]const ImageViewHandleInfoNVX) callconv(.c) u64;
pub const PFN_getImageViewAddressNVX = ?*const fn (Device, ImageView, [*c]ImageViewAddressPropertiesNVX) callconv(.c) Result;
pub extern fn getImageViewHandleNvx(device: Device, p_info: [*c]const ImageViewHandleInfoNVX) u32;
pub extern fn getImageViewHandle64Nvx(device: Device, p_info: [*c]const ImageViewHandleInfoNVX) u64;
pub extern fn getImageViewAddressNvx(device: Device, image_view: ImageView, p_properties: [*c]ImageViewAddressPropertiesNVX) Result;
pub const PFN_cmdDrawIndirectCountAMD = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndexedIndirectCountAMD = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub extern fn cmdDrawIndirectCountAmd(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_bufferOffset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub extern fn cmdDrawIndexedIndirectCountAmd(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_bufferOffset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub const TextureLODGatherFormatPropertiesAMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supports_texture_gather_lodbias_amd: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ShaderInfoTypeAMD = enum(u32) {
    statistics = 0,
    binary = 1,
    disassembly = 2,
    max_enum = 2147483647,
};
pub const ShaderResourceUsageAMD = extern struct {
    num_used_vgprs: u32 = @import("std").mem.zeroes(u32),
    num_used_sgprs: u32 = @import("std").mem.zeroes(u32),
    lds_size_per_local_work_group: u32 = @import("std").mem.zeroes(u32),
    lds_usage_size_in_bytes: usize = @import("std").mem.zeroes(usize),
    scratch_mem_usage_in_bytes: usize = @import("std").mem.zeroes(usize),
};
pub const ShaderStatisticsInfoAMD = extern struct {
    shader_stage_mask: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    resource_usage: ShaderResourceUsageAMD = @import("std").mem.zeroes(ShaderResourceUsageAMD),
    num_physical_vgprs: u32 = @import("std").mem.zeroes(u32),
    num_physical_sgprs: u32 = @import("std").mem.zeroes(u32),
    num_available_vgprs: u32 = @import("std").mem.zeroes(u32),
    num_available_sgprs: u32 = @import("std").mem.zeroes(u32),
    compute_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
};
pub const PFN_getShaderInfoAMD = ?*const fn (Device, Pipeline, ShaderStageFlagBits, ShaderInfoTypeAMD, [*c]usize, ?*anyopaque) callconv(.c) Result;
pub extern fn getShaderInfoAmd(device: Device, pipeline: Pipeline, shader_stage: ShaderStageFlagBits, info_type: ShaderInfoTypeAMD, p_info_size: [*c]usize, p_info: ?*anyopaque) Result;
pub const PhysicalDeviceCornerSampledImageFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    corner_sampled_image: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ExternalMemoryHandleTypeFlagBitsNV = enum(u32) {
    opaque_win32_bit = 1,
    opaque_win32_kmt_bit = 2,
    d3d11_image_bit = 4,
    d3d11_image_kmt_bit = 8,
    max_enum = 2147483647,
};
pub const ExternalMemoryHandleTypeFlagsNV = Flags;
pub const ExternalMemoryFeatureFlagBitsNV = enum(u32) {
    dedicated_only_bit = 1,
    exportable_bit = 2,
    importable_bit = 4,
    max_enum = 2147483647,
};
pub const ExternalMemoryFeatureFlagsNV = Flags;
pub const ExternalImageFormatPropertiesNV = extern struct {
    image_format_properties: ImageFormatProperties = @import("std").mem.zeroes(ImageFormatProperties),
    external_memory_features: ExternalMemoryFeatureFlagsNV = @import("std").mem.zeroes(ExternalMemoryFeatureFlagsNV),
    export_from_imported_handle_types: ExternalMemoryHandleTypeFlagsNV = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagsNV),
    compatible_handle_types: ExternalMemoryHandleTypeFlagsNV = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagsNV),
};
pub const PFN_getPhysicalDeviceExternalImageFormatPropertiesNV = ?*const fn (PhysicalDevice, Format, ImageType, ImageTiling, ImageUsageFlags, ImageCreateFlags, ExternalMemoryHandleTypeFlagsNV, [*c]ExternalImageFormatPropertiesNV) callconv(.c) Result;
pub extern fn getPhysicalDeviceExternalImageFormatPropertiesNv(physical_device: PhysicalDevice, format: Format, @"type": ImageType, tiling: ImageTiling, usage: ImageUsageFlags, flags: ImageCreateFlags, external_handle_type: ExternalMemoryHandleTypeFlagsNV, p_external_image_format_properties: [*c]ExternalImageFormatPropertiesNV) Result;
pub const ExternalMemoryImageCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalMemoryHandleTypeFlagsNV = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagsNV),
};
pub const ExportMemoryAllocateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalMemoryHandleTypeFlagsNV = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagsNV),
};
pub const ValidationCheckEXT = enum(u32) {
    all = 0,
    shaders = 1,
    max_enum = 2147483647,
};
pub const ValidationFlagsEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    disabled_validation_check_count: u32 = @import("std").mem.zeroes(u32),
    p_disabled_validation_checks: [*c]const ValidationCheckEXT = @import("std").mem.zeroes([*c]const ValidationCheckEXT),
};
pub const PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT = PhysicalDeviceTextureCompressionASTCHDRFeatures;
pub const ImageViewASTCDecodeModeEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    decode_mode: Format = @import("std").mem.zeroes(Format),
};
pub const PhysicalDeviceASTCDecodeFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    decode_mode_shared_exponent: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineRobustnessBufferBehaviorEXT = PipelineRobustnessBufferBehavior;
pub const PipelineRobustnessImageBehaviorEXT = PipelineRobustnessImageBehavior;
pub const PhysicalDevicePipelineRobustnessFeaturesEXT = PhysicalDevicePipelineRobustnessFeatures;
pub const PhysicalDevicePipelineRobustnessPropertiesEXT = PhysicalDevicePipelineRobustnessProperties;
pub const PipelineRobustnessCreateInfoEXT = PipelineRobustnessCreateInfo;
pub const ConditionalRenderingFlagBitsEXT = enum(u32) {
    inverted_bit = 1,
    max_enum = 2147483647,
};
pub const ConditionalRenderingFlagsEXT = Flags;
pub const ConditionalRenderingBeginInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    flags: ConditionalRenderingFlagsEXT = @import("std").mem.zeroes(ConditionalRenderingFlagsEXT),
};
pub const PhysicalDeviceConditionalRenderingFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    conditional_rendering: Bool32 = @import("std").mem.zeroes(Bool32),
    inherited_conditional_rendering: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const CommandBufferInheritanceConditionalRenderingInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    conditional_rendering_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdBeginConditionalRenderingEXT = ?*const fn (CommandBuffer, [*c]const ConditionalRenderingBeginInfoEXT) callconv(.c) void;
pub const PFN_cmdEndConditionalRenderingEXT = ?*const fn (CommandBuffer) callconv(.c) void;
pub extern fn cmdBeginConditionalRenderingExt(command_buffer: CommandBuffer, p_conditional_rendering_begin: [*c]const ConditionalRenderingBeginInfoEXT) void;
pub extern fn cmdEndConditionalRenderingExt(command_buffer: CommandBuffer) void;
pub const ViewportWScalingNV = extern struct {
    xcoeff: f32 = @import("std").mem.zeroes(f32),
    ycoeff: f32 = @import("std").mem.zeroes(f32),
};
pub const PipelineViewportWScalingStateCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    viewport_wscaling_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    viewport_count: u32 = @import("std").mem.zeroes(u32),
    p_viewport_wscalings: [*c]const ViewportWScalingNV = @import("std").mem.zeroes([*c]const ViewportWScalingNV),
};
pub const PFN_cmdSetViewportWScalingNV = ?*const fn (CommandBuffer, u32, u32, [*c]const ViewportWScalingNV) callconv(.c) void;
pub extern fn cmdSetViewportWscalingNv(command_buffer: CommandBuffer, first_viewport: u32, viewport_count: u32, p_viewport_wscalings: [*c]const ViewportWScalingNV) void;
pub const PFN_releaseDisplayEXT = ?*const fn (PhysicalDevice, DisplayKHR) callconv(.c) Result;
pub extern fn releaseDisplayExt(physical_device: PhysicalDevice, display: DisplayKHR) Result;
pub const SurfaceCounterFlagBitsEXT = enum(u32) {
    vblank = 1,
    max_enum = 2147483647,
    const Self = @This();
    pub const vblank_bit = Self.vblank;
};
pub const SurfaceCounterFlagsEXT = Flags;
pub const SurfaceCapabilities2EXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_image_count: u32 = @import("std").mem.zeroes(u32),
    max_image_count: u32 = @import("std").mem.zeroes(u32),
    current_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    min_image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_image_array_layers: u32 = @import("std").mem.zeroes(u32),
    supported_transforms: SurfaceTransformFlagsKHR = @import("std").mem.zeroes(SurfaceTransformFlagsKHR),
    current_transform: SurfaceTransformFlagBits = @import("std").mem.zeroes(SurfaceTransformFlagBits),
    supported_composite_alpha: CompositeAlphaFlags = @import("std").mem.zeroes(CompositeAlphaFlags),
    supported_usage_flags: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    supported_surface_counters: SurfaceCounterFlagsEXT = @import("std").mem.zeroes(SurfaceCounterFlagsEXT),
};
pub const PFN_getPhysicalDeviceSurfaceCapabilities2EXT = ?*const fn (PhysicalDevice, SurfaceKHR, [*c]SurfaceCapabilities2EXT) callconv(.c) Result;
pub extern fn getPhysicalDeviceSurfaceCapabilities2Ext(physical_device: PhysicalDevice, surface: SurfaceKHR, p_surface_capabilities: [*c]SurfaceCapabilities2EXT) Result;
pub const DisplayPowerStateEXT = enum(u32) {
    off = 0,
    @"suspend" = 1,
    on = 2,
    max_enum = 2147483647,
};
pub const DeviceEventTypeEXT = enum(u32) {
    display_hotplug = 0,
    max_enum = 2147483647,
};
pub const DisplayEventTypeEXT = enum(u32) {
    first_pixel_out = 0,
    max_enum = 2147483647,
};
pub const DisplayPowerInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    power_state: DisplayPowerStateEXT = @import("std").mem.zeroes(DisplayPowerStateEXT),
};
pub const DeviceEventInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_event: DeviceEventTypeEXT = @import("std").mem.zeroes(DeviceEventTypeEXT),
};
pub const DisplayEventInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    display_event: DisplayEventTypeEXT = @import("std").mem.zeroes(DisplayEventTypeEXT),
};
pub const SwapchainCounterCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    surface_counters: SurfaceCounterFlagsEXT = @import("std").mem.zeroes(SurfaceCounterFlagsEXT),
};
pub const PFN_displayPowerControlEXT = ?*const fn (Device, DisplayKHR, [*c]const DisplayPowerInfoEXT) callconv(.c) Result;
pub const PFN_registerDeviceEventEXT = ?*const fn (Device, [*c]const DeviceEventInfoEXT, [*c]const AllocationCallbacks, [*c]Fence) callconv(.c) Result;
pub const PFN_registerDisplayEventEXT = ?*const fn (Device, DisplayKHR, [*c]const DisplayEventInfoEXT, [*c]const AllocationCallbacks, [*c]Fence) callconv(.c) Result;
pub const PFN_getSwapchainCounterEXT = ?*const fn (Device, SwapchainKHR, SurfaceCounterFlagBitsEXT, [*c]u64) callconv(.c) Result;
pub extern fn displayPowerControlExt(device: Device, display: DisplayKHR, p_display_power_info: [*c]const DisplayPowerInfoEXT) Result;
pub extern fn registerDeviceEventExt(device: Device, p_device_event_info: [*c]const DeviceEventInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_fence: [*c]Fence) Result;
pub extern fn registerDisplayEventExt(device: Device, display: DisplayKHR, p_display_event_info: [*c]const DisplayEventInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_fence: [*c]Fence) Result;
pub extern fn getSwapchainCounterExt(device: Device, swapchain: SwapchainKHR, counter: SurfaceCounterFlagBitsEXT, p_counter_value: [*c]u64) Result;
pub const RefreshCycleDurationGOOGLE = extern struct {
    refresh_duration: u64 = @import("std").mem.zeroes(u64),
};
pub const PastPresentationTimingGOOGLE = extern struct {
    present_id: u32 = @import("std").mem.zeroes(u32),
    desired_present_time: u64 = @import("std").mem.zeroes(u64),
    actual_present_time: u64 = @import("std").mem.zeroes(u64),
    earliest_present_time: u64 = @import("std").mem.zeroes(u64),
    present_margin: u64 = @import("std").mem.zeroes(u64),
};
pub const PresentTimeGOOGLE = extern struct {
    present_id: u32 = @import("std").mem.zeroes(u32),
    desired_present_time: u64 = @import("std").mem.zeroes(u64),
};
pub const PresentTimesInfoGOOGLE = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_times: [*c]const PresentTimeGOOGLE = @import("std").mem.zeroes([*c]const PresentTimeGOOGLE),
};
pub const PFN_getRefreshCycleDurationGOOGLE = ?*const fn (Device, SwapchainKHR, [*c]RefreshCycleDurationGOOGLE) callconv(.c) Result;
pub const PFN_getPastPresentationTimingGOOGLE = ?*const fn (Device, SwapchainKHR, [*c]u32, [*c]PastPresentationTimingGOOGLE) callconv(.c) Result;
pub extern fn getRefreshCycleDurationGoogle(device: Device, swapchain: SwapchainKHR, p_display_timing_properties: [*c]RefreshCycleDurationGOOGLE) Result;
pub extern fn getPastPresentationTimingGoogle(device: Device, swapchain: SwapchainKHR, p_presentation_timing_count: [*c]u32, p_presentation_timings: [*c]PastPresentationTimingGOOGLE) Result;
pub const PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    per_view_position_all_components: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MultiviewPerViewAttributesInfoNVX = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    per_view_attributes: Bool32 = @import("std").mem.zeroes(Bool32),
    per_view_attributes_position_xonly: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ViewportCoordinateSwizzleNV = enum(u32) {
    positive_x = 0,
    negative_x = 1,
    positive_y = 2,
    negative_y = 3,
    positive_z = 4,
    negative_z = 5,
    positive_w = 6,
    negative_w = 7,
    max_enum = 2147483647,
};
pub const PipelineViewportSwizzleStateCreateFlagsNV = Flags;
pub const ViewportSwizzleNV = extern struct {
    x: ViewportCoordinateSwizzleNV = @import("std").mem.zeroes(ViewportCoordinateSwizzleNV),
    y: ViewportCoordinateSwizzleNV = @import("std").mem.zeroes(ViewportCoordinateSwizzleNV),
    z: ViewportCoordinateSwizzleNV = @import("std").mem.zeroes(ViewportCoordinateSwizzleNV),
    w: ViewportCoordinateSwizzleNV = @import("std").mem.zeroes(ViewportCoordinateSwizzleNV),
};
pub const PipelineViewportSwizzleStateCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineViewportSwizzleStateCreateFlagsNV = @import("std").mem.zeroes(PipelineViewportSwizzleStateCreateFlagsNV),
    viewport_count: u32 = @import("std").mem.zeroes(u32),
    p_viewport_swizzles: [*c]const ViewportSwizzleNV = @import("std").mem.zeroes([*c]const ViewportSwizzleNV),
};
pub const DiscardRectangleModeEXT = enum(u32) {
    inclusive = 0,
    exclusive = 1,
    max_enum = 2147483647,
};
pub const PipelineDiscardRectangleStateCreateFlagsEXT = Flags;
pub const PhysicalDeviceDiscardRectanglePropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_discard_rectangles: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineDiscardRectangleStateCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineDiscardRectangleStateCreateFlagsEXT = @import("std").mem.zeroes(PipelineDiscardRectangleStateCreateFlagsEXT),
    discard_rectangle_mode: DiscardRectangleModeEXT = @import("std").mem.zeroes(DiscardRectangleModeEXT),
    discard_rectangle_count: u32 = @import("std").mem.zeroes(u32),
    p_discard_rectangles: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const PFN_cmdSetDiscardRectangleEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const Rect2D) callconv(.c) void;
pub const PFN_cmdSetDiscardRectangleEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDiscardRectangleModeEXT = ?*const fn (CommandBuffer, DiscardRectangleModeEXT) callconv(.c) void;
pub extern fn cmdSetDiscardRectangleExt(command_buffer: CommandBuffer, first_discard_rectangle: u32, discard_rectangle_count: u32, p_discard_rectangles: [*c]const Rect2D) void;
pub extern fn cmdSetDiscardRectangleEnableExt(command_buffer: CommandBuffer, discard_rectangle_enable: Bool32) void;
pub extern fn cmdSetDiscardRectangleModeExt(command_buffer: CommandBuffer, discard_rectangle_mode: DiscardRectangleModeEXT) void;
pub const ConservativeRasterizationModeEXT = enum(u32) {
    disabled = 0,
    overestimate = 1,
    underestimate = 2,
    max_enum = 2147483647,
};
pub const PipelineRasterizationConservativeStateCreateFlagsEXT = Flags;
pub const PhysicalDeviceConservativeRasterizationPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    primitive_overestimation_size: f32 = @import("std").mem.zeroes(f32),
    max_extra_primitive_overestimation_size: f32 = @import("std").mem.zeroes(f32),
    extra_primitive_overestimation_size_granularity: f32 = @import("std").mem.zeroes(f32),
    primitive_underestimation: Bool32 = @import("std").mem.zeroes(Bool32),
    conservative_point_and_line_rasterization: Bool32 = @import("std").mem.zeroes(Bool32),
    degenerate_triangles_rasterized: Bool32 = @import("std").mem.zeroes(Bool32),
    degenerate_lines_rasterized: Bool32 = @import("std").mem.zeroes(Bool32),
    fully_covered_fragment_shader_input_variable: Bool32 = @import("std").mem.zeroes(Bool32),
    conservative_rasterization_post_depth_coverage: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineRasterizationConservativeStateCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineRasterizationConservativeStateCreateFlagsEXT = @import("std").mem.zeroes(PipelineRasterizationConservativeStateCreateFlagsEXT),
    conservative_rasterization_mode: ConservativeRasterizationModeEXT = @import("std").mem.zeroes(ConservativeRasterizationModeEXT),
    extra_primitive_overestimation_size: f32 = @import("std").mem.zeroes(f32),
};
pub const PipelineRasterizationDepthClipStateCreateFlagsEXT = Flags;
pub const PhysicalDeviceDepthClipEnableFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    depth_clip_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineRasterizationDepthClipStateCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineRasterizationDepthClipStateCreateFlagsEXT = @import("std").mem.zeroes(PipelineRasterizationDepthClipStateCreateFlagsEXT),
    depth_clip_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const XYColorEXT = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
};
pub const HdrMetadataEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    display_primary_red: XYColorEXT = @import("std").mem.zeroes(XYColorEXT),
    display_primary_green: XYColorEXT = @import("std").mem.zeroes(XYColorEXT),
    display_primary_blue: XYColorEXT = @import("std").mem.zeroes(XYColorEXT),
    white_point: XYColorEXT = @import("std").mem.zeroes(XYColorEXT),
    max_luminance: f32 = @import("std").mem.zeroes(f32),
    min_luminance: f32 = @import("std").mem.zeroes(f32),
    max_content_light_level: f32 = @import("std").mem.zeroes(f32),
    max_frame_average_light_level: f32 = @import("std").mem.zeroes(f32),
};
pub const PFN_setHdrMetadataEXT = ?*const fn (Device, u32, [*c]const SwapchainKHR, [*c]const HdrMetadataEXT) callconv(.c) void;
pub extern fn setHdrMetadataExt(device: Device, swapchain_count: u32, p_swapchains: [*c]const SwapchainKHR, p_metadata: [*c]const HdrMetadataEXT) void;
pub const PhysicalDeviceRelaxedLineRasterizationFeaturesIMG = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    relaxed_line_rasterization: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DebugUtilsMessengerEXT = enum(u64) { null = 0, _ };
pub const DebugUtilsMessengerCallbackDataFlagsEXT = Flags;
pub const DebugUtilsMessageSeverityFlagBitsEXT = enum(u32) {
    verbose_bit = 1,
    info_bit = 16,
    warning_bit = 256,
    error_bit = 4096,
    max_enum = 2147483647,
};
pub const DebugUtilsMessageTypeFlagBitsEXT = enum(u32) {
    general_bit = 1,
    validation_bit = 2,
    performance_bit = 4,
    device_address_binding_bit = 8,
    max_enum = 2147483647,
};
pub const DebugUtilsMessageTypeFlagsEXT = Flags;
pub const DebugUtilsMessageSeverityFlagsEXT = Flags;
pub const DebugUtilsMessengerCreateFlagsEXT = Flags;
pub const DebugUtilsLabelEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_label_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    color: [4]f32 = @import("std").mem.zeroes([4]f32),
};
pub const DebugUtilsObjectNameInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    object_type: ObjectType = @import("std").mem.zeroes(ObjectType),
    object_handle: u64 = @import("std").mem.zeroes(u64),
    p_object_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const DebugUtilsMessengerCallbackDataEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DebugUtilsMessengerCallbackDataFlagsEXT = @import("std").mem.zeroes(DebugUtilsMessengerCallbackDataFlagsEXT),
    p_message_id_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    message_id_number: i32 = @import("std").mem.zeroes(i32),
    p_message: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    queue_label_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_labels: [*c]const DebugUtilsLabelEXT = @import("std").mem.zeroes([*c]const DebugUtilsLabelEXT),
    cmd_buf_label_count: u32 = @import("std").mem.zeroes(u32),
    p_cmd_buf_labels: [*c]const DebugUtilsLabelEXT = @import("std").mem.zeroes([*c]const DebugUtilsLabelEXT),
    object_count: u32 = @import("std").mem.zeroes(u32),
    p_objects: [*c]const DebugUtilsObjectNameInfoEXT = @import("std").mem.zeroes([*c]const DebugUtilsObjectNameInfoEXT),
};
pub const PFN_debugUtilsMessengerCallbackEXT = ?*const fn (DebugUtilsMessageSeverityFlagBitsEXT, DebugUtilsMessageTypeFlagsEXT, [*c]const DebugUtilsMessengerCallbackDataEXT, ?*anyopaque) callconv(.c) Bool32;
pub const DebugUtilsMessengerCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DebugUtilsMessengerCreateFlagsEXT = @import("std").mem.zeroes(DebugUtilsMessengerCreateFlagsEXT),
    message_severity: DebugUtilsMessageSeverityFlagsEXT = @import("std").mem.zeroes(DebugUtilsMessageSeverityFlagsEXT),
    message_type: DebugUtilsMessageTypeFlagsEXT = @import("std").mem.zeroes(DebugUtilsMessageTypeFlagsEXT),
    pfn_user_callback: PFN_debugUtilsMessengerCallbackEXT = @import("std").mem.zeroes(PFN_debugUtilsMessengerCallbackEXT),
    p_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const DebugUtilsObjectTagInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    object_type: ObjectType = @import("std").mem.zeroes(ObjectType),
    object_handle: u64 = @import("std").mem.zeroes(u64),
    tag_name: u64 = @import("std").mem.zeroes(u64),
    tag_size: usize = @import("std").mem.zeroes(usize),
    p_tag: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const PFN_setDebugUtilsObjectNameEXT = ?*const fn (Device, [*c]const DebugUtilsObjectNameInfoEXT) callconv(.c) Result;
pub const PFN_setDebugUtilsObjectTagEXT = ?*const fn (Device, [*c]const DebugUtilsObjectTagInfoEXT) callconv(.c) Result;
pub const PFN_queueBeginDebugUtilsLabelEXT = ?*const fn (Queue, [*c]const DebugUtilsLabelEXT) callconv(.c) void;
pub const PFN_queueEndDebugUtilsLabelEXT = ?*const fn (Queue) callconv(.c) void;
pub const PFN_queueInsertDebugUtilsLabelEXT = ?*const fn (Queue, [*c]const DebugUtilsLabelEXT) callconv(.c) void;
pub const PFN_cmdBeginDebugUtilsLabelEXT = ?*const fn (CommandBuffer, [*c]const DebugUtilsLabelEXT) callconv(.c) void;
pub const PFN_cmdEndDebugUtilsLabelEXT = ?*const fn (CommandBuffer) callconv(.c) void;
pub const PFN_cmdInsertDebugUtilsLabelEXT = ?*const fn (CommandBuffer, [*c]const DebugUtilsLabelEXT) callconv(.c) void;
pub const PFN_createDebugUtilsMessengerEXT = ?*const fn (Instance, [*c]const DebugUtilsMessengerCreateInfoEXT, [*c]const AllocationCallbacks, [*c]DebugUtilsMessengerEXT) callconv(.c) Result;
pub const PFN_destroyDebugUtilsMessengerEXT = ?*const fn (Instance, DebugUtilsMessengerEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_submitDebugUtilsMessageEXT = ?*const fn (Instance, DebugUtilsMessageSeverityFlagBitsEXT, DebugUtilsMessageTypeFlagsEXT, [*c]const DebugUtilsMessengerCallbackDataEXT) callconv(.c) void;
pub extern fn setDebugUtilsObjectNameExt(device: Device, p_name_info: [*c]const DebugUtilsObjectNameInfoEXT) Result;
pub extern fn setDebugUtilsObjectTagExt(device: Device, p_tag_info: [*c]const DebugUtilsObjectTagInfoEXT) Result;
pub extern fn queueBeginDebugUtilsLabelExt(queue: Queue, p_label_info: [*c]const DebugUtilsLabelEXT) void;
pub extern fn queueEndDebugUtilsLabelExt(queue: Queue) void;
pub extern fn queueInsertDebugUtilsLabelExt(queue: Queue, p_label_info: [*c]const DebugUtilsLabelEXT) void;
pub extern fn cmdBeginDebugUtilsLabelExt(command_buffer: CommandBuffer, p_label_info: [*c]const DebugUtilsLabelEXT) void;
pub extern fn cmdEndDebugUtilsLabelExt(command_buffer: CommandBuffer) void;
pub extern fn cmdInsertDebugUtilsLabelExt(command_buffer: CommandBuffer, p_label_info: [*c]const DebugUtilsLabelEXT) void;
pub extern fn createDebugUtilsMessengerExt(instance: Instance, p_create_info: [*c]const DebugUtilsMessengerCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_messenger: [*c]DebugUtilsMessengerEXT) Result;
pub extern fn destroyDebugUtilsMessengerExt(instance: Instance, messenger: DebugUtilsMessengerEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn submitDebugUtilsMessageExt(instance: Instance, message_severity: DebugUtilsMessageSeverityFlagBitsEXT, message_types: DebugUtilsMessageTypeFlagsEXT, p_callback_data: [*c]const DebugUtilsMessengerCallbackDataEXT) void;
pub const SamplerReductionModeEXT = SamplerReductionMode;
pub const SamplerReductionModeCreateInfoEXT = SamplerReductionModeCreateInfo;
pub const PhysicalDeviceSamplerFilterMinmaxPropertiesEXT = PhysicalDeviceSamplerFilterMinmaxProperties;
pub const AttachmentSampleCountInfoAMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachment_samples: [*c]const SampleCountFlagBits = @import("std").mem.zeroes([*c]const SampleCountFlagBits),
    depth_stencil_attachment_samples: SampleCountFlagBits = @import("std").mem.zeroes(SampleCountFlagBits),
};
pub const PhysicalDeviceInlineUniformBlockFeaturesEXT = PhysicalDeviceInlineUniformBlockFeatures;
pub const PhysicalDeviceInlineUniformBlockPropertiesEXT = PhysicalDeviceInlineUniformBlockProperties;
pub const WriteDescriptorSetInlineUniformBlockEXT = WriteDescriptorSetInlineUniformBlock;
pub const DescriptorPoolInlineUniformBlockCreateInfoEXT = DescriptorPoolInlineUniformBlockCreateInfo;
pub const SampleLocationEXT = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
};
pub const SampleLocationsInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    sample_locations_per_pixel: SampleCountFlagBits = @import("std").mem.zeroes(SampleCountFlagBits),
    sample_location_grid_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    sample_locations_count: u32 = @import("std").mem.zeroes(u32),
    p_sample_locations: [*c]const SampleLocationEXT = @import("std").mem.zeroes([*c]const SampleLocationEXT),
};
pub const AttachmentSampleLocationsEXT = extern struct {
    attachment_index: u32 = @import("std").mem.zeroes(u32),
    sample_locations_info: SampleLocationsInfoEXT = @import("std").mem.zeroes(SampleLocationsInfoEXT),
};
pub const SubpassSampleLocationsEXT = extern struct {
    subpass_index: u32 = @import("std").mem.zeroes(u32),
    sample_locations_info: SampleLocationsInfoEXT = @import("std").mem.zeroes(SampleLocationsInfoEXT),
};
pub const RenderPassSampleLocationsBeginInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    attachment_initial_sample_locations_count: u32 = @import("std").mem.zeroes(u32),
    p_attachment_initial_sample_locations: [*c]const AttachmentSampleLocationsEXT = @import("std").mem.zeroes([*c]const AttachmentSampleLocationsEXT),
    post_subpass_sample_locations_count: u32 = @import("std").mem.zeroes(u32),
    p_post_subpass_sample_locations: [*c]const SubpassSampleLocationsEXT = @import("std").mem.zeroes([*c]const SubpassSampleLocationsEXT),
};
pub const PipelineSampleLocationsStateCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    sample_locations_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    sample_locations_info: SampleLocationsInfoEXT = @import("std").mem.zeroes(SampleLocationsInfoEXT),
};
pub const PhysicalDeviceSampleLocationsPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    sample_location_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    max_sample_location_grid_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    sample_location_coordinate_range: [2]f32 = @import("std").mem.zeroes([2]f32),
    sample_location_sub_pixel_bits: u32 = @import("std").mem.zeroes(u32),
    variable_sample_locations: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MultisamplePropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_sample_location_grid_size: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const PFN_cmdSetSampleLocationsEXT = ?*const fn (CommandBuffer, [*c]const SampleLocationsInfoEXT) callconv(.c) void;
pub const PFN_getPhysicalDeviceMultisamplePropertiesEXT = ?*const fn (PhysicalDevice, SampleCountFlagBits, [*c]MultisamplePropertiesEXT) callconv(.c) void;
pub extern fn cmdSetSampleLocationsExt(command_buffer: CommandBuffer, p_sample_locations_info: [*c]const SampleLocationsInfoEXT) void;
pub extern fn getPhysicalDeviceMultisamplePropertiesExt(physical_device: PhysicalDevice, samples: SampleCountFlagBits, p_multisample_properties: [*c]MultisamplePropertiesEXT) void;
pub const BlendOverlapEXT = enum(u32) {
    uncorrelated = 0,
    disjoint = 1,
    conjoint = 2,
    max_enum = 2147483647,
};
pub const PhysicalDeviceBlendOperationAdvancedFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    advanced_blend_coherent_operations: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceBlendOperationAdvancedPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    advanced_blend_max_color_attachments: u32 = @import("std").mem.zeroes(u32),
    advanced_blend_independent_blend: Bool32 = @import("std").mem.zeroes(Bool32),
    advanced_blend_non_premultiplied_src_color: Bool32 = @import("std").mem.zeroes(Bool32),
    advanced_blend_non_premultiplied_dst_color: Bool32 = @import("std").mem.zeroes(Bool32),
    advanced_blend_correlated_overlap: Bool32 = @import("std").mem.zeroes(Bool32),
    advanced_blend_all_operations: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineColorBlendAdvancedStateCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_premultiplied: Bool32 = @import("std").mem.zeroes(Bool32),
    dst_premultiplied: Bool32 = @import("std").mem.zeroes(Bool32),
    blend_overlap: BlendOverlapEXT = @import("std").mem.zeroes(BlendOverlapEXT),
};
pub const PipelineCoverageToColorStateCreateFlagsNV = Flags;
pub const PipelineCoverageToColorStateCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCoverageToColorStateCreateFlagsNV = @import("std").mem.zeroes(PipelineCoverageToColorStateCreateFlagsNV),
    coverage_to_color_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    coverage_to_color_location: u32 = @import("std").mem.zeroes(u32),
};
pub const CoverageModulationModeNV = enum(u32) {
    none = 0,
    rgb = 1,
    alpha = 2,
    rgba = 3,
    max_enum = 2147483647,
};
pub const PipelineCoverageModulationStateCreateFlagsNV = Flags;
pub const PipelineCoverageModulationStateCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCoverageModulationStateCreateFlagsNV = @import("std").mem.zeroes(PipelineCoverageModulationStateCreateFlagsNV),
    coverage_modulation_mode: CoverageModulationModeNV = @import("std").mem.zeroes(CoverageModulationModeNV),
    coverage_modulation_table_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    coverage_modulation_table_count: u32 = @import("std").mem.zeroes(u32),
    p_coverage_modulation_table: [*c]const f32 = @import("std").mem.zeroes([*c]const f32),
};
pub const AttachmentSampleCountInfoNV = AttachmentSampleCountInfoAMD;
pub const PhysicalDeviceShaderSMBuiltinsPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_smcount: u32 = @import("std").mem.zeroes(u32),
    shader_warps_per_sm: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceShaderSMBuiltinsFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_smbuiltins: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DrmFormatModifierPropertiesEXT = extern struct {
    drm_format_modifier: u64 = @import("std").mem.zeroes(u64),
    drm_format_modifier_plane_count: u32 = @import("std").mem.zeroes(u32),
    drm_format_modifier_tiling_features: FormatFeatureFlags = @import("std").mem.zeroes(FormatFeatureFlags),
};
pub const DrmFormatModifierPropertiesListEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    drm_format_modifier_count: u32 = @import("std").mem.zeroes(u32),
    p_drm_format_modifier_properties: [*c]DrmFormatModifierPropertiesEXT = @import("std").mem.zeroes([*c]DrmFormatModifierPropertiesEXT),
};
pub const PhysicalDeviceImageDrmFormatModifierInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    drm_format_modifier: u64 = @import("std").mem.zeroes(u64),
    sharing_mode: SharingMode = @import("std").mem.zeroes(SharingMode),
    queue_family_index_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_family_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const ImageDrmFormatModifierListCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    drm_format_modifier_count: u32 = @import("std").mem.zeroes(u32),
    p_drm_format_modifiers: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
};
pub const ImageDrmFormatModifierExplicitCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    drm_format_modifier: u64 = @import("std").mem.zeroes(u64),
    drm_format_modifier_plane_count: u32 = @import("std").mem.zeroes(u32),
    p_plane_layouts: [*c]const SubresourceLayout = @import("std").mem.zeroes([*c]const SubresourceLayout),
};
pub const ImageDrmFormatModifierPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    drm_format_modifier: u64 = @import("std").mem.zeroes(u64),
};
pub const DrmFormatModifierProperties2EXT = extern struct {
    drm_format_modifier: u64 = @import("std").mem.zeroes(u64),
    drm_format_modifier_plane_count: u32 = @import("std").mem.zeroes(u32),
    drm_format_modifier_tiling_features: FormatFeatureFlags2 = @import("std").mem.zeroes(FormatFeatureFlags2),
};
pub const DrmFormatModifierPropertiesList2EXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    drm_format_modifier_count: u32 = @import("std").mem.zeroes(u32),
    p_drm_format_modifier_properties: [*c]DrmFormatModifierProperties2EXT = @import("std").mem.zeroes([*c]DrmFormatModifierProperties2EXT),
};
pub const PFN_getImageDrmFormatModifierPropertiesEXT = ?*const fn (Device, Image, [*c]ImageDrmFormatModifierPropertiesEXT) callconv(.c) Result;
pub extern fn getImageDrmFormatModifierPropertiesExt(device: Device, image: Image, p_properties: [*c]ImageDrmFormatModifierPropertiesEXT) Result;
pub const ValidationCacheEXT = enum(u64) { null = 0, _ };
pub const ValidationCacheHeaderVersionEXT = enum(u32) {
    one = 1,
    max_enum = 2147483647,
};
pub const ValidationCacheCreateFlagsEXT = Flags;
pub const ValidationCacheCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ValidationCacheCreateFlagsEXT = @import("std").mem.zeroes(ValidationCacheCreateFlagsEXT),
    initial_data_size: usize = @import("std").mem.zeroes(usize),
    p_initial_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const ShaderModuleValidationCacheCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    validation_cache: ValidationCacheEXT = @import("std").mem.zeroes(ValidationCacheEXT),
};
pub const PFN_createValidationCacheEXT = ?*const fn (Device, [*c]const ValidationCacheCreateInfoEXT, [*c]const AllocationCallbacks, [*c]ValidationCacheEXT) callconv(.c) Result;
pub const PFN_destroyValidationCacheEXT = ?*const fn (Device, ValidationCacheEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_mergeValidationCachesEXT = ?*const fn (Device, ValidationCacheEXT, u32, [*c]const ValidationCacheEXT) callconv(.c) Result;
pub const PFN_getValidationCacheDataEXT = ?*const fn (Device, ValidationCacheEXT, [*c]usize, ?*anyopaque) callconv(.c) Result;
pub extern fn createValidationCacheExt(device: Device, p_create_info: [*c]const ValidationCacheCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_validation_cache: [*c]ValidationCacheEXT) Result;
pub extern fn destroyValidationCacheExt(device: Device, validation_cache: ValidationCacheEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn mergeValidationCachesExt(device: Device, dst_cache: ValidationCacheEXT, src_cache_count: u32, p_src_caches: [*c]const ValidationCacheEXT) Result;
pub extern fn getValidationCacheDataExt(device: Device, validation_cache: ValidationCacheEXT, p_data_size: [*c]usize, p_data: ?*anyopaque) Result;
pub const DescriptorBindingFlagBitsEXT = DescriptorBindingFlagBits;
pub const DescriptorBindingFlagsEXT = DescriptorBindingFlags;
pub const DescriptorSetLayoutBindingFlagsCreateInfoEXT = DescriptorSetLayoutBindingFlagsCreateInfo;
pub const PhysicalDeviceDescriptorIndexingFeaturesEXT = PhysicalDeviceDescriptorIndexingFeatures;
pub const PhysicalDeviceDescriptorIndexingPropertiesEXT = PhysicalDeviceDescriptorIndexingProperties;
pub const DescriptorSetVariableDescriptorCountAllocateInfoEXT = DescriptorSetVariableDescriptorCountAllocateInfo;
pub const DescriptorSetVariableDescriptorCountLayoutSupportEXT = DescriptorSetVariableDescriptorCountLayoutSupport;
pub const ShadingRatePaletteEntryNV = enum(u32) {
    no_invocations = 0,
    @"16_invocations_per_pixel" = 1,
    @"8_invocations_per_pixel" = 2,
    @"4_invocations_per_pixel" = 3,
    @"2_invocations_per_pixel" = 4,
    @"1_invocation_per_pixel" = 5,
    @"1_invocation_per_2x1_pixels" = 6,
    @"1_invocation_per_1x2_pixels" = 7,
    @"1_invocation_per_2x2_pixels" = 8,
    @"1_invocation_per_4x2_pixels" = 9,
    @"1_invocation_per_2x4_pixels" = 10,
    @"1_invocation_per_4x4_pixels" = 11,
    max_enum = 2147483647,
};
pub const CoarseSampleOrderTypeNV = enum(u32) {
    default = 0,
    custom = 1,
    pixel_major = 2,
    sample_major = 3,
    max_enum = 2147483647,
};
pub const ShadingRatePaletteNV = extern struct {
    shading_rate_palette_entry_count: u32 = @import("std").mem.zeroes(u32),
    p_shading_rate_palette_entries: [*c]const ShadingRatePaletteEntryNV = @import("std").mem.zeroes([*c]const ShadingRatePaletteEntryNV),
};
pub const PipelineViewportShadingRateImageStateCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    shading_rate_image_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    viewport_count: u32 = @import("std").mem.zeroes(u32),
    p_shading_rate_palettes: [*c]const ShadingRatePaletteNV = @import("std").mem.zeroes([*c]const ShadingRatePaletteNV),
};
pub const PhysicalDeviceShadingRateImageFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shading_rate_image: Bool32 = @import("std").mem.zeroes(Bool32),
    shading_rate_coarse_sample_order: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShadingRateImagePropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shading_rate_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    shading_rate_palette_size: u32 = @import("std").mem.zeroes(u32),
    shading_rate_max_coarse_samples: u32 = @import("std").mem.zeroes(u32),
};
pub const CoarseSampleLocationNV = extern struct {
    pixel_x: u32 = @import("std").mem.zeroes(u32),
    pixel_y: u32 = @import("std").mem.zeroes(u32),
    sample: u32 = @import("std").mem.zeroes(u32),
};
pub const CoarseSampleOrderCustomNV = extern struct {
    shading_rate: ShadingRatePaletteEntryNV = @import("std").mem.zeroes(ShadingRatePaletteEntryNV),
    sample_count: u32 = @import("std").mem.zeroes(u32),
    sample_location_count: u32 = @import("std").mem.zeroes(u32),
    p_sample_locations: [*c]const CoarseSampleLocationNV = @import("std").mem.zeroes([*c]const CoarseSampleLocationNV),
};
pub const PipelineViewportCoarseSampleOrderStateCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    sample_order_type: CoarseSampleOrderTypeNV = @import("std").mem.zeroes(CoarseSampleOrderTypeNV),
    custom_sample_order_count: u32 = @import("std").mem.zeroes(u32),
    p_custom_sample_orders: [*c]const CoarseSampleOrderCustomNV = @import("std").mem.zeroes([*c]const CoarseSampleOrderCustomNV),
};
pub const PFN_cmdBindShadingRateImageNV = ?*const fn (CommandBuffer, ImageView, ImageLayout) callconv(.c) void;
pub const PFN_cmdSetViewportShadingRatePaletteNV = ?*const fn (CommandBuffer, u32, u32, [*c]const ShadingRatePaletteNV) callconv(.c) void;
pub const PFN_cmdSetCoarseSampleOrderNV = ?*const fn (CommandBuffer, CoarseSampleOrderTypeNV, u32, [*c]const CoarseSampleOrderCustomNV) callconv(.c) void;
pub extern fn cmdBindShadingRateImageNv(command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout) void;
pub extern fn cmdSetViewportShadingRatePaletteNv(command_buffer: CommandBuffer, first_viewport: u32, viewport_count: u32, p_shading_rate_palettes: [*c]const ShadingRatePaletteNV) void;
pub extern fn cmdSetCoarseSampleOrderNv(command_buffer: CommandBuffer, sample_order_type: CoarseSampleOrderTypeNV, custom_sample_order_count: u32, p_custom_sample_orders: [*c]const CoarseSampleOrderCustomNV) void;
pub const AccelerationStructureNV = enum(u64) { null = 0, _ };
pub const RayTracingShaderGroupTypeKHR = enum(u32) {
    general = 0,
    triangles_hit_group = 1,
    procedural_hit_group = 2,
    max_enum = 2147483647,
    const Self = @This();
    pub const procedural_hit_group_nv = Self.procedural_hit_group;
    pub const triangles_hit_group_nv = Self.triangles_hit_group;
    pub const general_nv = Self.general;
};
pub const RayTracingShaderGroupTypeNV = RayTracingShaderGroupTypeKHR;
pub const GeometryTypeKHR = enum(u32) {
    triangles = 0,
    aabbs = 1,
    instances = 2,
    spheres_nv = 1000429004,
    linear_swept_spheres_nv = 1000429005,
    max_enum = 2147483647,
    const Self = @This();
    pub const aabbs_nv = Self.aabbs;
    pub const triangles_nv = Self.triangles;
};
pub const GeometryTypeNV = GeometryTypeKHR;
pub const AccelerationStructureTypeKHR = enum(u32) {
    top_level = 0,
    bottom_level = 1,
    generic = 2,
    max_enum = 2147483647,
    const Self = @This();
    pub const bottom_level_nv = Self.bottom_level;
    pub const top_level_nv = Self.top_level;
};
pub const AccelerationStructureTypeNV = AccelerationStructureTypeKHR;
pub const CopyAccelerationStructureModeKHR = enum(u32) {
    clone = 0,
    compact = 1,
    serialize = 2,
    deserialize = 3,
    max_enum = 2147483647,
    const Self = @This();
    pub const compact_nv = Self.compact;
    pub const clone_nv = Self.clone;
};
pub const CopyAccelerationStructureModeNV = CopyAccelerationStructureModeKHR;
pub const AccelerationStructureMemoryRequirementsTypeNV = enum(u32) {
    object = 0,
    build_scratch = 1,
    update_scratch = 2,
    max_enum = 2147483647,
};
pub const GeometryFlagBits = enum(u32) {
    opaque_bit_nv = 1,
    no_duplicate_any_hit_invocation_bit_nv = 2,
    flag_bits_max_enum_khr = 2147483647,
    const Self = @This();
    pub const no_duplicate_any_hit_invocation_bit_khr = Self.no_duplicate_any_hit_invocation_bit_nv;
    pub const opaque_bit_khr = Self.opaque_bit_nv;
};
pub const GeometryFlags = PES(GeometryFlagBits);
pub const GeometryInstanceFlagBits = enum(u32) {
    triangle_cull_disable_bit_nv = 1,
    triangle_flip_facing_bit_khr = 2,
    force_opaque_bit_nv = 4,
    force_no_opaque_bit_nv = 8,
    force_opacity_micromap_2_state_ext = 16,
    disable_opacity_micromaps_ext = 32,
    flag_bits_max_enum_khr = 2147483647,
    const Self = @This();
    pub const triangle_front_counterclockwise_bit_khr = Self.triangle_front_counterclockwise_bit_nv;
    pub const force_no_opaque_bit_khr = Self.force_no_opaque_bit_nv;
    pub const force_opaque_bit_khr = Self.force_opaque_bit_nv;
    pub const triangle_front_counterclockwise_bit_nv = Self.triangle_flip_facing_bit_khr;
    pub const triangle_facing_cull_disable_bit_khr = Self.triangle_cull_disable_bit_nv;
};
pub const GeometryInstanceFlags = PES(GeometryInstanceFlagBits);
pub const BuildAccelerationStructureFlagBits = enum(u32) {
    allow_update_bit_nv = 1,
    allow_compaction_bit_nv = 2,
    prefer_fast_trace_bit_nv = 4,
    prefer_fast_build_bit_nv = 8,
    low_memory_bit_nv = 16,
    motion_bit_nv = 32,
    allow_opacity_micromap_update_ext = 64,
    allow_disable_opacity_micromaps_ext = 128,
    allow_opacity_micromap_data_update_ext = 256,
    allow_data_access_khr = 2048,
    flag_bits_max_enum_khr = 2147483647,
    const Self = @This();
    pub const low_memory_bit_khr = Self.low_memory_bit_nv;
    pub const prefer_fast_build_bit_khr = Self.prefer_fast_build_bit_nv;
    pub const prefer_fast_trace_bit_khr = Self.prefer_fast_trace_bit_nv;
    pub const allow_compaction_bit_khr = Self.allow_compaction_bit_nv;
    pub const allow_update_bit_khr = Self.allow_update_bit_nv;
};
pub const BuildAccelerationStructureFlags = PES(BuildAccelerationStructureFlagBits);
pub const RayTracingShaderGroupCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: RayTracingShaderGroupTypeKHR = @import("std").mem.zeroes(RayTracingShaderGroupTypeKHR),
    general_shader: u32 = @import("std").mem.zeroes(u32),
    closest_hit_shader: u32 = @import("std").mem.zeroes(u32),
    any_hit_shader: u32 = @import("std").mem.zeroes(u32),
    intersection_shader: u32 = @import("std").mem.zeroes(u32),
};
pub const RayTracingPipelineCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCreateFlags = @import("std").mem.zeroes(PipelineCreateFlags),
    stage_count: u32 = @import("std").mem.zeroes(u32),
    p_stages: [*c]const PipelineShaderStageCreateInfo = @import("std").mem.zeroes([*c]const PipelineShaderStageCreateInfo),
    group_count: u32 = @import("std").mem.zeroes(u32),
    p_groups: [*c]const RayTracingShaderGroupCreateInfoNV = @import("std").mem.zeroes([*c]const RayTracingShaderGroupCreateInfoNV),
    max_recursion_depth: u32 = @import("std").mem.zeroes(u32),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    base_pipeline_handle: Pipeline = @import("std").mem.zeroes(Pipeline),
    base_pipeline_index: i32 = @import("std").mem.zeroes(i32),
};
pub const GeometryTrianglesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    vertex_data: Buffer = @import("std").mem.zeroes(Buffer),
    vertex_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    vertex_count: u32 = @import("std").mem.zeroes(u32),
    vertex_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    vertex_format: Format = @import("std").mem.zeroes(Format),
    index_data: Buffer = @import("std").mem.zeroes(Buffer),
    index_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    index_count: u32 = @import("std").mem.zeroes(u32),
    index_type: IndexType = @import("std").mem.zeroes(IndexType),
    transform_data: Buffer = @import("std").mem.zeroes(Buffer),
    transform_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const GeometryAABBNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    aabb_data: Buffer = @import("std").mem.zeroes(Buffer),
    num_aabbs: u32 = @import("std").mem.zeroes(u32),
    stride: u32 = @import("std").mem.zeroes(u32),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const GeometryDataNV = extern struct {
    triangles: GeometryTrianglesNV = @import("std").mem.zeroes(GeometryTrianglesNV),
    aabbs: GeometryAABBNV = @import("std").mem.zeroes(GeometryAABBNV),
};
pub const GeometryNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    geometry_type: GeometryTypeKHR = @import("std").mem.zeroes(GeometryTypeKHR),
    geometry: GeometryDataNV = @import("std").mem.zeroes(GeometryDataNV),
    flags: GeometryFlags = @import("std").mem.zeroes(GeometryFlags),
};
pub const BindAccelerationStructureMemoryInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acceleration_structure: AccelerationStructureNV = @import("std").mem.zeroes(AccelerationStructureNV),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    memory_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    device_index_count: u32 = @import("std").mem.zeroes(u32),
    p_device_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const WriteDescriptorSetAccelerationStructureNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acceleration_structure_count: u32 = @import("std").mem.zeroes(u32),
    p_acceleration_structures: [*c]const AccelerationStructureNV = @import("std").mem.zeroes([*c]const AccelerationStructureNV),
};
pub const AccelerationStructureMemoryRequirementsInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: AccelerationStructureMemoryRequirementsTypeNV = @import("std").mem.zeroes(AccelerationStructureMemoryRequirementsTypeNV),
    acceleration_structure: AccelerationStructureNV = @import("std").mem.zeroes(AccelerationStructureNV),
};
pub const PhysicalDeviceRayTracingPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_group_handle_size: u32 = @import("std").mem.zeroes(u32),
    max_recursion_depth: u32 = @import("std").mem.zeroes(u32),
    max_shader_group_stride: u32 = @import("std").mem.zeroes(u32),
    shader_group_base_alignment: u32 = @import("std").mem.zeroes(u32),
    max_geometry_count: u64 = @import("std").mem.zeroes(u64),
    max_instance_count: u64 = @import("std").mem.zeroes(u64),
    max_triangle_count: u64 = @import("std").mem.zeroes(u64),
    max_descriptor_set_acceleration_structures: u32 = @import("std").mem.zeroes(u32),
};
pub const TransformMatrixKHR = extern struct {
    matrix: [3][4]f32 = @import("std").mem.zeroes([3][4]f32),
};
pub const TransformMatrixNV = TransformMatrixKHR;
pub const AabbPositionsKHR = extern struct {
    min_x: f32 = @import("std").mem.zeroes(f32),
    min_y: f32 = @import("std").mem.zeroes(f32),
    min_z: f32 = @import("std").mem.zeroes(f32),
    max_x: f32 = @import("std").mem.zeroes(f32),
    max_y: f32 = @import("std").mem.zeroes(f32),
    max_z: f32 = @import("std").mem.zeroes(f32),
};
pub const AabbPositionsNV = AabbPositionsKHR;
pub const AccelerationStructureInstanceKHR = enum(u64) { null = 0, _ };
pub const AccelerationStructureInstanceNV = AccelerationStructureInstanceKHR;
pub const PFN_destroyAccelerationStructureNV = ?*const fn (Device, AccelerationStructureNV, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getAccelerationStructureMemoryRequirementsNV = ?*const fn (Device, [*c]const AccelerationStructureMemoryRequirementsInfoNV, [*c]MemoryRequirements2KHR) callconv(.c) void;
pub const PFN_bindAccelerationStructureMemoryNV = ?*const fn (Device, u32, [*c]const BindAccelerationStructureMemoryInfoNV) callconv(.c) Result;
pub const PFN_cmdCopyAccelerationStructureNV = ?*const fn (CommandBuffer, AccelerationStructureNV, AccelerationStructureNV, CopyAccelerationStructureModeKHR) callconv(.c) void;
pub const PFN_cmdTraceRaysNV = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, DeviceSize, Buffer, DeviceSize, DeviceSize, Buffer, DeviceSize, DeviceSize, u32, u32, u32) callconv(.c) void;
pub const PFN_createRayTracingPipelinesNV = ?*const fn (Device, PipelineCache, u32, [*c]const RayTracingPipelineCreateInfoNV, [*c]const AllocationCallbacks, [*c]Pipeline) callconv(.c) Result;
pub const PFN_getRayTracingShaderGroupHandlesKHR = ?*const fn (Device, Pipeline, u32, u32, usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_getRayTracingShaderGroupHandlesNV = ?*const fn (Device, Pipeline, u32, u32, usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_getAccelerationStructureHandleNV = ?*const fn (Device, AccelerationStructureNV, usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_cmdWriteAccelerationStructuresPropertiesNV = ?*const fn (CommandBuffer, u32, [*c]const AccelerationStructureNV, QueryType, QueryPool, u32) callconv(.c) void;
pub const PFN_compileDeferredNV = ?*const fn (Device, Pipeline, u32) callconv(.c) Result;
pub extern fn destroyAccelerationStructureNv(device: Device, acceleration_structure: AccelerationStructureNV, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getAccelerationStructureMemoryRequirementsNv(device: Device, p_info: [*c]const AccelerationStructureMemoryRequirementsInfoNV, p_memory_requirements: [*c]MemoryRequirements2KHR) void;
pub extern fn bindAccelerationStructureMemoryNv(device: Device, bind_info_count: u32, p_bind_infos: [*c]const BindAccelerationStructureMemoryInfoNV) Result;
pub extern fn cmdCopyAccelerationStructureNv(command_buffer: CommandBuffer, dst: AccelerationStructureNV, src: AccelerationStructureNV, mode: CopyAccelerationStructureModeKHR) void;
pub extern fn cmdTraceRaysNv(command_buffer: CommandBuffer, raygen_shader_binding_table_buffer: Buffer, raygen_shader_binding_offset: DeviceSize, miss_shader_binding_table_buffer: Buffer, miss_shader_binding_offset: DeviceSize, miss_shader_binding_stride: DeviceSize, hit_shader_binding_table_buffer: Buffer, hit_shader_binding_offset: DeviceSize, hit_shader_binding_stride: DeviceSize, callable_shader_binding_table_buffer: Buffer, callable_shader_binding_offset: DeviceSize, callable_shader_binding_stride: DeviceSize, width: u32, height: u32, depth: u32) void;
pub extern fn createRayTracingPipelinesNv(device: Device, pipeline_cache: PipelineCache, create_info_count: u32, p_create_infos: [*c]const RayTracingPipelineCreateInfoNV, p_allocator: [*c]const AllocationCallbacks, p_pipelines: [*c]Pipeline) Result;
pub extern fn getRayTracingShaderGroupHandlesKhr(device: Device, pipeline: Pipeline, first_group: u32, group_count: u32, data_size: usize, p_data: ?*anyopaque) Result;
pub extern fn getRayTracingShaderGroupHandlesNv(device: Device, pipeline: Pipeline, first_group: u32, group_count: u32, data_size: usize, p_data: ?*anyopaque) Result;
pub extern fn getAccelerationStructureHandleNv(device: Device, acceleration_structure: AccelerationStructureNV, data_size: usize, p_data: ?*anyopaque) Result;
pub extern fn cmdWriteAccelerationStructuresPropertiesNv(command_buffer: CommandBuffer, acceleration_structure_count: u32, p_acceleration_structures: [*c]const AccelerationStructureNV, query_type: QueryType, query_pool: QueryPool, first_query: u32) void;
pub extern fn compileDeferredNv(device: Device, pipeline: Pipeline, shader: u32) Result;
pub const PhysicalDeviceRepresentativeFragmentTestFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    representative_fragment_test: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineRepresentativeFragmentTestStateCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    representative_fragment_test_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImageViewImageFormatInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_view_type: ImageViewType = @import("std").mem.zeroes(ImageViewType),
};
pub const FilterCubicImageViewImageFormatPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    filter_cubic: Bool32 = @import("std").mem.zeroes(Bool32),
    filter_cubic_minmax: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const QueueGlobalPriorityEXT = QueueGlobalPriority;
pub const DeviceQueueGlobalPriorityCreateInfoEXT = DeviceQueueGlobalPriorityCreateInfo;
pub const ImportMemoryHostPointerInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_type: ExternalMemoryHandleTypeFlagBits = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagBits),
    p_host_pointer: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const MemoryHostPointerPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_type_bits: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceExternalMemoryHostPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_imported_host_pointer_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PFN_getMemoryHostPointerPropertiesEXT = ?*const fn (Device, ExternalMemoryHandleTypeFlagBits, ?*const anyopaque, [*c]MemoryHostPointerPropertiesEXT) callconv(.c) Result;
pub extern fn getMemoryHostPointerPropertiesExt(device: Device, handle_type: ExternalMemoryHandleTypeFlagBits, p_host_pointer: ?*const anyopaque, p_memory_host_pointer_properties: [*c]MemoryHostPointerPropertiesEXT) Result;
pub const PFN_cmdWriteBufferMarkerAMD = ?*const fn (CommandBuffer, PipelineStageFlagBits, Buffer, DeviceSize, u32) callconv(.c) void;
pub const PFN_cmdWriteBufferMarker2AMD = ?*const fn (CommandBuffer, PipelineStageFlags2, Buffer, DeviceSize, u32) callconv(.c) void;
pub extern fn cmdWriteBufferMarkerAmd(command_buffer: CommandBuffer, pipeline_stage: PipelineStageFlagBits, dst_buffer: Buffer, dst_offset: DeviceSize, marker: u32) void;
pub extern fn cmdWriteBufferMarker2Amd(command_buffer: CommandBuffer, stage: PipelineStageFlags2, dst_buffer: Buffer, dst_offset: DeviceSize, marker: u32) void;
pub const PipelineCompilerControlFlagBitsAMD = enum(u32) {
    max_enum = 2147483647,
};
pub const PipelineCompilerControlFlagsAMD = Flags;
pub const PipelineCompilerControlCreateInfoAMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    compiler_control_flags: PipelineCompilerControlFlagsAMD = @import("std").mem.zeroes(PipelineCompilerControlFlagsAMD),
};
pub const TimeDomainEXT = TimeDomainKHR;
pub const CalibratedTimestampInfoEXT = CalibratedTimestampInfoKHR;
pub const PFN_getPhysicalDeviceCalibrateableTimeDomainsEXT = ?*const fn (PhysicalDevice, [*c]u32, [*c]TimeDomainKHR) callconv(.c) Result;
pub const PFN_getCalibratedTimestampsEXT = ?*const fn (Device, u32, [*c]const CalibratedTimestampInfoKHR, [*c]u64, [*c]u64) callconv(.c) Result;
pub extern fn getPhysicalDeviceCalibrateableTimeDomainsExt(physical_device: PhysicalDevice, p_time_domain_count: [*c]u32, p_time_domains: [*c]TimeDomainKHR) Result;
pub extern fn getCalibratedTimestampsExt(device: Device, timestamp_count: u32, p_timestamp_infos: [*c]const CalibratedTimestampInfoKHR, p_timestamps: [*c]u64, p_max_deviation: [*c]u64) Result;
pub const PhysicalDeviceShaderCorePropertiesAMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_engine_count: u32 = @import("std").mem.zeroes(u32),
    shader_arrays_per_engine_count: u32 = @import("std").mem.zeroes(u32),
    compute_units_per_shader_array: u32 = @import("std").mem.zeroes(u32),
    simd_per_compute_unit: u32 = @import("std").mem.zeroes(u32),
    wavefronts_per_simd: u32 = @import("std").mem.zeroes(u32),
    wavefront_size: u32 = @import("std").mem.zeroes(u32),
    sgprs_per_simd: u32 = @import("std").mem.zeroes(u32),
    min_sgpr_allocation: u32 = @import("std").mem.zeroes(u32),
    max_sgpr_allocation: u32 = @import("std").mem.zeroes(u32),
    sgpr_allocation_granularity: u32 = @import("std").mem.zeroes(u32),
    vgprs_per_simd: u32 = @import("std").mem.zeroes(u32),
    min_vgpr_allocation: u32 = @import("std").mem.zeroes(u32),
    max_vgpr_allocation: u32 = @import("std").mem.zeroes(u32),
    vgpr_allocation_granularity: u32 = @import("std").mem.zeroes(u32),
};
pub const MemoryOverallocationBehaviorAMD = enum(u32) {
    default = 0,
    allowed = 1,
    disallowed = 2,
    max_enum = 2147483647,
};
pub const DeviceMemoryOverallocationCreateInfoAMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    overallocation_behavior: MemoryOverallocationBehaviorAMD = @import("std").mem.zeroes(MemoryOverallocationBehaviorAMD),
};
pub const PhysicalDeviceVertexAttributeDivisorPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_vertex_attrib_divisor: u32 = @import("std").mem.zeroes(u32),
};
pub const VertexInputBindingDivisorDescriptionEXT = VertexInputBindingDivisorDescription;
pub const PipelineVertexInputDivisorStateCreateInfoEXT = PipelineVertexInputDivisorStateCreateInfo;
pub const PhysicalDeviceVertexAttributeDivisorFeaturesEXT = PhysicalDeviceVertexAttributeDivisorFeatures;
pub const PipelineCreationFeedbackFlagBitsEXT = PipelineCreationFeedbackFlagBits;
pub const PipelineCreationFeedbackFlagsEXT = PipelineCreationFeedbackFlags;
pub const PipelineCreationFeedbackCreateInfoEXT = PipelineCreationFeedbackCreateInfo;
pub const PipelineCreationFeedbackEXT = PipelineCreationFeedback;
pub const PhysicalDeviceComputeShaderDerivativesFeaturesNV = PhysicalDeviceComputeShaderDerivativesFeaturesKHR;
pub const PhysicalDeviceMeshShaderFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    task_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    mesh_shader: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMeshShaderPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_draw_mesh_tasks_count: u32 = @import("std").mem.zeroes(u32),
    max_task_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    max_task_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_task_total_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_task_output_count: u32 = @import("std").mem.zeroes(u32),
    max_mesh_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    max_mesh_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_mesh_total_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_vertices: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_primitives: u32 = @import("std").mem.zeroes(u32),
    max_mesh_multiview_view_count: u32 = @import("std").mem.zeroes(u32),
    mesh_output_per_vertex_granularity: u32 = @import("std").mem.zeroes(u32),
    mesh_output_per_primitive_granularity: u32 = @import("std").mem.zeroes(u32),
};
pub const DrawMeshTasksIndirectCommandNV = extern struct {
    task_count: u32 = @import("std").mem.zeroes(u32),
    first_task: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdDrawMeshTasksNV = ?*const fn (CommandBuffer, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawMeshTasksIndirectNV = ?*const fn (CommandBuffer, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawMeshTasksIndirectCountNV = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub extern fn cmdDrawMeshTasksNv(command_buffer: CommandBuffer, task_count: u32, first_task: u32) void;
pub extern fn cmdDrawMeshTasksIndirectNv(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, draw_count: u32, stride: u32) void;
pub extern fn cmdDrawMeshTasksIndirectCountNv(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_bufferOffset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub const PhysicalDeviceFragmentShaderBarycentricFeaturesNV = PhysicalDeviceFragmentShaderBarycentricFeaturesKHR;
pub const PhysicalDeviceShaderImageFootprintFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_footprint: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineViewportExclusiveScissorStateCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    exclusive_scissor_count: u32 = @import("std").mem.zeroes(u32),
    p_exclusive_scissors: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const PhysicalDeviceExclusiveScissorFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    exclusive_scissor: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdSetExclusiveScissorEnableNV = ?*const fn (CommandBuffer, u32, u32, [*c]const Bool32) callconv(.c) void;
pub const PFN_cmdSetExclusiveScissorNV = ?*const fn (CommandBuffer, u32, u32, [*c]const Rect2D) callconv(.c) void;
pub extern fn cmdSetExclusiveScissorEnableNv(command_buffer: CommandBuffer, first_exclusive_scissor: u32, exclusive_scissor_count: u32, p_exclusive_scissor_enables: [*c]const Bool32) void;
pub extern fn cmdSetExclusiveScissorNv(command_buffer: CommandBuffer, first_exclusive_scissor: u32, exclusive_scissor_count: u32, p_exclusive_scissors: [*c]const Rect2D) void;
pub const QueueFamilyCheckpointPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    checkpoint_execution_stage_mask: PipelineStageFlags = @import("std").mem.zeroes(PipelineStageFlags),
};
pub const CheckpointDataNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    stage: PipelineStageFlagBits = @import("std").mem.zeroes(PipelineStageFlagBits),
    p_checkpoint_marker: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const QueueFamilyCheckpointProperties2NV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    checkpoint_execution_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
};
pub const CheckpointData2NV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    stage: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    p_checkpoint_marker: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PFN_cmdSetCheckpointNV = ?*const fn (CommandBuffer, ?*const anyopaque) callconv(.c) void;
pub const PFN_getQueueCheckpointDataNV = ?*const fn (Queue, [*c]u32, [*c]CheckpointDataNV) callconv(.c) void;
pub const PFN_getQueueCheckpointData2NV = ?*const fn (Queue, [*c]u32, [*c]CheckpointData2NV) callconv(.c) void;
pub extern fn cmdSetCheckpointNv(command_buffer: CommandBuffer, p_checkpoint_marker: ?*const anyopaque) void;
pub extern fn getQueueCheckpointDataNv(queue: Queue, p_checkpoint_data_count: [*c]u32, p_checkpoint_data: [*c]CheckpointDataNV) void;
pub extern fn getQueueCheckpointData2Nv(queue: Queue, p_checkpoint_data_count: [*c]u32, p_checkpoint_data: [*c]CheckpointData2NV) void;
pub const PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_integer_functions2: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PerformanceConfigurationINTEL = enum(u64) { null = 0, _ };
pub const PerformanceConfigurationTypeINTEL = enum(u32) {
    command_queue_metrics_discovery_activated = 0,
    max_enum = 2147483647,
};
pub const QueryPoolSamplingModeINTEL = enum(u32) {
    manual = 0,
    max_enum = 2147483647,
};
pub const PerformanceOverrideTypeINTEL = enum(u32) {
    null_hardware = 0,
    flush_gpu_caches = 1,
    max_enum = 2147483647,
};
pub const PerformanceParameterTypeINTEL = enum(u32) {
    hw_counters_supported = 0,
    stream_marker_valid_bits = 1,
    max_enum = 2147483647,
};
pub const PerformanceValueTypeINTEL = enum(u32) {
    uint32 = 0,
    uint64 = 1,
    float = 2,
    bool = 3,
    string = 4,
    max_enum = 2147483647,
};
pub const PerformanceValueDataINTEL = extern union {
    value32: u32,
    value64: u64,
    valueFloat: f32,
    valueBool: Bool32,
    valueString: [*c]const u8,
};
pub const PerformanceValueINTEL = extern struct {
    type: PerformanceValueTypeINTEL = @import("std").mem.zeroes(PerformanceValueTypeINTEL),
    data: PerformanceValueDataINTEL = @import("std").mem.zeroes(PerformanceValueDataINTEL),
};
pub const InitializePerformanceApiInfoINTEL = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const QueryPoolPerformanceQueryCreateInfoINTEL = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    performance_counters_sampling: QueryPoolSamplingModeINTEL = @import("std").mem.zeroes(QueryPoolSamplingModeINTEL),
};
pub const QueryPoolCreateInfoINTEL = QueryPoolPerformanceQueryCreateInfoINTEL;
pub const PerformanceMarkerInfoINTEL = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    marker: u64 = @import("std").mem.zeroes(u64),
};
pub const PerformanceStreamMarkerInfoINTEL = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    marker: u32 = @import("std").mem.zeroes(u32),
};
pub const PerformanceOverrideInfoINTEL = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: PerformanceOverrideTypeINTEL = @import("std").mem.zeroes(PerformanceOverrideTypeINTEL),
    enable: Bool32 = @import("std").mem.zeroes(Bool32),
    parameter: u64 = @import("std").mem.zeroes(u64),
};
pub const PerformanceConfigurationAcquireInfoINTEL = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: PerformanceConfigurationTypeINTEL = @import("std").mem.zeroes(PerformanceConfigurationTypeINTEL),
};
pub const PFN_initializePerformanceApiINTEL = ?*const fn (Device, [*c]const InitializePerformanceApiInfoINTEL) callconv(.c) Result;
pub const PFN_uninitializePerformanceApiINTEL = ?*const fn (Device) callconv(.c) void;
pub const PFN_cmdSetPerformanceMarkerINTEL = ?*const fn (CommandBuffer, [*c]const PerformanceMarkerInfoINTEL) callconv(.c) Result;
pub const PFN_cmdSetPerformanceStreamMarkerINTEL = ?*const fn (CommandBuffer, [*c]const PerformanceStreamMarkerInfoINTEL) callconv(.c) Result;
pub const PFN_cmdSetPerformanceOverrideINTEL = ?*const fn (CommandBuffer, [*c]const PerformanceOverrideInfoINTEL) callconv(.c) Result;
pub const PFN_acquirePerformanceConfigurationINTEL = ?*const fn (Device, [*c]const PerformanceConfigurationAcquireInfoINTEL, [*c]PerformanceConfigurationINTEL) callconv(.c) Result;
pub const PFN_releasePerformanceConfigurationINTEL = ?*const fn (Device, PerformanceConfigurationINTEL) callconv(.c) Result;
pub const PFN_queueSetPerformanceConfigurationINTEL = ?*const fn (Queue, PerformanceConfigurationINTEL) callconv(.c) Result;
pub const PFN_getPerformanceParameterINTEL = ?*const fn (Device, PerformanceParameterTypeINTEL, [*c]PerformanceValueINTEL) callconv(.c) Result;
pub extern fn initializePerformanceApiIntel(device: Device, p_initialize_info: [*c]const InitializePerformanceApiInfoINTEL) Result;
pub extern fn uninitializePerformanceApiIntel(device: Device) void;
pub extern fn cmdSetPerformanceMarkerIntel(command_buffer: CommandBuffer, p_marker_info: [*c]const PerformanceMarkerInfoINTEL) Result;
pub extern fn cmdSetPerformanceStreamMarkerIntel(command_buffer: CommandBuffer, p_marker_info: [*c]const PerformanceStreamMarkerInfoINTEL) Result;
pub extern fn cmdSetPerformanceOverrideIntel(command_buffer: CommandBuffer, p_override_info: [*c]const PerformanceOverrideInfoINTEL) Result;
pub extern fn acquirePerformanceConfigurationIntel(device: Device, p_acquire_info: [*c]const PerformanceConfigurationAcquireInfoINTEL, p_configuration: [*c]PerformanceConfigurationINTEL) Result;
pub extern fn releasePerformanceConfigurationIntel(device: Device, configuration: PerformanceConfigurationINTEL) Result;
pub extern fn queueSetPerformanceConfigurationIntel(queue: Queue, configuration: PerformanceConfigurationINTEL) Result;
pub extern fn getPerformanceParameterIntel(device: Device, parameter: PerformanceParameterTypeINTEL, p_value: [*c]PerformanceValueINTEL) Result;
pub const PhysicalDevicePCIBusInfoPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pci_domain: u32 = @import("std").mem.zeroes(u32),
    pci_bus: u32 = @import("std").mem.zeroes(u32),
    pci_device: u32 = @import("std").mem.zeroes(u32),
    pci_function: u32 = @import("std").mem.zeroes(u32),
};
pub const DisplayNativeHdrSurfaceCapabilitiesAMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    local_dimming_support: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SwapchainDisplayNativeHdrCreateInfoAMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    local_dimming_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_setLocalDimmingAMD = ?*const fn (Device, SwapchainKHR, Bool32) callconv(.c) void;
pub extern fn setLocalDimmingAmd(device: Device, swap_chain: SwapchainKHR, local_dimming_enable: Bool32) void;
pub const PhysicalDeviceFragmentDensityMapFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_density_map: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_density_map_dynamic: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_density_map_non_subsampled_images: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentDensityMapPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_fragment_density_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_fragment_density_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    fragment_density_invocations: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RenderPassFragmentDensityMapCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    fragment_density_map_attachment: AttachmentReference = @import("std").mem.zeroes(AttachmentReference),
};
pub const RenderingFragmentDensityMapAttachmentInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image_view: ImageView = @import("std").mem.zeroes(ImageView),
    image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const PhysicalDeviceScalarBlockLayoutFeaturesEXT = PhysicalDeviceScalarBlockLayoutFeatures;
pub const PhysicalDeviceSubgroupSizeControlFeaturesEXT = PhysicalDeviceSubgroupSizeControlFeatures;
pub const PhysicalDeviceSubgroupSizeControlPropertiesEXT = PhysicalDeviceSubgroupSizeControlProperties;
pub const PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT = PipelineShaderStageRequiredSubgroupSizeCreateInfo;
pub const ShaderCorePropertiesFlagBitsAMD = enum(u32) {
    max_enum = 2147483647,
};
pub const ShaderCorePropertiesFlagsAMD = Flags;
pub const PhysicalDeviceShaderCoreProperties2AMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_core_features: ShaderCorePropertiesFlagsAMD = @import("std").mem.zeroes(ShaderCorePropertiesFlagsAMD),
    active_compute_unit_count: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceCoherentMemoryFeaturesAMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_coherent_memory: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderImageAtomicInt64FeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_image_int64_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_image_int64_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMemoryBudgetPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    heap_budget: [16]DeviceSize = @import("std").mem.zeroes([16]DeviceSize),
    heap_usage: [16]DeviceSize = @import("std").mem.zeroes([16]DeviceSize),
};
pub const PhysicalDeviceMemoryPriorityFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_priority: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MemoryPriorityAllocateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    priority: f32 = @import("std").mem.zeroes(f32),
};
pub const PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    dedicated_allocation_image_aliasing: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceBufferDeviceAddressFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    buffer_device_address: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address_multi_device: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceBufferAddressFeaturesEXT = PhysicalDeviceBufferDeviceAddressFeaturesEXT;
pub const BufferDeviceAddressInfoEXT = BufferDeviceAddressInfo;
pub const BufferDeviceAddressCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const PFN_getBufferDeviceAddressEXT = ?*const fn (Device, [*c]const BufferDeviceAddressInfo) callconv(.c) DeviceAddress;
pub extern fn getBufferDeviceAddressExt(device: Device, p_info: [*c]const BufferDeviceAddressInfo) DeviceAddress;
pub const ToolPurposeFlagBitsEXT = ToolPurposeFlagBits;
pub const ToolPurposeFlagsEXT = ToolPurposeFlags;
pub const PhysicalDeviceToolPropertiesEXT = PhysicalDeviceToolProperties;
pub const PFN_getPhysicalDeviceToolPropertiesEXT = ?*const fn (PhysicalDevice, [*c]u32, [*c]PhysicalDeviceToolProperties) callconv(.c) Result;
pub extern fn getPhysicalDeviceToolPropertiesExt(physical_device: PhysicalDevice, p_tool_count: [*c]u32, p_tool_properties: [*c]PhysicalDeviceToolProperties) Result;
pub const ImageStencilUsageCreateInfoEXT = ImageStencilUsageCreateInfo;
pub const ValidationFeatureEnableEXT = enum(u32) {
    gpu_assisted = 0,
    gpu_assisted_reserve_binding_slot = 1,
    best_practices = 2,
    debug_printf = 3,
    synchronization_validation = 4,
    max_enum = 2147483647,
};
pub const ValidationFeatureDisableEXT = enum(u32) {
    all = 0,
    shaders = 1,
    thread_safety = 2,
    api_parameters = 3,
    object_lifetimes = 4,
    core_checks = 5,
    unique_handles = 6,
    shader_validation_cache = 7,
    max_enum = 2147483647,
};
pub const ValidationFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    enabled_validation_feature_count: u32 = @import("std").mem.zeroes(u32),
    p_enabled_validation_features: [*c]const ValidationFeatureEnableEXT = @import("std").mem.zeroes([*c]const ValidationFeatureEnableEXT),
    disabled_validation_feature_count: u32 = @import("std").mem.zeroes(u32),
    p_disabled_validation_features: [*c]const ValidationFeatureDisableEXT = @import("std").mem.zeroes([*c]const ValidationFeatureDisableEXT),
};
pub const ComponentTypeNV = ComponentTypeKHR;
pub const ScopeNV = ScopeKHR;
pub const CooperativeMatrixPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    msize: u32 = @import("std").mem.zeroes(u32),
    nsize: u32 = @import("std").mem.zeroes(u32),
    ksize: u32 = @import("std").mem.zeroes(u32),
    atype: ComponentTypeNV = @import("std").mem.zeroes(ComponentTypeNV),
    btype: ComponentTypeNV = @import("std").mem.zeroes(ComponentTypeNV),
    ctype: ComponentTypeNV = @import("std").mem.zeroes(ComponentTypeNV),
    dtype: ComponentTypeNV = @import("std").mem.zeroes(ComponentTypeNV),
    scope: ScopeNV = @import("std").mem.zeroes(ScopeNV),
};
pub const PhysicalDeviceCooperativeMatrixFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cooperative_matrix: Bool32 = @import("std").mem.zeroes(Bool32),
    cooperative_matrix_robust_buffer_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceCooperativeMatrixPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cooperative_matrix_supported_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
};
pub const PFN_getPhysicalDeviceCooperativeMatrixPropertiesNV = ?*const fn (PhysicalDevice, [*c]u32, [*c]CooperativeMatrixPropertiesNV) callconv(.c) Result;
pub extern fn getPhysicalDeviceCooperativeMatrixPropertiesNv(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]CooperativeMatrixPropertiesNV) Result;
pub const CoverageReductionModeNV = enum(u32) {
    merge = 0,
    truncate = 1,
    max_enum = 2147483647,
};
pub const PipelineCoverageReductionStateCreateFlagsNV = Flags;
pub const PhysicalDeviceCoverageReductionModeFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    coverage_reduction_mode: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineCoverageReductionStateCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCoverageReductionStateCreateFlagsNV = @import("std").mem.zeroes(PipelineCoverageReductionStateCreateFlagsNV),
    coverage_reduction_mode: CoverageReductionModeNV = @import("std").mem.zeroes(CoverageReductionModeNV),
};
pub const FramebufferMixedSamplesCombinationNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    coverage_reduction_mode: CoverageReductionModeNV = @import("std").mem.zeroes(CoverageReductionModeNV),
    rasterization_samples: SampleCountFlagBits = @import("std").mem.zeroes(SampleCountFlagBits),
    depth_stencil_samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    color_samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
};
pub const PFN_getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV = ?*const fn (PhysicalDevice, [*c]u32, [*c]FramebufferMixedSamplesCombinationNV) callconv(.c) Result;
pub extern fn getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNv(physical_device: PhysicalDevice, p_combination_count: [*c]u32, p_combinations: [*c]FramebufferMixedSamplesCombinationNV) Result;
pub const PhysicalDeviceFragmentShaderInterlockFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_shader_sample_interlock: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shader_pixel_interlock: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shader_shading_rate_interlock: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceYcbcrImageArraysFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ycbcr_image_arrays: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ProvokingVertexModeEXT = enum(u32) {
    first_vertex = 0,
    last_vertex = 1,
    max_enum = 2147483647,
};
pub const PhysicalDeviceProvokingVertexFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    provoking_vertex_last: Bool32 = @import("std").mem.zeroes(Bool32),
    transform_feedback_preserves_provoking_vertex: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceProvokingVertexPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    provoking_vertex_mode_per_pipeline: Bool32 = @import("std").mem.zeroes(Bool32),
    transform_feedback_preserves_triangle_fan_provoking_vertex: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineRasterizationProvokingVertexStateCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    provoking_vertex_mode: ProvokingVertexModeEXT = @import("std").mem.zeroes(ProvokingVertexModeEXT),
};
pub const HeadlessSurfaceCreateFlagsEXT = Flags;
pub const HeadlessSurfaceCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: HeadlessSurfaceCreateFlagsEXT = @import("std").mem.zeroes(HeadlessSurfaceCreateFlagsEXT),
};
pub const PFN_createHeadlessSurfaceEXT = ?*const fn (Instance, [*c]const HeadlessSurfaceCreateInfoEXT, [*c]const AllocationCallbacks, [*c]SurfaceKHR) callconv(.c) Result;
pub extern fn createHeadlessSurfaceExt(instance: Instance, p_create_info: [*c]const HeadlessSurfaceCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_surface: [*c]SurfaceKHR) Result;
pub const LineRasterizationModeEXT = LineRasterizationMode;
pub const PhysicalDeviceLineRasterizationFeaturesEXT = PhysicalDeviceLineRasterizationFeatures;
pub const PhysicalDeviceLineRasterizationPropertiesEXT = PhysicalDeviceLineRasterizationProperties;
pub const PipelineRasterizationLineStateCreateInfoEXT = PipelineRasterizationLineStateCreateInfo;
pub const PFN_cmdSetLineStippleEXT = ?*const fn (CommandBuffer, u32, u16) callconv(.c) void;
pub extern fn cmdSetLineStippleExt(command_buffer: CommandBuffer, line_stipple_factor: u32, line_stipple_pattern: u16) void;
pub const PhysicalDeviceShaderAtomicFloatFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_buffer_float32_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float32_atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float64_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float64_atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float32_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float32_atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float64_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float64_atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_image_float32_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_image_float32_atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_image_float32_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_image_float32_atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceHostQueryResetFeaturesEXT = PhysicalDeviceHostQueryResetFeatures;
pub const PFN_resetQueryPoolEXT = ?*const fn (Device, QueryPool, u32, u32) callconv(.c) void;
pub extern fn resetQueryPoolExt(device: Device, query_pool: QueryPool, first_query: u32, query_count: u32) void;
pub const PhysicalDeviceIndexTypeUint8FeaturesEXT = PhysicalDeviceIndexTypeUint8Features;
pub const PhysicalDeviceExtendedDynamicStateFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    extended_dynamic_state: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdSetCullModeEXT = ?*const fn (CommandBuffer, CullModeFlags) callconv(.c) void;
pub const PFN_cmdSetFrontFaceEXT = ?*const fn (CommandBuffer, FrontFace) callconv(.c) void;
pub const PFN_cmdSetPrimitiveTopologyEXT = ?*const fn (CommandBuffer, PrimitiveTopology) callconv(.c) void;
pub const PFN_cmdSetViewportWithCountEXT = ?*const fn (CommandBuffer, u32, [*c]const Viewport) callconv(.c) void;
pub const PFN_cmdSetScissorWithCountEXT = ?*const fn (CommandBuffer, u32, [*c]const Rect2D) callconv(.c) void;
pub const PFN_cmdBindVertexBuffers2EXT = ?*const fn (CommandBuffer, u32, u32, [*c]const Buffer, [*c]const DeviceSize, [*c]const DeviceSize, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdSetDepthTestEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthWriteEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthCompareOpEXT = ?*const fn (CommandBuffer, CompareOp) callconv(.c) void;
pub const PFN_cmdSetDepthBoundsTestEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetStencilTestEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetStencilOpEXT = ?*const fn (CommandBuffer, StencilFaceFlags, StencilOp, StencilOp, StencilOp, CompareOp) callconv(.c) void;
pub extern fn cmdSetCullModeExt(command_buffer: CommandBuffer, cull_mode: CullModeFlags) void;
pub extern fn cmdSetFrontFaceExt(command_buffer: CommandBuffer, front_face: FrontFace) void;
pub extern fn cmdSetPrimitiveTopologyExt(command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology) void;
pub extern fn cmdSetViewportWithCountExt(command_buffer: CommandBuffer, viewport_count: u32, p_viewports: [*c]const Viewport) void;
pub extern fn cmdSetScissorWithCountExt(command_buffer: CommandBuffer, scissor_count: u32, p_scissors: [*c]const Rect2D) void;
pub extern fn cmdBindVertexBuffers2Ext(command_buffer: CommandBuffer, first_binding: u32, binding_count: u32, p_buffers: [*c]const Buffer, p_offsets: [*c]const DeviceSize, p_sizes: [*c]const DeviceSize, p_strides: [*c]const DeviceSize) void;
pub extern fn cmdSetDepthTestEnableExt(command_buffer: CommandBuffer, depth_test_enable: Bool32) void;
pub extern fn cmdSetDepthWriteEnableExt(command_buffer: CommandBuffer, depth_write_enable: Bool32) void;
pub extern fn cmdSetDepthCompareOpExt(command_buffer: CommandBuffer, depth_compare_op: CompareOp) void;
pub extern fn cmdSetDepthBoundsTestEnableExt(command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32) void;
pub extern fn cmdSetStencilTestEnableExt(command_buffer: CommandBuffer, stencil_test_enable: Bool32) void;
pub extern fn cmdSetStencilOpExt(command_buffer: CommandBuffer, face_mask: StencilFaceFlags, fail_op: StencilOp, pass_op: StencilOp, depth_fail_op: StencilOp, compare_op: CompareOp) void;
pub const HostImageCopyFlagBitsEXT = HostImageCopyFlagBits;
pub const HostImageCopyFlagsEXT = HostImageCopyFlags;
pub const PhysicalDeviceHostImageCopyFeaturesEXT = PhysicalDeviceHostImageCopyFeatures;
pub const PhysicalDeviceHostImageCopyPropertiesEXT = PhysicalDeviceHostImageCopyProperties;
pub const MemoryToImageCopyEXT = MemoryToImageCopy;
pub const ImageToMemoryCopyEXT = ImageToMemoryCopy;
pub const CopyMemoryToImageInfoEXT = CopyMemoryToImageInfo;
pub const CopyImageToMemoryInfoEXT = CopyImageToMemoryInfo;
pub const CopyImageToImageInfoEXT = CopyImageToImageInfo;
pub const HostImageLayoutTransitionInfoEXT = HostImageLayoutTransitionInfo;
pub const SubresourceHostMemcpySizeEXT = SubresourceHostMemcpySize;
pub const HostImageCopyDevicePerformanceQueryEXT = HostImageCopyDevicePerformanceQuery;
pub const SubresourceLayout2EXT = SubresourceLayout2;
pub const ImageSubresource2EXT = ImageSubresource2;
pub const PFN_copyMemoryToImageEXT = ?*const fn (Device, [*c]const CopyMemoryToImageInfo) callconv(.c) Result;
pub const PFN_copyImageToMemoryEXT = ?*const fn (Device, [*c]const CopyImageToMemoryInfo) callconv(.c) Result;
pub const PFN_copyImageToImageEXT = ?*const fn (Device, [*c]const CopyImageToImageInfo) callconv(.c) Result;
pub const PFN_transitionImageLayoutEXT = ?*const fn (Device, u32, [*c]const HostImageLayoutTransitionInfo) callconv(.c) Result;
pub const PFN_getImageSubresourceLayout2EXT = ?*const fn (Device, Image, [*c]const ImageSubresource2, [*c]SubresourceLayout2) callconv(.c) void;
pub extern fn copyMemoryToImageExt(device: Device, p_copy_memory_to_image_info: [*c]const CopyMemoryToImageInfo) Result;
pub extern fn copyImageToMemoryExt(device: Device, p_copy_image_to_memory_info: [*c]const CopyImageToMemoryInfo) Result;
pub extern fn copyImageToImageExt(device: Device, p_copy_image_to_image_info: [*c]const CopyImageToImageInfo) Result;
pub extern fn transitionImageLayoutExt(device: Device, transition_count: u32, p_transitions: [*c]const HostImageLayoutTransitionInfo) Result;
pub extern fn getImageSubresourceLayout2Ext(device: Device, image: Image, p_subresource: [*c]const ImageSubresource2, p_layout: [*c]SubresourceLayout2) void;
pub const PhysicalDeviceMapMemoryPlacedFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_map_placed: Bool32 = @import("std").mem.zeroes(Bool32),
    memory_map_range_placed: Bool32 = @import("std").mem.zeroes(Bool32),
    memory_unmap_reserve: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMapMemoryPlacedPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_placed_memory_map_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const MemoryMapPlacedInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_placed_address: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PhysicalDeviceShaderAtomicFloat2FeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_buffer_float16_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float16_atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float16_atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float32_atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float64_atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float16_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float16_atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float16_atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float32_atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float64_atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_image_float32_atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_image_float32_atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PresentScalingFlagBitsEXT = enum(u32) {
    one_to_one_bit = 1,
    aspect_ratio_stretch_bit = 2,
    stretch_bit = 4,
    max_enum = 2147483647,
};
pub const PresentScalingFlagsEXT = Flags;
pub const PresentGravityFlagBitsEXT = enum(u32) {
    min_bit = 1,
    max_bit = 2,
    centered_bit = 4,
    max_enum = 2147483647,
};
pub const PresentGravityFlagsEXT = Flags;
pub const SurfacePresentModeEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_mode: PresentModeKHR = @import("std").mem.zeroes(PresentModeKHR),
};
pub const SurfacePresentScalingCapabilitiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supported_present_scaling: PresentScalingFlagsEXT = @import("std").mem.zeroes(PresentScalingFlagsEXT),
    supported_present_gravity_x: PresentGravityFlagsEXT = @import("std").mem.zeroes(PresentGravityFlagsEXT),
    supported_present_gravity_y: PresentGravityFlagsEXT = @import("std").mem.zeroes(PresentGravityFlagsEXT),
    min_scaled_image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_scaled_image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const SurfacePresentModeCompatibilityEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_mode_count: u32 = @import("std").mem.zeroes(u32),
    p_present_modes: [*c]PresentModeKHR = @import("std").mem.zeroes([*c]PresentModeKHR),
};
pub const PhysicalDeviceSwapchainMaintenance1FeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    swapchain_maintenance1: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SwapchainPresentFenceInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_fences: [*c]const Fence = @import("std").mem.zeroes([*c]const Fence),
};
pub const SwapchainPresentModesCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    present_mode_count: u32 = @import("std").mem.zeroes(u32),
    p_present_modes: [*c]const PresentModeKHR = @import("std").mem.zeroes([*c]const PresentModeKHR),
};
pub const SwapchainPresentModeInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_present_modes: [*c]const PresentModeKHR = @import("std").mem.zeroes([*c]const PresentModeKHR),
};
pub const SwapchainPresentScalingCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    scaling_behavior: PresentScalingFlagsEXT = @import("std").mem.zeroes(PresentScalingFlagsEXT),
    present_gravity_x: PresentGravityFlagsEXT = @import("std").mem.zeroes(PresentGravityFlagsEXT),
    present_gravity_y: PresentGravityFlagsEXT = @import("std").mem.zeroes(PresentGravityFlagsEXT),
};
pub const ReleaseSwapchainImagesInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain: SwapchainKHR = @import("std").mem.zeroes(SwapchainKHR),
    image_index_count: u32 = @import("std").mem.zeroes(u32),
    p_image_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const PFN_releaseSwapchainImagesEXT = ?*const fn (Device, [*c]const ReleaseSwapchainImagesInfoEXT) callconv(.c) Result;
pub extern fn releaseSwapchainImagesExt(device: Device, p_release_info: [*c]const ReleaseSwapchainImagesInfoEXT) Result;
pub const PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT = PhysicalDeviceShaderDemoteToHelperInvocationFeatures;
pub const IndirectCommandsLayoutNV = enum(u64) { null = 0, _ };
pub const IndirectCommandsTokenTypeNV = enum(u32) {
    shader_group = 0,
    state_flags = 1,
    index_buffer = 2,
    vertex_buffer = 3,
    push_constant = 4,
    draw_indexed = 5,
    draw = 6,
    draw_tasks = 7,
    draw_mesh_tasks = 1000328000,
    pipeline = 1000428003,
    dispatch = 1000428004,
    max_enum = 2147483647,
};
pub const IndirectStateFlagBitsNV = enum(u32) {
    frontface_bit = 1,
    max_enum = 2147483647,
};
pub const IndirectStateFlagsNV = Flags;
pub const IndirectCommandsLayoutUsageFlagBitsNV = enum(u32) {
    explicit_preprocess_bit = 1,
    indexed_sequences_bit = 2,
    unordered_sequences_bit = 4,
    max_enum = 2147483647,
};
pub const IndirectCommandsLayoutUsageFlagsNV = Flags;
pub const PhysicalDeviceDeviceGeneratedCommandsPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_graphics_shader_group_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_sequence_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_token_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_stream_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_token_offset: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_stream_stride: u32 = @import("std").mem.zeroes(u32),
    min_sequences_count_buffer_offset_alignment: u32 = @import("std").mem.zeroes(u32),
    min_sequences_index_buffer_offset_alignment: u32 = @import("std").mem.zeroes(u32),
    min_indirect_commands_buffer_offset_alignment: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceDeviceGeneratedCommandsFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_generated_commands: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const GraphicsShaderGroupCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stage_count: u32 = @import("std").mem.zeroes(u32),
    p_stages: [*c]const PipelineShaderStageCreateInfo = @import("std").mem.zeroes([*c]const PipelineShaderStageCreateInfo),
    p_vertex_input_state: [*c]const PipelineVertexInputStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineVertexInputStateCreateInfo),
    p_tessellation_state: [*c]const PipelineTessellationStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineTessellationStateCreateInfo),
};
pub const GraphicsPipelineShaderGroupsCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    group_count: u32 = @import("std").mem.zeroes(u32),
    p_groups: [*c]const GraphicsShaderGroupCreateInfoNV = @import("std").mem.zeroes([*c]const GraphicsShaderGroupCreateInfoNV),
    pipeline_count: u32 = @import("std").mem.zeroes(u32),
    p_pipelines: [*c]const Pipeline = @import("std").mem.zeroes([*c]const Pipeline),
};
pub const BindShaderGroupIndirectCommandNV = extern struct {
    group_index: u32 = @import("std").mem.zeroes(u32),
};
pub const BindIndexBufferIndirectCommandNV = extern struct {
    buffer_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: u32 = @import("std").mem.zeroes(u32),
    index_type: IndexType = @import("std").mem.zeroes(IndexType),
};
pub const BindVertexBufferIndirectCommandNV = extern struct {
    buffer_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: u32 = @import("std").mem.zeroes(u32),
    stride: u32 = @import("std").mem.zeroes(u32),
};
pub const SetStateFlagsIndirectCommandNV = extern struct {
    data: u32 = @import("std").mem.zeroes(u32),
};
pub const IndirectCommandsStreamNV = extern struct {
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const IndirectCommandsLayoutTokenNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    token_type: IndirectCommandsTokenTypeNV = @import("std").mem.zeroes(IndirectCommandsTokenTypeNV),
    stream: u32 = @import("std").mem.zeroes(u32),
    offset: u32 = @import("std").mem.zeroes(u32),
    vertex_binding_unit: u32 = @import("std").mem.zeroes(u32),
    vertex_dynamic_stride: Bool32 = @import("std").mem.zeroes(Bool32),
    pushconstant_pipeline_layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    pushconstant_shader_stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    pushconstant_offset: u32 = @import("std").mem.zeroes(u32),
    pushconstant_size: u32 = @import("std").mem.zeroes(u32),
    indirect_state_flags: IndirectStateFlagsNV = @import("std").mem.zeroes(IndirectStateFlagsNV),
    index_type_count: u32 = @import("std").mem.zeroes(u32),
    p_index_types: [*c]const IndexType = @import("std").mem.zeroes([*c]const IndexType),
    p_index_type_values: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const IndirectCommandsLayoutCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: IndirectCommandsLayoutUsageFlagsNV = @import("std").mem.zeroes(IndirectCommandsLayoutUsageFlagsNV),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    token_count: u32 = @import("std").mem.zeroes(u32),
    p_tokens: [*c]const IndirectCommandsLayoutTokenNV = @import("std").mem.zeroes([*c]const IndirectCommandsLayoutTokenNV),
    stream_count: u32 = @import("std").mem.zeroes(u32),
    p_stream_strides: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const GeneratedCommandsInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
    indirect_commands_layout: IndirectCommandsLayoutNV = @import("std").mem.zeroes(IndirectCommandsLayoutNV),
    stream_count: u32 = @import("std").mem.zeroes(u32),
    p_streams: [*c]const IndirectCommandsStreamNV = @import("std").mem.zeroes([*c]const IndirectCommandsStreamNV),
    sequences_count: u32 = @import("std").mem.zeroes(u32),
    preprocess_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    preprocess_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    preprocess_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    sequences_count_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    sequences_count_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    sequences_index_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    sequences_index_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const GeneratedCommandsMemoryRequirementsInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
    indirect_commands_layout: IndirectCommandsLayoutNV = @import("std").mem.zeroes(IndirectCommandsLayoutNV),
    max_sequences_count: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_getGeneratedCommandsMemoryRequirementsNV = ?*const fn (Device, [*c]const GeneratedCommandsMemoryRequirementsInfoNV, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_cmdPreprocessGeneratedCommandsNV = ?*const fn (CommandBuffer, [*c]const GeneratedCommandsInfoNV) callconv(.c) void;
pub const PFN_cmdExecuteGeneratedCommandsNV = ?*const fn (CommandBuffer, Bool32, [*c]const GeneratedCommandsInfoNV) callconv(.c) void;
pub const PFN_cmdBindPipelineShaderGroupNV = ?*const fn (CommandBuffer, PipelineBindPoint, Pipeline, u32) callconv(.c) void;
pub const PFN_createIndirectCommandsLayoutNV = ?*const fn (Device, [*c]const IndirectCommandsLayoutCreateInfoNV, [*c]const AllocationCallbacks, [*c]IndirectCommandsLayoutNV) callconv(.c) Result;
pub const PFN_destroyIndirectCommandsLayoutNV = ?*const fn (Device, IndirectCommandsLayoutNV, [*c]const AllocationCallbacks) callconv(.c) void;
pub extern fn getGeneratedCommandsMemoryRequirementsNv(device: Device, p_info: [*c]const GeneratedCommandsMemoryRequirementsInfoNV, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn cmdPreprocessGeneratedCommandsNv(command_buffer: CommandBuffer, p_generated_commands_info: [*c]const GeneratedCommandsInfoNV) void;
pub extern fn cmdExecuteGeneratedCommandsNv(command_buffer: CommandBuffer, is_preprocessed: Bool32, p_generated_commands_info: [*c]const GeneratedCommandsInfoNV) void;
pub extern fn cmdBindPipelineShaderGroupNv(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, pipeline: Pipeline, group_index: u32) void;
pub extern fn createIndirectCommandsLayoutNv(device: Device, p_create_info: [*c]const IndirectCommandsLayoutCreateInfoNV, p_allocator: [*c]const AllocationCallbacks, p_indirect_commands_layout: [*c]IndirectCommandsLayoutNV) Result;
pub extern fn destroyIndirectCommandsLayoutNv(device: Device, indirect_commands_layout: IndirectCommandsLayoutNV, p_allocator: [*c]const AllocationCallbacks) void;
pub const PhysicalDeviceInheritedViewportScissorFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    inherited_viewport_scissor2_d: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const CommandBufferInheritanceViewportScissorInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    viewport_scissor2_d: Bool32 = @import("std").mem.zeroes(Bool32),
    viewport_depth_count: u32 = @import("std").mem.zeroes(u32),
    p_viewport_depths: [*c]const Viewport = @import("std").mem.zeroes([*c]const Viewport),
};
pub const PhysicalDeviceTexelBufferAlignmentFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    texel_buffer_alignment: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceTexelBufferAlignmentPropertiesEXT = PhysicalDeviceTexelBufferAlignmentProperties;
pub const RenderPassTransformBeginInfoQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    transform: SurfaceTransformFlagBits = @import("std").mem.zeroes(SurfaceTransformFlagBits),
};
pub const CommandBufferInheritanceRenderPassTransformInfoQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    transform: SurfaceTransformFlagBits = @import("std").mem.zeroes(SurfaceTransformFlagBits),
    render_area: Rect2D = @import("std").mem.zeroes(Rect2D),
};
pub const DepthBiasRepresentationEXT = enum(u32) {
    least_representable_value_format = 0,
    least_representable_value_force_unorm = 1,
    float = 2,
    max_enum = 2147483647,
};
pub const PhysicalDeviceDepthBiasControlFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    depth_bias_control: Bool32 = @import("std").mem.zeroes(Bool32),
    least_representable_value_force_unorm_representation: Bool32 = @import("std").mem.zeroes(Bool32),
    float_representation: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_bias_exact: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DepthBiasInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    depth_bias_constant_factor: f32 = @import("std").mem.zeroes(f32),
    depth_bias_clamp: f32 = @import("std").mem.zeroes(f32),
    depth_bias_slope_factor: f32 = @import("std").mem.zeroes(f32),
};
pub const DepthBiasRepresentationInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    depth_bias_representation: DepthBiasRepresentationEXT = @import("std").mem.zeroes(DepthBiasRepresentationEXT),
    depth_bias_exact: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdSetDepthBias2EXT = ?*const fn (CommandBuffer, [*c]const DepthBiasInfoEXT) callconv(.c) void;
pub extern fn cmdSetDepthBias2Ext(command_buffer: CommandBuffer, p_depth_bias_info: [*c]const DepthBiasInfoEXT) void;
pub const DeviceMemoryReportEventTypeEXT = enum(u32) {
    allocate = 0,
    free = 1,
    import = 2,
    unimport = 3,
    allocation_failed = 4,
    max_enum = 2147483647,
};
pub const DeviceMemoryReportFlagsEXT = Flags;
pub const PhysicalDeviceDeviceMemoryReportFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_memory_report: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceMemoryReportCallbackDataEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: DeviceMemoryReportFlagsEXT = @import("std").mem.zeroes(DeviceMemoryReportFlagsEXT),
    type: DeviceMemoryReportEventTypeEXT = @import("std").mem.zeroes(DeviceMemoryReportEventTypeEXT),
    memory_object_id: u64 = @import("std").mem.zeroes(u64),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    object_type: ObjectType = @import("std").mem.zeroes(ObjectType),
    object_handle: u64 = @import("std").mem.zeroes(u64),
    heap_index: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_deviceMemoryReportCallbackEXT = ?*const fn ([*c]const DeviceMemoryReportCallbackDataEXT, ?*anyopaque) callconv(.c) void;
pub const DeviceDeviceMemoryReportCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DeviceMemoryReportFlagsEXT = @import("std").mem.zeroes(DeviceMemoryReportFlagsEXT),
    pfn_user_callback: PFN_deviceMemoryReportCallbackEXT = @import("std").mem.zeroes(PFN_deviceMemoryReportCallbackEXT),
    p_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PFN_acquireDrmDisplayEXT = ?*const fn (PhysicalDevice, i32, DisplayKHR) callconv(.c) Result;
pub const PFN_getDrmDisplayEXT = ?*const fn (PhysicalDevice, i32, u32, [*c]DisplayKHR) callconv(.c) Result;
pub extern fn acquireDrmDisplayExt(physical_device: PhysicalDevice, drm_fd: i32, display: DisplayKHR) Result;
pub extern fn getDrmDisplayExt(physical_device: PhysicalDevice, drm_fd: i32, connector_id: u32, display: [*c]DisplayKHR) Result;
pub const PhysicalDeviceRobustness2FeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    robust_buffer_access2: Bool32 = @import("std").mem.zeroes(Bool32),
    robust_image_access2: Bool32 = @import("std").mem.zeroes(Bool32),
    null_descriptor: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRobustness2PropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    robust_storage_buffer_access_size_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    robust_uniform_buffer_access_size_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const SamplerCustomBorderColorCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    custom_border_color: ClearColorValue = @import("std").mem.zeroes(ClearColorValue),
    format: Format = @import("std").mem.zeroes(Format),
};
pub const PhysicalDeviceCustomBorderColorPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_custom_border_color_samplers: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceCustomBorderColorFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    custom_border_colors: Bool32 = @import("std").mem.zeroes(Bool32),
    custom_border_color_without_format: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePresentBarrierFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_barrier: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SurfaceCapabilitiesPresentBarrierNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_barrier_supported: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SwapchainPresentBarrierCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_barrier_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PrivateDataSlotEXT = PrivateDataSlot;
pub const PrivateDataSlotCreateFlagsEXT = PrivateDataSlotCreateFlags;
pub const PhysicalDevicePrivateDataFeaturesEXT = PhysicalDevicePrivateDataFeatures;
pub const DevicePrivateDataCreateInfoEXT = DevicePrivateDataCreateInfo;
pub const PrivateDataSlotCreateInfoEXT = PrivateDataSlotCreateInfo;
pub const PFN_createPrivateDataSlotEXT = ?*const fn (Device, [*c]const PrivateDataSlotCreateInfo, [*c]const AllocationCallbacks, [*c]PrivateDataSlot) callconv(.c) Result;
pub const PFN_destroyPrivateDataSlotEXT = ?*const fn (Device, PrivateDataSlot, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_setPrivateDataEXT = ?*const fn (Device, ObjectType, u64, PrivateDataSlot, u64) callconv(.c) Result;
pub const PFN_getPrivateDataEXT = ?*const fn (Device, ObjectType, u64, PrivateDataSlot, [*c]u64) callconv(.c) void;
pub extern fn createPrivateDataSlotExt(device: Device, p_create_info: [*c]const PrivateDataSlotCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_private_data_slot: [*c]PrivateDataSlot) Result;
pub extern fn destroyPrivateDataSlotExt(device: Device, private_data_slot: PrivateDataSlot, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn setPrivateDataExt(device: Device, object_type: ObjectType, object_handle: u64, private_data_slot: PrivateDataSlot, data: u64) Result;
pub extern fn getPrivateDataExt(device: Device, object_type: ObjectType, object_handle: u64, private_data_slot: PrivateDataSlot, p_data: [*c]u64) void;
pub const PhysicalDevicePipelineCreationCacheControlFeaturesEXT = PhysicalDevicePipelineCreationCacheControlFeatures;
pub const DeviceDiagnosticsConfigFlagBitsNV = enum(u32) {
    enable_shader_debug_info_bit = 1,
    enable_resource_tracking_bit = 2,
    enable_automatic_checkpoints_bit = 4,
    enable_shader_error_reporting_bit = 8,
    max_enum = 2147483647,
};
pub const DeviceDiagnosticsConfigFlagsNV = Flags;
pub const PhysicalDeviceDiagnosticsConfigFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    diagnostics_config: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceDiagnosticsConfigCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DeviceDiagnosticsConfigFlagsNV = @import("std").mem.zeroes(DeviceDiagnosticsConfigFlagsNV),
};
pub const CudaModuleNV = enum(u64) { null = 0, _ };
pub const CudaFunctionNV = enum(u64) { null = 0, _ };
pub const CudaModuleCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    data_size: usize = @import("std").mem.zeroes(usize),
    p_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const CudaFunctionCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    module: CudaModuleNV = @import("std").mem.zeroes(CudaModuleNV),
    p_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const CudaLaunchInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    function: CudaFunctionNV = @import("std").mem.zeroes(CudaFunctionNV),
    grid_dim_x: u32 = @import("std").mem.zeroes(u32),
    grid_dim_y: u32 = @import("std").mem.zeroes(u32),
    grid_dim_z: u32 = @import("std").mem.zeroes(u32),
    block_dim_x: u32 = @import("std").mem.zeroes(u32),
    block_dim_y: u32 = @import("std").mem.zeroes(u32),
    block_dim_z: u32 = @import("std").mem.zeroes(u32),
    shared_mem_bytes: u32 = @import("std").mem.zeroes(u32),
    param_count: usize = @import("std").mem.zeroes(usize),
    p_params: [*c]const ?*const anyopaque = @import("std").mem.zeroes([*c]const ?*const anyopaque),
    extra_count: usize = @import("std").mem.zeroes(usize),
    p_extras: [*c]const ?*const anyopaque = @import("std").mem.zeroes([*c]const ?*const anyopaque),
};
pub const PhysicalDeviceCudaKernelLaunchFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cuda_kernel_launch_features: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceCudaKernelLaunchPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    compute_capability_minor: u32 = @import("std").mem.zeroes(u32),
    compute_capability_major: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_createCudaModuleNV = ?*const fn (Device, [*c]const CudaModuleCreateInfoNV, [*c]const AllocationCallbacks, [*c]CudaModuleNV) callconv(.c) Result;
pub const PFN_getCudaModuleCacheNV = ?*const fn (Device, CudaModuleNV, [*c]usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_createCudaFunctionNV = ?*const fn (Device, [*c]const CudaFunctionCreateInfoNV, [*c]const AllocationCallbacks, [*c]CudaFunctionNV) callconv(.c) Result;
pub const PFN_destroyCudaModuleNV = ?*const fn (Device, CudaModuleNV, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_destroyCudaFunctionNV = ?*const fn (Device, CudaFunctionNV, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_cmdCudaLaunchKernelNV = ?*const fn (CommandBuffer, [*c]const CudaLaunchInfoNV) callconv(.c) void;
pub extern fn createCudaModuleNv(device: Device, p_create_info: [*c]const CudaModuleCreateInfoNV, p_allocator: [*c]const AllocationCallbacks, p_module: [*c]CudaModuleNV) Result;
pub extern fn getCudaModuleCacheNv(device: Device, module: CudaModuleNV, p_cache_size: [*c]usize, p_cache_data: ?*anyopaque) Result;
pub extern fn createCudaFunctionNv(device: Device, p_create_info: [*c]const CudaFunctionCreateInfoNV, p_allocator: [*c]const AllocationCallbacks, p_function: [*c]CudaFunctionNV) Result;
pub extern fn destroyCudaModuleNv(device: Device, module: CudaModuleNV, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn destroyCudaFunctionNv(device: Device, function: CudaFunctionNV, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn cmdCudaLaunchKernelNv(command_buffer: CommandBuffer, p_launch_info: [*c]const CudaLaunchInfoNV) void;
pub const QueryLowLatencySupportNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_queried_low_latency_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const AccelerationStructureKHR = enum(u64) { null = 0, _ };
pub const PhysicalDeviceDescriptorBufferPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    combined_image_sampler_descriptor_single_array: Bool32 = @import("std").mem.zeroes(Bool32),
    bufferless_push_descriptors: Bool32 = @import("std").mem.zeroes(Bool32),
    allow_sampler_image_view_post_submit_creation: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_buffer_offset_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    max_descriptor_buffer_bindings: u32 = @import("std").mem.zeroes(u32),
    max_resource_descriptor_buffer_bindings: u32 = @import("std").mem.zeroes(u32),
    max_sampler_descriptor_buffer_bindings: u32 = @import("std").mem.zeroes(u32),
    max_embedded_immutable_sampler_bindings: u32 = @import("std").mem.zeroes(u32),
    max_embedded_immutable_samplers: u32 = @import("std").mem.zeroes(u32),
    buffer_capture_replay_descriptor_data_size: usize = @import("std").mem.zeroes(usize),
    image_capture_replay_descriptor_data_size: usize = @import("std").mem.zeroes(usize),
    image_view_capture_replay_descriptor_data_size: usize = @import("std").mem.zeroes(usize),
    sampler_capture_replay_descriptor_data_size: usize = @import("std").mem.zeroes(usize),
    acceleration_structure_capture_replay_descriptor_data_size: usize = @import("std").mem.zeroes(usize),
    sampler_descriptor_size: usize = @import("std").mem.zeroes(usize),
    combined_image_sampler_descriptor_size: usize = @import("std").mem.zeroes(usize),
    sampled_image_descriptor_size: usize = @import("std").mem.zeroes(usize),
    storage_image_descriptor_size: usize = @import("std").mem.zeroes(usize),
    uniform_texel_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    robust_uniform_texel_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    storage_texel_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    robust_storage_texel_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    uniform_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    robust_uniform_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    storage_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    robust_storage_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    input_attachment_descriptor_size: usize = @import("std").mem.zeroes(usize),
    acceleration_structure_descriptor_size: usize = @import("std").mem.zeroes(usize),
    max_sampler_descriptor_buffer_range: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    max_resource_descriptor_buffer_range: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    sampler_descriptor_buffer_address_space_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    resource_descriptor_buffer_address_space_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    descriptor_buffer_address_space_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PhysicalDeviceDescriptorBufferDensityMapPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    combined_image_sampler_density_map_descriptor_size: usize = @import("std").mem.zeroes(usize),
};
pub const PhysicalDeviceDescriptorBufferFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    descriptor_buffer: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_buffer_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_buffer_image_layout_ignored: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_buffer_push_descriptors: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DescriptorAddressInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    range: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    format: Format = @import("std").mem.zeroes(Format),
};
pub const DescriptorBufferBindingInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    usage: BufferUsageFlags = @import("std").mem.zeroes(BufferUsageFlags),
};
pub const DescriptorBufferBindingPushDescriptorBufferHandleEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
};
pub const DescriptorDataEXT = extern union {
    pSampler: [*c]const Sampler,
    pCombinedImageSampler: [*c]const DescriptorImageInfo,
    pInputAttachmentImage: [*c]const DescriptorImageInfo,
    pSampledImage: [*c]const DescriptorImageInfo,
    pStorageImage: [*c]const DescriptorImageInfo,
    pUniformTexelBuffer: [*c]const DescriptorAddressInfoEXT,
    pStorageTexelBuffer: [*c]const DescriptorAddressInfoEXT,
    pUniformBuffer: [*c]const DescriptorAddressInfoEXT,
    pStorageBuffer: [*c]const DescriptorAddressInfoEXT,
    accelerationStructure: DeviceAddress,
};
pub const DescriptorGetInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: DescriptorType = @import("std").mem.zeroes(DescriptorType),
    data: DescriptorDataEXT = @import("std").mem.zeroes(DescriptorDataEXT),
};
pub const BufferCaptureDescriptorDataInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
};
pub const ImageCaptureDescriptorDataInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
};
pub const ImageViewCaptureDescriptorDataInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image_view: ImageView = @import("std").mem.zeroes(ImageView),
};
pub const SamplerCaptureDescriptorDataInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    sampler: Sampler = @import("std").mem.zeroes(Sampler),
};
pub const OpaqueCaptureDescriptorDataCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    opaque_capture_descriptor_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const AccelerationStructureCaptureDescriptorDataInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acceleration_structure: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    acceleration_structure_nv: AccelerationStructureNV = @import("std").mem.zeroes(AccelerationStructureNV),
};
pub const PFN_getDescriptorSetLayoutSizeEXT = ?*const fn (Device, DescriptorSetLayout, [*c]DeviceSize) callconv(.c) void;
pub const PFN_getDescriptorSetLayoutBindingOffsetEXT = ?*const fn (Device, DescriptorSetLayout, u32, [*c]DeviceSize) callconv(.c) void;
pub const PFN_getDescriptorEXT = ?*const fn (Device, [*c]const DescriptorGetInfoEXT, usize, ?*anyopaque) callconv(.c) void;
pub const PFN_cmdBindDescriptorBuffersEXT = ?*const fn (CommandBuffer, u32, [*c]const DescriptorBufferBindingInfoEXT) callconv(.c) void;
pub const PFN_cmdSetDescriptorBufferOffsetsEXT = ?*const fn (CommandBuffer, PipelineBindPoint, PipelineLayout, u32, u32, [*c]const u32, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdBindDescriptorBufferEmbeddedSamplersEXT = ?*const fn (CommandBuffer, PipelineBindPoint, PipelineLayout, u32) callconv(.c) void;
pub const PFN_getBufferOpaqueCaptureDescriptorDataEXT = ?*const fn (Device, [*c]const BufferCaptureDescriptorDataInfoEXT, ?*anyopaque) callconv(.c) Result;
pub const PFN_getImageOpaqueCaptureDescriptorDataEXT = ?*const fn (Device, [*c]const ImageCaptureDescriptorDataInfoEXT, ?*anyopaque) callconv(.c) Result;
pub const PFN_getImageViewOpaqueCaptureDescriptorDataEXT = ?*const fn (Device, [*c]const ImageViewCaptureDescriptorDataInfoEXT, ?*anyopaque) callconv(.c) Result;
pub const PFN_getSamplerOpaqueCaptureDescriptorDataEXT = ?*const fn (Device, [*c]const SamplerCaptureDescriptorDataInfoEXT, ?*anyopaque) callconv(.c) Result;
pub const PFN_getAccelerationStructureOpaqueCaptureDescriptorDataEXT = ?*const fn (Device, [*c]const AccelerationStructureCaptureDescriptorDataInfoEXT, ?*anyopaque) callconv(.c) Result;
pub extern fn getDescriptorSetLayoutSizeExt(device: Device, layout: DescriptorSetLayout, p_layout_size_in_bytes: [*c]DeviceSize) void;
pub extern fn getDescriptorSetLayoutBindingOffsetExt(device: Device, layout: DescriptorSetLayout, binding: u32, p_offset: [*c]DeviceSize) void;
pub extern fn getDescriptorExt(device: Device, p_descriptor_info: [*c]const DescriptorGetInfoEXT, data_size: usize, p_descriptor: ?*anyopaque) void;
pub extern fn cmdBindDescriptorBuffersExt(command_buffer: CommandBuffer, buffer_count: u32, p_binding_infos: [*c]const DescriptorBufferBindingInfoEXT) void;
pub extern fn cmdSetDescriptorBufferOffsetsExt(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, layout: PipelineLayout, first_set: u32, set_count: u32, p_buffer_indices: [*c]const u32, p_offsets: [*c]const DeviceSize) void;
pub extern fn cmdBindDescriptorBufferEmbeddedSamplersExt(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, layout: PipelineLayout, set: u32) void;
pub extern fn getBufferOpaqueCaptureDescriptorDataExt(device: Device, p_info: [*c]const BufferCaptureDescriptorDataInfoEXT, p_data: ?*anyopaque) Result;
pub extern fn getImageOpaqueCaptureDescriptorDataExt(device: Device, p_info: [*c]const ImageCaptureDescriptorDataInfoEXT, p_data: ?*anyopaque) Result;
pub extern fn getImageViewOpaqueCaptureDescriptorDataExt(device: Device, p_info: [*c]const ImageViewCaptureDescriptorDataInfoEXT, p_data: ?*anyopaque) Result;
pub extern fn getSamplerOpaqueCaptureDescriptorDataExt(device: Device, p_info: [*c]const SamplerCaptureDescriptorDataInfoEXT, p_data: ?*anyopaque) Result;
pub extern fn getAccelerationStructureOpaqueCaptureDescriptorDataExt(device: Device, p_info: [*c]const AccelerationStructureCaptureDescriptorDataInfoEXT, p_data: ?*anyopaque) Result;
pub const GraphicsPipelineLibraryFlagBitsEXT = enum(u32) {
    vertex_input_interface_bit = 1,
    pre_rasterization_shaders_bit = 2,
    fragment_shader_bit = 4,
    fragment_output_interface_bit = 8,
    max_enum = 2147483647,
};
pub const GraphicsPipelineLibraryFlagsEXT = Flags;
pub const PhysicalDeviceGraphicsPipelineLibraryFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    graphics_pipeline_library: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceGraphicsPipelineLibraryPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    graphics_pipeline_library_fast_linking: Bool32 = @import("std").mem.zeroes(Bool32),
    graphics_pipeline_library_independent_interpolation_decoration: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const GraphicsPipelineLibraryCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: GraphicsPipelineLibraryFlagsEXT = @import("std").mem.zeroes(GraphicsPipelineLibraryFlagsEXT),
};
pub const PhysicalDeviceShaderEarlyAndLateFragmentTestsFeaturesAMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_early_and_late_fragment_tests: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const FragmentShadingRateTypeNV = enum(u32) {
    fragment_size = 0,
    enums = 1,
    max_enum = 2147483647,
};
pub const FragmentShadingRateNV = enum(u32) {
    @"1_invocation_per_pixel" = 0,
    @"1_invocation_per_1x2_pixels" = 1,
    @"1_invocation_per_2x1_pixels" = 4,
    @"1_invocation_per_2x2_pixels" = 5,
    @"1_invocation_per_2x4_pixels" = 6,
    @"1_invocation_per_4x2_pixels" = 9,
    @"1_invocation_per_4x4_pixels" = 10,
    @"2_invocations_per_pixel" = 11,
    @"4_invocations_per_pixel" = 12,
    @"8_invocations_per_pixel" = 13,
    @"16_invocations_per_pixel" = 14,
    no_invocations = 15,
    max_enum = 2147483647,
};
pub const PhysicalDeviceFragmentShadingRateEnumsFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_shading_rate_enums: Bool32 = @import("std").mem.zeroes(Bool32),
    supersample_fragment_shading_rates: Bool32 = @import("std").mem.zeroes(Bool32),
    no_invocation_fragment_shading_rates: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentShadingRateEnumsPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_fragment_shading_rate_invocation_count: SampleCountFlagBits = @import("std").mem.zeroes(SampleCountFlagBits),
};
pub const PipelineFragmentShadingRateEnumStateCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    shading_rate_type: FragmentShadingRateTypeNV = @import("std").mem.zeroes(FragmentShadingRateTypeNV),
    shading_rate: FragmentShadingRateNV = @import("std").mem.zeroes(FragmentShadingRateNV),
    combiner_ops: [2]FragmentShadingRateCombinerOpKHR = @import("std").mem.zeroes([2]FragmentShadingRateCombinerOpKHR),
};
pub const PFN_cmdSetFragmentShadingRateEnumNV = ?*const fn (CommandBuffer, FragmentShadingRateNV, [*c]const FragmentShadingRateCombinerOpKHR) callconv(.c) void;
pub extern fn cmdSetFragmentShadingRateEnumNv(command_buffer: CommandBuffer, shading_rate: FragmentShadingRateNV, combiner_ops: [*c]const FragmentShadingRateCombinerOpKHR) void;
pub const AccelerationStructureMotionInstanceTypeNV = enum(u32) {
    static = 0,
    matrix_motion = 1,
    srt_motion = 2,
    max_enum = 2147483647,
};
pub const AccelerationStructureMotionInfoFlagsNV = Flags;
pub const AccelerationStructureMotionInstanceFlagsNV = Flags;
pub const DeviceOrHostAddressConstKHR = extern union {
    deviceAddress: DeviceAddress,
    hostAddress: ?*const anyopaque,
};
pub const AccelerationStructureGeometryMotionTrianglesDataNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    vertex_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
};
pub const AccelerationStructureMotionInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    max_instances: u32 = @import("std").mem.zeroes(u32),
    flags: AccelerationStructureMotionInfoFlagsNV = @import("std").mem.zeroes(AccelerationStructureMotionInfoFlagsNV),
};
pub const AccelerationStructureMatrixMotionInstanceNV = enum(u64) { null = 0, _ };
pub const SRTDataNV = extern struct {
    sx: f32 = @import("std").mem.zeroes(f32),
    a: f32 = @import("std").mem.zeroes(f32),
    b: f32 = @import("std").mem.zeroes(f32),
    pvx: f32 = @import("std").mem.zeroes(f32),
    sy: f32 = @import("std").mem.zeroes(f32),
    c: f32 = @import("std").mem.zeroes(f32),
    pvy: f32 = @import("std").mem.zeroes(f32),
    sz: f32 = @import("std").mem.zeroes(f32),
    pvz: f32 = @import("std").mem.zeroes(f32),
    qx: f32 = @import("std").mem.zeroes(f32),
    qy: f32 = @import("std").mem.zeroes(f32),
    qz: f32 = @import("std").mem.zeroes(f32),
    qw: f32 = @import("std").mem.zeroes(f32),
    tx: f32 = @import("std").mem.zeroes(f32),
    ty: f32 = @import("std").mem.zeroes(f32),
    tz: f32 = @import("std").mem.zeroes(f32),
};
pub const AccelerationStructureSRTMotionInstanceNV = enum(u64) { null = 0, _ };
pub const AccelerationStructureMotionInstanceDataNV = extern union {
    staticInstance: AccelerationStructureInstanceKHR,
    matrixMotionInstance: AccelerationStructureMatrixMotionInstanceNV,
    srtMotionInstance: AccelerationStructureSRTMotionInstanceNV,
};
pub const AccelerationStructureMotionInstanceNV = extern struct {
    type: AccelerationStructureMotionInstanceTypeNV = @import("std").mem.zeroes(AccelerationStructureMotionInstanceTypeNV),
    flags: AccelerationStructureMotionInstanceFlagsNV = @import("std").mem.zeroes(AccelerationStructureMotionInstanceFlagsNV),
    data: AccelerationStructureMotionInstanceDataNV = @import("std").mem.zeroes(AccelerationStructureMotionInstanceDataNV),
};
pub const PhysicalDeviceRayTracingMotionBlurFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_motion_blur: Bool32 = @import("std").mem.zeroes(Bool32),
    ray_tracing_motion_blur_pipeline_trace_rays_indirect: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ycbcr2plane444_formats: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentDensityMap2FeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_density_map_deferred: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentDensityMap2PropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    subsampled_loads: Bool32 = @import("std").mem.zeroes(Bool32),
    subsampled_coarse_reconstruction_early_access: Bool32 = @import("std").mem.zeroes(Bool32),
    max_subsampled_array_layers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_subsampled_samplers: u32 = @import("std").mem.zeroes(u32),
};
pub const CopyCommandTransformInfoQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    transform: SurfaceTransformFlagBits = @import("std").mem.zeroes(SurfaceTransformFlagBits),
};
pub const PhysicalDeviceImageRobustnessFeaturesEXT = PhysicalDeviceImageRobustnessFeatures;
pub const ImageCompressionFlagBitsEXT = enum(u32) {
    default = 0,
    fixed_rate_default = 1,
    fixed_rate_explicit = 2,
    disabled = 4,
    max_enum = 2147483647,
};
pub const ImageCompressionFlagsEXT = Flags;
pub const ImageCompressionFixedRateFlagBitsEXT = enum(u32) {
    none = 0,
    @"1bpc_bit" = 1,
    @"2bpc_bit" = 2,
    @"3bpc_bit" = 4,
    @"4bpc_bit" = 8,
    @"5bpc_bit" = 16,
    @"6bpc_bit" = 32,
    @"7bpc_bit" = 64,
    @"8bpc_bit" = 128,
    @"9bpc_bit" = 256,
    @"10bpc_bit" = 512,
    @"11bpc_bit" = 1024,
    @"12bpc_bit" = 2048,
    @"13bpc_bit" = 4096,
    @"14bpc_bit" = 8192,
    @"15bpc_bit" = 16384,
    @"16bpc_bit" = 32768,
    @"17bpc_bit" = 65536,
    @"18bpc_bit" = 131072,
    @"19bpc_bit" = 262144,
    @"20bpc_bit" = 524288,
    @"21bpc_bit" = 1048576,
    @"22bpc_bit" = 2097152,
    @"23bpc_bit" = 4194304,
    @"24bpc_bit" = 8388608,
    max_enum = 2147483647,
};
pub const ImageCompressionFixedRateFlagsEXT = Flags;
pub const PhysicalDeviceImageCompressionControlFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_compression_control: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ImageCompressionControlEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ImageCompressionFlagsEXT = @import("std").mem.zeroes(ImageCompressionFlagsEXT),
    compression_control_plane_count: u32 = @import("std").mem.zeroes(u32),
    p_fixed_rate_flags: [*c]ImageCompressionFixedRateFlagsEXT = @import("std").mem.zeroes([*c]ImageCompressionFixedRateFlagsEXT),
};
pub const ImageCompressionPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_compression_flags: ImageCompressionFlagsEXT = @import("std").mem.zeroes(ImageCompressionFlagsEXT),
    image_compression_fixed_rate_flags: ImageCompressionFixedRateFlagsEXT = @import("std").mem.zeroes(ImageCompressionFixedRateFlagsEXT),
};
pub const PhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    attachment_feedback_loop_layout: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevice4444FormatsFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    format_a4_r4_g4_b4: Bool32 = @import("std").mem.zeroes(Bool32),
    format_a4_b4_g4_r4: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceFaultAddressTypeEXT = enum(u32) {
    none = 0,
    read_invalid = 1,
    write_invalid = 2,
    execute_invalid = 3,
    instruction_pointer_unknown = 4,
    instruction_pointer_invalid = 5,
    instruction_pointer_fault = 6,
    max_enum = 2147483647,
};
pub const DeviceFaultVendorBinaryHeaderVersionEXT = enum(u32) {
    one = 1,
    max_enum = 2147483647,
};
pub const PhysicalDeviceFaultFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_fault: Bool32 = @import("std").mem.zeroes(Bool32),
    device_fault_vendor_binary: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceFaultCountsEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    address_info_count: u32 = @import("std").mem.zeroes(u32),
    vendor_info_count: u32 = @import("std").mem.zeroes(u32),
    vendor_binary_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const DeviceFaultAddressInfoEXT = extern struct {
    address_type: DeviceFaultAddressTypeEXT = @import("std").mem.zeroes(DeviceFaultAddressTypeEXT),
    reported_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    address_precision: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const DeviceFaultVendorInfoEXT = extern struct {
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    vendor_fault_code: u64 = @import("std").mem.zeroes(u64),
    vendor_fault_data: u64 = @import("std").mem.zeroes(u64),
};
pub const DeviceFaultInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    p_address_infos: [*c]DeviceFaultAddressInfoEXT = @import("std").mem.zeroes([*c]DeviceFaultAddressInfoEXT),
    p_vendor_infos: [*c]DeviceFaultVendorInfoEXT = @import("std").mem.zeroes([*c]DeviceFaultVendorInfoEXT),
    p_vendor_binary_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const DeviceFaultVendorBinaryHeaderVersionOneEXT = extern struct {
    header_size: u32 = @import("std").mem.zeroes(u32),
    header_version: DeviceFaultVendorBinaryHeaderVersionEXT = @import("std").mem.zeroes(DeviceFaultVendorBinaryHeaderVersionEXT),
    vendor_id: u32 = @import("std").mem.zeroes(u32),
    device_id: u32 = @import("std").mem.zeroes(u32),
    driver_version: u32 = @import("std").mem.zeroes(u32),
    pipeline_cache_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    application_name_offset: u32 = @import("std").mem.zeroes(u32),
    application_version: u32 = @import("std").mem.zeroes(u32),
    engine_name_offset: u32 = @import("std").mem.zeroes(u32),
    engine_version: u32 = @import("std").mem.zeroes(u32),
    api_version: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_getDeviceFaultInfoEXT = ?*const fn (Device, [*c]DeviceFaultCountsEXT, [*c]DeviceFaultInfoEXT) callconv(.c) Result;
pub extern fn getDeviceFaultInfoExt(device: Device, p_fault_counts: [*c]DeviceFaultCountsEXT, p_fault_info: [*c]DeviceFaultInfoEXT) Result;
pub const PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    rasterization_order_color_attachment_access: Bool32 = @import("std").mem.zeroes(Bool32),
    rasterization_order_depth_attachment_access: Bool32 = @import("std").mem.zeroes(Bool32),
    rasterization_order_stencil_attachment_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM = PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT;
pub const PhysicalDeviceRGBA10X6FormatsFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    format_rgba10x6_without_ycb_cr_sampler: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMutableDescriptorTypeFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    mutable_descriptor_type: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMutableDescriptorTypeFeaturesVALVE = PhysicalDeviceMutableDescriptorTypeFeaturesEXT;
pub const MutableDescriptorTypeListEXT = extern struct {
    descriptor_type_count: u32 = @import("std").mem.zeroes(u32),
    p_descriptor_types: [*c]const DescriptorType = @import("std").mem.zeroes([*c]const DescriptorType),
};
pub const MutableDescriptorTypeListVALVE = MutableDescriptorTypeListEXT;
pub const MutableDescriptorTypeCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    mutable_descriptor_type_list_count: u32 = @import("std").mem.zeroes(u32),
    p_mutable_descriptor_type_lists: [*c]const MutableDescriptorTypeListEXT = @import("std").mem.zeroes([*c]const MutableDescriptorTypeListEXT),
};
pub const MutableDescriptorTypeCreateInfoVALVE = MutableDescriptorTypeCreateInfoEXT;
pub const PhysicalDeviceVertexInputDynamicStateFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    vertex_input_dynamic_state: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const VertexInputBindingDescription2EXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    binding: u32 = @import("std").mem.zeroes(u32),
    stride: u32 = @import("std").mem.zeroes(u32),
    input_rate: VertexInputRate = @import("std").mem.zeroes(VertexInputRate),
    divisor: u32 = @import("std").mem.zeroes(u32),
};
pub const VertexInputAttributeDescription2EXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    location: u32 = @import("std").mem.zeroes(u32),
    binding: u32 = @import("std").mem.zeroes(u32),
    format: Format = @import("std").mem.zeroes(Format),
    offset: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdSetVertexInputEXT = ?*const fn (CommandBuffer, u32, [*c]const VertexInputBindingDescription2EXT, u32, [*c]const VertexInputAttributeDescription2EXT) callconv(.c) void;
pub extern fn cmdSetVertexInputExt(command_buffer: CommandBuffer, vertex_binding_description_count: u32, p_vertex_binding_descriptions: [*c]const VertexInputBindingDescription2EXT, vertex_attribute_description_count: u32, p_vertex_attribute_descriptions: [*c]const VertexInputAttributeDescription2EXT) void;
pub const PhysicalDeviceDrmPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    has_primary: Bool32 = @import("std").mem.zeroes(Bool32),
    has_render: Bool32 = @import("std").mem.zeroes(Bool32),
    primary_major: i64 = @import("std").mem.zeroes(i64),
    primary_minor: i64 = @import("std").mem.zeroes(i64),
    render_major: i64 = @import("std").mem.zeroes(i64),
    render_minor: i64 = @import("std").mem.zeroes(i64),
};
pub const DeviceAddressBindingTypeEXT = enum(u32) {
    bind = 0,
    unbind = 1,
    max_enum = 2147483647,
};
pub const DeviceAddressBindingFlagBitsEXT = enum(u32) {
    internal_object_bit = 1,
    max_enum = 2147483647,
};
pub const DeviceAddressBindingFlagsEXT = Flags;
pub const PhysicalDeviceAddressBindingReportFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    report_address_binding: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceAddressBindingCallbackDataEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: DeviceAddressBindingFlagsEXT = @import("std").mem.zeroes(DeviceAddressBindingFlagsEXT),
    base_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    binding_type: DeviceAddressBindingTypeEXT = @import("std").mem.zeroes(DeviceAddressBindingTypeEXT),
};
pub const PhysicalDeviceDepthClipControlFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    depth_clip_control: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineViewportDepthClipControlCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    negative_one_to_one: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePrimitiveTopologyListRestartFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    primitive_topology_list_restart: Bool32 = @import("std").mem.zeroes(Bool32),
    primitive_topology_patch_list_restart: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePresentModeFifoLatestReadyFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_mode_fifo_latest_ready: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SubpassShadingPipelineCreateInfoHUAWEI = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    render_pass: RenderPass = @import("std").mem.zeroes(RenderPass),
    subpass: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceSubpassShadingFeaturesHUAWEI = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    subpass_shading: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceSubpassShadingPropertiesHUAWEI = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_subpass_shading_workgroup_size_aspect_ratio: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_getDeviceSubpassShadingMaxWorkgroupSizeHUAWEI = ?*const fn (Device, RenderPass, [*c]Extent2D) callconv(.c) Result;
pub const PFN_cmdSubpassShadingHUAWEI = ?*const fn (CommandBuffer) callconv(.c) void;
pub extern fn getDeviceSubpassShadingMaxWorkgroupSizeHuawei(device: Device, renderpass: RenderPass, p_max_workgroup_size: [*c]Extent2D) Result;
pub extern fn cmdSubpassShadingHuawei(command_buffer: CommandBuffer) void;
pub const PhysicalDeviceInvocationMaskFeaturesHUAWEI = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    invocation_mask: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdBindInvocationMaskHUAWEI = ?*const fn (CommandBuffer, ImageView, ImageLayout) callconv(.c) void;
pub extern fn cmdBindInvocationMaskHuawei(command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout) void;
pub const RemoteAddressNV = ?*anyopaque;
pub const MemoryGetRemoteAddressInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    handle_type: ExternalMemoryHandleTypeFlagBits = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagBits),
};
pub const PhysicalDeviceExternalMemoryRDMAFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    external_memory_rdma: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_getMemoryRemoteAddressNV = ?*const fn (Device, [*c]const MemoryGetRemoteAddressInfoNV, [*c]RemoteAddressNV) callconv(.c) Result;
pub extern fn getMemoryRemoteAddressNv(device: Device, p_memory_get_remote_address_info: [*c]const MemoryGetRemoteAddressInfoNV, p_address: [*c]RemoteAddressNV) Result;
pub const PipelineInfoEXT = PipelineInfoKHR;
pub const PipelinePropertiesIdentifierEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_identifier: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const PhysicalDevicePipelinePropertiesFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_properties_identifier: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_getPipelinePropertiesEXT = ?*const fn (Device, [*c]const PipelineInfoEXT, [*c]BaseOutStructure) callconv(.c) Result;
pub extern fn getPipelinePropertiesExt(device: Device, p_pipeline_info: [*c]const PipelineInfoEXT, p_pipeline_properties: [*c]BaseOutStructure) Result;
pub const FrameBoundaryFlagBitsEXT = enum(u32) {
    frame_end_bit = 1,
    max_enum = 2147483647,
};
pub const FrameBoundaryFlagsEXT = Flags;
pub const PhysicalDeviceFrameBoundaryFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    frame_boundary: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const FrameBoundaryEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: FrameBoundaryFlagsEXT = @import("std").mem.zeroes(FrameBoundaryFlagsEXT),
    frame_id: u64 = @import("std").mem.zeroes(u64),
    image_count: u32 = @import("std").mem.zeroes(u32),
    p_images: [*c]const Image = @import("std").mem.zeroes([*c]const Image),
    buffer_count: u32 = @import("std").mem.zeroes(u32),
    p_buffers: [*c]const Buffer = @import("std").mem.zeroes([*c]const Buffer),
    tag_name: u64 = @import("std").mem.zeroes(u64),
    tag_size: usize = @import("std").mem.zeroes(usize),
    p_tag: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const PhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    multisampled_render_to_single_sampled: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SubpassResolvePerformanceQueryEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    optimal: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MultisampledRenderToSingleSampledInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    multisampled_render_to_single_sampled_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    rasterization_samples: SampleCountFlagBits = @import("std").mem.zeroes(SampleCountFlagBits),
};
pub const PhysicalDeviceExtendedDynamicState2FeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    extended_dynamic_state2: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state2_logic_op: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state2_patch_control_points: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdSetPatchControlPointsEXT = ?*const fn (CommandBuffer, u32) callconv(.c) void;
pub const PFN_cmdSetRasterizerDiscardEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthBiasEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetLogicOpEXT = ?*const fn (CommandBuffer, LogicOp) callconv(.c) void;
pub const PFN_cmdSetPrimitiveRestartEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub extern fn cmdSetPatchControlPointsExt(command_buffer: CommandBuffer, patch_control_points: u32) void;
pub extern fn cmdSetRasterizerDiscardEnableExt(command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32) void;
pub extern fn cmdSetDepthBiasEnableExt(command_buffer: CommandBuffer, depth_bias_enable: Bool32) void;
pub extern fn cmdSetLogicOpExt(command_buffer: CommandBuffer, logic_op: LogicOp) void;
pub extern fn cmdSetPrimitiveRestartEnableExt(command_buffer: CommandBuffer, primitive_restart_enable: Bool32) void;
pub const PhysicalDeviceColorWriteEnableFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    color_write_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineColorWriteCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_write_enables: [*c]const Bool32 = @import("std").mem.zeroes([*c]const Bool32),
};
pub const PFN_cmdSetColorWriteEnableEXT = ?*const fn (CommandBuffer, u32, [*c]const Bool32) callconv(.c) void;
pub extern fn cmdSetColorWriteEnableExt(command_buffer: CommandBuffer, attachment_count: u32, p_color_write_enables: [*c]const Bool32) void;
pub const PhysicalDevicePrimitivesGeneratedQueryFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    primitives_generated_query: Bool32 = @import("std").mem.zeroes(Bool32),
    primitives_generated_query_with_rasterizer_discard: Bool32 = @import("std").mem.zeroes(Bool32),
    primitives_generated_query_with_non_zero_streams: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceGlobalPriorityQueryFeaturesEXT = PhysicalDeviceGlobalPriorityQueryFeatures;
pub const QueueFamilyGlobalPriorityPropertiesEXT = QueueFamilyGlobalPriorityProperties;
pub const PhysicalDeviceImageViewMinLodFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_lod: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ImageViewMinLodCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    min_lod: f32 = @import("std").mem.zeroes(f32),
};
pub const PhysicalDeviceMultiDrawFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    multi_draw: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMultiDrawPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_multi_draw_count: u32 = @import("std").mem.zeroes(u32),
};
pub const MultiDrawInfoEXT = extern struct {
    first_vertex: u32 = @import("std").mem.zeroes(u32),
    vertex_count: u32 = @import("std").mem.zeroes(u32),
};
pub const MultiDrawIndexedInfoEXT = extern struct {
    first_index: u32 = @import("std").mem.zeroes(u32),
    index_count: u32 = @import("std").mem.zeroes(u32),
    vertex_offset: i32 = @import("std").mem.zeroes(i32),
};
pub const PFN_cmdDrawMultiEXT = ?*const fn (CommandBuffer, u32, [*c]const MultiDrawInfoEXT, u32, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawMultiIndexedEXT = ?*const fn (CommandBuffer, u32, [*c]const MultiDrawIndexedInfoEXT, u32, u32, u32, [*c]const i32) callconv(.c) void;
pub extern fn cmdDrawMultiExt(command_buffer: CommandBuffer, draw_count: u32, p_vertex_info: [*c]const MultiDrawInfoEXT, instance_count: u32, first_instance: u32, stride: u32) void;
pub extern fn cmdDrawMultiIndexedExt(command_buffer: CommandBuffer, draw_count: u32, p_index_info: [*c]const MultiDrawIndexedInfoEXT, instance_count: u32, first_instance: u32, stride: u32, p_vertex_offset: [*c]const i32) void;
pub const PhysicalDeviceImage2DViewOf3DFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image2_dview_of3_d: Bool32 = @import("std").mem.zeroes(Bool32),
    sampler2_dview_of3_d: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderTileImageFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_tile_image_color_read_access: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_tile_image_depth_read_access: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_tile_image_stencil_read_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderTileImagePropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_tile_image_coherent_read_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_tile_image_read_sample_from_pixel_rate_invocation: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_tile_image_read_from_helper_invocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MicromapEXT = enum(u64) { null = 0, _ };
pub const MicromapTypeEXT = enum(u32) {
    opacity_micromap = 0,
    max_enum = 2147483647,
};
pub const BuildMicromapModeEXT = enum(u32) {
    build = 0,
    max_enum = 2147483647,
};
pub const CopyMicromapModeEXT = enum(u32) {
    clone = 0,
    serialize = 1,
    deserialize = 2,
    compact = 3,
    max_enum = 2147483647,
};
pub const OpacityMicromapFormatEXT = enum(u32) {
    @"2_state" = 1,
    @"4_state" = 2,
    max_enum = 2147483647,
};
pub const OpacityMicromapSpecialIndexEXT = enum(i32) {
    cluster_geometry_disable_opacity_micromap_nv = -5,
    fully_unknown_opaque = -4,
    fully_unknown_transparent = -3,
    fully_opaque = -2,
    fully_transparent = -1,
    max_enum = 2147483647,
};
pub const AccelerationStructureCompatibilityKHR = enum(u32) {
    compatible = 0,
    incompatible = 1,
    max_enum = 2147483647,
};
pub const AccelerationStructureBuildTypeKHR = enum(u32) {
    host = 0,
    device = 1,
    host_or_device = 2,
    max_enum = 2147483647,
};
pub const BuildMicromapFlagBitsEXT = enum(u32) {
    prefer_fast_trace_bit = 1,
    prefer_fast_build_bit = 2,
    allow_compaction_bit = 4,
    max_enum = 2147483647,
};
pub const BuildMicromapFlagsEXT = Flags;
pub const MicromapCreateFlagBitsEXT = enum(u32) {
    device_address_capture_replay_bit = 1,
    max_enum = 2147483647,
};
pub const MicromapCreateFlagsEXT = Flags;
pub const MicromapUsageEXT = extern struct {
    count: u32 = @import("std").mem.zeroes(u32),
    subdivision_level: u32 = @import("std").mem.zeroes(u32),
    format: u32 = @import("std").mem.zeroes(u32),
};
pub const DeviceOrHostAddressKHR = extern union {
    deviceAddress: DeviceAddress,
    hostAddress: ?*anyopaque,
};
pub const MicromapBuildInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: MicromapTypeEXT = @import("std").mem.zeroes(MicromapTypeEXT),
    flags: BuildMicromapFlagsEXT = @import("std").mem.zeroes(BuildMicromapFlagsEXT),
    mode: BuildMicromapModeEXT = @import("std").mem.zeroes(BuildMicromapModeEXT),
    dst_micromap: MicromapEXT = @import("std").mem.zeroes(MicromapEXT),
    usage_counts_count: u32 = @import("std").mem.zeroes(u32),
    p_usage_counts: [*c]const MicromapUsageEXT = @import("std").mem.zeroes([*c]const MicromapUsageEXT),
    pp_usage_counts: [*c]const [*c]const MicromapUsageEXT = @import("std").mem.zeroes([*c]const [*c]const MicromapUsageEXT),
    data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    scratch_data: DeviceOrHostAddressKHR = @import("std").mem.zeroes(DeviceOrHostAddressKHR),
    triangle_array: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    triangle_array_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const MicromapCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    create_flags: MicromapCreateFlagsEXT = @import("std").mem.zeroes(MicromapCreateFlagsEXT),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    type: MicromapTypeEXT = @import("std").mem.zeroes(MicromapTypeEXT),
    device_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const PhysicalDeviceOpacityMicromapFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    micromap: Bool32 = @import("std").mem.zeroes(Bool32),
    micromap_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    micromap_host_commands: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceOpacityMicromapPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_opacity2_state_subdivision_level: u32 = @import("std").mem.zeroes(u32),
    max_opacity4_state_subdivision_level: u32 = @import("std").mem.zeroes(u32),
};
pub const MicromapVersionInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_version_data: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const CopyMicromapToMemoryInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src: MicromapEXT = @import("std").mem.zeroes(MicromapEXT),
    dst: DeviceOrHostAddressKHR = @import("std").mem.zeroes(DeviceOrHostAddressKHR),
    mode: CopyMicromapModeEXT = @import("std").mem.zeroes(CopyMicromapModeEXT),
};
pub const CopyMemoryToMicromapInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    dst: MicromapEXT = @import("std").mem.zeroes(MicromapEXT),
    mode: CopyMicromapModeEXT = @import("std").mem.zeroes(CopyMicromapModeEXT),
};
pub const CopyMicromapInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src: MicromapEXT = @import("std").mem.zeroes(MicromapEXT),
    dst: MicromapEXT = @import("std").mem.zeroes(MicromapEXT),
    mode: CopyMicromapModeEXT = @import("std").mem.zeroes(CopyMicromapModeEXT),
};
pub const MicromapBuildSizesInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    micromap_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    build_scratch_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    discardable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const AccelerationStructureTrianglesOpacityMicromapEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    index_type: IndexType = @import("std").mem.zeroes(IndexType),
    index_buffer: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    index_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    base_triangle: u32 = @import("std").mem.zeroes(u32),
    usage_counts_count: u32 = @import("std").mem.zeroes(u32),
    p_usage_counts: [*c]const MicromapUsageEXT = @import("std").mem.zeroes([*c]const MicromapUsageEXT),
    pp_usage_counts: [*c]const [*c]const MicromapUsageEXT = @import("std").mem.zeroes([*c]const [*c]const MicromapUsageEXT),
    micromap: MicromapEXT = @import("std").mem.zeroes(MicromapEXT),
};
pub const MicromapTriangleEXT = extern struct {
    data_offset: u32 = @import("std").mem.zeroes(u32),
    subdivision_level: u16 = @import("std").mem.zeroes(u16),
    format: u16 = @import("std").mem.zeroes(u16),
};
pub const PFN_createMicromapEXT = ?*const fn (Device, [*c]const MicromapCreateInfoEXT, [*c]const AllocationCallbacks, [*c]MicromapEXT) callconv(.c) Result;
pub const PFN_destroyMicromapEXT = ?*const fn (Device, MicromapEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_cmdBuildMicromapsEXT = ?*const fn (CommandBuffer, u32, [*c]const MicromapBuildInfoEXT) callconv(.c) void;
pub const PFN_buildMicromapsEXT = ?*const fn (Device, DeferredOperationKHR, u32, [*c]const MicromapBuildInfoEXT) callconv(.c) Result;
pub const PFN_copyMicromapEXT = ?*const fn (Device, DeferredOperationKHR, [*c]const CopyMicromapInfoEXT) callconv(.c) Result;
pub const PFN_copyMicromapToMemoryEXT = ?*const fn (Device, DeferredOperationKHR, [*c]const CopyMicromapToMemoryInfoEXT) callconv(.c) Result;
pub const PFN_copyMemoryToMicromapEXT = ?*const fn (Device, DeferredOperationKHR, [*c]const CopyMemoryToMicromapInfoEXT) callconv(.c) Result;
pub const PFN_writeMicromapsPropertiesEXT = ?*const fn (Device, u32, [*c]const MicromapEXT, QueryType, usize, ?*anyopaque, usize) callconv(.c) Result;
pub const PFN_cmdCopyMicromapEXT = ?*const fn (CommandBuffer, [*c]const CopyMicromapInfoEXT) callconv(.c) void;
pub const PFN_cmdCopyMicromapToMemoryEXT = ?*const fn (CommandBuffer, [*c]const CopyMicromapToMemoryInfoEXT) callconv(.c) void;
pub const PFN_cmdCopyMemoryToMicromapEXT = ?*const fn (CommandBuffer, [*c]const CopyMemoryToMicromapInfoEXT) callconv(.c) void;
pub const PFN_cmdWriteMicromapsPropertiesEXT = ?*const fn (CommandBuffer, u32, [*c]const MicromapEXT, QueryType, QueryPool, u32) callconv(.c) void;
pub const PFN_getDeviceMicromapCompatibilityEXT = ?*const fn (Device, [*c]const MicromapVersionInfoEXT, [*c]AccelerationStructureCompatibilityKHR) callconv(.c) void;
pub const PFN_getMicromapBuildSizesEXT = ?*const fn (Device, AccelerationStructureBuildTypeKHR, [*c]const MicromapBuildInfoEXT, [*c]MicromapBuildSizesInfoEXT) callconv(.c) void;
pub extern fn destroyMicromapExt(device: Device, micromap: MicromapEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn cmdBuildMicromapsExt(command_buffer: CommandBuffer, info_count: u32, p_infos: [*c]const MicromapBuildInfoEXT) void;
pub extern fn buildMicromapsExt(device: Device, deferred_operation: DeferredOperationKHR, info_count: u32, p_infos: [*c]const MicromapBuildInfoEXT) Result;
pub extern fn copyMicromapToMemoryExt(device: Device, deferred_operation: DeferredOperationKHR, p_info: [*c]const CopyMicromapToMemoryInfoEXT) Result;
pub extern fn writeMicromapsPropertiesExt(device: Device, micromap_count: u32, p_micromaps: [*c]const MicromapEXT, query_type: QueryType, data_size: usize, p_data: ?*anyopaque, stride: usize) Result;
pub extern fn cmdCopyMicromapToMemoryExt(command_buffer: CommandBuffer, p_info: [*c]const CopyMicromapToMemoryInfoEXT) void;
pub extern fn cmdWriteMicromapsPropertiesExt(command_buffer: CommandBuffer, micromap_count: u32, p_micromaps: [*c]const MicromapEXT, query_type: QueryType, query_pool: QueryPool, first_query: u32) void;
pub const PhysicalDeviceClusterCullingShaderFeaturesHUAWEI = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    clusterculling_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview_cluster_culling_shader: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceClusterCullingShaderPropertiesHUAWEI = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_work_group_count: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_output_cluster_count: u32 = @import("std").mem.zeroes(u32),
    indirect_buffer_offset_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PhysicalDeviceClusterCullingShaderVrsFeaturesHUAWEI = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cluster_shading_rate: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdDrawClusterHUAWEI = ?*const fn (CommandBuffer, u32, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawClusterIndirectHUAWEI = ?*const fn (CommandBuffer, Buffer, DeviceSize) callconv(.c) void;
pub extern fn cmdDrawClusterHuawei(command_buffer: CommandBuffer, group_count_x: u32, group_count_y: u32, group_count_z: u32) void;
pub extern fn cmdDrawClusterIndirectHuawei(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize) void;
pub const PhysicalDeviceBorderColorSwizzleFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    border_color_swizzle: Bool32 = @import("std").mem.zeroes(Bool32),
    border_color_swizzle_from_image: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SamplerBorderColorComponentMappingCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    components: ComponentMapping = @import("std").mem.zeroes(ComponentMapping),
    srgb: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePageableDeviceLocalMemoryFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pageable_device_local_memory: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_setDeviceMemoryPriorityEXT = ?*const fn (Device, DeviceMemory, f32) callconv(.c) void;
pub extern fn setDeviceMemoryPriorityExt(device: Device, memory: DeviceMemory, priority: f32) void;
pub const PhysicalDeviceShaderCorePropertiesARM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pixel_rate: u32 = @import("std").mem.zeroes(u32),
    texel_rate: u32 = @import("std").mem.zeroes(u32),
    fma_rate: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceSchedulingControlsFlagsARM = Flags64;
pub const PhysicalDeviceSchedulingControlsFlagBitsARM = Flags64;
pub const DeviceQueueShaderCoreControlCreateInfoARM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_core_count: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceSchedulingControlsFeaturesARM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    scheduling_controls: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceSchedulingControlsPropertiesARM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    scheduling_controls_flags: PhysicalDeviceSchedulingControlsFlagsARM = @import("std").mem.zeroes(PhysicalDeviceSchedulingControlsFlagsARM),
};
pub const PhysicalDeviceImageSlicedViewOf3DFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_sliced_view_of3_d: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ImageViewSlicedCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    slice_offset: u32 = @import("std").mem.zeroes(u32),
    slice_count: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceDescriptorSetHostMappingFeaturesVALVE = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    descriptor_set_host_mapping: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DescriptorSetBindingReferenceVALVE = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    descriptor_set_layout: DescriptorSetLayout = @import("std").mem.zeroes(DescriptorSetLayout),
    binding: u32 = @import("std").mem.zeroes(u32),
};
pub const DescriptorSetLayoutHostMappingInfoVALVE = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    descriptor_offset: usize = @import("std").mem.zeroes(usize),
    descriptor_size: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_getDescriptorSetLayoutHostMappingInfoVALVE = ?*const fn (Device, [*c]const DescriptorSetBindingReferenceVALVE, [*c]DescriptorSetLayoutHostMappingInfoVALVE) callconv(.c) void;
pub const PFN_getDescriptorSetHostMappingVALVE = ?*const fn (Device, DescriptorSet, [*c]?*anyopaque) callconv(.c) void;
pub extern fn getDescriptorSetLayoutHostMappingInfoValve(device: Device, p_binding_reference: [*c]const DescriptorSetBindingReferenceVALVE, p_host_mapping: [*c]DescriptorSetLayoutHostMappingInfoVALVE) void;
pub extern fn getDescriptorSetHostMappingValve(device: Device, descriptor_set: DescriptorSet, pp_data: [*c]?*anyopaque) void;
pub const PhysicalDeviceDepthClampZeroOneFeaturesEXT = PhysicalDeviceDepthClampZeroOneFeaturesKHR;
pub const PhysicalDeviceNonSeamlessCubeMapFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    non_seamless_cube_map: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRenderPassStripedFeaturesARM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    render_pass_striped: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRenderPassStripedPropertiesARM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    render_pass_stripe_granularity: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_render_pass_stripes: u32 = @import("std").mem.zeroes(u32),
};
pub const RenderPassStripeInfoARM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stripe_area: Rect2D = @import("std").mem.zeroes(Rect2D),
};
pub const RenderPassStripeBeginInfoARM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stripe_info_count: u32 = @import("std").mem.zeroes(u32),
    p_stripe_infos: [*c]const RenderPassStripeInfoARM = @import("std").mem.zeroes([*c]const RenderPassStripeInfoARM),
};
pub const RenderPassStripeSubmitInfoARM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stripe_semaphore_info_count: u32 = @import("std").mem.zeroes(u32),
    p_stripe_semaphore_infos: [*c]const SemaphoreSubmitInfo = @import("std").mem.zeroes([*c]const SemaphoreSubmitInfo),
};
pub const PhysicalDeviceFragmentDensityMapOffsetFeaturesQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_density_map_offset: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentDensityMapOffsetPropertiesQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_density_offset_granularity: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const SubpassFragmentDensityMapOffsetEndInfoQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    fragment_density_offset_count: u32 = @import("std").mem.zeroes(u32),
    p_fragment_density_offsets: [*c]const Offset2D = @import("std").mem.zeroes([*c]const Offset2D),
};
pub const CopyMemoryIndirectCommandNV = extern struct {
    src_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    dst_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const CopyMemoryToImageIndirectCommandNV = extern struct {
    src_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    buffer_row_length: u32 = @import("std").mem.zeroes(u32),
    buffer_image_height: u32 = @import("std").mem.zeroes(u32),
    image_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    image_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    image_extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const PhysicalDeviceCopyMemoryIndirectFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    indirect_copy: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceCopyMemoryIndirectPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supported_queues: QueueFlags = @import("std").mem.zeroes(QueueFlags),
};
pub const PFN_cmdCopyMemoryIndirectNV = ?*const fn (CommandBuffer, DeviceAddress, u32, u32) callconv(.c) void;
pub const PFN_cmdCopyMemoryToImageIndirectNV = ?*const fn (CommandBuffer, DeviceAddress, u32, u32, Image, ImageLayout, [*c]const ImageSubresourceLayers) callconv(.c) void;
pub extern fn cmdCopyMemoryIndirectNv(command_buffer: CommandBuffer, copy_buffer_address: DeviceAddress, copy_count: u32, stride: u32) void;
pub extern fn cmdCopyMemoryToImageIndirectNv(command_buffer: CommandBuffer, copy_buffer_address: DeviceAddress, copy_count: u32, stride: u32, dst_image: Image, dst_imageLayout: ImageLayout, p_image_subresources: [*c]const ImageSubresourceLayers) void;
pub const MemoryDecompressionMethodFlagBitsNV = Flags64;
pub const MemoryDecompressionMethodFlagsNV = Flags64;
pub const DecompressMemoryRegionNV = extern struct {
    src_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    dst_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    compressed_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    decompressed_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    decompression_method: MemoryDecompressionMethodFlagsNV = @import("std").mem.zeroes(MemoryDecompressionMethodFlagsNV),
};
pub const PhysicalDeviceMemoryDecompressionFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_decompression: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMemoryDecompressionPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    decompression_methods: MemoryDecompressionMethodFlagsNV = @import("std").mem.zeroes(MemoryDecompressionMethodFlagsNV),
    max_decompression_indirect_count: u64 = @import("std").mem.zeroes(u64),
};
pub const PFN_cmdDecompressMemoryNV = ?*const fn (CommandBuffer, u32, [*c]const DecompressMemoryRegionNV) callconv(.c) void;
pub const PFN_cmdDecompressMemoryIndirectCountNV = ?*const fn (CommandBuffer, DeviceAddress, DeviceAddress, u32) callconv(.c) void;
pub extern fn cmdDecompressMemoryNv(command_buffer: CommandBuffer, decompress_region_count: u32, p_decompress_memory_regions: [*c]const DecompressMemoryRegionNV) void;
pub extern fn cmdDecompressMemoryIndirectCountNv(command_buffer: CommandBuffer, indirect_commands_address: DeviceAddress, indirect_commands_count_address: DeviceAddress, stride: u32) void;
pub const PhysicalDeviceDeviceGeneratedCommandsComputeFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_generated_compute: Bool32 = @import("std").mem.zeroes(Bool32),
    device_generated_compute_pipelines: Bool32 = @import("std").mem.zeroes(Bool32),
    device_generated_compute_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ComputePipelineIndirectBufferInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    pipeline_device_address_capture_replay: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const PipelineIndirectDeviceAddressInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
};
pub const BindPipelineIndirectCommandNV = extern struct {
    pipeline_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const PFN_getPipelineIndirectMemoryRequirementsNV = ?*const fn (Device, [*c]const ComputePipelineCreateInfo, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_cmdUpdatePipelineIndirectBufferNV = ?*const fn (CommandBuffer, PipelineBindPoint, Pipeline) callconv(.c) void;
pub const PFN_getPipelineIndirectDeviceAddressNV = ?*const fn (Device, [*c]const PipelineIndirectDeviceAddressInfoNV) callconv(.c) DeviceAddress;
pub extern fn getPipelineIndirectMemoryRequirementsNv(device: Device, p_create_info: [*c]const ComputePipelineCreateInfo, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn cmdUpdatePipelineIndirectBufferNv(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, pipeline: Pipeline) void;
pub extern fn getPipelineIndirectDeviceAddressNv(device: Device, p_info: [*c]const PipelineIndirectDeviceAddressInfoNV) DeviceAddress;
pub const RayTracingLssIndexingModeNV = enum(u32) {
    list = 0,
    successive = 1,
    max_enum = 2147483647,
};
pub const RayTracingLssPrimitiveEndCapsModeNV = enum(u32) {
    none = 0,
    chained = 1,
    max_enum = 2147483647,
};
pub const PhysicalDeviceRayTracingLinearSweptSpheresFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    spheres: Bool32 = @import("std").mem.zeroes(Bool32),
    linear_swept_spheres: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const AccelerationStructureGeometryLinearSweptSpheresDataNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    vertex_format: Format = @import("std").mem.zeroes(Format),
    vertex_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    vertex_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    radius_format: Format = @import("std").mem.zeroes(Format),
    radius_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    radius_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    index_type: IndexType = @import("std").mem.zeroes(IndexType),
    index_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    index_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    indexing_mode: RayTracingLssIndexingModeNV = @import("std").mem.zeroes(RayTracingLssIndexingModeNV),
    end_caps_mode: RayTracingLssPrimitiveEndCapsModeNV = @import("std").mem.zeroes(RayTracingLssPrimitiveEndCapsModeNV),
};
pub const AccelerationStructureGeometrySpheresDataNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    vertex_format: Format = @import("std").mem.zeroes(Format),
    vertex_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    vertex_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    radius_format: Format = @import("std").mem.zeroes(Format),
    radius_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    radius_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    index_type: IndexType = @import("std").mem.zeroes(IndexType),
    index_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    index_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PhysicalDeviceLinearColorAttachmentFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    linear_color_attachment: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImageCompressionControlSwapchainFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_compression_control_swapchain: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ImageViewSampleWeightCreateInfoQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    filter_center: Offset2D = @import("std").mem.zeroes(Offset2D),
    filter_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    num_phases: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceImageProcessingFeaturesQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    texture_sample_weighted: Bool32 = @import("std").mem.zeroes(Bool32),
    texture_box_filter: Bool32 = @import("std").mem.zeroes(Bool32),
    texture_block_match: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImageProcessingPropertiesQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_weight_filter_phases: u32 = @import("std").mem.zeroes(u32),
    max_weight_filter_dimension: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_block_match_region: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_box_filter_block_size: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const PhysicalDeviceNestedCommandBufferFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    nested_command_buffer: Bool32 = @import("std").mem.zeroes(Bool32),
    nested_command_buffer_rendering: Bool32 = @import("std").mem.zeroes(Bool32),
    nested_command_buffer_simultaneous_use: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceNestedCommandBufferPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_command_buffer_nesting_level: u32 = @import("std").mem.zeroes(u32),
};
pub const ExternalMemoryAcquireUnmodifiedEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acquire_unmodified_memory: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceExtendedDynamicState3FeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    extended_dynamic_state3_tessellation_domain_origin: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_depth_clamp_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_polygon_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_rasterization_samples: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_sample_mask: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_alpha_to_coverage_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_alpha_to_one_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_logic_op_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_color_blend_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_color_blend_equation: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_color_write_mask: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_rasterization_stream: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_conservative_rasterization_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_extra_primitive_overestimation_size: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_depth_clip_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_sample_locations_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_color_blend_advanced: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_provoking_vertex_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_line_rasterization_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_line_stipple_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_depth_clip_negative_one_to_one: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_viewport_wscaling_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_viewport_swizzle: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_coverage_to_color_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_coverage_to_color_location: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_coverage_modulation_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_coverage_modulation_table_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_coverage_modulation_table: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_coverage_reduction_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_representative_fragment_test_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3_shading_rate_image_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceExtendedDynamicState3PropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    dynamic_primitive_topology_unrestricted: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ColorBlendEquationEXT = extern struct {
    src_color_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    dst_color_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    color_blend_op: BlendOp = @import("std").mem.zeroes(BlendOp),
    src_alpha_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    dst_alpha_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    alpha_blend_op: BlendOp = @import("std").mem.zeroes(BlendOp),
};
pub const ColorBlendAdvancedEXT = extern struct {
    advanced_blend_op: BlendOp = @import("std").mem.zeroes(BlendOp),
    src_premultiplied: Bool32 = @import("std").mem.zeroes(Bool32),
    dst_premultiplied: Bool32 = @import("std").mem.zeroes(Bool32),
    blend_overlap: BlendOverlapEXT = @import("std").mem.zeroes(BlendOverlapEXT),
    clamp_results: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdSetDepthClampEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetPolygonModeEXT = ?*const fn (CommandBuffer, PolygonMode) callconv(.c) void;
pub const PFN_cmdSetRasterizationSamplesEXT = ?*const fn (CommandBuffer, SampleCountFlagBits) callconv(.c) void;
pub const PFN_cmdSetSampleMaskEXT = ?*const fn (CommandBuffer, SampleCountFlagBits, [*c]const SampleMask) callconv(.c) void;
pub const PFN_cmdSetAlphaToCoverageEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetAlphaToOneEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetLogicOpEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetColorBlendEnableEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const Bool32) callconv(.c) void;
pub const PFN_cmdSetColorBlendEquationEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const ColorBlendEquationEXT) callconv(.c) void;
pub const PFN_cmdSetColorWriteMaskEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const ColorComponentFlags) callconv(.c) void;
pub const PFN_cmdSetTessellationDomainOriginEXT = ?*const fn (CommandBuffer, TessellationDomainOrigin) callconv(.c) void;
pub const PFN_cmdSetRasterizationStreamEXT = ?*const fn (CommandBuffer, u32) callconv(.c) void;
pub const PFN_cmdSetConservativeRasterizationModeEXT = ?*const fn (CommandBuffer, ConservativeRasterizationModeEXT) callconv(.c) void;
pub const PFN_cmdSetExtraPrimitiveOverestimationSizeEXT = ?*const fn (CommandBuffer, f32) callconv(.c) void;
pub const PFN_cmdSetDepthClipEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetSampleLocationsEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetColorBlendAdvancedEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const ColorBlendAdvancedEXT) callconv(.c) void;
pub const PFN_cmdSetProvokingVertexModeEXT = ?*const fn (CommandBuffer, ProvokingVertexModeEXT) callconv(.c) void;
pub const PFN_cmdSetLineRasterizationModeEXT = ?*const fn (CommandBuffer, LineRasterizationModeEXT) callconv(.c) void;
pub const PFN_cmdSetLineStippleEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthClipNegativeOneToOneEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetViewportWScalingEnableNV = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetViewportSwizzleNV = ?*const fn (CommandBuffer, u32, u32, [*c]const ViewportSwizzleNV) callconv(.c) void;
pub const PFN_cmdSetCoverageToColorEnableNV = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetCoverageToColorLocationNV = ?*const fn (CommandBuffer, u32) callconv(.c) void;
pub const PFN_cmdSetCoverageModulationModeNV = ?*const fn (CommandBuffer, CoverageModulationModeNV) callconv(.c) void;
pub const PFN_cmdSetCoverageModulationTableEnableNV = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetCoverageModulationTableNV = ?*const fn (CommandBuffer, u32, [*c]const f32) callconv(.c) void;
pub const PFN_cmdSetShadingRateImageEnableNV = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetRepresentativeFragmentTestEnableNV = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetCoverageReductionModeNV = ?*const fn (CommandBuffer, CoverageReductionModeNV) callconv(.c) void;
pub extern fn cmdSetDepthClampEnableExt(command_buffer: CommandBuffer, depth_clamp_enable: Bool32) void;
pub extern fn cmdSetPolygonModeExt(command_buffer: CommandBuffer, polygon_mode: PolygonMode) void;
pub extern fn cmdSetRasterizationSamplesExt(command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits) void;
pub extern fn cmdSetSampleMaskExt(command_buffer: CommandBuffer, samples: SampleCountFlagBits, p_sample_mask: [*c]const SampleMask) void;
pub extern fn cmdSetAlphaToCoverageEnableExt(command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32) void;
pub extern fn cmdSetAlphaToOneEnableExt(command_buffer: CommandBuffer, alpha_to_one_enable: Bool32) void;
pub extern fn cmdSetLogicOpEnableExt(command_buffer: CommandBuffer, logic_op_enable: Bool32) void;
pub extern fn cmdSetColorBlendEnableExt(command_buffer: CommandBuffer, first_attachment: u32, attachment_count: u32, p_color_blend_enables: [*c]const Bool32) void;
pub extern fn cmdSetColorBlendEquationExt(command_buffer: CommandBuffer, first_attachment: u32, attachment_count: u32, p_color_blend_equations: [*c]const ColorBlendEquationEXT) void;
pub extern fn cmdSetColorWriteMaskExt(command_buffer: CommandBuffer, first_attachment: u32, attachment_count: u32, p_color_write_masks: [*c]const ColorComponentFlags) void;
pub extern fn cmdSetTessellationDomainOriginExt(command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin) void;
pub extern fn cmdSetRasterizationStreamExt(command_buffer: CommandBuffer, rasterization_stream: u32) void;
pub extern fn cmdSetConservativeRasterizationModeExt(command_buffer: CommandBuffer, conservative_rasterization_mode: ConservativeRasterizationModeEXT) void;
pub extern fn cmdSetExtraPrimitiveOverestimationSizeExt(command_buffer: CommandBuffer, extra_primitive_overestimation_size: f32) void;
pub extern fn cmdSetDepthClipEnableExt(command_buffer: CommandBuffer, depth_clip_enable: Bool32) void;
pub extern fn cmdSetSampleLocationsEnableExt(command_buffer: CommandBuffer, sample_locations_enable: Bool32) void;
pub extern fn cmdSetColorBlendAdvancedExt(command_buffer: CommandBuffer, first_attachment: u32, attachment_count: u32, p_color_blend_advanced: [*c]const ColorBlendAdvancedEXT) void;
pub extern fn cmdSetProvokingVertexModeExt(command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT) void;
pub extern fn cmdSetLineRasterizationModeExt(command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT) void;
pub extern fn cmdSetLineStippleEnableExt(command_buffer: CommandBuffer, stippled_line_enable: Bool32) void;
pub extern fn cmdSetDepthClipNegativeOneToOneExt(command_buffer: CommandBuffer, negative_one_to_one: Bool32) void;
pub extern fn cmdSetViewportWscalingEnableNv(command_buffer: CommandBuffer, viewport_wscaling_enable: Bool32) void;
pub extern fn cmdSetViewportSwizzleNv(command_buffer: CommandBuffer, first_viewport: u32, viewport_count: u32, p_viewport_swizzles: [*c]const ViewportSwizzleNV) void;
pub extern fn cmdSetCoverageToColorEnableNv(command_buffer: CommandBuffer, coverage_to_color_enable: Bool32) void;
pub extern fn cmdSetCoverageToColorLocationNv(command_buffer: CommandBuffer, coverage_to_color_location: u32) void;
pub extern fn cmdSetCoverageModulationModeNv(command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV) void;
pub extern fn cmdSetCoverageModulationTableEnableNv(command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32) void;
pub extern fn cmdSetCoverageModulationTableNv(command_buffer: CommandBuffer, coverage_modulation_table_count: u32, p_coverage_modulation_table: [*c]const f32) void;
pub extern fn cmdSetShadingRateImageEnableNv(command_buffer: CommandBuffer, shading_rate_image_enable: Bool32) void;
pub extern fn cmdSetRepresentativeFragmentTestEnableNv(command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32) void;
pub extern fn cmdSetCoverageReductionModeNv(command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV) void;
pub const SubpassMergeStatusEXT = enum(u32) {
    merged = 0,
    disallowed = 1,
    not_merged_side_effects = 2,
    not_merged_samples_mismatch = 3,
    not_merged_views_mismatch = 4,
    not_merged_aliasing = 5,
    not_merged_dependencies = 6,
    not_merged_incompatible_input_attachment = 7,
    not_merged_too_many_attachments = 8,
    not_merged_insufficient_storage = 9,
    not_merged_depth_stencil_count = 10,
    not_merged_resolve_attachment_reuse = 11,
    not_merged_single_subpass = 12,
    not_merged_unspecified = 13,
    max_enum = 2147483647,
};
pub const PhysicalDeviceSubpassMergeFeedbackFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    subpass_merge_feedback: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RenderPassCreationControlEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    disallow_merging: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RenderPassCreationFeedbackInfoEXT = extern struct {
    post_merge_subpass_count: u32 = @import("std").mem.zeroes(u32),
};
pub const RenderPassCreationFeedbackCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_render_pass_feedback: [*c]RenderPassCreationFeedbackInfoEXT = @import("std").mem.zeroes([*c]RenderPassCreationFeedbackInfoEXT),
};
pub const RenderPassSubpassFeedbackInfoEXT = extern struct {
    subpass_merge_status: SubpassMergeStatusEXT = @import("std").mem.zeroes(SubpassMergeStatusEXT),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    post_merge_index: u32 = @import("std").mem.zeroes(u32),
};
pub const RenderPassSubpassFeedbackCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_subpass_feedback: [*c]RenderPassSubpassFeedbackInfoEXT = @import("std").mem.zeroes([*c]RenderPassSubpassFeedbackInfoEXT),
};
pub const DirectDriverLoadingModeLUNARG = enum(u32) {
    exclusive = 0,
    inclusive = 1,
    max_enum = 2147483647,
};
pub const DirectDriverLoadingFlagsLUNARG = Flags;
pub const PFN_getInstanceProcAddrLUNARG = ?*const fn (Instance, [*c]const u8) callconv(.c) PFN_voidFunction;
pub const DirectDriverLoadingInfoLUNARG = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: DirectDriverLoadingFlagsLUNARG = @import("std").mem.zeroes(DirectDriverLoadingFlagsLUNARG),
    pfn_get_instance_proc_addr: PFN_getInstanceProcAddrLUNARG = @import("std").mem.zeroes(PFN_getInstanceProcAddrLUNARG),
};
pub const DirectDriverLoadingListLUNARG = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    mode: DirectDriverLoadingModeLUNARG = @import("std").mem.zeroes(DirectDriverLoadingModeLUNARG),
    driver_count: u32 = @import("std").mem.zeroes(u32),
    p_drivers: [*c]const DirectDriverLoadingInfoLUNARG = @import("std").mem.zeroes([*c]const DirectDriverLoadingInfoLUNARG),
};
pub const PhysicalDeviceShaderModuleIdentifierFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_module_identifier: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderModuleIdentifierPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_module_identifier_algorithm_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const PipelineShaderStageModuleIdentifierCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    identifier_size: u32 = @import("std").mem.zeroes(u32),
    p_identifier: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const ShaderModuleIdentifierEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    identifier_size: u32 = @import("std").mem.zeroes(u32),
    identifier: [32]u8 = @import("std").mem.zeroes([32]u8),
};
pub const PFN_getShaderModuleIdentifierEXT = ?*const fn (Device, ShaderModule, [*c]ShaderModuleIdentifierEXT) callconv(.c) void;
pub const PFN_getShaderModuleCreateInfoIdentifierEXT = ?*const fn (Device, [*c]const ShaderModuleCreateInfo, [*c]ShaderModuleIdentifierEXT) callconv(.c) void;
pub extern fn getShaderModuleIdentifierExt(device: Device, shader_module: ShaderModule, p_identifier: [*c]ShaderModuleIdentifierEXT) void;
pub extern fn getShaderModuleCreateInfoIdentifierExt(device: Device, p_create_info: [*c]const ShaderModuleCreateInfo, p_identifier: [*c]ShaderModuleIdentifierEXT) void;
pub const OpticalFlowSessionNV = enum(u64) { null = 0, _ };
pub const OpticalFlowPerformanceLevelNV = enum(u32) {
    unknown = 0,
    slow = 1,
    medium = 2,
    fast = 3,
    max_enum = 2147483647,
};
pub const OpticalFlowSessionBindingPointNV = enum(u32) {
    unknown = 0,
    input = 1,
    reference = 2,
    hint = 3,
    flow_vector = 4,
    backward_flow_vector = 5,
    cost = 6,
    backward_cost = 7,
    global_flow = 8,
    max_enum = 2147483647,
};
pub const OpticalFlowGridSizeFlagBitsNV = enum(u32) {
    unknown = 0,
    @"1x1_bit" = 1,
    @"2x2_bit" = 2,
    @"4x4_bit" = 4,
    @"8x8_bit" = 8,
    max_enum = 2147483647,
};
pub const OpticalFlowGridSizeFlagsNV = Flags;
pub const OpticalFlowUsageFlagBitsNV = enum(u32) {
    unknown = 0,
    input_bit = 1,
    output_bit = 2,
    hint_bit = 4,
    cost_bit = 8,
    global_flow_bit = 16,
    max_enum = 2147483647,
};
pub const OpticalFlowUsageFlagsNV = Flags;
pub const OpticalFlowSessionCreateFlagBitsNV = enum(u32) {
    enable_hint_bit = 1,
    enable_cost_bit = 2,
    enable_global_flow_bit = 4,
    allow_regions_bit = 8,
    both_directions_bit = 16,
    max_enum = 2147483647,
};
pub const OpticalFlowSessionCreateFlagsNV = Flags;
pub const OpticalFlowExecuteFlagBitsNV = enum(u32) {
    disable_temporal_hints_bit = 1,
    max_enum = 2147483647,
};
pub const OpticalFlowExecuteFlagsNV = Flags;
pub const PhysicalDeviceOpticalFlowFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    optical_flow: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceOpticalFlowPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supported_output_grid_sizes: OpticalFlowGridSizeFlagsNV = @import("std").mem.zeroes(OpticalFlowGridSizeFlagsNV),
    supported_hint_grid_sizes: OpticalFlowGridSizeFlagsNV = @import("std").mem.zeroes(OpticalFlowGridSizeFlagsNV),
    hint_supported: Bool32 = @import("std").mem.zeroes(Bool32),
    cost_supported: Bool32 = @import("std").mem.zeroes(Bool32),
    bidirectional_flow_supported: Bool32 = @import("std").mem.zeroes(Bool32),
    global_flow_supported: Bool32 = @import("std").mem.zeroes(Bool32),
    min_width: u32 = @import("std").mem.zeroes(u32),
    min_height: u32 = @import("std").mem.zeroes(u32),
    max_width: u32 = @import("std").mem.zeroes(u32),
    max_height: u32 = @import("std").mem.zeroes(u32),
    max_num_regions_of_interest: u32 = @import("std").mem.zeroes(u32),
};
pub const OpticalFlowImageFormatInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    usage: OpticalFlowUsageFlagsNV = @import("std").mem.zeroes(OpticalFlowUsageFlagsNV),
};
pub const OpticalFlowImageFormatPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    format: Format = @import("std").mem.zeroes(Format),
};
pub const OpticalFlowSessionCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
    image_format: Format = @import("std").mem.zeroes(Format),
    flow_vector_format: Format = @import("std").mem.zeroes(Format),
    cost_format: Format = @import("std").mem.zeroes(Format),
    output_grid_size: OpticalFlowGridSizeFlagsNV = @import("std").mem.zeroes(OpticalFlowGridSizeFlagsNV),
    hint_grid_size: OpticalFlowGridSizeFlagsNV = @import("std").mem.zeroes(OpticalFlowGridSizeFlagsNV),
    performance_level: OpticalFlowPerformanceLevelNV = @import("std").mem.zeroes(OpticalFlowPerformanceLevelNV),
    flags: OpticalFlowSessionCreateFlagsNV = @import("std").mem.zeroes(OpticalFlowSessionCreateFlagsNV),
};
pub const OpticalFlowSessionCreatePrivateDataInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    id: u32 = @import("std").mem.zeroes(u32),
    size: u32 = @import("std").mem.zeroes(u32),
    p_private_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const OpticalFlowExecuteInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: OpticalFlowExecuteFlagsNV = @import("std").mem.zeroes(OpticalFlowExecuteFlagsNV),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const PFN_getPhysicalDeviceOpticalFlowImageFormatsNV = ?*const fn (PhysicalDevice, [*c]const OpticalFlowImageFormatInfoNV, [*c]u32, [*c]OpticalFlowImageFormatPropertiesNV) callconv(.c) Result;
pub const PFN_createOpticalFlowSessionNV = ?*const fn (Device, [*c]const OpticalFlowSessionCreateInfoNV, [*c]const AllocationCallbacks, [*c]OpticalFlowSessionNV) callconv(.c) Result;
pub const PFN_destroyOpticalFlowSessionNV = ?*const fn (Device, OpticalFlowSessionNV, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_bindOpticalFlowSessionImageNV = ?*const fn (Device, OpticalFlowSessionNV, OpticalFlowSessionBindingPointNV, ImageView, ImageLayout) callconv(.c) Result;
pub const PFN_cmdOpticalFlowExecuteNV = ?*const fn (CommandBuffer, OpticalFlowSessionNV, [*c]const OpticalFlowExecuteInfoNV) callconv(.c) void;
pub extern fn getPhysicalDeviceOpticalFlowImageFormatsNv(physical_device: PhysicalDevice, p_optical_flow_image_format_info: [*c]const OpticalFlowImageFormatInfoNV, p_format_count: [*c]u32, p_image_format_properties: [*c]OpticalFlowImageFormatPropertiesNV) Result;
pub extern fn createOpticalFlowSessionNv(device: Device, p_create_info: [*c]const OpticalFlowSessionCreateInfoNV, p_allocator: [*c]const AllocationCallbacks, p_session: [*c]OpticalFlowSessionNV) Result;
pub extern fn destroyOpticalFlowSessionNv(device: Device, session: OpticalFlowSessionNV, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn bindOpticalFlowSessionImageNv(device: Device, session: OpticalFlowSessionNV, binding_point: OpticalFlowSessionBindingPointNV, view: ImageView, layout: ImageLayout) Result;
pub extern fn cmdOpticalFlowExecuteNv(command_buffer: CommandBuffer, session: OpticalFlowSessionNV, p_execute_info: [*c]const OpticalFlowExecuteInfoNV) void;
pub const PhysicalDeviceLegacyDitheringFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    legacy_dithering: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePipelineProtectedAccessFeaturesEXT = PhysicalDevicePipelineProtectedAccessFeatures;
pub const AntiLagModeAMD = enum(u32) {
    driver_control = 0,
    on = 1,
    off = 2,
    max_enum = 2147483647,
};
pub const AntiLagStageAMD = enum(u32) {
    input = 0,
    present = 1,
    max_enum = 2147483647,
};
pub const PhysicalDeviceAntiLagFeaturesAMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    anti_lag: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const AntiLagPresentationInfoAMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    stage: AntiLagStageAMD = @import("std").mem.zeroes(AntiLagStageAMD),
    frame_index: u64 = @import("std").mem.zeroes(u64),
};
pub const AntiLagDataAMD = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    mode: AntiLagModeAMD = @import("std").mem.zeroes(AntiLagModeAMD),
    max_fps: u32 = @import("std").mem.zeroes(u32),
    p_presentation_info: [*c]const AntiLagPresentationInfoAMD = @import("std").mem.zeroes([*c]const AntiLagPresentationInfoAMD),
};
pub const PFN_antiLagUpdateAMD = ?*const fn (Device, [*c]const AntiLagDataAMD) callconv(.c) void;
pub extern fn antiLagUpdateAmd(device: Device, p_data: [*c]const AntiLagDataAMD) void;
pub const ShaderEXT = enum(u64) { null = 0, _ };
pub const ShaderCodeTypeEXT = enum(u32) {
    binary = 0,
    spirv = 1,
    max_enum = 2147483647,
};
pub const DepthClampModeEXT = enum(u32) {
    viewport_range = 0,
    user_defined_range = 1,
    max_enum = 2147483647,
};
pub const ShaderCreateFlagBitsEXT = enum(u32) {
    link_stage_bit = 1,
    allow_varying_subgroup_size_bit = 2,
    require_full_subgroups_bit = 4,
    no_task_shader_bit = 8,
    dispatch_base_bit = 16,
    fragment_shading_rate_attachment_bit = 32,
    fragment_density_map_attachment_bit = 64,
    indirect_bindable_bit = 128,
    max_enum = 2147483647,
};
pub const ShaderCreateFlagsEXT = Flags;
pub const PhysicalDeviceShaderObjectFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_object: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderObjectPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_binary_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    shader_binary_version: u32 = @import("std").mem.zeroes(u32),
};
pub const ShaderCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ShaderCreateFlagsEXT = @import("std").mem.zeroes(ShaderCreateFlagsEXT),
    stage: ShaderStageFlagBits = @import("std").mem.zeroes(ShaderStageFlagBits),
    next_stage: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    code_type: ShaderCodeTypeEXT = @import("std").mem.zeroes(ShaderCodeTypeEXT),
    code_size: usize = @import("std").mem.zeroes(usize),
    p_code: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    set_layout_count: u32 = @import("std").mem.zeroes(u32),
    p_set_layouts: [*c]const DescriptorSetLayout = @import("std").mem.zeroes([*c]const DescriptorSetLayout),
    push_constant_range_count: u32 = @import("std").mem.zeroes(u32),
    p_push_constant_ranges: [*c]const PushConstantRange = @import("std").mem.zeroes([*c]const PushConstantRange),
    p_specialization_info: [*c]const SpecializationInfo = @import("std").mem.zeroes([*c]const SpecializationInfo),
};
pub const ShaderRequiredSubgroupSizeCreateInfoEXT = PipelineShaderStageRequiredSubgroupSizeCreateInfo;
pub const DepthClampRangeEXT = extern struct {
    min_depth_clamp: f32 = @import("std").mem.zeroes(f32),
    max_depth_clamp: f32 = @import("std").mem.zeroes(f32),
};
pub const PFN_createShadersEXT = ?*const fn (Device, u32, [*c]const ShaderCreateInfoEXT, [*c]const AllocationCallbacks, [*c]ShaderEXT) callconv(.c) Result;
pub const PFN_destroyShaderEXT = ?*const fn (Device, ShaderEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getShaderBinaryDataEXT = ?*const fn (Device, ShaderEXT, [*c]usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_cmdBindShadersEXT = ?*const fn (CommandBuffer, u32, [*c]const ShaderStageFlagBits, [*c]const ShaderEXT) callconv(.c) void;
pub const PFN_cmdSetDepthClampRangeEXT = ?*const fn (CommandBuffer, DepthClampModeEXT, [*c]const DepthClampRangeEXT) callconv(.c) void;
pub extern fn createShadersExt(device: Device, create_info_count: u32, p_create_infos: [*c]const ShaderCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_shaders: [*c]ShaderEXT) Result;
pub extern fn destroyShaderExt(device: Device, shader: ShaderEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getShaderBinaryDataExt(device: Device, shader: ShaderEXT, p_data_size: [*c]usize, p_data: ?*anyopaque) Result;
pub extern fn cmdBindShadersExt(command_buffer: CommandBuffer, stage_count: u32, p_stages: [*c]const ShaderStageFlagBits, p_shaders: [*c]const ShaderEXT) void;
pub extern fn cmdSetDepthClampRangeExt(command_buffer: CommandBuffer, depth_clamp_mode: DepthClampModeEXT, p_depth_clamp_range: [*c]const DepthClampRangeEXT) void;
pub const PhysicalDeviceTilePropertiesFeaturesQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    tile_properties: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const TilePropertiesQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    tile_size: Extent3D = @import("std").mem.zeroes(Extent3D),
    apron_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    origin: Offset2D = @import("std").mem.zeroes(Offset2D),
};
pub const PFN_getFramebufferTilePropertiesQCOM = ?*const fn (Device, Framebuffer, [*c]u32, [*c]TilePropertiesQCOM) callconv(.c) Result;
pub const PFN_getDynamicRenderingTilePropertiesQCOM = ?*const fn (Device, [*c]const RenderingInfo, [*c]TilePropertiesQCOM) callconv(.c) Result;
pub extern fn getFramebufferTilePropertiesQcom(device: Device, framebuffer: Framebuffer, p_properties_count: [*c]u32, p_properties: [*c]TilePropertiesQCOM) Result;
pub extern fn getDynamicRenderingTilePropertiesQcom(device: Device, p_rendering_info: [*c]const RenderingInfo, p_properties: [*c]TilePropertiesQCOM) Result;
pub const PhysicalDeviceAmigoProfilingFeaturesSEC = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    amigo_profiling: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const AmigoProfilingSubmitInfoSEC = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    first_draw_timestamp: u64 = @import("std").mem.zeroes(u64),
    swap_buffer_timestamp: u64 = @import("std").mem.zeroes(u64),
};
pub const PhysicalDeviceMultiviewPerViewViewportsFeaturesQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    multiview_per_view_viewports: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RayTracingInvocationReorderModeNV = enum(u32) {
    none = 0,
    reorder = 1,
    max_enum = 2147483647,
};
pub const PhysicalDeviceRayTracingInvocationReorderPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_invocation_reorder_reordering_hint: RayTracingInvocationReorderModeNV = @import("std").mem.zeroes(RayTracingInvocationReorderModeNV),
};
pub const PhysicalDeviceRayTracingInvocationReorderFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_invocation_reorder: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const CooperativeVectorMatrixLayoutNV = enum(u32) {
    row_major = 0,
    column_major = 1,
    inferencing_optimal = 2,
    training_optimal = 3,
    max_enum = 2147483647,
};
pub const PhysicalDeviceCooperativeVectorPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cooperative_vector_supported_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    cooperative_vector_training_float16_accumulation: Bool32 = @import("std").mem.zeroes(Bool32),
    cooperative_vector_training_float32_accumulation: Bool32 = @import("std").mem.zeroes(Bool32),
    max_cooperative_vector_components: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceCooperativeVectorFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cooperative_vector: Bool32 = @import("std").mem.zeroes(Bool32),
    cooperative_vector_training: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const CooperativeVectorPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    input_type: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    input_interpretation: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    matrix_interpretation: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    bias_interpretation: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    result_type: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    transpose: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ConvertCooperativeVectorMatrixInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_size: usize = @import("std").mem.zeroes(usize),
    src_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    p_dst_size: [*c]usize = @import("std").mem.zeroes([*c]usize),
    dst_data: DeviceOrHostAddressKHR = @import("std").mem.zeroes(DeviceOrHostAddressKHR),
    src_component_type: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    dst_component_type: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    num_rows: u32 = @import("std").mem.zeroes(u32),
    num_columns: u32 = @import("std").mem.zeroes(u32),
    src_layout: CooperativeVectorMatrixLayoutNV = @import("std").mem.zeroes(CooperativeVectorMatrixLayoutNV),
    src_stride: usize = @import("std").mem.zeroes(usize),
    dst_layout: CooperativeVectorMatrixLayoutNV = @import("std").mem.zeroes(CooperativeVectorMatrixLayoutNV),
    dst_stride: usize = @import("std").mem.zeroes(usize),
};
pub const PFN_getPhysicalDeviceCooperativeVectorPropertiesNV = ?*const fn (PhysicalDevice, [*c]u32, [*c]CooperativeVectorPropertiesNV) callconv(.c) Result;
pub const PFN_convertCooperativeVectorMatrixNV = ?*const fn (Device, [*c]const ConvertCooperativeVectorMatrixInfoNV) callconv(.c) Result;
pub const PFN_cmdConvertCooperativeVectorMatrixNV = ?*const fn (CommandBuffer, u32, [*c]const ConvertCooperativeVectorMatrixInfoNV) callconv(.c) void;
pub extern fn getPhysicalDeviceCooperativeVectorPropertiesNv(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]CooperativeVectorPropertiesNV) Result;
pub extern fn convertCooperativeVectorMatrixNv(device: Device, p_info: [*c]const ConvertCooperativeVectorMatrixInfoNV) Result;
pub extern fn cmdConvertCooperativeVectorMatrixNv(command_buffer: CommandBuffer, info_count: u32, p_infos: [*c]const ConvertCooperativeVectorMatrixInfoNV) void;
pub const PhysicalDeviceExtendedSparseAddressSpaceFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    extended_sparse_address_space: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceExtendedSparseAddressSpacePropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    extended_sparse_address_space_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    extended_sparse_image_usage_flags: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    extended_sparse_buffer_usage_flags: BufferUsageFlags = @import("std").mem.zeroes(BufferUsageFlags),
};
pub const PhysicalDeviceLegacyVertexAttributesFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    legacy_vertex_attributes: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceLegacyVertexAttributesPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    native_unaligned_performance: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const LayerSettingTypeEXT = enum(u32) {
    bool32 = 0,
    int32 = 1,
    int64 = 2,
    uint32 = 3,
    uint64 = 4,
    float32 = 5,
    float64 = 6,
    string = 7,
    max_enum = 2147483647,
};
pub const LayerSettingEXT = extern struct {
    p_layer_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    p_setting_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    type: LayerSettingTypeEXT = @import("std").mem.zeroes(LayerSettingTypeEXT),
    value_count: u32 = @import("std").mem.zeroes(u32),
    p_values: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const LayerSettingsCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    setting_count: u32 = @import("std").mem.zeroes(u32),
    p_settings: [*c]const LayerSettingEXT = @import("std").mem.zeroes([*c]const LayerSettingEXT),
};
pub const PhysicalDeviceShaderCoreBuiltinsFeaturesARM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_core_builtins: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderCoreBuiltinsPropertiesARM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_core_mask: u64 = @import("std").mem.zeroes(u64),
    shader_core_count: u32 = @import("std").mem.zeroes(u32),
    shader_warps_per_core: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_library_group_handles: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    dynamic_rendering_unused_attachments: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const LatencyMarkerNV = enum(u32) {
    simulation_start = 0,
    simulation_end = 1,
    rendersubmit_start = 2,
    rendersubmit_end = 3,
    present_start = 4,
    present_end = 5,
    input_sample = 6,
    trigger_flash = 7,
    out_of_band_rendersubmit_start = 8,
    out_of_band_rendersubmit_end = 9,
    out_of_band_present_start = 10,
    out_of_band_present_end = 11,
    max_enum = 2147483647,
};
pub const OutOfBandQueueTypeNV = enum(u32) {
    render = 0,
    present = 1,
    max_enum = 2147483647,
};
pub const LatencySleepModeInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    low_latency_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    low_latency_boost: Bool32 = @import("std").mem.zeroes(Bool32),
    minimum_interval_us: u32 = @import("std").mem.zeroes(u32),
};
pub const LatencySleepInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    signal_semaphore: Semaphore = @import("std").mem.zeroes(Semaphore),
    value: u64 = @import("std").mem.zeroes(u64),
};
pub const SetLatencyMarkerInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    present_id: u64 = @import("std").mem.zeroes(u64),
    marker: LatencyMarkerNV = @import("std").mem.zeroes(LatencyMarkerNV),
};
pub const LatencyTimingsFrameReportNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    present_id: u64 = @import("std").mem.zeroes(u64),
    input_sample_time_us: u64 = @import("std").mem.zeroes(u64),
    sim_start_time_us: u64 = @import("std").mem.zeroes(u64),
    sim_end_time_us: u64 = @import("std").mem.zeroes(u64),
    render_submit_start_time_us: u64 = @import("std").mem.zeroes(u64),
    render_submit_end_time_us: u64 = @import("std").mem.zeroes(u64),
    present_start_time_us: u64 = @import("std").mem.zeroes(u64),
    present_end_time_us: u64 = @import("std").mem.zeroes(u64),
    driver_start_time_us: u64 = @import("std").mem.zeroes(u64),
    driver_end_time_us: u64 = @import("std").mem.zeroes(u64),
    os_render_queue_start_time_us: u64 = @import("std").mem.zeroes(u64),
    os_render_queue_end_time_us: u64 = @import("std").mem.zeroes(u64),
    gpu_render_start_time_us: u64 = @import("std").mem.zeroes(u64),
    gpu_render_end_time_us: u64 = @import("std").mem.zeroes(u64),
};
pub const GetLatencyMarkerInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    timing_count: u32 = @import("std").mem.zeroes(u32),
    p_timings: [*c]LatencyTimingsFrameReportNV = @import("std").mem.zeroes([*c]LatencyTimingsFrameReportNV),
};
pub const LatencySubmissionPresentIdNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    present_id: u64 = @import("std").mem.zeroes(u64),
};
pub const SwapchainLatencyCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    latency_mode_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const OutOfBandQueueTypeInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    queue_type: OutOfBandQueueTypeNV = @import("std").mem.zeroes(OutOfBandQueueTypeNV),
};
pub const LatencySurfaceCapabilitiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    present_mode_count: u32 = @import("std").mem.zeroes(u32),
    p_present_modes: [*c]PresentModeKHR = @import("std").mem.zeroes([*c]PresentModeKHR),
};
pub const PFN_setLatencySleepModeNV = ?*const fn (Device, SwapchainKHR, [*c]const LatencySleepModeInfoNV) callconv(.c) Result;
pub const PFN_latencySleepNV = ?*const fn (Device, SwapchainKHR, [*c]const LatencySleepInfoNV) callconv(.c) Result;
pub const PFN_setLatencyMarkerNV = ?*const fn (Device, SwapchainKHR, [*c]const SetLatencyMarkerInfoNV) callconv(.c) void;
pub const PFN_getLatencyTimingsNV = ?*const fn (Device, SwapchainKHR, [*c]GetLatencyMarkerInfoNV) callconv(.c) void;
pub const PFN_queueNotifyOutOfBandNV = ?*const fn (Queue, [*c]const OutOfBandQueueTypeInfoNV) callconv(.c) void;
pub extern fn setLatencySleepModeNv(device: Device, swapchain: SwapchainKHR, p_sleep_mode_info: [*c]const LatencySleepModeInfoNV) Result;
pub extern fn latencySleepNv(device: Device, swapchain: SwapchainKHR, p_sleep_info: [*c]const LatencySleepInfoNV) Result;
pub extern fn setLatencyMarkerNv(device: Device, swapchain: SwapchainKHR, p_latency_marker_info: [*c]const SetLatencyMarkerInfoNV) void;
pub extern fn getLatencyTimingsNv(device: Device, swapchain: SwapchainKHR, p_latency_marker_info: [*c]GetLatencyMarkerInfoNV) void;
pub extern fn queueNotifyOutOfBandNv(queue: Queue, p_queue_type_info: [*c]const OutOfBandQueueTypeInfoNV) void;
pub const PhysicalDeviceMultiviewPerViewRenderAreasFeaturesQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    multiview_per_view_render_areas: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MultiviewPerViewRenderAreasRenderPassBeginInfoQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    per_view_render_area_count: u32 = @import("std").mem.zeroes(u32),
    p_per_view_render_areas: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const PhysicalDevicePerStageDescriptorSetFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    per_stage_descriptor_set: Bool32 = @import("std").mem.zeroes(Bool32),
    dynamic_pipeline_layout: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const BlockMatchWindowCompareModeQCOM = enum(u32) {
    min = 0,
    max = 1,
    max_enum = 2147483647,
};
pub const PhysicalDeviceImageProcessing2FeaturesQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    texture_block_match2: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImageProcessing2PropertiesQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_block_match_window: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const SamplerBlockMatchWindowCreateInfoQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    window_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    window_compare_mode: BlockMatchWindowCompareModeQCOM = @import("std").mem.zeroes(BlockMatchWindowCompareModeQCOM),
};
pub const CubicFilterWeightsQCOM = enum(u32) {
    catmull_rom = 0,
    zero_tangent_cardinal = 1,
    b_spline = 2,
    mitchell_netravali = 3,
    max_enum = 2147483647,
};
pub const PhysicalDeviceCubicWeightsFeaturesQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    selectable_cubic_weights: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SamplerCubicWeightsCreateInfoQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    cubic_weights: CubicFilterWeightsQCOM = @import("std").mem.zeroes(CubicFilterWeightsQCOM),
};
pub const BlitImageCubicWeightsInfoQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    cubic_weights: CubicFilterWeightsQCOM = @import("std").mem.zeroes(CubicFilterWeightsQCOM),
};
pub const PhysicalDeviceYcbcrDegammaFeaturesQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ycbcr_degamma: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SamplerYcbcrConversionYcbcrDegammaCreateInfoQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    enable_ydegamma: Bool32 = @import("std").mem.zeroes(Bool32),
    enable_cb_cr_degamma: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceCubicClampFeaturesQCOM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cubic_range_clamp: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceAttachmentFeedbackLoopDynamicStateFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    attachment_feedback_loop_dynamic_state: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdSetAttachmentFeedbackLoopEnableEXT = ?*const fn (CommandBuffer, ImageAspectFlags) callconv(.c) void;
pub extern fn cmdSetAttachmentFeedbackLoopEnableExt(command_buffer: CommandBuffer, aspect_mask: ImageAspectFlags) void;
pub const LayeredDriverUnderlyingApiMSFT = enum(u32) {
    none = 0,
    d3d12 = 1,
    max_enum = 2147483647,
};
pub const PhysicalDeviceLayeredDriverPropertiesMSFT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    underlying_api: LayeredDriverUnderlyingApiMSFT = @import("std").mem.zeroes(LayeredDriverUnderlyingApiMSFT),
};
pub const PhysicalDeviceDescriptorPoolOverallocationFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    descriptor_pool_overallocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DisplaySurfaceStereoTypeNV = enum(u32) {
    none = 0,
    onboard_din = 1,
    hdmi_3d = 2,
    inband_displayport = 3,
    max_enum = 2147483647,
};
pub const DisplaySurfaceStereoCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stereo_type: DisplaySurfaceStereoTypeNV = @import("std").mem.zeroes(DisplaySurfaceStereoTypeNV),
};
pub const DisplayModeStereoPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    hdmi3_dsupported: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRawAccessChainsFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_raw_access_chains: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceCommandBufferInheritanceFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    command_buffer_inheritance: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderAtomicFloat16VectorFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_float16_vector_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderReplicatedCompositesFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_replicated_composites: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRayTracingValidationFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_validation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ClusterAccelerationStructureTypeNV = enum(u32) {
    clusters_bottom_level = 0,
    triangle_cluster = 1,
    triangle_cluster_template = 2,
    max_enum = 2147483647,
};
pub const ClusterAccelerationStructureOpTypeNV = enum(u32) {
    move_objects = 0,
    build_clusters_bottom_level = 1,
    build_triangle_cluster = 2,
    build_triangle_cluster_template = 3,
    instantiate_triangle_cluster = 4,
    max_enum = 2147483647,
};
pub const ClusterAccelerationStructureOpModeNV = enum(u32) {
    implicit_destinations = 0,
    explicit_destinations = 1,
    compute_sizes = 2,
    max_enum = 2147483647,
};
pub const ClusterAccelerationStructureAddressResolutionFlagBitsNV = enum(u32) {
    indirected_dst_implicit_data_bit = 1,
    indirected_scratch_data_bit = 2,
    indirected_dst_address_array_bit = 4,
    indirected_dst_sizes_array_bit = 8,
    indirected_src_infos_array_bit = 16,
    indirected_src_infos_count_bit = 32,
    max_enum = 2147483647,
};
pub const ClusterAccelerationStructureAddressResolutionFlagsNV = Flags;
pub const ClusterAccelerationStructureClusterFlagBitsNV = enum(u32) {
    cluster_allow_disable_opacity_micromaps = 1,
    cluster_max_enum = 2147483647,
};
pub const ClusterAccelerationStructureClusterFlagsNV = Flags;
pub const ClusterAccelerationStructureGeometryFlagBitsNV = enum(u32) {
    cull_disable_bit = 1,
    no_duplicate_anyhit_invocation_bit = 2,
    opaque_bit = 4,
    max_enum = 2147483647,
};
pub const ClusterAccelerationStructureGeometryFlagsNV = Flags;
pub const ClusterAccelerationStructureIndexFormatFlagBitsNV = enum(u32) {
    @"8bit" = 1,
    @"16bit" = 2,
    @"32bit" = 4,
    max_enum = 2147483647,
};
pub const ClusterAccelerationStructureIndexFormatFlagsNV = Flags;
pub const PhysicalDeviceClusterAccelerationStructureFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cluster_acceleration_structure: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceClusterAccelerationStructurePropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_vertices_per_cluster: u32 = @import("std").mem.zeroes(u32),
    max_triangles_per_cluster: u32 = @import("std").mem.zeroes(u32),
    cluster_scratch_byte_alignment: u32 = @import("std").mem.zeroes(u32),
    cluster_byte_alignment: u32 = @import("std").mem.zeroes(u32),
    cluster_template_byte_alignment: u32 = @import("std").mem.zeroes(u32),
    cluster_bottom_level_byte_alignment: u32 = @import("std").mem.zeroes(u32),
    cluster_template_bounds_byte_alignment: u32 = @import("std").mem.zeroes(u32),
    max_cluster_geometry_index: u32 = @import("std").mem.zeroes(u32),
};
pub const ClusterAccelerationStructureClustersBottomLevelInputNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_total_cluster_count: u32 = @import("std").mem.zeroes(u32),
    max_cluster_count_per_acceleration_structure: u32 = @import("std").mem.zeroes(u32),
};
pub const ClusterAccelerationStructureTriangleClusterInputNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    vertex_format: Format = @import("std").mem.zeroes(Format),
    max_geometry_index_value: u32 = @import("std").mem.zeroes(u32),
    max_cluster_unique_geometry_count: u32 = @import("std").mem.zeroes(u32),
    max_cluster_triangle_count: u32 = @import("std").mem.zeroes(u32),
    max_cluster_vertex_count: u32 = @import("std").mem.zeroes(u32),
    max_total_triangle_count: u32 = @import("std").mem.zeroes(u32),
    max_total_vertex_count: u32 = @import("std").mem.zeroes(u32),
    min_position_truncate_bit_count: u32 = @import("std").mem.zeroes(u32),
};
pub const ClusterAccelerationStructureMoveObjectsInputNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    type: ClusterAccelerationStructureTypeNV = @import("std").mem.zeroes(ClusterAccelerationStructureTypeNV),
    no_move_overlap: Bool32 = @import("std").mem.zeroes(Bool32),
    max_moved_bytes: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const ClusterAccelerationStructureOpInputNV = extern union {
    pClustersBottomLevel: [*c]ClusterAccelerationStructureClustersBottomLevelInputNV,
    pTriangleClusters: [*c]ClusterAccelerationStructureTriangleClusterInputNV,
    pMoveObjects: [*c]ClusterAccelerationStructureMoveObjectsInputNV,
};
pub const ClusterAccelerationStructureInputInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_acceleration_structure_count: u32 = @import("std").mem.zeroes(u32),
    flags: BuildAccelerationStructureFlags = @import("std").mem.zeroes(BuildAccelerationStructureFlags),
    op_type: ClusterAccelerationStructureOpTypeNV = @import("std").mem.zeroes(ClusterAccelerationStructureOpTypeNV),
    op_mode: ClusterAccelerationStructureOpModeNV = @import("std").mem.zeroes(ClusterAccelerationStructureOpModeNV),
    op_input: ClusterAccelerationStructureOpInputNV = @import("std").mem.zeroes(ClusterAccelerationStructureOpInputNV),
};
pub const StridedDeviceAddressRegionKHR = extern struct {
    device_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const ClusterAccelerationStructureCommandsInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    input: ClusterAccelerationStructureInputInfoNV = @import("std").mem.zeroes(ClusterAccelerationStructureInputInfoNV),
    dst_implicit_data: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    scratch_data: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    dst_addresses_array: StridedDeviceAddressRegionKHR = @import("std").mem.zeroes(StridedDeviceAddressRegionKHR),
    dst_sizes_array: StridedDeviceAddressRegionKHR = @import("std").mem.zeroes(StridedDeviceAddressRegionKHR),
    src_infos_array: StridedDeviceAddressRegionKHR = @import("std").mem.zeroes(StridedDeviceAddressRegionKHR),
    src_infos_count: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    address_resolution_flags: ClusterAccelerationStructureAddressResolutionFlagsNV = @import("std").mem.zeroes(ClusterAccelerationStructureAddressResolutionFlagsNV),
};
pub const StridedDeviceAddressNV = extern struct {
    start_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    stride_in_bytes: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const ClusterAccelerationStructureGeometryIndexAndGeometryFlagsNV = enum(u64) { null = 0, _ };
pub const ClusterAccelerationStructureMoveObjectsInfoNV = extern struct {
    src_acceleration_structure: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const ClusterAccelerationStructureBuildClustersBottomLevelInfoNV = extern struct {
    cluster_references_count: u32 = @import("std").mem.zeroes(u32),
    cluster_references_stride: u32 = @import("std").mem.zeroes(u32),
    cluster_references: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const ClusterAccelerationStructureBuildTriangleClusterInfoNV = enum(u64) { null = 0, _ };
pub const ClusterAccelerationStructureBuildTriangleClusterTemplateInfoNV = enum(u64) { null = 0, _ };
pub const ClusterAccelerationStructureInstantiateClusterInfoNV = enum(u64) { null = 0, _ };
pub const AccelerationStructureBuildSizesInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acceleration_structure_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    update_scratch_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    build_scratch_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const RayTracingPipelineClusterAccelerationStructureCreateInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    allow_cluster_acceleration_structure: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_getClusterAccelerationStructureBuildSizesNV = ?*const fn (Device, [*c]const ClusterAccelerationStructureInputInfoNV, [*c]AccelerationStructureBuildSizesInfoKHR) callconv(.c) void;
pub const PFN_cmdBuildClusterAccelerationStructureIndirectNV = ?*const fn (CommandBuffer, [*c]const ClusterAccelerationStructureCommandsInfoNV) callconv(.c) void;
pub extern fn getClusterAccelerationStructureBuildSizesNv(device: Device, p_info: [*c]const ClusterAccelerationStructureInputInfoNV, p_size_info: [*c]AccelerationStructureBuildSizesInfoKHR) void;
pub extern fn cmdBuildClusterAccelerationStructureIndirectNv(command_buffer: CommandBuffer, p_command_infos: [*c]const ClusterAccelerationStructureCommandsInfoNV) void;
pub const PartitionedAccelerationStructureOpTypeNV = enum(u32) {
    write_instance = 0,
    update_instance = 1,
    write_partition_translation = 2,
    max_enum = 2147483647,
};
pub const PartitionedAccelerationStructureInstanceFlagBitsNV = enum(u32) {
    triangle_facing_cull_disable_bit = 1,
    triangle_flip_facing_bit = 2,
    force_opaque_bit = 4,
    force_no_opaque_bit = 8,
    enable_explicit_bounding_box = 16,
    max_enum = 2147483647,
};
pub const PartitionedAccelerationStructureInstanceFlagsNV = Flags;
pub const PhysicalDevicePartitionedAccelerationStructureFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    partitioned_acceleration_structure: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePartitionedAccelerationStructurePropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_partition_count: u32 = @import("std").mem.zeroes(u32),
};
pub const PartitionedAccelerationStructureFlagsNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    enable_partition_translation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const BuildPartitionedAccelerationStructureIndirectCommandNV = extern struct {
    op_type: PartitionedAccelerationStructureOpTypeNV = @import("std").mem.zeroes(PartitionedAccelerationStructureOpTypeNV),
    arg_count: u32 = @import("std").mem.zeroes(u32),
    arg_data: StridedDeviceAddressNV = @import("std").mem.zeroes(StridedDeviceAddressNV),
};
pub const PartitionedAccelerationStructureWriteInstanceDataNV = extern struct {
    transform: TransformMatrixKHR = @import("std").mem.zeroes(TransformMatrixKHR),
    explicit_aabb: [6]f32 = @import("std").mem.zeroes([6]f32),
    instance_id: u32 = @import("std").mem.zeroes(u32),
    instance_mask: u32 = @import("std").mem.zeroes(u32),
    instance_contribution_to_hit_group_index: u32 = @import("std").mem.zeroes(u32),
    instance_flags: PartitionedAccelerationStructureInstanceFlagsNV = @import("std").mem.zeroes(PartitionedAccelerationStructureInstanceFlagsNV),
    instance_index: u32 = @import("std").mem.zeroes(u32),
    partition_index: u32 = @import("std").mem.zeroes(u32),
    acceleration_structure: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const PartitionedAccelerationStructureUpdateInstanceDataNV = extern struct {
    instance_index: u32 = @import("std").mem.zeroes(u32),
    instance_contribution_to_hit_group_index: u32 = @import("std").mem.zeroes(u32),
    acceleration_structure: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const PartitionedAccelerationStructureWritePartitionTranslationDataNV = extern struct {
    partition_index: u32 = @import("std").mem.zeroes(u32),
    partition_translation: [3]f32 = @import("std").mem.zeroes([3]f32),
};
pub const WriteDescriptorSetPartitionedAccelerationStructureNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    acceleration_structure_count: u32 = @import("std").mem.zeroes(u32),
    p_acceleration_structures: [*c]const DeviceAddress = @import("std").mem.zeroes([*c]const DeviceAddress),
};
pub const PartitionedAccelerationStructureInstancesInputNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: BuildAccelerationStructureFlags = @import("std").mem.zeroes(BuildAccelerationStructureFlags),
    instance_count: u32 = @import("std").mem.zeroes(u32),
    max_instance_per_partition_count: u32 = @import("std").mem.zeroes(u32),
    partition_count: u32 = @import("std").mem.zeroes(u32),
    max_instance_in_global_partition_count: u32 = @import("std").mem.zeroes(u32),
};
pub const BuildPartitionedAccelerationStructureInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    input: PartitionedAccelerationStructureInstancesInputNV = @import("std").mem.zeroes(PartitionedAccelerationStructureInstancesInputNV),
    src_acceleration_structure_data: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    dst_acceleration_structure_data: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    scratch_data: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    src_infos: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    src_infos_count: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const PFN_getPartitionedAccelerationStructuresBuildSizesNV = ?*const fn (Device, [*c]const PartitionedAccelerationStructureInstancesInputNV, [*c]AccelerationStructureBuildSizesInfoKHR) callconv(.c) void;
pub const PFN_cmdBuildPartitionedAccelerationStructuresNV = ?*const fn (CommandBuffer, [*c]const BuildPartitionedAccelerationStructureInfoNV) callconv(.c) void;
pub extern fn getPartitionedAccelerationStructuresBuildSizesNv(device: Device, p_info: [*c]const PartitionedAccelerationStructureInstancesInputNV, p_size_info: [*c]AccelerationStructureBuildSizesInfoKHR) void;
pub extern fn cmdBuildPartitionedAccelerationStructuresNv(command_buffer: CommandBuffer, p_build_info: [*c]const BuildPartitionedAccelerationStructureInfoNV) void;
pub const IndirectExecutionSetEXT = enum(u64) { null = 0, _ };
pub const IndirectCommandsLayoutEXT = enum(u64) { null = 0, _ };
pub const IndirectExecutionSetInfoTypeEXT = enum(u32) {
    pipelines = 0,
    shader_objects = 1,
    max_enum = 2147483647,
};
pub const IndirectCommandsTokenTypeEXT = enum(u32) {
    execution_set = 0,
    push_constant = 1,
    sequence_index = 2,
    index_buffer = 3,
    vertex_buffer = 4,
    draw_indexed = 5,
    draw = 6,
    draw_indexed_count = 7,
    draw_count = 8,
    dispatch = 9,
    draw_mesh_tasks_nv = 1000202002,
    draw_mesh_tasks_count_nv = 1000202003,
    draw_mesh_tasks = 1000328000,
    draw_mesh_tasks_count = 1000328001,
    trace_rays2 = 1000386004,
    max_enum = 2147483647,
};
pub const IndirectCommandsInputModeFlagBitsEXT = enum(u32) {
    vulkan_index_buffer = 1,
    dxgi_index_buffer = 2,
    max_enum = 2147483647,
};
pub const IndirectCommandsInputModeFlagsEXT = Flags;
pub const IndirectCommandsLayoutUsageFlagBitsEXT = enum(u32) {
    explicit_preprocess_bit = 1,
    unordered_sequences_bit = 2,
    max_enum = 2147483647,
};
pub const IndirectCommandsLayoutUsageFlagsEXT = Flags;
pub const PhysicalDeviceDeviceGeneratedCommandsFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_generated_commands: Bool32 = @import("std").mem.zeroes(Bool32),
    dynamic_generated_pipeline_layout: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceDeviceGeneratedCommandsPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_indirect_pipeline_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_shader_object_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_sequence_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_token_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_token_offset: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_indirect_stride: u32 = @import("std").mem.zeroes(u32),
    supported_indirect_commands_input_modes: IndirectCommandsInputModeFlagsEXT = @import("std").mem.zeroes(IndirectCommandsInputModeFlagsEXT),
    supported_indirect_commands_shader_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    supported_indirect_commands_shader_stages_pipeline_binding: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    supported_indirect_commands_shader_stages_shader_binding: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    device_generated_commands_transform_feedback: Bool32 = @import("std").mem.zeroes(Bool32),
    device_generated_commands_multi_draw_indirect_count: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const GeneratedCommandsMemoryRequirementsInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    indirect_execution_set: IndirectExecutionSetEXT = @import("std").mem.zeroes(IndirectExecutionSetEXT),
    indirect_commands_layout: IndirectCommandsLayoutEXT = @import("std").mem.zeroes(IndirectCommandsLayoutEXT),
    max_sequence_count: u32 = @import("std").mem.zeroes(u32),
    max_draw_count: u32 = @import("std").mem.zeroes(u32),
};
pub const IndirectExecutionSetPipelineInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    initial_pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
    max_pipeline_count: u32 = @import("std").mem.zeroes(u32),
};
pub const IndirectExecutionSetShaderLayoutInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    set_layout_count: u32 = @import("std").mem.zeroes(u32),
    p_set_layouts: [*c]const DescriptorSetLayout = @import("std").mem.zeroes([*c]const DescriptorSetLayout),
};
pub const IndirectExecutionSetShaderInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    shader_count: u32 = @import("std").mem.zeroes(u32),
    p_initial_shaders: [*c]const ShaderEXT = @import("std").mem.zeroes([*c]const ShaderEXT),
    p_set_layout_infos: [*c]const IndirectExecutionSetShaderLayoutInfoEXT = @import("std").mem.zeroes([*c]const IndirectExecutionSetShaderLayoutInfoEXT),
    max_shader_count: u32 = @import("std").mem.zeroes(u32),
    push_constant_range_count: u32 = @import("std").mem.zeroes(u32),
    p_push_constant_ranges: [*c]const PushConstantRange = @import("std").mem.zeroes([*c]const PushConstantRange),
};
pub const IndirectExecutionSetInfoEXT = extern union {
    pPipelineInfo: [*c]const IndirectExecutionSetPipelineInfoEXT,
    pShaderInfo: [*c]const IndirectExecutionSetShaderInfoEXT,
};
pub const IndirectExecutionSetCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: IndirectExecutionSetInfoTypeEXT = @import("std").mem.zeroes(IndirectExecutionSetInfoTypeEXT),
    info: IndirectExecutionSetInfoEXT = @import("std").mem.zeroes(IndirectExecutionSetInfoEXT),
};
pub const GeneratedCommandsInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    shader_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    indirect_execution_set: IndirectExecutionSetEXT = @import("std").mem.zeroes(IndirectExecutionSetEXT),
    indirect_commands_layout: IndirectCommandsLayoutEXT = @import("std").mem.zeroes(IndirectCommandsLayoutEXT),
    indirect_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    indirect_address_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    preprocess_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    preprocess_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    max_sequence_count: u32 = @import("std").mem.zeroes(u32),
    sequence_count_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    max_draw_count: u32 = @import("std").mem.zeroes(u32),
};
pub const WriteIndirectExecutionSetPipelineEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    index: u32 = @import("std").mem.zeroes(u32),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
};
pub const IndirectCommandsPushConstantTokenEXT = extern struct {
    update_range: PushConstantRange = @import("std").mem.zeroes(PushConstantRange),
};
pub const IndirectCommandsVertexBufferTokenEXT = extern struct {
    vertex_binding_unit: u32 = @import("std").mem.zeroes(u32),
};
pub const IndirectCommandsIndexBufferTokenEXT = extern struct {
    mode: IndirectCommandsInputModeFlagBitsEXT = @import("std").mem.zeroes(IndirectCommandsInputModeFlagBitsEXT),
};
pub const IndirectCommandsExecutionSetTokenEXT = extern struct {
    type: IndirectExecutionSetInfoTypeEXT = @import("std").mem.zeroes(IndirectExecutionSetInfoTypeEXT),
    shader_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
};
pub const IndirectCommandsTokenDataEXT = extern union {
    pPushConstant: [*c]const IndirectCommandsPushConstantTokenEXT,
    pVertexBuffer: [*c]const IndirectCommandsVertexBufferTokenEXT,
    pIndexBuffer: [*c]const IndirectCommandsIndexBufferTokenEXT,
    pExecutionSet: [*c]const IndirectCommandsExecutionSetTokenEXT,
};
pub const IndirectCommandsLayoutTokenEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: IndirectCommandsTokenTypeEXT = @import("std").mem.zeroes(IndirectCommandsTokenTypeEXT),
    data: IndirectCommandsTokenDataEXT = @import("std").mem.zeroes(IndirectCommandsTokenDataEXT),
    offset: u32 = @import("std").mem.zeroes(u32),
};
pub const IndirectCommandsLayoutCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: IndirectCommandsLayoutUsageFlagsEXT = @import("std").mem.zeroes(IndirectCommandsLayoutUsageFlagsEXT),
    shader_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    indirect_stride: u32 = @import("std").mem.zeroes(u32),
    pipeline_layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    token_count: u32 = @import("std").mem.zeroes(u32),
    p_tokens: [*c]const IndirectCommandsLayoutTokenEXT = @import("std").mem.zeroes([*c]const IndirectCommandsLayoutTokenEXT),
};
pub const DrawIndirectCountIndirectCommandEXT = extern struct {
    buffer_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    stride: u32 = @import("std").mem.zeroes(u32),
    command_count: u32 = @import("std").mem.zeroes(u32),
};
pub const BindVertexBufferIndirectCommandEXT = extern struct {
    buffer_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: u32 = @import("std").mem.zeroes(u32),
    stride: u32 = @import("std").mem.zeroes(u32),
};
pub const BindIndexBufferIndirectCommandEXT = extern struct {
    buffer_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: u32 = @import("std").mem.zeroes(u32),
    index_type: IndexType = @import("std").mem.zeroes(IndexType),
};
pub const GeneratedCommandsPipelineInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
};
pub const GeneratedCommandsShaderInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_count: u32 = @import("std").mem.zeroes(u32),
    p_shaders: [*c]const ShaderEXT = @import("std").mem.zeroes([*c]const ShaderEXT),
};
pub const WriteIndirectExecutionSetShaderEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    index: u32 = @import("std").mem.zeroes(u32),
    shader: ShaderEXT = @import("std").mem.zeroes(ShaderEXT),
};
pub const PFN_getGeneratedCommandsMemoryRequirementsEXT = ?*const fn (Device, [*c]const GeneratedCommandsMemoryRequirementsInfoEXT, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_cmdPreprocessGeneratedCommandsEXT = ?*const fn (CommandBuffer, [*c]const GeneratedCommandsInfoEXT, CommandBuffer) callconv(.c) void;
pub const PFN_cmdExecuteGeneratedCommandsEXT = ?*const fn (CommandBuffer, Bool32, [*c]const GeneratedCommandsInfoEXT) callconv(.c) void;
pub const PFN_createIndirectCommandsLayoutEXT = ?*const fn (Device, [*c]const IndirectCommandsLayoutCreateInfoEXT, [*c]const AllocationCallbacks, [*c]IndirectCommandsLayoutEXT) callconv(.c) Result;
pub const PFN_destroyIndirectCommandsLayoutEXT = ?*const fn (Device, IndirectCommandsLayoutEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createIndirectExecutionSetEXT = ?*const fn (Device, [*c]const IndirectExecutionSetCreateInfoEXT, [*c]const AllocationCallbacks, [*c]IndirectExecutionSetEXT) callconv(.c) Result;
pub const PFN_destroyIndirectExecutionSetEXT = ?*const fn (Device, IndirectExecutionSetEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_updateIndirectExecutionSetPipelineEXT = ?*const fn (Device, IndirectExecutionSetEXT, u32, [*c]const WriteIndirectExecutionSetPipelineEXT) callconv(.c) void;
pub const PFN_updateIndirectExecutionSetShaderEXT = ?*const fn (Device, IndirectExecutionSetEXT, u32, [*c]const WriteIndirectExecutionSetShaderEXT) callconv(.c) void;
pub extern fn getGeneratedCommandsMemoryRequirementsExt(device: Device, p_info: [*c]const GeneratedCommandsMemoryRequirementsInfoEXT, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn cmdPreprocessGeneratedCommandsExt(command_buffer: CommandBuffer, p_generated_commands_info: [*c]const GeneratedCommandsInfoEXT, state_command_buffer: CommandBuffer) void;
pub extern fn cmdExecuteGeneratedCommandsExt(command_buffer: CommandBuffer, is_preprocessed: Bool32, p_generated_commands_info: [*c]const GeneratedCommandsInfoEXT) void;
pub extern fn createIndirectCommandsLayoutExt(device: Device, p_create_info: [*c]const IndirectCommandsLayoutCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_indirect_commands_layout: [*c]IndirectCommandsLayoutEXT) Result;
pub extern fn destroyIndirectCommandsLayoutExt(device: Device, indirect_commands_layout: IndirectCommandsLayoutEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createIndirectExecutionSetExt(device: Device, p_create_info: [*c]const IndirectExecutionSetCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_indirect_execution_set: [*c]IndirectExecutionSetEXT) Result;
pub extern fn destroyIndirectExecutionSetExt(device: Device, indirect_execution_set: IndirectExecutionSetEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn updateIndirectExecutionSetPipelineExt(device: Device, indirect_execution_set: IndirectExecutionSetEXT, execution_set_write_count: u32, p_execution_set_writes: [*c]const WriteIndirectExecutionSetPipelineEXT) void;
pub extern fn updateIndirectExecutionSetShaderExt(device: Device, indirect_execution_set: IndirectExecutionSetEXT, execution_set_write_count: u32, p_execution_set_writes: [*c]const WriteIndirectExecutionSetShaderEXT) void;
pub const PhysicalDeviceImageAlignmentControlFeaturesMESA = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_alignment_control: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImageAlignmentControlPropertiesMESA = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supported_image_alignment_mask: u32 = @import("std").mem.zeroes(u32),
};
pub const ImageAlignmentControlCreateInfoMESA = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    maximum_requested_alignment: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceDepthClampControlFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    depth_clamp_control: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineViewportDepthClampControlCreateInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    depth_clamp_mode: DepthClampModeEXT = @import("std").mem.zeroes(DepthClampModeEXT),
    p_depth_clamp_range: [*c]const DepthClampRangeEXT = @import("std").mem.zeroes([*c]const DepthClampRangeEXT),
};
pub const PhysicalDeviceHdrVividFeaturesHUAWEI = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    hdr_vivid: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const HdrVividDynamicMetadataHUAWEI = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    dynamic_metadata_size: usize = @import("std").mem.zeroes(usize),
    p_dynamic_metadata: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const CooperativeMatrixFlexibleDimensionsPropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    mgranularity: u32 = @import("std").mem.zeroes(u32),
    ngranularity: u32 = @import("std").mem.zeroes(u32),
    kgranularity: u32 = @import("std").mem.zeroes(u32),
    atype: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    btype: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    ctype: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    result_type: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    saturating_accumulation: Bool32 = @import("std").mem.zeroes(Bool32),
    scope: ScopeKHR = @import("std").mem.zeroes(ScopeKHR),
    workgroup_invocations: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceCooperativeMatrix2FeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cooperative_matrix_workgroup_scope: Bool32 = @import("std").mem.zeroes(Bool32),
    cooperative_matrix_flexible_dimensions: Bool32 = @import("std").mem.zeroes(Bool32),
    cooperative_matrix_reductions: Bool32 = @import("std").mem.zeroes(Bool32),
    cooperative_matrix_conversions: Bool32 = @import("std").mem.zeroes(Bool32),
    cooperative_matrix_per_element_operations: Bool32 = @import("std").mem.zeroes(Bool32),
    cooperative_matrix_tensor_addressing: Bool32 = @import("std").mem.zeroes(Bool32),
    cooperative_matrix_block_loads: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceCooperativeMatrix2PropertiesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cooperative_matrix_workgroup_scope_max_workgroup_size: u32 = @import("std").mem.zeroes(u32),
    cooperative_matrix_flexible_dimensions_max_dimension: u32 = @import("std").mem.zeroes(u32),
    cooperative_matrix_workgroup_scope_reserved_shared_memory: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_getPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV = ?*const fn (PhysicalDevice, [*c]u32, [*c]CooperativeMatrixFlexibleDimensionsPropertiesNV) callconv(.c) Result;
pub extern fn getPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNv(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]CooperativeMatrixFlexibleDimensionsPropertiesNV) Result;
pub const PhysicalDevicePipelineOpacityMicromapFeaturesARM = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_opacity_micromap: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVertexAttributeRobustnessFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    vertex_attribute_robustness: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SetPresentConfigNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    num_frames_per_batch: u32 = @import("std").mem.zeroes(u32),
    present_config_feedback: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDevicePresentMeteringFeaturesNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_metering: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const BuildAccelerationStructureModeKHR = enum(u32) {
    build = 0,
    update = 1,
    max_enum = 2147483647,
};
pub const AccelerationStructureCreateFlagBits = enum(u32) {
    device_address_capture_replay_bit_khr = 1,
    motion_bit_nv = 4,
    descriptor_buffer_capture_replay_bit_ext = 8,
    flag_bits_max_enum_khr = 2147483647,
};
pub const AccelerationStructureCreateFlags = PES(AccelerationStructureCreateFlagBits);
pub const AccelerationStructureBuildRangeInfoKHR = extern struct {
    primitive_count: u32 = @import("std").mem.zeroes(u32),
    primitive_offset: u32 = @import("std").mem.zeroes(u32),
    first_vertex: u32 = @import("std").mem.zeroes(u32),
    transform_offset: u32 = @import("std").mem.zeroes(u32),
};
pub const AccelerationStructureGeometryTrianglesDataKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    vertex_format: Format = @import("std").mem.zeroes(Format),
    vertex_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    vertex_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    max_vertex: u32 = @import("std").mem.zeroes(u32),
    index_type: IndexType = @import("std").mem.zeroes(IndexType),
    index_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    transform_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
};
pub const AccelerationStructureGeometryAabbsDataKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const AccelerationStructureGeometryInstancesDataKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    array_of_pointers: Bool32 = @import("std").mem.zeroes(Bool32),
    data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
};
pub const AccelerationStructureGeometryDataKHR = extern union {
    triangles: AccelerationStructureGeometryTrianglesDataKHR,
    aabbs: AccelerationStructureGeometryAabbsDataKHR,
    instances: AccelerationStructureGeometryInstancesDataKHR,
};
pub const AccelerationStructureGeometryKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    geometry_type: GeometryTypeKHR = @import("std").mem.zeroes(GeometryTypeKHR),
    geometry: AccelerationStructureGeometryDataKHR = @import("std").mem.zeroes(AccelerationStructureGeometryDataKHR),
    flags: GeometryFlags = @import("std").mem.zeroes(GeometryFlags),
};
pub const AccelerationStructureBuildGeometryInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: AccelerationStructureTypeKHR = @import("std").mem.zeroes(AccelerationStructureTypeKHR),
    flags: BuildAccelerationStructureFlags = @import("std").mem.zeroes(BuildAccelerationStructureFlags),
    mode: BuildAccelerationStructureModeKHR = @import("std").mem.zeroes(BuildAccelerationStructureModeKHR),
    src_acceleration_structure: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    dst_acceleration_structure: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    geometry_count: u32 = @import("std").mem.zeroes(u32),
    p_geometries: [*c]const AccelerationStructureGeometryKHR = @import("std").mem.zeroes([*c]const AccelerationStructureGeometryKHR),
    pp_geometries: [*c]const [*c]const AccelerationStructureGeometryKHR = @import("std").mem.zeroes([*c]const [*c]const AccelerationStructureGeometryKHR),
    scratch_data: DeviceOrHostAddressKHR = @import("std").mem.zeroes(DeviceOrHostAddressKHR),
};
pub const AccelerationStructureCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    create_flags: AccelerationStructureCreateFlags = @import("std").mem.zeroes(AccelerationStructureCreateFlags),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    type: AccelerationStructureTypeKHR = @import("std").mem.zeroes(AccelerationStructureTypeKHR),
    device_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const WriteDescriptorSetAccelerationStructureKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acceleration_structure_count: u32 = @import("std").mem.zeroes(u32),
    p_acceleration_structures: [*c]const AccelerationStructureKHR = @import("std").mem.zeroes([*c]const AccelerationStructureKHR),
};
pub const PhysicalDeviceAccelerationStructureFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    acceleration_structure: Bool32 = @import("std").mem.zeroes(Bool32),
    acceleration_structure_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    acceleration_structure_indirect_build: Bool32 = @import("std").mem.zeroes(Bool32),
    acceleration_structure_host_commands: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_acceleration_structure_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceAccelerationStructurePropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_geometry_count: u64 = @import("std").mem.zeroes(u64),
    max_instance_count: u64 = @import("std").mem.zeroes(u64),
    max_primitive_count: u64 = @import("std").mem.zeroes(u64),
    max_per_stage_descriptor_acceleration_structures: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_acceleration_structures: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_acceleration_structures: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_acceleration_structures: u32 = @import("std").mem.zeroes(u32),
    min_acceleration_structure_scratch_offset_alignment: u32 = @import("std").mem.zeroes(u32),
};
pub const AccelerationStructureDeviceAddressInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acceleration_structure: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
};
pub const AccelerationStructureVersionInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_version_data: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const CopyAccelerationStructureToMemoryInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    dst: DeviceOrHostAddressKHR = @import("std").mem.zeroes(DeviceOrHostAddressKHR),
    mode: CopyAccelerationStructureModeKHR = @import("std").mem.zeroes(CopyAccelerationStructureModeKHR),
};
pub const CopyMemoryToAccelerationStructureInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    dst: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    mode: CopyAccelerationStructureModeKHR = @import("std").mem.zeroes(CopyAccelerationStructureModeKHR),
};
pub const CopyAccelerationStructureInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    dst: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    mode: CopyAccelerationStructureModeKHR = @import("std").mem.zeroes(CopyAccelerationStructureModeKHR),
};
pub const PFN_createAccelerationStructureKHR = ?*const fn (Device, [*c]const AccelerationStructureCreateInfoKHR, [*c]const AllocationCallbacks, [*c]AccelerationStructureKHR) callconv(.c) Result;
pub const PFN_destroyAccelerationStructureKHR = ?*const fn (Device, AccelerationStructureKHR, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_cmdBuildAccelerationStructuresKHR = ?*const fn (CommandBuffer, u32, [*c]const AccelerationStructureBuildGeometryInfoKHR, [*c]const [*c]const AccelerationStructureBuildRangeInfoKHR) callconv(.c) void;
pub const PFN_cmdBuildAccelerationStructuresIndirectKHR = ?*const fn (CommandBuffer, u32, [*c]const AccelerationStructureBuildGeometryInfoKHR, [*c]const DeviceAddress, [*c]const u32, [*c]const [*c]const u32) callconv(.c) void;
pub const PFN_buildAccelerationStructuresKHR = ?*const fn (Device, DeferredOperationKHR, u32, [*c]const AccelerationStructureBuildGeometryInfoKHR, [*c]const [*c]const AccelerationStructureBuildRangeInfoKHR) callconv(.c) Result;
pub const PFN_copyAccelerationStructureKHR = ?*const fn (Device, DeferredOperationKHR, [*c]const CopyAccelerationStructureInfoKHR) callconv(.c) Result;
pub const PFN_copyAccelerationStructureToMemoryKHR = ?*const fn (Device, DeferredOperationKHR, [*c]const CopyAccelerationStructureToMemoryInfoKHR) callconv(.c) Result;
pub const PFN_copyMemoryToAccelerationStructureKHR = ?*const fn (Device, DeferredOperationKHR, [*c]const CopyMemoryToAccelerationStructureInfoKHR) callconv(.c) Result;
pub const PFN_writeAccelerationStructuresPropertiesKHR = ?*const fn (Device, u32, [*c]const AccelerationStructureKHR, QueryType, usize, ?*anyopaque, usize) callconv(.c) Result;
pub const PFN_cmdCopyAccelerationStructureKHR = ?*const fn (CommandBuffer, [*c]const CopyAccelerationStructureInfoKHR) callconv(.c) void;
pub const PFN_cmdCopyAccelerationStructureToMemoryKHR = ?*const fn (CommandBuffer, [*c]const CopyAccelerationStructureToMemoryInfoKHR) callconv(.c) void;
pub const PFN_cmdCopyMemoryToAccelerationStructureKHR = ?*const fn (CommandBuffer, [*c]const CopyMemoryToAccelerationStructureInfoKHR) callconv(.c) void;
pub const PFN_getAccelerationStructureDeviceAddressKHR = ?*const fn (Device, [*c]const AccelerationStructureDeviceAddressInfoKHR) callconv(.c) DeviceAddress;
pub const PFN_cmdWriteAccelerationStructuresPropertiesKHR = ?*const fn (CommandBuffer, u32, [*c]const AccelerationStructureKHR, QueryType, QueryPool, u32) callconv(.c) void;
pub const PFN_getDeviceAccelerationStructureCompatibilityKHR = ?*const fn (Device, [*c]const AccelerationStructureVersionInfoKHR, [*c]AccelerationStructureCompatibilityKHR) callconv(.c) void;
pub const PFN_getAccelerationStructureBuildSizesKHR = ?*const fn (Device, AccelerationStructureBuildTypeKHR, [*c]const AccelerationStructureBuildGeometryInfoKHR, [*c]const u32, [*c]AccelerationStructureBuildSizesInfoKHR) callconv(.c) void;
pub extern fn createAccelerationStructureKhr(device: Device, p_create_info: [*c]const AccelerationStructureCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_acceleration_structure: [*c]AccelerationStructureKHR) Result;
pub extern fn destroyAccelerationStructureKhr(device: Device, acceleration_structure: AccelerationStructureKHR, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn cmdBuildAccelerationStructuresKhr(command_buffer: CommandBuffer, info_count: u32, p_infos: [*c]const AccelerationStructureBuildGeometryInfoKHR, pp_build_range_infos: [*c]const [*c]const AccelerationStructureBuildRangeInfoKHR) void;
pub extern fn cmdBuildAccelerationStructuresIndirectKhr(command_buffer: CommandBuffer, info_count: u32, p_infos: [*c]const AccelerationStructureBuildGeometryInfoKHR, p_indirect_device_addresses: [*c]const DeviceAddress, p_indirect_strides: [*c]const u32, pp_max_primitive_counts: [*c]const [*c]const u32) void;
pub extern fn buildAccelerationStructuresKhr(device: Device, deferred_operation: DeferredOperationKHR, info_count: u32, p_infos: [*c]const AccelerationStructureBuildGeometryInfoKHR, pp_build_range_infos: [*c]const [*c]const AccelerationStructureBuildRangeInfoKHR) Result;
pub extern fn copyAccelerationStructureKhr(device: Device, deferred_operation: DeferredOperationKHR, p_info: [*c]const CopyAccelerationStructureInfoKHR) Result;
pub extern fn copyAccelerationStructureToMemoryKhr(device: Device, deferred_operation: DeferredOperationKHR, p_info: [*c]const CopyAccelerationStructureToMemoryInfoKHR) Result;
pub extern fn copyMemoryToAccelerationStructureKhr(device: Device, deferred_operation: DeferredOperationKHR, p_info: [*c]const CopyMemoryToAccelerationStructureInfoKHR) Result;
pub extern fn writeAccelerationStructuresPropertiesKhr(device: Device, acceleration_structure_count: u32, p_acceleration_structures: [*c]const AccelerationStructureKHR, query_type: QueryType, data_size: usize, p_data: ?*anyopaque, stride: usize) Result;
pub extern fn cmdCopyAccelerationStructureKhr(command_buffer: CommandBuffer, p_info: [*c]const CopyAccelerationStructureInfoKHR) void;
pub extern fn cmdCopyAccelerationStructureToMemoryKhr(command_buffer: CommandBuffer, p_info: [*c]const CopyAccelerationStructureToMemoryInfoKHR) void;
pub extern fn cmdCopyMemoryToAccelerationStructureKhr(command_buffer: CommandBuffer, p_info: [*c]const CopyMemoryToAccelerationStructureInfoKHR) void;
pub extern fn getAccelerationStructureDeviceAddressKhr(device: Device, p_info: [*c]const AccelerationStructureDeviceAddressInfoKHR) DeviceAddress;
pub extern fn cmdWriteAccelerationStructuresPropertiesKhr(command_buffer: CommandBuffer, acceleration_structure_count: u32, p_acceleration_structures: [*c]const AccelerationStructureKHR, query_type: QueryType, query_pool: QueryPool, first_query: u32) void;
pub extern fn getDeviceAccelerationStructureCompatibilityKhr(device: Device, p_version_info: [*c]const AccelerationStructureVersionInfoKHR, p_compatibility: [*c]AccelerationStructureCompatibilityKHR) void;
pub extern fn getAccelerationStructureBuildSizesKhr(device: Device, build_type: AccelerationStructureBuildTypeKHR, p_build_info: [*c]const AccelerationStructureBuildGeometryInfoKHR, p_max_primitive_counts: [*c]const u32, p_size_info: [*c]AccelerationStructureBuildSizesInfoKHR) void;
pub const ShaderGroupShaderKHR = enum(u32) {
    shader_general = 0,
    shader_closest_hit = 1,
    shader_any_hit = 2,
    shader_intersection = 3,
    shader_max_enum = 2147483647,
};
pub const RayTracingShaderGroupCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: RayTracingShaderGroupTypeKHR = @import("std").mem.zeroes(RayTracingShaderGroupTypeKHR),
    general_shader: u32 = @import("std").mem.zeroes(u32),
    closest_hit_shader: u32 = @import("std").mem.zeroes(u32),
    any_hit_shader: u32 = @import("std").mem.zeroes(u32),
    intersection_shader: u32 = @import("std").mem.zeroes(u32),
    p_shader_group_capture_replay_handle: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const RayTracingPipelineInterfaceCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    max_pipeline_ray_payload_size: u32 = @import("std").mem.zeroes(u32),
    max_pipeline_ray_hit_attribute_size: u32 = @import("std").mem.zeroes(u32),
};
pub const RayTracingPipelineCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCreateFlags = @import("std").mem.zeroes(PipelineCreateFlags),
    stage_count: u32 = @import("std").mem.zeroes(u32),
    p_stages: [*c]const PipelineShaderStageCreateInfo = @import("std").mem.zeroes([*c]const PipelineShaderStageCreateInfo),
    group_count: u32 = @import("std").mem.zeroes(u32),
    p_groups: [*c]const RayTracingShaderGroupCreateInfoKHR = @import("std").mem.zeroes([*c]const RayTracingShaderGroupCreateInfoKHR),
    max_pipeline_ray_recursion_depth: u32 = @import("std").mem.zeroes(u32),
    p_library_info: [*c]const PipelineLibraryCreateInfoKHR = @import("std").mem.zeroes([*c]const PipelineLibraryCreateInfoKHR),
    p_library_interface: [*c]const RayTracingPipelineInterfaceCreateInfoKHR = @import("std").mem.zeroes([*c]const RayTracingPipelineInterfaceCreateInfoKHR),
    p_dynamic_state: [*c]const PipelineDynamicStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineDynamicStateCreateInfo),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    base_pipeline_handle: Pipeline = @import("std").mem.zeroes(Pipeline),
    base_pipeline_index: i32 = @import("std").mem.zeroes(i32),
};
pub const PhysicalDeviceRayTracingPipelineFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_pipeline: Bool32 = @import("std").mem.zeroes(Bool32),
    ray_tracing_pipeline_shader_group_handle_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    ray_tracing_pipeline_shader_group_handle_capture_replay_mixed: Bool32 = @import("std").mem.zeroes(Bool32),
    ray_tracing_pipeline_trace_rays_indirect: Bool32 = @import("std").mem.zeroes(Bool32),
    ray_traversal_primitive_culling: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRayTracingPipelinePropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_group_handle_size: u32 = @import("std").mem.zeroes(u32),
    max_ray_recursion_depth: u32 = @import("std").mem.zeroes(u32),
    max_shader_group_stride: u32 = @import("std").mem.zeroes(u32),
    shader_group_base_alignment: u32 = @import("std").mem.zeroes(u32),
    shader_group_handle_capture_replay_size: u32 = @import("std").mem.zeroes(u32),
    max_ray_dispatch_invocation_count: u32 = @import("std").mem.zeroes(u32),
    shader_group_handle_alignment: u32 = @import("std").mem.zeroes(u32),
    max_ray_hit_attribute_size: u32 = @import("std").mem.zeroes(u32),
};
pub const TraceRaysIndirectCommandKHR = extern struct {
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
    depth: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdTraceRaysKHR = ?*const fn (CommandBuffer, [*c]const StridedDeviceAddressRegionKHR, [*c]const StridedDeviceAddressRegionKHR, [*c]const StridedDeviceAddressRegionKHR, [*c]const StridedDeviceAddressRegionKHR, u32, u32, u32) callconv(.c) void;
pub const PFN_createRayTracingPipelinesKHR = ?*const fn (Device, DeferredOperationKHR, PipelineCache, u32, [*c]const RayTracingPipelineCreateInfoKHR, [*c]const AllocationCallbacks, [*c]Pipeline) callconv(.c) Result;
pub const PFN_getRayTracingCaptureReplayShaderGroupHandlesKHR = ?*const fn (Device, Pipeline, u32, u32, usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_cmdTraceRaysIndirectKHR = ?*const fn (CommandBuffer, [*c]const StridedDeviceAddressRegionKHR, [*c]const StridedDeviceAddressRegionKHR, [*c]const StridedDeviceAddressRegionKHR, [*c]const StridedDeviceAddressRegionKHR, DeviceAddress) callconv(.c) void;
pub const PFN_getRayTracingShaderGroupStackSizeKHR = ?*const fn (Device, Pipeline, u32, ShaderGroupShaderKHR) callconv(.c) DeviceSize;
pub const PFN_cmdSetRayTracingPipelineStackSizeKHR = ?*const fn (CommandBuffer, u32) callconv(.c) void;
pub extern fn cmdTraceRaysKhr(command_buffer: CommandBuffer, p_raygen_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, p_miss_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, p_hit_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, p_callable_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, width: u32, height: u32, depth: u32) void;
pub extern fn createRayTracingPipelinesKhr(device: Device, deferred_operation: DeferredOperationKHR, pipeline_cache: PipelineCache, create_info_count: u32, p_create_infos: [*c]const RayTracingPipelineCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_pipelines: [*c]Pipeline) Result;
pub extern fn getRayTracingCaptureReplayShaderGroupHandlesKhr(device: Device, pipeline: Pipeline, first_group: u32, group_count: u32, data_size: usize, p_data: ?*anyopaque) Result;
pub extern fn cmdTraceRaysIndirectKhr(command_buffer: CommandBuffer, p_raygen_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, p_miss_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, p_hit_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, p_callable_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, indirect_device_address: DeviceAddress) void;
pub extern fn getRayTracingShaderGroupStackSizeKhr(device: Device, pipeline: Pipeline, group: u32, group_shader: ShaderGroupShaderKHR) DeviceSize;
pub extern fn cmdSetRayTracingPipelineStackSizeKhr(command_buffer: CommandBuffer, pipeline_stack_size: u32) void;
pub const PhysicalDeviceRayQueryFeaturesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_query: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMeshShaderFeaturesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    task_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    mesh_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview_mesh_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    primitive_fragment_shading_rate_mesh_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    mesh_shader_queries: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMeshShaderPropertiesEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_task_work_group_total_count: u32 = @import("std").mem.zeroes(u32),
    max_task_work_group_count: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_task_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    max_task_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_task_payload_size: u32 = @import("std").mem.zeroes(u32),
    max_task_shared_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_task_payload_and_shared_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_mesh_work_group_total_count: u32 = @import("std").mem.zeroes(u32),
    max_mesh_work_group_count: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_mesh_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    max_mesh_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_mesh_shared_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_mesh_payload_and_shared_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_mesh_payload_and_output_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_components: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_vertices: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_primitives: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_layers: u32 = @import("std").mem.zeroes(u32),
    max_mesh_multiview_view_count: u32 = @import("std").mem.zeroes(u32),
    mesh_output_per_vertex_granularity: u32 = @import("std").mem.zeroes(u32),
    mesh_output_per_primitive_granularity: u32 = @import("std").mem.zeroes(u32),
    max_preferred_task_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    max_preferred_mesh_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    prefers_local_invocation_vertex_output: Bool32 = @import("std").mem.zeroes(Bool32),
    prefers_local_invocation_primitive_output: Bool32 = @import("std").mem.zeroes(Bool32),
    prefers_compact_vertex_output: Bool32 = @import("std").mem.zeroes(Bool32),
    prefers_compact_primitive_output: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DrawMeshTasksIndirectCommandEXT = extern struct {
    group_count_x: u32 = @import("std").mem.zeroes(u32),
    group_count_y: u32 = @import("std").mem.zeroes(u32),
    group_count_z: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdDrawMeshTasksEXT = ?*const fn (CommandBuffer, u32, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawMeshTasksIndirectEXT = ?*const fn (CommandBuffer, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawMeshTasksIndirectCountEXT = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub extern fn cmdDrawMeshTasksExt(command_buffer: CommandBuffer, group_count_x: u32, group_count_y: u32, group_count_z: u32) void;
pub extern fn cmdDrawMeshTasksIndirectExt(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, draw_count: u32, stride: u32) void;
pub extern fn cmdDrawMeshTasksIndirectCountExt(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_bufferOffset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub const Win32SurfaceCreateFlagsKHR = Flags;
const HINSTANCE = @import("std").os.windows.HINSTANCE;
const HWND = @import("std").os.windows.HWND;
pub const Win32SurfaceCreateInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: Win32SurfaceCreateFlagsKHR = @import("std").mem.zeroes(Win32SurfaceCreateFlagsKHR),
    hinstance: HINSTANCE = @import("std").mem.zeroes(HINSTANCE),
    hwnd: HWND = @import("std").mem.zeroes(HWND),
};
pub const PFN_createWin32SurfaceKHR = ?*const fn (Instance, [*c]const Win32SurfaceCreateInfoKHR, [*c]const AllocationCallbacks, [*c]SurfaceKHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceWin32PresentationSupportKHR = ?*const fn (PhysicalDevice, u32) callconv(.c) Bool32;
pub extern fn createWin32SurfaceKhr(instance: Instance, p_create_info: [*c]const Win32SurfaceCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_surface: [*c]SurfaceKHR) Result;
pub extern fn getPhysicalDeviceWin32PresentationSupportKhr(physical_device: PhysicalDevice, queue_family_index: u32) Bool32;
pub const MemoryWin32HandlePropertiesKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_type_bits: u32 = @import("std").mem.zeroes(u32),
};
pub const MemoryGetWin32HandleInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    handle_type: ExternalMemoryHandleTypeFlagBits = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagBits),
};
pub const Win32KeyedMutexAcquireReleaseInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acquire_count: u32 = @import("std").mem.zeroes(u32),
    p_acquire_syncs: [*c]const DeviceMemory = @import("std").mem.zeroes([*c]const DeviceMemory),
    p_acquire_keys: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
    p_acquire_timeouts: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    release_count: u32 = @import("std").mem.zeroes(u32),
    p_release_syncs: [*c]const DeviceMemory = @import("std").mem.zeroes([*c]const DeviceMemory),
    p_release_keys: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
};
pub const D3D12FenceSubmitInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    wait_semaphore_values_count: u32 = @import("std").mem.zeroes(u32),
    p_wait_semaphore_values: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
    signal_semaphore_values_count: u32 = @import("std").mem.zeroes(u32),
    p_signal_semaphore_values: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
};
pub const SemaphoreGetWin32HandleInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    semaphore: Semaphore = @import("std").mem.zeroes(Semaphore),
    handle_type: ExternalSemaphoreHandleTypeFlagBits = @import("std").mem.zeroes(ExternalSemaphoreHandleTypeFlagBits),
};
pub const FenceGetWin32HandleInfoKHR = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    fence: Fence = @import("std").mem.zeroes(Fence),
    handle_type: ExternalFenceHandleTypeFlagBits = @import("std").mem.zeroes(ExternalFenceHandleTypeFlagBits),
};
pub const Win32KeyedMutexAcquireReleaseInfoNV = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acquire_count: u32 = @import("std").mem.zeroes(u32),
    p_acquire_syncs: [*c]const DeviceMemory = @import("std").mem.zeroes([*c]const DeviceMemory),
    p_acquire_keys: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
    p_acquire_timeout_milliseconds: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    release_count: u32 = @import("std").mem.zeroes(u32),
    p_release_syncs: [*c]const DeviceMemory = @import("std").mem.zeroes([*c]const DeviceMemory),
    p_release_keys: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
};
pub const FullScreenExclusiveEXT = enum(u32) {
    default = 0,
    allowed = 1,
    disallowed = 2,
    application_controlled = 3,
    max_enum = 2147483647,
};
pub const SurfaceFullScreenExclusiveInfoEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    full_screen_exclusive: FullScreenExclusiveEXT = @import("std").mem.zeroes(FullScreenExclusiveEXT),
};
pub const SurfaceCapabilitiesFullScreenExclusiveEXT = extern struct {
    s_type: StructureType = @import("std").mem.zeroes(StructureType),
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    full_screen_exclusive_supported: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_getPhysicalDeviceSurfacePresentModes2EXT = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceSurfaceInfo2KHR, [*c]u32, [*c]PresentModeKHR) callconv(.c) Result;
pub const PFN_acquireFullScreenExclusiveModeEXT = ?*const fn (Device, SwapchainKHR) callconv(.c) Result;
pub const PFN_releaseFullScreenExclusiveModeEXT = ?*const fn (Device, SwapchainKHR) callconv(.c) Result;
pub extern fn getPhysicalDeviceSurfacePresentModes2Ext(physical_device: PhysicalDevice, p_surface_info: [*c]const PhysicalDeviceSurfaceInfo2KHR, p_present_mode_count: [*c]u32, p_present_modes: [*c]PresentModeKHR) Result;
pub extern fn acquireFullScreenExclusiveModeExt(device: Device, swapchain: SwapchainKHR) Result;
pub extern fn releaseFullScreenExclusiveModeExt(device: Device, swapchain: SwapchainKHR) Result;
pub extern fn getDeviceGroupSurfacePresentModes2Ext(device: Device, p_surface_info: [*c]const PhysicalDeviceSurfaceInfo2KHR, p_modes: [*c]DeviceGroupPresentModeFlags) Result;
pub const PFN_acquireWinrtDisplayNV = ?*const fn (PhysicalDevice, DisplayKHR) callconv(.c) Result;
pub const PFN_getWinrtDisplayNV = ?*const fn (PhysicalDevice, u32, [*c]DisplayKHR) callconv(.c) Result;
pub extern fn acquireWinrtDisplayNv(physical_device: PhysicalDevice, display: DisplayKHR) Result;
pub extern fn getWinrtDisplayNv(physical_device: PhysicalDevice, device_relative_id: u32, p_display: [*c]DisplayKHR) Result;
pub inline fn makeApiVersion(variant: anytype, major: anytype, minor: anytype, patch: anytype) @TypeOf((((@import("std").zig.c_translation.cast(u32, variant) << @as(c_uint, 29)) | (@import("std").zig.c_translation.cast(u32, major) << @as(c_uint, 22))) | (@import("std").zig.c_translation.cast(u32, minor) << @as(c_uint, 12))) | @import("std").zig.c_translation.cast(u32, patch)) {
    _ = &variant;
    _ = &major;
    _ = &minor;
    _ = &patch;
    return (((@import("std").zig.c_translation.cast(u32, variant) << @as(c_uint, 29)) | (@import("std").zig.c_translation.cast(u32, major) << @as(c_uint, 22))) | (@import("std").zig.c_translation.cast(u32, minor) << @as(c_uint, 12))) | @import("std").zig.c_translation.cast(u32, patch);
}
pub inline fn makeVersion(major: anytype, minor: anytype, patch: anytype) @TypeOf(((@import("std").zig.c_translation.cast(u32, major) << @as(c_uint, 22)) | (@import("std").zig.c_translation.cast(u32, minor) << @as(c_uint, 12))) | @import("std").zig.c_translation.cast(u32, patch)) {
    _ = &major;
    _ = &minor;
    _ = &patch;
    return ((@import("std").zig.c_translation.cast(u32, major) << @as(c_uint, 22)) | (@import("std").zig.c_translation.cast(u32, minor) << @as(c_uint, 12))) | @import("std").zig.c_translation.cast(u32, patch);
}
pub inline fn versionMajor(version: anytype) @TypeOf(@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 22)) {
    _ = &version;
    return @import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 22);
}
pub inline fn versionMinor(version: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 12)) & @as(c_uint, 0x3FF)) {
    _ = &version;
    return (@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 12)) & @as(c_uint, 0x3FF);
}
pub inline fn versionPatch(version: anytype) @TypeOf(@import("std").zig.c_translation.cast(u32, version) & @as(c_uint, 0xFFF)) {
    _ = &version;
    return @import("std").zig.c_translation.cast(u32, version) & @as(c_uint, 0xFFF);
}
pub inline fn apiVersionVariant(version: anytype) @TypeOf(@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 29)) {
    _ = &version;
    return @import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 29);
}
pub inline fn apiVersionMajor(version: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 22)) & @as(c_uint, 0x7F)) {
    _ = &version;
    return (@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 22)) & @as(c_uint, 0x7F);
}
pub inline fn apiVersionMinor(version: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 12)) & @as(c_uint, 0x3FF)) {
    _ = &version;
    return (@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 12)) & @as(c_uint, 0x3FF);
}
pub inline fn apiVersionPatch(version: anytype) @TypeOf(@import("std").zig.c_translation.cast(u32, version) & @as(c_uint, 0xFFF)) {
    _ = &version;
    return @import("std").zig.c_translation.cast(u32, version) & @as(c_uint, 0xFFF);
}
pub inline fn makeVideoStdVersion(major: anytype, minor: anytype, patch: anytype) @TypeOf(((@import("std").zig.c_translation.cast(u32, major) << @as(c_int, 22)) | (@import("std").zig.c_translation.cast(u32, minor) << @as(c_int, 12))) | @import("std").zig.c_translation.cast(u32, patch)) {
    _ = &major;
    _ = &minor;
    _ = &patch;
    return ((@import("std").zig.c_translation.cast(u32, major) << @as(c_int, 22)) | (@import("std").zig.c_translation.cast(u32, minor) << @as(c_int, 12))) | @import("std").zig.c_translation.cast(u32, patch);
}
pub const ExtensionNames = struct {
    surface: "VK_KHR_surface",
    swapchain: "VK_KHR_swapchain",
    display: "VK_KHR_display",
    display_swapchain: "VK_KHR_display_swapchain",
    sampler_mirror_clamp_to_edge: "VK_KHR_sampler_mirror_clamp_to_edge",
    video_queue: "VK_KHR_video_queue",
    video_decode_queue: "VK_KHR_video_decode_queue",
    std_vulkan_video_codec_h264_encode: "VK_STD_vulkan_video_codec_h264_encode",
    video_encode_h264: "VK_KHR_video_encode_h264",
    std_vulkan_video_codec_h265_encode: "VK_STD_vulkan_video_codec_h265_encode",
    video_encode_h265: "VK_KHR_video_encode_h265",
    std_vulkan_video_codec_h264_decode: "VK_STD_vulkan_video_codec_h264_decode",
    video_decode_h264: "VK_KHR_video_decode_h264",
    dynamic_rendering: "VK_KHR_dynamic_rendering",
    multiview: "VK_KHR_multiview",
    get_physical_device_properties_2: "VK_KHR_get_physical_device_properties2",
    device_group: "VK_KHR_device_group",
    shader_draw_parameters: "VK_KHR_shader_draw_parameters",
    maintenance_1: "VK_KHR_maintenance1",
    device_group_creation: "VK_KHR_device_group_creation",
    external_memory_capabilities: "VK_KHR_external_memory_capabilities",
    external_memory: "VK_KHR_external_memory",
    external_memory_fd: "VK_KHR_external_memory_fd",
    external_semaphore_capabilities: "VK_KHR_external_semaphore_capabilities",
    external_semaphore: "VK_KHR_external_semaphore",
    external_semaphore_fd: "VK_KHR_external_semaphore_fd",
    push_descriptor: "VK_KHR_push_descriptor",
    shader_float16_int8: "VK_KHR_shader_float16_int8",
    @"16bit_storage": "VK_KHR_16bit_storage",
    incremental_present: "VK_KHR_incremental_present",
    descriptor_update_template: "VK_KHR_descriptor_update_template",
    imageless_framebuffer: "VK_KHR_imageless_framebuffer",
    create_renderpass_2: "VK_KHR_create_renderpass2",
    shared_presentable_image: "VK_KHR_shared_presentable_image",
    external_fence_capabilities: "VK_KHR_external_fence_capabilities",
    external_fence: "VK_KHR_external_fence",
    external_fence_fd: "VK_KHR_external_fence_fd",
    performance_query: "VK_KHR_performance_query",
    maintenance_2: "VK_KHR_maintenance2",
    get_surface_capabilities_2: "VK_KHR_get_surface_capabilities2",
    variable_pointers: "VK_KHR_variable_pointers",
    get_display_properties_2: "VK_KHR_get_display_properties2",
    dedicated_allocation: "VK_KHR_dedicated_allocation",
    storage_buffer_storage_class: "VK_KHR_storage_buffer_storage_class",
    relaxed_block_layout: "VK_KHR_relaxed_block_layout",
    get_memory_requirements_2: "VK_KHR_get_memory_requirements2",
    image_format_list: "VK_KHR_image_format_list",
    sampler_ycbcr_conversion: "VK_KHR_sampler_ycbcr_conversion",
    bind_memory_2: "VK_KHR_bind_memory2",
    maintenance_3: "VK_KHR_maintenance3",
    draw_indirect_count: "VK_KHR_draw_indirect_count",
    shader_subgroup_extended_types: "VK_KHR_shader_subgroup_extended_types",
    @"8bit_storage": "VK_KHR_8bit_storage",
    shader_atomic_int64: "VK_KHR_shader_atomic_int64",
    shader_clock: "VK_KHR_shader_clock",
    std_vulkan_video_codec_h265_decode: "VK_STD_vulkan_video_codec_h265_decode",
    video_decode_h265: "VK_KHR_video_decode_h265",
    global_priority: "VK_KHR_global_priority",
    driver_properties: "VK_KHR_driver_properties",
    shader_float_controls: "VK_KHR_shader_float_controls",
    depth_stencil_resolve: "VK_KHR_depth_stencil_resolve",
    swapchain_mutable_format: "VK_KHR_swapchain_mutable_format",
    timeline_semaphore: "VK_KHR_timeline_semaphore",
    vulkan_memory_model: "VK_KHR_vulkan_memory_model",
    shader_terminate_invocation: "VK_KHR_shader_terminate_invocation",
    fragment_shading_rate: "VK_KHR_fragment_shading_rate",
    dynamic_rendering_local_read: "VK_KHR_dynamic_rendering_local_read",
    shader_quad_control: "VK_KHR_shader_quad_control",
    spirv_1_4: "VK_KHR_spirv_1_4",
    surface_protected_capabilities: "VK_KHR_surface_protected_capabilities",
    separate_depth_stencil_layouts: "VK_KHR_separate_depth_stencil_layouts",
    present_wait: "VK_KHR_present_wait",
    uniform_buffer_standard_layout: "VK_KHR_uniform_buffer_standard_layout",
    buffer_device_address: "VK_KHR_buffer_device_address",
    deferred_host_operations: "VK_KHR_deferred_host_operations",
    pipeline_executable_properties: "VK_KHR_pipeline_executable_properties",
    map_memory_2: "VK_KHR_map_memory2",
    shader_integer_dot_product: "VK_KHR_shader_integer_dot_product",
    pipeline_library: "VK_KHR_pipeline_library",
    shader_non_semantic_info: "VK_KHR_shader_non_semantic_info",
    present_id: "VK_KHR_present_id",
    video_encode_queue: "VK_KHR_video_encode_queue",
    synchronization_2: "VK_KHR_synchronization2",
    fragment_shader_barycentric: "VK_KHR_fragment_shader_barycentric",
    shader_subgroup_uniform_control_flow: "VK_KHR_shader_subgroup_uniform_control_flow",
    zero_initialize_workgroup_memory: "VK_KHR_zero_initialize_workgroup_memory",
    workgroup_memory_explicit_layout: "VK_KHR_workgroup_memory_explicit_layout",
    copy_commands_2: "VK_KHR_copy_commands2",
    format_feature_flags_2: "VK_KHR_format_feature_flags2",
    ray_tracing_maintenance_1: "VK_KHR_ray_tracing_maintenance1",
    portability_enumeration: "VK_KHR_portability_enumeration",
    maintenance_4: "VK_KHR_maintenance4",
    shader_subgroup_rotate: "VK_KHR_shader_subgroup_rotate",
    shader_maximal_reconvergence: "VK_KHR_shader_maximal_reconvergence",
    maintenance_5: "VK_KHR_maintenance5",
    ray_tracing_position_fetch: "VK_KHR_ray_tracing_position_fetch",
    pipeline_binary: "VK_KHR_pipeline_binary",
    cooperative_matrix: "VK_KHR_cooperative_matrix",
    compute_shader_derivatives: "VK_KHR_compute_shader_derivatives",
    std_vulkan_video_codec_av1_decode: "VK_STD_vulkan_video_codec_av1_decode",
    video_decode_av1: "VK_KHR_video_decode_av1",
    std_vulkan_video_codec_av1_encode: "VK_STD_vulkan_video_codec_av1_encode",
    video_encode_av1: "VK_KHR_video_encode_av1",
    video_maintenance_1: "VK_KHR_video_maintenance1",
    vertex_attribute_divisor: "VK_KHR_vertex_attribute_divisor",
    load_store_op_none: "VK_KHR_load_store_op_none",
    shader_float_controls_2: "VK_KHR_shader_float_controls2",
    index_type_uint8: "VK_KHR_index_type_uint8",
    line_rasterization: "VK_KHR_line_rasterization",
    calibrated_timestamps: "VK_KHR_calibrated_timestamps",
    shader_expect_assume: "VK_KHR_shader_expect_assume",
    maintenance_6: "VK_KHR_maintenance6",
    video_encode_quantization_map: "VK_KHR_video_encode_quantization_map",
    shader_relaxed_extended_instruction: "VK_KHR_shader_relaxed_extended_instruction",
    maintenance_7: "VK_KHR_maintenance7",
    maintenance_8: "VK_KHR_maintenance8",
    video_maintenance_2: "VK_KHR_video_maintenance2",
    depth_clamp_zero_one: "VK_KHR_depth_clamp_zero_one",
    ext_debug_report: "VK_EXT_debug_report",
    nv_glsl_shader: "VK_NV_glsl_shader",
    ext_depth_range_unrestricted: "VK_EXT_depth_range_unrestricted",
    img_filter_cubic: "VK_IMG_filter_cubic",
    amd_rasterization_order: "VK_AMD_rasterization_order",
    amd_shader_trinary_minmax: "VK_AMD_shader_trinary_minmax",
    amd_shader_explicit_vertex_parameter: "VK_AMD_shader_explicit_vertex_parameter",
    ext_debug_marker: "VK_EXT_debug_marker",
    amd_gcn_shader: "VK_AMD_gcn_shader",
    nv_dedicated_allocation: "VK_NV_dedicated_allocation",
    ext_transform_feedback: "VK_EXT_transform_feedback",
    nvx_binary_import: "VK_NVX_binary_import",
    nvx_image_view_handle: "VK_NVX_image_view_handle",
    amd_draw_indirect_count: "VK_AMD_draw_indirect_count",
    amd_negative_viewport_height: "VK_AMD_negative_viewport_height",
    amd_gpu_shader_half_float: "VK_AMD_gpu_shader_half_float",
    amd_shader_ballot: "VK_AMD_shader_ballot",
    amd_texture_gather_bias_lod: "VK_AMD_texture_gather_bias_lod",
    amd_shader_info: "VK_AMD_shader_info",
    amd_shader_image_load_store_lod: "VK_AMD_shader_image_load_store_lod",
    nv_corner_sampled_image: "VK_NV_corner_sampled_image",
    img_format_pvrtc: "VK_IMG_format_pvrtc",
    nv_external_memory_capabilities: "VK_NV_external_memory_capabilities",
    nv_external_memory: "VK_NV_external_memory",
    ext_validation_flags: "VK_EXT_validation_flags",
    ext_shader_subgroup_ballot: "VK_EXT_shader_subgroup_ballot",
    ext_shader_subgroup_vote: "VK_EXT_shader_subgroup_vote",
    ext_texture_compression_astc_hdr: "VK_EXT_texture_compression_astc_hdr",
    ext_astc_decode_mode: "VK_EXT_astc_decode_mode",
    ext_pipeline_robustness: "VK_EXT_pipeline_robustness",
    ext_conditional_rendering: "VK_EXT_conditional_rendering",
    nv_clip_space_w_scaling: "VK_NV_clip_space_w_scaling",
    ext_direct_mode_display: "VK_EXT_direct_mode_display",
    ext_display_surface_counter: "VK_EXT_display_surface_counter",
    ext_display_control: "VK_EXT_display_control",
    google_display_timing: "VK_GOOGLE_display_timing",
    nv_sample_mask_override_coverage: "VK_NV_sample_mask_override_coverage",
    nv_geometry_shader_passthrough: "VK_NV_geometry_shader_passthrough",
    nv_viewport_array_2: "VK_NV_viewport_array2",
    nvx_multiview_per_view_attributes: "VK_NVX_multiview_per_view_attributes",
    nv_viewport_swizzle: "VK_NV_viewport_swizzle",
    ext_discard_rectangles: "VK_EXT_discard_rectangles",
    ext_conservative_rasterization: "VK_EXT_conservative_rasterization",
    ext_depth_clip_enable: "VK_EXT_depth_clip_enable",
    ext_swapchain_color_space: "VK_EXT_swapchain_colorspace",
    ext_hdr_metadata: "VK_EXT_hdr_metadata",
    img_relaxed_line_rasterization: "VK_IMG_relaxed_line_rasterization",
    ext_external_memory_dma_buf: "VK_EXT_external_memory_dma_buf",
    ext_queue_family_foreign: "VK_EXT_queue_family_foreign",
    ext_debug_utils: "VK_EXT_debug_utils",
    ext_sampler_filter_minmax: "VK_EXT_sampler_filter_minmax",
    amd_gpu_shader_int16: "VK_AMD_gpu_shader_int16",
    amd_mixed_attachment_samples: "VK_AMD_mixed_attachment_samples",
    amd_shader_fragment_mask: "VK_AMD_shader_fragment_mask",
    ext_shader_stencil_export: "VK_EXT_shader_stencil_export",
    ext_sample_locations: "VK_EXT_sample_locations",
    ext_blend_operation_advanced: "VK_EXT_blend_operation_advanced",
    nv_fragment_coverage_to_color: "VK_NV_fragment_coverage_to_color",
    nv_framebuffer_mixed_samples: "VK_NV_framebuffer_mixed_samples",
    nv_fill_rectangle: "VK_NV_fill_rectangle",
    nv_shader_sm_builtins: "VK_NV_shader_sm_builtins",
    ext_post_depth_coverage: "VK_EXT_post_depth_coverage",
    ext_image_drm_format_modifier: "VK_EXT_image_drm_format_modifier",
    ext_validation_cache: "VK_EXT_validation_cache",
    ext_descriptor_indexing: "VK_EXT_descriptor_indexing",
    ext_shader_viewport_index_layer: "VK_EXT_shader_viewport_index_layer",
    nv_shading_rate_image: "VK_NV_shading_rate_image",
    nv_ray_tracing: "VK_NV_ray_tracing",
    nv_representative_fragment_test: "VK_NV_representative_fragment_test",
    ext_filter_cubic: "VK_EXT_filter_cubic",
    qcom_render_pass_shader_resolve: "VK_QCOM_render_pass_shader_resolve",
    ext_global_priority: "VK_EXT_global_priority",
    ext_external_memory_host: "VK_EXT_external_memory_host",
    amd_buffer_marker: "VK_AMD_buffer_marker",
    amd_pipeline_compiler_control: "VK_AMD_pipeline_compiler_control",
    ext_calibrated_timestamps: "VK_EXT_calibrated_timestamps",
    amd_shader_core_properties: "VK_AMD_shader_core_properties",
    amd_memory_overallocation_behavior: "VK_AMD_memory_overallocation_behavior",
    ext_vertex_attribute_divisor: "VK_EXT_vertex_attribute_divisor",
    ext_pipeline_creation_feedback: "VK_EXT_pipeline_creation_feedback",
    nv_shader_subgroup_partitioned: "VK_NV_shader_subgroup_partitioned",
    nv_compute_shader_derivatives: "VK_NV_compute_shader_derivatives",
    nv_mesh_shader: "VK_NV_mesh_shader",
    nv_fragment_shader_barycentric: "VK_NV_fragment_shader_barycentric",
    nv_shader_image_footprint: "VK_NV_shader_image_footprint",
    nv_scissor_exclusive: "VK_NV_scissor_exclusive",
    nv_device_diagnostic_checkpoints: "VK_NV_device_diagnostic_checkpoints",
    intel_shader_integer_functions_2: "VK_INTEL_shader_integer_functions2",
    intel_performance_query: "VK_INTEL_performance_query",
    ext_pci_bus_info: "VK_EXT_pci_bus_info",
    amd_display_native_hdr: "VK_AMD_display_native_hdr",
    ext_fragment_density_map: "VK_EXT_fragment_density_map",
    ext_scalar_block_layout: "VK_EXT_scalar_block_layout",
    google_hlsl_functionality_1: "VK_GOOGLE_hlsl_functionality1",
    google_decorate_string: "VK_GOOGLE_decorate_string",
    ext_subgroup_size_control: "VK_EXT_subgroup_size_control",
    amd_shader_core_properties_2: "VK_AMD_shader_core_properties2",
    amd_device_coherent_memory: "VK_AMD_device_coherent_memory",
    ext_shader_image_atomic_int64: "VK_EXT_shader_image_atomic_int64",
    ext_memory_budget: "VK_EXT_memory_budget",
    ext_memory_priority: "VK_EXT_memory_priority",
    nv_dedicated_allocation_image_aliasing: "VK_NV_dedicated_allocation_image_aliasing",
    ext_buffer_device_address: "VK_EXT_buffer_device_address",
    ext_tooling_info: "VK_EXT_tooling_info",
    ext_separate_stencil_usage: "VK_EXT_separate_stencil_usage",
    ext_validation_features: "VK_EXT_validation_features",
    nv_cooperative_matrix: "VK_NV_cooperative_matrix",
    nv_coverage_reduction_mode: "VK_NV_coverage_reduction_mode",
    ext_fragment_shader_interlock: "VK_EXT_fragment_shader_interlock",
    ext_ycbcr_image_arrays: "VK_EXT_ycbcr_image_arrays",
    ext_provoking_vertex: "VK_EXT_provoking_vertex",
    ext_headless_surface: "VK_EXT_headless_surface",
    ext_line_rasterization: "VK_EXT_line_rasterization",
    ext_shader_atomic_float: "VK_EXT_shader_atomic_float",
    ext_host_query_reset: "VK_EXT_host_query_reset",
    ext_index_type_uint8: "VK_EXT_index_type_uint8",
    ext_extended_dynamic_state: "VK_EXT_extended_dynamic_state",
    ext_host_image_copy: "VK_EXT_host_image_copy",
    ext_map_memory_placed: "VK_EXT_map_memory_placed",
    ext_shader_atomic_float_2: "VK_EXT_shader_atomic_float2",
    ext_surface_maintenance_1: "VK_EXT_surface_maintenance1",
    ext_swapchain_maintenance_1: "VK_EXT_swapchain_maintenance1",
    ext_shader_demote_to_helper_invocation: "VK_EXT_shader_demote_to_helper_invocation",
    nv_device_generated_commands: "VK_NV_device_generated_commands",
    nv_inherited_viewport_scissor: "VK_NV_inherited_viewport_scissor",
    ext_texel_buffer_alignment: "VK_EXT_texel_buffer_alignment",
    qcom_render_pass_transform: "VK_QCOM_render_pass_transform",
    ext_depth_bias_control: "VK_EXT_depth_bias_control",
    ext_device_memory_report: "VK_EXT_device_memory_report",
    ext_acquire_drm_display: "VK_EXT_acquire_drm_display",
    ext_robustness_2: "VK_EXT_robustness2",
    ext_custom_border_color: "VK_EXT_custom_border_color",
    google_user_type: "VK_GOOGLE_user_type",
    nv_present_barrier: "VK_NV_present_barrier",
    ext_private_data: "VK_EXT_private_data",
    ext_pipeline_creation_cache_control: "VK_EXT_pipeline_creation_cache_control",
    nv_device_diagnostics_config: "VK_NV_device_diagnostics_config",
    qcom_render_pass_store_ops: "VK_QCOM_render_pass_store_ops",
    nv_cuda_kernel_launch: "VK_NV_cuda_kernel_launch",
    nv_low_latency: "VK_NV_low_latency",
    ext_descriptor_buffer: "VK_EXT_descriptor_buffer",
    ext_graphics_pipeline_library: "VK_EXT_graphics_pipeline_library",
    amd_shader_early_and_late_fragment_tests: "VK_AMD_shader_early_and_late_fragment_tests",
    nv_fragment_shading_rate_enums: "VK_NV_fragment_shading_rate_enums",
    nv_ray_tracing_motion_blur: "VK_NV_ray_tracing_motion_blur",
    ext_ycbcr_2plane_444_formats: "VK_EXT_ycbcr_2plane_444_formats",
    ext_fragment_density_map_2: "VK_EXT_fragment_density_map2",
    qcom_rotated_copy_commands: "VK_QCOM_rotated_copy_commands",
    ext_image_robustness: "VK_EXT_image_robustness",
    ext_image_compression_control: "VK_EXT_image_compression_control",
    ext_attachment_feedback_loop_layout: "VK_EXT_attachment_feedback_loop_layout",
    ext_4444_formats: "VK_EXT_4444_formats",
    ext_device_fault: "VK_EXT_device_fault",
    arm_rasterization_order_attachment_access: "VK_ARM_rasterization_order_attachment_access",
    ext_rgba10x6_formats: "VK_EXT_rgba10x6_formats",
    valve_mutable_descriptor_type: "VK_VALVE_mutable_descriptor_type",
    ext_vertex_input_dynamic_state: "VK_EXT_vertex_input_dynamic_state",
    ext_physical_device_drm: "VK_EXT_physical_device_drm",
    ext_device_address_binding_report: "VK_EXT_device_address_binding_report",
    ext_depth_clip_control: "VK_EXT_depth_clip_control",
    ext_primitive_topology_list_restart: "VK_EXT_primitive_topology_list_restart",
    ext_present_mode_fifo_latest_ready: "VK_EXT_present_mode_fifo_latest_ready",
    huawei_subpass_shading: "VK_HUAWEI_subpass_shading",
    huawei_invocation_mask: "VK_HUAWEI_invocation_mask",
    nv_external_memory_rdma: "VK_NV_external_memory_rdma",
    ext_pipeline_properties: "VK_EXT_pipeline_properties",
    ext_frame_boundary: "VK_EXT_frame_boundary",
    ext_multisampled_render_to_single_sampled: "VK_EXT_multisampled_render_to_single_sampled",
    ext_extended_dynamic_state_2: "VK_EXT_extended_dynamic_state2",
    ext_color_write_enable: "VK_EXT_color_write_enable",
    ext_primitives_generated_query: "VK_EXT_primitives_generated_query",
    ext_global_priority_query: "VK_EXT_global_priority_query",
    ext_image_view_min_lod: "VK_EXT_image_view_min_lod",
    ext_multi_draw: "VK_EXT_multi_draw",
    ext_image_2d_view_of_3d: "VK_EXT_image_2d_view_of_3d",
    ext_shader_tile_image: "VK_EXT_shader_tile_image",
    ext_opacity_micromap: "VK_EXT_opacity_micromap",
    ext_load_store_op_none: "VK_EXT_load_store_op_none",
    huawei_cluster_culling_shader: "VK_HUAWEI_cluster_culling_shader",
    ext_border_color_swizzle: "VK_EXT_border_color_swizzle",
    ext_pageable_device_local_memory: "VK_EXT_pageable_device_local_memory",
    arm_shader_core_properties: "VK_ARM_shader_core_properties",
    arm_scheduling_controls: "VK_ARM_scheduling_controls",
    ext_image_sliced_view_of_3d: "VK_EXT_image_sliced_view_of_3d",
    valve_descriptor_set_host_mapping: "VK_VALVE_descriptor_set_host_mapping",
    ext_depth_clamp_zero_one: "VK_EXT_depth_clamp_zero_one",
    ext_non_seamless_cube_map: "VK_EXT_non_seamless_cube_map",
    arm_render_pass_striped: "VK_ARM_render_pass_striped",
    qcom_fragment_density_map_offset: "VK_QCOM_fragment_density_map_offset",
    nv_copy_memory_indirect: "VK_NV_copy_memory_indirect",
    nv_memory_decompression: "VK_NV_memory_decompression",
    nv_device_generated_commands_compute: "VK_NV_device_generated_commands_compute",
    nv_ray_tracing_linear_swept_spheres: "VK_NV_ray_tracing_linear_swept_spheres",
    nv_linear_color_attachment: "VK_NV_linear_color_attachment",
    google_surfaceless_query: "VK_GOOGLE_surfaceless_query",
    ext_image_compression_control_swapchain: "VK_EXT_image_compression_control_swapchain",
    qcom_image_processing: "VK_QCOM_image_processing",
    ext_nested_command_buffer: "VK_EXT_nested_command_buffer",
    ext_external_memory_acquire_unmodified: "VK_EXT_external_memory_acquire_unmodified",
    ext_extended_dynamic_state_3: "VK_EXT_extended_dynamic_state3",
    ext_subpass_merge_feedback: "VK_EXT_subpass_merge_feedback",
    lunarg_direct_driver_loading: "VK_LUNARG_direct_driver_loading",
    ext_shader_module_identifier: "VK_EXT_shader_module_identifier",
    ext_rasterization_order_attachment_access: "VK_EXT_rasterization_order_attachment_access",
    nv_optical_flow: "VK_NV_optical_flow",
    ext_legacy_dithering: "VK_EXT_legacy_dithering",
    ext_pipeline_protected_access: "VK_EXT_pipeline_protected_access",
    amd_anti_lag: "VK_AMD_anti_lag",
    ext_shader_object: "VK_EXT_shader_object",
    qcom_tile_properties: "VK_QCOM_tile_properties",
    sec_amigo_profiling: "VK_SEC_amigo_profiling",
    qcom_multiview_per_view_viewports: "VK_QCOM_multiview_per_view_viewports",
    nv_ray_tracing_invocation_reorder: "VK_NV_ray_tracing_invocation_reorder",
    nv_cooperative_vector: "VK_NV_cooperative_vector",
    nv_extended_sparse_address_space: "VK_NV_extended_sparse_address_space",
    ext_mutable_descriptor_type: "VK_EXT_mutable_descriptor_type",
    ext_legacy_vertex_attributes: "VK_EXT_legacy_vertex_attributes",
    ext_layer_settings: "VK_EXT_layer_settings",
    arm_shader_core_builtins: "VK_ARM_shader_core_builtins",
    ext_pipeline_library_group_handles: "VK_EXT_pipeline_library_group_handles",
    ext_dynamic_rendering_unused_attachments: "VK_EXT_dynamic_rendering_unused_attachments",
    nv_low_latency_2: "VK_NV_low_latency2",
    qcom_multiview_per_view_render_areas: "VK_QCOM_multiview_per_view_render_areas",
    nv_per_stage_descriptor_set: "VK_NV_per_stage_descriptor_set",
    qcom_image_processing_2: "VK_QCOM_image_processing2",
    qcom_filter_cubic_weights: "VK_QCOM_filter_cubic_weights",
    qcom_ycbcr_degamma: "VK_QCOM_ycbcr_degamma",
    qcom_filter_cubic_clamp: "VK_QCOM_filter_cubic_clamp",
    ext_attachment_feedback_loop_dynamic_state: "VK_EXT_attachment_feedback_loop_dynamic_state",
    msft_layered_driver: "VK_MSFT_layered_driver",
    nv_descriptor_pool_overallocation: "VK_NV_descriptor_pool_overallocation",
    nv_display_stereo: "VK_NV_display_stereo",
    nv_raw_access_chains: "VK_NV_raw_access_chains",
    nv_command_buffer_inheritance: "VK_NV_command_buffer_inheritance",
    nv_shader_atomic_float16_vector: "VK_NV_shader_atomic_float16_vector",
    ext_shader_replicated_composites: "VK_EXT_shader_replicated_composites",
    nv_ray_tracing_validation: "VK_NV_ray_tracing_validation",
    nv_cluster_acceleration_structure: "VK_NV_cluster_acceleration_structure",
    nv_partitioned_acceleration_structure: "VK_NV_partitioned_acceleration_structure",
    ext_device_generated_commands: "VK_EXT_device_generated_commands",
    mesa_image_alignment_control: "VK_MESA_image_alignment_control",
    ext_depth_clamp_control: "VK_EXT_depth_clamp_control",
    huawei_hdr_vivid: "VK_HUAWEI_hdr_vivid",
    nv_cooperative_matrix_2: "VK_NV_cooperative_matrix2",
    arm_pipeline_opacity_micromap: "VK_ARM_pipeline_opacity_micromap",
    ext_vertex_attribute_robustness: "VK_EXT_vertex_attribute_robustness",
    nv_present_metering: "VK_NV_present_metering",
    acceleration_structure: "VK_KHR_acceleration_structure",
    ray_tracing_pipeline: "VK_KHR_ray_tracing_pipeline",
    ray_query: "VK_KHR_ray_query",
    ext_mesh_shader: "VK_EXT_mesh_shader",
    win32_surface: "VK_KHR_win32_surface",
    external_memory_win32: "VK_KHR_external_memory_win32",
    win32_keyed_mutex: "VK_KHR_win32_keyed_mutex",
    external_semaphore_win32: "VK_KHR_external_semaphore_win32",
    external_fence_win32: "VK_KHR_external_fence_win32",
    nv_external_memory_win32: "VK_NV_external_memory_win32",
    nv_win32_keyed_mutex: "VK_NV_win32_keyed_mutex",
    ext_full_screen_exclusive: "VK_EXT_full_screen_exclusive",
    nv_acquire_winrt_display: "VK_NV_acquire_winrt_display",
    const Self = @This();
    pub const maintenance1 = Self.maintenance_1;
    pub const maintenance2 = Self.maintenance_2;
    pub const maintenance3 = Self.maintenance_3;
    pub const nv_viewport_array2 = Self.nv_viewport_array_2;
    pub const google_hlsl_functionality1 = Self.google_hlsl_functionality_1;
};
pub const SpecVersions = struct {
    dynamic_rendering: i32 = 1,
    multiview: i32 = 1,
    shader_draw_parameters: i32 = 1,
    device_group_creation: i32 = 1,
    external_memory_capabilities: i32 = 1,
    external_memory: i32 = 1,
    external_memory_fd: i32 = 1,
    external_semaphore_capabilities: i32 = 1,
    external_semaphore: i32 = 1,
    external_semaphore_fd: i32 = 1,
    shader_float16_int8: i32 = 1,
    @"16bit_storage": i32 = 1,
    descriptor_update_template: i32 = 1,
    imageless_framebuffer: i32 = 1,
    create_renderpass_2: i32 = 1,
    shared_presentable_image: i32 = 1,
    external_fence_capabilities: i32 = 1,
    external_fence: i32 = 1,
    external_fence_fd: i32 = 1,
    performance_query: i32 = 1,
    maintenance_2: i32 = 1,
    get_surface_capabilities_2: i32 = 1,
    variable_pointers: i32 = 1,
    get_display_properties_2: i32 = 1,
    storage_buffer_storage_class: i32 = 1,
    relaxed_block_layout: i32 = 1,
    get_memory_requirements_2: i32 = 1,
    image_format_list: i32 = 1,
    bind_memory_2: i32 = 1,
    maintenance_3: i32 = 1,
    draw_indirect_count: i32 = 1,
    shader_subgroup_extended_types: i32 = 1,
    @"8bit_storage": i32 = 1,
    shader_atomic_int64: i32 = 1,
    shader_clock: i32 = 1,
    global_priority: i32 = 1,
    driver_properties: i32 = 1,
    depth_stencil_resolve: i32 = 1,
    swapchain_mutable_format: i32 = 1,
    shader_terminate_invocation: i32 = 1,
    dynamic_rendering_local_read: i32 = 1,
    shader_quad_control: i32 = 1,
    spirv_1_4: i32 = 1,
    surface_protected_capabilities: i32 = 1,
    separate_depth_stencil_layouts: i32 = 1,
    present_wait: i32 = 1,
    uniform_buffer_standard_layout: i32 = 1,
    buffer_device_address: i32 = 1,
    pipeline_executable_properties: i32 = 1,
    map_memory_2: i32 = 1,
    shader_integer_dot_product: i32 = 1,
    pipeline_library: i32 = 1,
    shader_non_semantic_info: i32 = 1,
    present_id: i32 = 1,
    synchronization_2: i32 = 1,
    fragment_shader_barycentric: i32 = 1,
    shader_subgroup_uniform_control_flow: i32 = 1,
    zero_initialize_workgroup_memory: i32 = 1,
    workgroup_memory_explicit_layout: i32 = 1,
    copy_commands_2: i32 = 1,
    ray_tracing_maintenance_1: i32 = 1,
    portability_enumeration: i32 = 1,
    shader_maximal_reconvergence: i32 = 1,
    maintenance_5: i32 = 1,
    ray_tracing_position_fetch: i32 = 1,
    pipeline_binary: i32 = 1,
    compute_shader_derivatives: i32 = 1,
    video_decode_av1: i32 = 1,
    video_encode_av1: i32 = 1,
    video_maintenance_1: i32 = 1,
    vertex_attribute_divisor: i32 = 1,
    load_store_op_none: i32 = 1,
    shader_float_controls_2: i32 = 1,
    index_type_uint8: i32 = 1,
    line_rasterization: i32 = 1,
    calibrated_timestamps: i32 = 1,
    shader_expect_assume: i32 = 1,
    maintenance_6: i32 = 1,
    shader_relaxed_extended_instruction: i32 = 1,
    maintenance_7: i32 = 1,
    maintenance_8: i32 = 1,
    video_maintenance_2: i32 = 1,
    depth_clamp_zero_one: i32 = 1,
    nv_glsl_shader: i32 = 1,
    ext_depth_range_unrestricted: i32 = 1,
    img_filter_cubic: i32 = 1,
    amd_rasterization_order: i32 = 1,
    amd_shader_trinary_minmax: i32 = 1,
    amd_shader_explicit_vertex_parameter: i32 = 1,
    amd_gcn_shader: i32 = 1,
    nv_dedicated_allocation: i32 = 1,
    ext_transform_feedback: i32 = 1,
    amd_negative_viewport_height: i32 = 1,
    amd_shader_ballot: i32 = 1,
    amd_texture_gather_bias_lod: i32 = 1,
    amd_shader_info: i32 = 1,
    amd_shader_image_load_store_lod: i32 = 1,
    img_format_pvrtc: i32 = 1,
    nv_external_memory_capabilities: i32 = 1,
    nv_external_memory: i32 = 1,
    ext_shader_subgroup_ballot: i32 = 1,
    ext_shader_subgroup_vote: i32 = 1,
    ext_texture_compression_astc_hdr: i32 = 1,
    ext_astc_decode_mode: i32 = 1,
    ext_pipeline_robustness: i32 = 1,
    nv_clip_space_w_scaling: i32 = 1,
    ext_direct_mode_display: i32 = 1,
    ext_display_surface_counter: i32 = 1,
    ext_display_control: i32 = 1,
    google_display_timing: i32 = 1,
    nv_sample_mask_override_coverage: i32 = 1,
    nv_geometry_shader_passthrough: i32 = 1,
    nv_viewport_array_2: i32 = 1,
    nvx_multiview_per_view_attributes: i32 = 1,
    nv_viewport_swizzle: i32 = 1,
    ext_conservative_rasterization: i32 = 1,
    ext_depth_clip_enable: i32 = 1,
    img_relaxed_line_rasterization: i32 = 1,
    ext_external_memory_dma_buf: i32 = 1,
    ext_queue_family_foreign: i32 = 1,
    amd_mixed_attachment_samples: i32 = 1,
    amd_shader_fragment_mask: i32 = 1,
    ext_inline_uniform_block: i32 = 1,
    ext_shader_stencil_export: i32 = 1,
    ext_sample_locations: i32 = 1,
    nv_fragment_coverage_to_color: i32 = 1,
    nv_framebuffer_mixed_samples: i32 = 1,
    nv_fill_rectangle: i32 = 1,
    nv_shader_sm_builtins: i32 = 1,
    ext_post_depth_coverage: i32 = 1,
    ext_validation_cache: i32 = 1,
    ext_shader_viewport_index_layer: i32 = 1,
    ext_external_memory_host: i32 = 1,
    amd_buffer_marker: i32 = 1,
    amd_pipeline_compiler_control: i32 = 1,
    amd_memory_overallocation_behavior: i32 = 1,
    ext_pipeline_creation_feedback: i32 = 1,
    nv_shader_subgroup_partitioned: i32 = 1,
    nv_compute_shader_derivatives: i32 = 1,
    nv_mesh_shader: i32 = 1,
    nv_fragment_shader_barycentric: i32 = 1,
    intel_shader_integer_functions_2: i32 = 1,
    amd_display_native_hdr: i32 = 1,
    ext_scalar_block_layout: i32 = 1,
    google_hlsl_functionality_1: i32 = 1,
    google_decorate_string: i32 = 1,
    amd_shader_core_properties_2: i32 = 1,
    amd_device_coherent_memory: i32 = 1,
    ext_shader_image_atomic_int64: i32 = 1,
    ext_memory_budget: i32 = 1,
    ext_memory_priority: i32 = 1,
    nv_dedicated_allocation_image_aliasing: i32 = 1,
    ext_tooling_info: i32 = 1,
    ext_separate_stencil_usage: i32 = 1,
    nv_cooperative_matrix: i32 = 1,
    nv_coverage_reduction_mode: i32 = 1,
    ext_fragment_shader_interlock: i32 = 1,
    ext_ycbcr_image_arrays: i32 = 1,
    ext_provoking_vertex: i32 = 1,
    ext_headless_surface: i32 = 1,
    ext_line_rasterization: i32 = 1,
    ext_shader_atomic_float: i32 = 1,
    ext_host_query_reset: i32 = 1,
    ext_index_type_uint8: i32 = 1,
    ext_extended_dynamic_state: i32 = 1,
    ext_host_image_copy: i32 = 1,
    ext_map_memory_placed: i32 = 1,
    ext_shader_atomic_float_2: i32 = 1,
    ext_surface_maintenance_1: i32 = 1,
    ext_swapchain_maintenance_1: i32 = 1,
    ext_shader_demote_to_helper_invocation: i32 = 1,
    nv_inherited_viewport_scissor: i32 = 1,
    ext_texel_buffer_alignment: i32 = 1,
    ext_depth_bias_control: i32 = 1,
    ext_acquire_drm_display: i32 = 1,
    ext_robustness_2: i32 = 1,
    google_user_type: i32 = 1,
    nv_present_barrier: i32 = 1,
    ext_private_data: i32 = 1,
    nv_low_latency: i32 = 1,
    ext_descriptor_buffer: i32 = 1,
    ext_graphics_pipeline_library: i32 = 1,
    amd_shader_early_and_late_fragment_tests: i32 = 1,
    nv_fragment_shading_rate_enums: i32 = 1,
    nv_ray_tracing_motion_blur: i32 = 1,
    ext_ycbcr_2plane_444_formats: i32 = 1,
    ext_fragment_density_map_2: i32 = 1,
    ext_image_robustness: i32 = 1,
    ext_image_compression_control: i32 = 1,
    ext_4444_formats: i32 = 1,
    arm_rasterization_order_attachment_access: i32 = 1,
    ext_rgba10x6_formats: i32 = 1,
    valve_mutable_descriptor_type: i32 = 1,
    ext_physical_device_drm: i32 = 1,
    ext_device_address_binding_report: i32 = 1,
    ext_depth_clip_control: i32 = 1,
    ext_primitive_topology_list_restart: i32 = 1,
    ext_present_mode_fifo_latest_ready: i32 = 1,
    huawei_invocation_mask: i32 = 1,
    nv_external_memory_rdma: i32 = 1,
    ext_pipeline_properties: i32 = 1,
    ext_frame_boundary: i32 = 1,
    ext_multisampled_render_to_single_sampled: i32 = 1,
    ext_extended_dynamic_state_2: i32 = 1,
    ext_color_write_enable: i32 = 1,
    ext_primitives_generated_query: i32 = 1,
    ext_global_priority_query: i32 = 1,
    ext_image_view_min_lod: i32 = 1,
    ext_multi_draw: i32 = 1,
    ext_image_2d_view_of_3d: i32 = 1,
    ext_shader_tile_image: i32 = 1,
    ext_load_store_op_none: i32 = 1,
    ext_border_color_swizzle: i32 = 1,
    ext_pageable_device_local_memory: i32 = 1,
    arm_shader_core_properties: i32 = 1,
    arm_scheduling_controls: i32 = 1,
    ext_image_sliced_view_of_3d: i32 = 1,
    valve_descriptor_set_host_mapping: i32 = 1,
    ext_depth_clamp_zero_one: i32 = 1,
    ext_non_seamless_cube_map: i32 = 1,
    arm_render_pass_striped: i32 = 1,
    nv_copy_memory_indirect: i32 = 1,
    nv_memory_decompression: i32 = 1,
    nv_ray_tracing_linear_swept_spheres: i32 = 1,
    nv_linear_color_attachment: i32 = 1,
    ext_image_compression_control_swapchain: i32 = 1,
    qcom_image_processing: i32 = 1,
    ext_nested_command_buffer: i32 = 1,
    ext_external_memory_acquire_unmodified: i32 = 1,
    lunarg_direct_driver_loading: i32 = 1,
    ext_shader_module_identifier: i32 = 1,
    ext_rasterization_order_attachment_access: i32 = 1,
    nv_optical_flow: i32 = 1,
    ext_pipeline_protected_access: i32 = 1,
    amd_anti_lag: i32 = 1,
    ext_shader_object: i32 = 1,
    qcom_tile_properties: i32 = 1,
    sec_amigo_profiling: i32 = 1,
    qcom_multiview_per_view_viewports: i32 = 1,
    nv_ray_tracing_invocation_reorder: i32 = 1,
    nv_extended_sparse_address_space: i32 = 1,
    ext_mutable_descriptor_type: i32 = 1,
    ext_legacy_vertex_attributes: i32 = 1,
    ext_pipeline_library_group_handles: i32 = 1,
    ext_dynamic_rendering_unused_attachments: i32 = 1,
    qcom_multiview_per_view_render_areas: i32 = 1,
    nv_per_stage_descriptor_set: i32 = 1,
    qcom_image_processing_2: i32 = 1,
    qcom_filter_cubic_weights: i32 = 1,
    qcom_ycbcr_degamma: i32 = 1,
    qcom_filter_cubic_clamp: i32 = 1,
    ext_attachment_feedback_loop_dynamic_state: i32 = 1,
    msft_layered_driver: i32 = 1,
    nv_descriptor_pool_overallocation: i32 = 1,
    nv_display_stereo: i32 = 1,
    nv_raw_access_chains: i32 = 1,
    nv_command_buffer_inheritance: i32 = 1,
    nv_shader_atomic_float16_vector: i32 = 1,
    ext_shader_replicated_composites: i32 = 1,
    nv_ray_tracing_validation: i32 = 1,
    nv_partitioned_acceleration_structure: i32 = 1,
    ext_device_generated_commands: i32 = 1,
    mesa_image_alignment_control: i32 = 1,
    ext_depth_clamp_control: i32 = 1,
    huawei_hdr_vivid: i32 = 1,
    nv_cooperative_matrix_2: i32 = 1,
    arm_pipeline_opacity_micromap: i32 = 1,
    ext_vertex_attribute_robustness: i32 = 1,
    nv_present_metering: i32 = 1,
    ray_tracing_pipeline: i32 = 1,
    ray_query: i32 = 1,
    ext_mesh_shader: i32 = 1,
    external_memory_win32: i32 = 1,
    win32_keyed_mutex: i32 = 1,
    external_semaphore_win32: i32 = 1,
    external_fence_win32: i32 = 1,
    nv_external_memory_win32: i32 = 1,
    nv_acquire_winrt_display: i32 = 1,
    ext_attachment_feedback_loop_layout: i32 = 2,
    ext_discard_rectangles: i32 = 2,
    ext_device_fault: i32 = 2,
    nv_representative_fragment_test: i32 = 2,
    ext_legacy_dithering: i32 = 2,
    ext_global_priority: i32 = 2,
    timeline_semaphore: i32 = 2,
    ext_vertex_input_dynamic_state: i32 = 2,
    maintenance_4: i32 = 2,
    shader_subgroup_rotate: i32 = 2,
    ext_calibrated_timestamps: i32 = 2,
    amd_shader_core_properties: i32 = 2,
    nvx_binary_import: i32 = 2,
    amd_draw_indirect_count: i32 = 2,
    ext_debug_utils: i32 = 2,
    ext_layer_settings: i32 = 2,
    arm_shader_core_builtins: i32 = 2,
    ext_sampler_filter_minmax: i32 = 2,
    amd_gpu_shader_int16: i32 = 2,
    nv_low_latency_2: i32 = 2,
    ext_conditional_rendering: i32 = 2,
    nv_shader_image_footprint: i32 = 2,
    nv_scissor_exclusive: i32 = 2,
    nv_device_diagnostic_checkpoints: i32 = 2,
    incremental_present: i32 = 2,
    intel_performance_query: i32 = 2,
    ext_pci_bus_info: i32 = 2,
    ext_device_memory_report: i32 = 2,
    amd_gpu_shader_half_float: i32 = 2,
    ext_opacity_micromap: i32 = 2,
    ext_fragment_density_map: i32 = 2,
    fragment_shading_rate: i32 = 2,
    push_descriptor: i32 = 2,
    ext_blend_operation_advanced: i32 = 2,
    nv_device_diagnostics_config: i32 = 2,
    nv_cluster_acceleration_structure: i32 = 2,
    qcom_render_pass_store_ops: i32 = 2,
    nv_cuda_kernel_launch: i32 = 2,
    ext_subgroup_size_control: i32 = 2,
    maintenance_1: i32 = 2,
    cooperative_matrix: i32 = 2,
    qcom_fragment_density_map_offset: i32 = 2,
    nv_corner_sampled_image: i32 = 2,
    format_feature_flags_2: i32 = 2,
    nv_device_generated_commands_compute: i32 = 2,
    get_physical_device_properties_2: i32 = 2,
    ext_image_drm_format_modifier: i32 = 2,
    google_surfaceless_query: i32 = 2,
    ext_buffer_device_address: i32 = 2,
    qcom_rotated_copy_commands: i32 = 2,
    video_encode_quantization_map: i32 = 2,
    ext_descriptor_indexing: i32 = 2,
    ext_extended_dynamic_state_3: i32 = 2,
    nv_win32_keyed_mutex: i32 = 2,
    ext_subpass_merge_feedback: i32 = 2,
    ext_pipeline_creation_cache_control: i32 = 3,
    vulkan_memory_model: i32 = 3,
    nv_device_generated_commands: i32 = 3,
    huawei_subpass_shading: i32 = 3,
    ext_hdr_metadata: i32 = 3,
    ext_validation_flags: i32 = 3,
    huawei_cluster_culling_shader: i32 = 3,
    nvx_image_view_handle: i32 = 3,
    sampler_mirror_clamp_to_edge: i32 = 3,
    nv_shading_rate_image: i32 = 3,
    nv_ray_tracing: i32 = 3,
    ext_vertex_attribute_divisor: i32 = 3,
    dedicated_allocation: i32 = 3,
    ext_filter_cubic: i32 = 3,
    ext_debug_marker: i32 = 4,
    shader_float_controls: i32 = 4,
    deferred_host_operations: i32 = 4,
    qcom_render_pass_transform: i32 = 4,
    qcom_render_pass_shader_resolve: i32 = 4,
    nv_cooperative_vector: i32 = 4,
    ext_full_screen_exclusive: i32 = 4,
    device_group: i32 = 4,
    ext_swapchain_color_space: i32 = 5,
    ext_validation_features: i32 = 6,
    win32_surface: i32 = 6,
    video_queue: i32 = 8,
    video_decode_h265: i32 = 8,
    video_decode_queue: i32 = 8,
    video_decode_h264: i32 = 9,
    display_swapchain: i32 = 10,
    ext_debug_report: i32 = 10,
    ext_custom_border_color: i32 = 12,
    video_encode_queue: i32 = 12,
    acceleration_structure: i32 = 13,
    video_encode_h264: i32 = 14,
    sampler_ycbcr_conversion: i32 = 14,
    video_encode_h265: i32 = 14,
    display: i32 = 23,
    surface: i32 = 25,
    swapchain: i32 = 70,
};
