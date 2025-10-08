const std = @import("std");
const vk = @import("..\\vulkan\\vulkan.zig");
const SSD = @import("SwapchainSupportDetails.zig");
const QFI = @import("QueueFamilyIndices.zig");
const WindowHandle = @import("WindowHandle.zig");
const Swapchain = @This();

swapchain: vk.SwapchainKHR = .null,
format: vk.Format = .b8g8r8_srgb,
extent: vk.Extent2D = .{ .width = 0, .height = 0 },
n_images: u32 = 0,
images: [3]vk.Image = [_]vk.Image{.null} ** 3,
image_views: [3]vk.ImageView = [_]vk.ImageView{.null} ** 3,
framebuffers: [3]vk.Framebuffer = [_]vk.Framebuffer{.null} ** 3,

pub fn init(
    device: vk.Device,
    physical_device: vk.PhysicalDevice,
    surface: vk.SurfaceKHR,
    render_pass: vk.RenderPass,
) !Swapchain {
    var self: Swapchain = .{};
    self.swapchain = try createSwapchainKHR(device, physical_device, surface);
    self.format = createSwapchainFormat(physical_device, surface);
    self.extent = createSwapchainExtent(physical_device, surface);
    self.n_images = getNumSwapchainImages(device, self.swapchain);
    try createSwapchainImages(
        device,
        self.swapchain,
        &self.n_images,
        &self.images,
    );
    try createSwapchainImageViews(
        device,
        self.format,
        &self.images,
        &self.image_views,
    );
    try createSwapchainFramebuffers(
        device,
        render_pass,
        &self.image_views,
        &self.framebuffers,
    );
    return self;
}

pub fn deinit(
    self: *Swapchain,
    device: vk.Device,
) void {
    for (self.framebuffers) |framebuffer| vk.destroyFramebuffer(device, framebuffer, null);
    for (self.image_views) |image_view| vk.destroyImageView(device, image_view, null);
    vk.destroySwapchainKHR(device, self.swapchain, null);
}

fn createSwapchainKHR(
    device: vk.Device,
    physical_device: vk.PhysicalDevice,
    surface: vk.SurfaceKHR,
) !vk.SwapchainKHR {
    // query swapchain support details
    const ssd = try SSD.init(physical_device, surface);
    const surface_format: vk.SurfaceFormatKHR = ssd.chooseSurfaceFormat();
    const present_mode: vk.PresentModeKHR = ssd.choosePresentMode();
    const extent: vk.Extent2D = ssd.chooseExtent();
    // get # of images
    var n_images: u32 = ssd.capabilities.min_image_count + 1;
    if (ssd.capabilities.max_image_count > 0 and ssd.capabilities.max_image_count < n_images) //
        n_images = ssd.capabilities.max_image_count;
    // get queue families
    const indices = try QFI.init(physical_device, surface);
    const queue_family_indices = [_]u32{
        indices.graphics_family.?,
        indices.present_family.?,
    };
    // create info
    const create_info = vk.SwapchainCreateInfoKHR{
        .surface = surface,
        .min_image_count = n_images,
        .image_format = surface_format.format,
        .image_color_space = surface_format.color_space,
        .image_extent = extent,
        .image_array_layers = 1,
        .image_usage = .init(.color_attachment_bit),
        .image_sharing_mode = if (indices.isSameFamily()) .exclusive //
        else .concurrent,
        .queue_family_index_count = if (indices.isSameFamily()) 0 else 2,
        .p_queue_family_indices = if (indices.isSameFamily()) null //
        else &queue_family_indices,
        .pre_transform = ssd.capabilities.current_transform,
        .composite_alpha = .opaque_bit,
        .present_mode = present_mode,
        .clipped = .true,
        .old_swapchain = .null,
    };
    // create swapchain
    var swapchain: vk.SwapchainKHR = .null;
    return switch (vk.createSwapchainKHR(
        device,
        &create_info,
        null,
        &swapchain,
    )) {
        .success => swapchain,
        else => error.FailedToCreateSwapchain,
    };
}

