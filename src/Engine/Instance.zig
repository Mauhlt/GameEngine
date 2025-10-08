const std = @import("std");
const vk = @import("..\\vulkan\\vulkan.zig");
const required_instance_extensions = [_][*:0]const u8{
    vk.ExtensionName.win32_surface,
    vk.ExtensionName.surface,
};

pub fn init() !vk.Instance {
    // app info
    const app_info: vk.ApplicationInfo = .{
        .p_application_name = "Curr App",
        .application_version = vk.makeApiVersion(0, 1, 0, 0),
        .p_engine_name = "No Engine",
        .engine_version = vk.makeApiVersion(0, 1, 0, 0),
        .api_version = vk.makeApiVersion(0, 1, 0, 0),
    };
    // get extensions
    var n_exts: u32 = 0;
    switch (vk.enumerateInstanceExtensionProperties(null, &n_exts, null)) {
        .success => {},
        else => return error.FailedToEnumerateInstanceExtensionProperties,
    }
    // print("# Of Instance Extensions: {}\n", .{n_exts});
    var exts: [64]vk.ExtensionProperties = undefined;
    switch (vk.enumerateInstanceExtensionProperties(null, &n_exts, &exts)) {
        .success => {},
        else => return error.FailedToEnumerateInstanceExtensionProperties,
    }
    // check that all required instance extensions are supported
    var has_instance_extensions: bool = true;
    outer: for (required_instance_extensions) |req_ext| {
        const name1 = std.mem.span(req_ext);
        for (exts[0..n_exts]) |extension| {
            const len = std.mem.indexOfScalar(u8, &extension.extension_name, 0).?;
            const name2 = extension.extension_name[0..len];
            if (std.mem.eql(u8, name1, name2)) continue :outer;
        }
        has_instance_extensions = false;
    }
    if (!has_instance_extensions) {
        return error.MissingRequiredInstanceExtension;
    }

    // create info
    const create_info = vk.InstanceCreateInfo{
        .flags = switch (@import("builtin").os.tag) {
            .macos => .init(.enumerate_portability_bit_khr),
            else => .initEmpty(),
        },
        .p_application_info = &app_info,
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
        .enabled_extension_count = @truncate(required_instance_extensions.len),
        .pp_enabled_extension_names = @ptrCast(&required_instance_extensions),
    };
    // create instance
    var instance: vk.Instance = .null;
    return switch (vk.createInstance(&create_info, null, &instance)) {
        .success => instance,
        else => error.FailedToCreateInstance,
    };
}

pub fn deinit(instance: vk.Instance) void {
    vk.destroyInstance(instance, null);
}

pub fn printExtensions() void {
    // get extensions
    var n_exts: u32 = 0;
    switch (vk.enumerateInstanceExtensionProperties(null, &n_exts, null)) {
        .success => {},
        else => return error.FailedToEnumerateInstanceExtensionProperties,
    }
    // print("# Of Instance Extensions: {}\n", .{n_exts});
    var exts: [64]vk.ExtensionProperties = undefined;
    switch (vk.enumerateInstanceExtensionProperties(null, &n_exts, &exts)) {
        .success => {},
        else => return error.FailedToEnumerateInstanceExtensionProperties,
    }
    std.debug.print("# Of Instance Extensions: {}\n", .{n_exts});
    for (exts[0..exts]) |ext| {
        const full_name = ext.extension_name;
        const len = std.mem.indexOfScalar(u8, full_name, 0) orelse ext.extension_name.len;
        const name = full_name[0..len];
        std.debug.print("{s}\n", .{name});
    }
}
