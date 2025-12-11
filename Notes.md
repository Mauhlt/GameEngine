# Asynchrony
https://kristoff.it/blog/asynchrony-is-not-concurrency/

concurrency = execute multiple tasks through simultaneous execution or time-sharing
time-sharing = context switching
parrallel computing = many calculations or processes are carried out simultaneously 

io.async(fileA, .{io});
io.async(fileB, .{io});
not gauranteed to overlap:
    - A -> B
    - B -> A
    - some of A -> some of B -> A -> B

io.async(Server.accept, .{server, io});
io.async(Client.connect, .{client, io});
guaranteed to ovelap
    - must be some of A/some of B -> some of B/some of A -> some of A/some of B

cro's defn:
asynchrony = possibility for tasks to run out of order 
concurrency = ability to progress multiple tasks via paralellism or task switching 
parallelism = ability for system to execute more than 1 task at same time 

problems with modern async code:
colored functions - choosing async requires all code interacting with it to change their style

zig's solution:
io.async does not gaurantee concurrency - could by run as single-threaded blocking mode 

ex: 
io.async(saveFileA, .{io});
io.async(saveFileB, .{io});

equal to:
saveFileA(io);
saveFileB(io);

Why does synchronous code behave well during concurrency?
- use evented i/o syscalls (io_uring, epoll, k-queue) instead of blocking
- use task switching primitives to do work while i/o ops done by os

Go Model:
- io = evented 
- has task switching

## Zig Example 1:
const std = @import("std");
const Io = std.Io;
fn saveData(io: Io, data: []const u8) !void {
    const file = try Io.Dir.cwd().createFile(io, filename, .{});
    defer file.close(io);

    try file.writeAll(io, data);

    const out: Io.File = .stdout();
    try out.writeAll("Save Complete");
}

fn saveFile(io: Io, data: []const u8, name: []const u8) !void {
    const file = try Io.Dir.cwd().createFile(io, name, .{});
    defer file.close(io);
    try file.writeAll(io, data);
}

- zig pipes in io through its functions
- above code has no express concurrency but by using Io interface participates in event loop

## Zig Example 2:
fn saveData(io: Io, data: []const u8) !void {
    var a_future = io.async(saveFile, .{io, data, fileA});
    var b_future = io.async(saveFile, .{io, data, fileB});

    const a_result = a_future.await(io);
    const b_result = b_future.await(io);

    try a_result;
    try b_result;

    const out: Io.File = .stdout();
    try out.writeAll(io, "save complete");
}

fn saveFile(io: Io, data: []const u8, name: []const u8) !void {
    const file = try Io.Dir.cwd().createFile(io, name, .{});
    defer file.close(io);
    try file.writeAll(io, data);
}

## Types of IO implementations:
- single thread blocking 
    - io blocking ops 
    - simplest 
    - synchrony
- thread pool - use blocking io syscalls multiplexed over a pool of os threads
    - parallelism
- green threads: 
    - io_uring, epoll, k-queue
    - concurrency
    - no WASM support 
- stackless coroutines 
    - rewrite function bodies into state machines
    - compatible with wasm

## Why the changes?
- code reusability
- Bob Nystrom - What Color Is Your Function? - Zig no longer colors functions
- Io Interface:
    - uses vtable for dispatch fn calls +  non-generic interface
    - reduces code bloat
    - virtual call performance penalty 
    - optimizer can de-virtualize fns in release mode
- Buffering is inside interfaces:
    - even when no de-virtualization happens - single flush to buffer = optimal behavior
- Vectorized Writes:
    - send in a single call multiple segments of data to write = single posix call = optimization 
- Splat Parameters:
    - defines # of times last data should be repeated 
    - useful for decompression streams 
    - comms along chain of readers = more efficient

