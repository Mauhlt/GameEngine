const std = @import("std");
const Allocator = std.mem.Allocator;

pub fn build(b: *std.Build) !void {
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

    const allo = std.heap.page_allocator;
    var exe_path_buf: [1024]u8 = undefined;
    var exe_path = std.fs.selfExePath(&exe_path_buf) catch unreachable;
    const idx = std.mem.indexOf(u8, exe_path, ".zig-cache").?;
    const basepath = exe_path[0..idx];

    for ([_][]const u8{ "Engine1", "Engine2" }) |engine_version| {
        const path = std.fs.path.join(allo, &.{
            basepath,
            "src",
            "Engine",
            engine_version,
            "Shaders",
        }) catch unreachable;
        defer allo.free(path);
        var dir = std.fs.openDirAbsolute(path, .{ .iterate = true }) catch unreachable;
        defer dir.close();
        var it = dir.iterate();
        while (try it.next()) |item| {
            switch (item.kind) {
                .file => if (isShader(item.name)) try compileShader(path, item.name),
                else => continue,
            }
        }
    }

    // Compile Shaders Here
    const run_step = b.step("run", "Run the app");
    const run_cmd = b.addRunArtifact(exe);
    run_step.dependOn(&run_cmd.step);
    run_cmd.step.dependOn(b.getInstallStep());

    // image loading
    // option 1: zstbi
    const zstbi = b.dependency("zstbi", .{});
    exe.root_module.addImport("zstbi", zstbi.module("root"));
    // option 2: zigimg
    const zigimg_dep = b.dependency("zigimg", .{
        .target = target,
        .optimize = optimize,
    });
    exe.root_module.addImport("zigimg", zigimg_dep.module("zigimg"));

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

fn isShader(name: []const u8) bool {
    for ([_][]const u8{ "vert", "frag" }) |ext| {
        if (std.mem.endsWith(u8, name, ext)) return true;
    } else return false;
}

fn compileShader(shader_dir: []const u8, name: []const u8) !void {
    const allo = std.heap.page_allocator;
    // base
    var buf: [1024]u8 = undefined;
    const path = try std.fs.selfExePath(&buf);
    const ge_dir = "GameEngine";
    const basepath = path[0 .. std.mem.indexOf(u8, path, ge_dir).? + ge_dir.len + 1];
    // glslc
    const glslc = try std.fs.path.join(allo, &.{ basepath, "Vulkan", "Bin", "glslc.exe" });
    defer allo.free(glslc);
    // in file
    const in_file = try std.fs.path.join(allo, &.{ shader_dir, name });
    defer allo.free(in_file);
    // out file
    var buf1: [1024]u8 = undefined;
    const out_file = try std.fmt.bufPrint(&buf1, "{s}.spv", .{in_file});
    // child process
    var child = std.process.Child.init(
        &.{ glslc, in_file, "-o", out_file },
        std.heap.page_allocator,
    );
    child.stdin_behavior = .Ignore;
    child.stdout_behavior = .Pipe;
    child.stderr_behavior = .Inherit;
    try child.spawn();
}