fn createSwapchainFormat(
    physical_device: vk.PhysicalDevice,
    surface: vk.SurfaceKHR,
) !vk.Format {
    const ssd = try SSD.init(physical_device, surface);
    const surface_format = ssd.chooseSurfaceFormat();
    return surface_format.format;
}

fn createSwapchainExtent(
    physical_device: vk.PhysicalDevice,
    surface: vk.SurfaceKHR,
) !vk.Extent2D {
    const ssd = try SSD.init(physical_device, surface);
    const extent = ssd.chooseExtent();
    return extent;
}

fn getNumSwapchainImages(device: vk.Device, swapchain: vk.SwapchainKHR) !u32 {
    var n_images: u32 = 0;
    return switch (vk.getSwapchainImagesKHR(
        device,
        swapchain,
        &n_images,
        null,
    )) {
        .success => n_images,
        else => return error.FailedToGetSwapchainImages,
    };
}

fn createSwapchainImages(
    device: vk.Device,
    swapchain: vk.SwapchainKHR,
    n_images: *u32,
    images: *[3]vk.Image,
) !void {
    switch (vk.getSwapchainImagesKHR(
        device,
        swapchain,
        &n_images,
        images,
    )) {
        .success => {},
        else => return error.FailedToGetSwapchainImages,
    }
}

fn createSwapchainImageViews(
    device: vk.Device,
    format: vk.Format,
    images: *[3]vk.Image,
    image_views: *[3]vk.ImageView,
) !void {
    for (images, image_views) |image, image_view| {
        const create_info = vk.ImageViewCreateInfo{
            .image = image,
            .view_type = .@"2d",
            .format = format,
            .components = .{
                .r = .identity,
                .g = .identity,
                .b = .identity,
                .a = .identity,
            },
            .subresource_range = .{
                .aspect_mask = .init(.color_bit),
                .base_mip_level = 0,
                .level_count = 1,
                .base_array_layer = 0,
                .layer_count = 1,
            },
        };
        switch (vk.createImageView(
            device,
            &create_info,
            null,
            &image_view,
        )) {
            .success => {},
            else => return error.FailedToCreateImageView,
        }
    }
}

fn createSwapchainFramebuffers(
    device: vk.Device,
    render_pass: vk.RenderPass,
    extent: vk.Extent2D,
    image_views: *[3]vk.ImageView,
    framebuffers: *[3]vk.Framebuffer,
) !void {
    for (image_views, framebuffers) |image_view, framebuffer| {
        const attachments = [_]vk.ImageView{image_view};

        const create_info = vk.FramebufferCreateInfo{
            .render_pass = render_pass,
            .attachment_count = 1,
            .p_attachments = &attachments,
            .width = extent.width,
            .height = extent.height,
            .layers = 1,
        };

        switch (vk.createFramebuffer(
            device,
            &create_info,
            null,
            &framebuffer,
        )) {
            .success => {},
            else => return error.FailedToCreateFramebuffer,
        }
    }
}

pub fn reinit(
    self: *Swapchain,
    window: WindowHandle,
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    surface: vk.SurfaceKHR,
    render_pass: vk.RenderPass,
) !void {
    _ = window;
    // var w: i32, var h: i32 = self.window.getWindowSize();
    // while (w == 0 or h == 0) {
    //     // check if minimized using messages
    //     // wParam == SC_MINIMIZE or wParam == SIZE_MINIMIZED
    //     // or check isIconic(hwnd) - return bool if minimized
    //     // or GetWindowPplacement(hwnd, &placement) == SW_SHOWMINIMIZED
    //     w, h = self.window.getWindowSize();
    // }
    // wait
    vk.deviceWaitIdle(device);
    try self.deinit(device);
    self = init(device, physical_device, surface, render_pass);
}
