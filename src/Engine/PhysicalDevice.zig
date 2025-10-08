const std = @import("std");
const vk = @import("..\\vulkan\\vulkan.zig");
const QFI = @import("QueueFamilyIndices.zig");
const SSD = @import("SwapchainSupportDetails.zig");
const required_device_extensions = [_][*:0]const u8{
    vk.ExtensionName.swapchain,
};
const PhysicalDevice = @This();

// PickPhysicalDevice
pub fn init(
    instance: vk.Instance,
    surface: vk.SurfaceKHR,
) !vk.PhysicalDevice {
    return pickPhysicalDevice(instance, surface);
}

fn pickPhysicalDevice(
    instance: vk.Instance,
    surface: vk.SurfaceKHR,
) !vk.PhysicalDevice {
    // get # of devices
    var n_devices: u32 = 0;
    switch (vk.enumeratePhysicalDevices(instance, &n_devices, null)) {
        .success => {},
        else => return error.FailedToEnumeratePhysicalDevices,
    }
    if (n_devices == 0) return error.FoundNoPhysicalDevice;
    // get physical devices
    var physical_devices: [16]vk.PhysicalDevice = undefined;
    switch (vk.enumeratePhysicalDevices(
        instance,
        &n_devices,
        &physical_devices,
    )) {
        .success => {},
        else => return error.FailedToEnumeratePhysicalDevices,
    }
    // get physical device
    for (physical_devices[0..n_devices]) |physical_device| {
        const is_device_suitable = try isDeviceSuitable(surface, physical_device);
        if (is_device_suitable) return physical_device;
    }
    // default
    return error.FoundNoSuitablePhysicalDevice;
}

// simplest
fn isDeviceSuitable(surface: vk.SurfaceKHR, device: vk.PhysicalDevice) !bool {
    const qfi = try QFI.init(surface, device);
    if (!qfi.isComplete()) return false;
    if (!checkDeviceExtensionSupport(device)) return false;
    const ssd = try SSD.init(device, surface);
    return ssd.isAdequate();
}

pub fn printDeviceExtensionSupport(device: vk.PhysicalDevice) void {
    var n_exts: u32 = 0;
    switch (vk.enumerateDeviceExtensionProperties(device, null, &n_exts, null)) {
        .success => {},
        else => return false,
        // else => return error.FailedToEnumerateDeviceExtensionProperties,
    }
    // get device extensions
    var exts: [512]vk.ExtensionProperties = undefined;
    switch (vk.enumerateDeviceExtensionProperties(device, null, &n_exts, &exts)) {
        .success => {},
        else => return false,
        // else => return error.FailedToEnumerateDeviceExtensionProperties,
    }
    for (exts) |ext| {
        const len = std.mem.indexOfScalar(u8, ext.extension_name, 0).?;
        const name = ext.extension_name[0..len];
        std.debug.print("Name: {s}\n", .{name});
    }
}

fn checkDeviceExtensionSupport(device: vk.PhysicalDevice) bool {
    // get # of device extensions
    var n_exts: u32 = 0;
    switch (vk.enumerateDeviceExtensionProperties(device, null, &n_exts, null)) {
        .success => {},
        else => return false,
        // else => return error.FailedToEnumerateDeviceExtensionProperties,
    }
    // get device extensions
    var exts: [512]vk.ExtensionProperties = undefined;
    switch (vk.enumerateDeviceExtensionProperties(device, null, &n_exts, &exts)) {
        .success => {},
        else => return false,
        // else => return error.FailedToEnumerateDeviceExtensionProperties,
    }
    // check that required device extensions are supported
    var has_device_extensions: bool = true;
    outer: for (required_device_extensions) |req_ext| {
        const name1 = std.mem.span(req_ext);
        for (exts[0..n_exts]) |ext| {
            const len = std.mem.indexOfScalar(u8, &ext.extension_name, 0).?;
            const name2 = ext.extension_name[0..len];
            if (std.mem.eql(u8, name1, name2)) continue :outer;
        }
        has_device_extensions = false;
        std.debug.print("Missing: {s}\n", .{name1});
    }
    // default
    return has_device_extensions;
}

// better
fn isDeviceSuitable1(device: vk.PhysicalDevice) bool {
    var props: vk.PhysicalDeviceProperties2 = undefined;
    vk.getPhysicalDeviceProperties(device, &props);
    var feats: vk.PhysicalDeviceFeatures2 = undefined;
    vk.getPhysicalDeviceFeatures2(device, &feats);
    return props.deviceType == .device_type_discrete_gpu and (feats.geometryShader > 0);
}

// best
fn ratePhysicalDeviceSuitability(device: vk.PhysicalDevice) i32 {
    var score: i32 = 0;
    // props + feats
    var props: vk.PhysicalDeviceProperties2 = undefined;
    vk.getPhysicalDeviceProperties(device, &props);
    var feats: vk.PhysicalDeviceFeatures2 = undefined;
    vk.getPhysicalDeviceFeatures2(device, &feats);
    // device type
    score += switch (device.deviceType) {
        .discrete_gpu => 1000,
        .integrated_gpu => 100,
        .virtual_gpu => 10,
        else => 0,
    };
    // dims - max possible txeture size
    score += props.limits.max_image_dimension_2d;
    score += props.limits.max_image_dimension_3d;
    // ensure shader types
    if (!feats.geometry_shader) {
        return 0;
    }
    // score
    return score;
}
