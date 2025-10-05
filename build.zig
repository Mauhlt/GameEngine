const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // dependencies
    const PackedEnumSet = b.dependency("PackedEnumSet", .{});

    // libraries
    // const mod = b.addModule("GameEngine", .{
    //     .root_source_file = b.path("src/root.zig"),
    //     .target = target,
    //  });

    const exe = b.addExecutable(.{
        .name = "GameEngine",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                // .{ .name = "GameEngine", .module = mod, },
            },
        }),
    });
    exe.linkLibC();
    // Vulkan
    exe.root_module.addLibraryPath(b.path("Vulkan/Lib"));
    switch (target.result.os.tag) {
        .windows => exe.root_module.linkSystemLibrary("vulkan-1", .{}),
        .linux => {},
        .macos => {},
        else => @panic("OS not supported!"),
    }
    exe.addIncludePath(b.path("Vulkan/Include"));
    // Packed Enum Set
    exe.root_module.addImport("PackedEnumSet", PackedEnumSet.module("PackedEnumSet"));
    // Necessary Libs
    switch (target.result.os.tag) {
        .windows => {
            exe.linkSystemLibrary("kernel32");
            exe.linkSystemLibrary("user32");
            // exe.linkSystemLibrary("gdi32");
        },
        .macos => {},
        .linux => {},
        else => unreachable,
    }
    b.installArtifact(exe);

    // Compile Shaders Here
    // path to glslc.exe tri.vert -o vert.spv
    // ptah to glslc.exe tri.frag -o frag.spv

    const run_step = b.step("run", "Run the app");
    const run_cmd = b.addRunArtifact(exe);
    run_step.dependOn(&run_cmd.step);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    // const mod_tests = b.addTest(.{
    //     .root_module = mod,
    // });
    // const run_mod_tests = b.addRunArtifact(mod_tests);

    const exe_tests = b.addTest(.{
        .root_module = exe.root_module,
    });

    const run_exe_tests = b.addRunArtifact(exe_tests);
    const test_step = b.step("test", "Run tests");
    // test_step.dependOn(&run_mod_tests.step);
    test_step.dependOn(&run_exe_tests.step);
}