# Vulkan:
## Instance: connects app to vulkan library + app drivers 
## Vulkan Pattern:
- pointer to create info struct 
- pointer to custom allocator 
- ponter to variable storing handle to object 
Cleanup all memory allocated to gpu at end 
## Validation Layers:
- checks values of params against specs to detect misuse 
- tracks creation + destruction of objects 
- checks thread safety by logging origination of calls 
- logs every call + parameter 
- traces vulkan calls for profiles + replays 
## Physical Devices + Queue Families 
- select a gpu or multiple 
- check device suitability via querying device details
- Queue Families
    - different queues for different gpus 
    - check which are supported by device + which support commands 
## Logical Device: 
- set up logical device to interface with device
- grab device specific extensions 
- VK_KHR_swapchain = allows presenting rendered images from device to windows 
- device queues auto cleaned after use 
## Surface: 
- vulkan = platform agnostic API = no direct interface to window system 
- WSI = window system integration 
- if offscreen rendering - don't use window system/surfaces 
## Swap chain 
- vulkan =/= default framebuffer 
swapchain:
- infrastructure to build the framebuffers 
- chain of images waiting to be presented to screen 
- synchronize presentation of images with refresh rate of screen 
## Image Views:
- image view = literal view into an image 
- describes accessing the miage + partitioning + how to treat textures 
## Graphics Pipeline:
- Vertex Buffer = contains raw vertices 
- Index Buffer = contains indices of vertices/data to repeat
- Input Assembler = collects row vertex data from buffers
- Vertex Shader = runs for every vertex - applies transformations to vertex from model to screen space
- Tesselation = subdividets geometry based on rules to improve mesh quality
- Geometry Shader = runs on every primitive = discard or improve them = more flexible but slower
- Rasterization = discritizes primitives into fragments/pixels
- Fragment Shader = determines which framebuffer the fragments are written to and which fragments survive
- Color Blending = mixes fragments that map to same pixel
- Framebuffer = stores data to be presented
- fixed-function stages = tweak operations using parameters
- programmable function stages = upload your own code to apply operations
- Vulkan = immutable pipeline = recreate pipeline from scratch to change shaders or bind framebuffers
## Shader Modules:
- SPIR-V = bytecode fromat that compiles to gpu machine code 
- Vertex Shader = processes vertices = takes attributes like model/position/color/normal/texture coords as inputs 
- clip coordinate = 4d vector from vertex shader - turned to normalized device coordinate (homogeneous coordinates) = map to framebuffer
- Fragement Shader = processes fragments
## Fixed Functions:
- older apis provide default state 
- vulkan requires explicit control 
## Render Passes: 
- need to inform vulkan about framebuffer attachments in render pass 
## Swapchain Recreation:
- recreate swapchain when window size or expected immutable features changes 
## Vertex Buffer: 
- replaces hardcoded vertex data with vertex buffer in memory 
- array of vertices specified within buffer
- can interleave vertex attributes or have tham as separate arrays
- binding descriptions = rate to load data from memory = # of bytes + stride
- atribute descriptions = describes how to extract vertex attribute from vertex data
    - binding = which binding the per-vertex data comes from 
    - location = location directive of input vertex shader 
    - 0 = position = has format 
    - format parameter: float, vec2, vec3, vec4
    - can use more channels than described in shader but they will be discarded 
- pipeline vertex input = allows pipeline to know what bindings + attributes to look out for
## Vertex Buffer Creation:
- buffers = regions of memory used for storing data read by gpu 
- buffers do not auto allocate memory for themselves 
- buffers cand be shared or owned by single queue 
## Staging Buffer:
- accessing memory from cpu directly onto gpu is not optimal 
- cpu -> gpu -> gpu is more optimal 
- vk.memory_property_device_local_bit
- use transfer buffer
## Index Buffer:
- real world has vertices shadred between triangles 
## Uniform Buffers: 
- what about global variables? 
- resource descriptors = freely access resources like buffers + images 
- specify set layout during pipeline creation 
- allocate sets using a pool
- bind descriptor set during rendering

# Networking:

# Reinforcement Learning:
