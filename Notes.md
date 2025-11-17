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

# Networking:

# Reinforcement Learning:
