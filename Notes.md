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

# Determinants: 
- formulas for computing area / volume much easier 
- determinant = helps measure area + volume + matrix is invertible
- how to measure area of lake?
    - calculus 
    - grid overlay = approximate 
    - triangles = web of triangles = fewer shapes + better fit = solve as area 
- strats work if area/volume is easy 
- coords -> vectors 
- 3 points (3, 1), (5, 2), (4, 5)
    - hard way = length of base + height = 1/2 a b
    - easy way = put rectangle around triangle - compute area of rectangle
    - easier way = translate triangle to origin - instead of 3 points, use 2 vectors
    - area of triangle = |ad - bc| = determinant
    - determinant = determines if a matrix is invertible
    - a square matrix is invertible iff col vectors are linearly independent
        - independent = no vector is a linear combination of the others
    - if A = [a, b; c, d] then A-1 = inverse of A = 1/(ad - bc) * [d, -b; -c a] = determinant of A * adjoint of A;
    - orientation = order in vertices (cw vs ccw)

# Homogeneous Coordinates:
- 3d translations using only matrix multiplications
- object space -> world space -> virtual camera -> project scene -> final image
- multiply all 3x3 matrices into 1 3x3 matrix to do a single matrix for computation
- no 3x3 does a translation
- 

# Kaynesian Beauty Contest:
- regular beauty contests: pick who you think is the most beautiful
- Kaynes = gay 
- his beauty contest: if you pick the winner of the contest, you win a big prize
    - also look around + pick who everyone else finds the most beautiful
- storytelling era of stock market
- top 4 biggest companies = computer memory (sandisk, western digital, micron, seagate, robinhood - #5 b/c prediction markets)
- AI industry walked to memory industry for better memory
    - Kiosia = #1 japan stock = sells computer memory
- Prediction Markets: Robinhood, Kalshi, Polymarket
- Warner Bros. Discovery = Debt ridden hollywood market that rose in value from netflix competing to buy them
- AI story: who can show AI or show AI growth 
    - google was winner this year + fierce competitor
- DJT + NATO - US pulls back from NATO - Europe spend on military = surge of military defense stocks
    - Germany + Rheinmetall is surging
    - Renk Group AG
    - UK has Babcock International Group
    - Exail Tech. = French undersea drones
- Gold Story:
    - diversification against dollar 
    - central banks buy gold 
    - retreat from inflation 
- Silver Story:
    - precious metals go up during inflation 
    - industrial demand for silver increases: solar panels, electric vehicles, future forward tech
- Cycle of Precious Metals: Gold Rises -> Silver Rises -> Gold Miners -> Silver Miners
- Fresnilo (Mexican Silver Mines) = doing well
- Marketing (Performing Poorly)
    - Trade Desk = Single Worst Performing Company
    - WPP = failed this year
    - make money from small-med businesses spending on ads = first to cut marketing during a downturn
        - pressure of tariffs, reduced consumer spending, uncertain economy
        - cost-cutting AI from large companies
- Food (Mid Tier Fast Casual):
    - Chipotle - consumers not getting slop bowls - 2024 stock narrative = fast-growing future-forward loved by millenials + gen z - down 37%
    - Kava = down 47%
    - Sweetgreen = down 78%
- Target = 27% down
- Walmart = 24% up = recession indicator
- Bitcoin = Flat
- Max Stupid = Microstrategy = scam of buying bitcoin for you
- Campbell Soup = omega viral of exec saying product is bad + fake meat = damaged brand
- Tariffs
    - companies that import a lot (Nike, Lululemon) = lost profits
- Nuclear Stocks:
    - Cameco = up 59%
    - GE Vernova = up 96%
    - Oklo Inc = up 252%
    - absolutely story based, no revenue
    - AI datacenters = huge surge in nuclear energy
