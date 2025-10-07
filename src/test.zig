// Just testing std.io.Reader + std.io.Writer
const std = @import("std");

pub fn main() !void {}

fn bufferedWriter() !void {
    // minimizes syscalls - 40x faster
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer: std.fs.Writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout: *std.Io.Writer = &stdout_writer.interface;
    for (1..1001) |i| {
        try stdout.print("{d}. Hello \n", .{i});
    }
    // cannot defer - do not forget to add this to end
    try stdout.flush();
}

pub fn writer() void {
    // strace = shows number of syscalls
    var stdout_writer: std.fs.Writer = std.fs.File.stdout().writer(&.{});
    var stdout: *std.Io.Writer = &stdout_writer.interface;
    for (1..1001) |i| {
        try stdout.print("{d}. Hello \n", .{i});
    }
    try stdout.flush();
}

pub fn bufferedReader() void {
    // 4 things:
    // 1. buffer
    // 2. stdin or stdout - optional
    // 3. reader or writer
    // 4. ioreader or iowriter
    var stdin_buffer: [1024]u8 = undefined;
    var stdin: std.fs.File = std.fs.File.stdin();
    var stdin_reader: std.fs.File.Reader = stdin.reader(&stdin_buffer);
    const stdin_ioreader: *std.io.Reader = &stdin_reader.interface;
    // 3 mistakes:
    // 1.
    //      var stdin_buffer: [1024]u8 = undefined
    //      const stdin_ioreader: *std.Io.Reader = &std.fs.File.stdin().reader(&stdin_buffer).interface // mistake is here
    //      ptr to temp variable is always constant = undefined behavior
    // 2.
    //      var stdin_buffer: [1024]u8 = undefined;
    //      const stdin_ioreader: std.Io.Reader = std.fs.File.stdin().reader(&stdin_buffer).interface // mistake is here
    //      makes copy - filereader is destroyed - uses @fieldParentPtr internally in ioreader - parent ptr no longer exists = undefined
    //      lifetime of stdin_ioreader <= stdin_reader
    // 3.
    //      var stdin_buffer: [1024]u8 = undefined;
    //      var stdin_reader: std.fs.File.stdin().reader(&stdin_buffer);
    //      const stdin_ioreader: std.Io.Reader = stdin_reader.interface; // mistake is here
    //      @fieldParentPtr - used on variable thinking this is part of struct = random mem
    //      never copy interface field unless you know what you are doing

    // How Does It Work?
    // ioreader - has vtable + internal buffer + 2 fields
    // seek = points to next byte to be consumed
    // end = position of next empty byte or length of buffer

    // Take byte = 1 byte at a time
    // Take array = read more bytes at a time
    // if you try to take more bytes than buffer can hold = crashes fn
    // takeDelimiterExclusive = read line by line - dynamically allocate data on heap and store line there as you read it in
    // stream - instead of taking values - will write to writer - pass an allocator to hold the data

    while (stdin_ioreader.takeByte()) |char| {
        if (char == '\n') continue;
        std.debug.print("you typed: {c}\n", .{char});
        if (char == 'q') break;
    } else |err| {
        std.debug.print("An error occurred: {any}", .{err});
    }
}

// above or below vtable
// work done above vtable = above virtual function call = done inside intrusive interface
// word done below vtable = below virtual function call = done inside concrete type

// Stream Reader Version
// var stdin_buffer: [10]u8 = undefined;
// var stdin: std.fs.File = .stdin();
// var stdin_reader: std.fs.File.Reader = stdin.reader(&stdin_buffer);
//
// var da = std.heap.DebugAllocator(.{}).init;
// defer _ = da.deinit();
// const allo = alloc.allocator();
//
// var allocating_writer = std.Io.Writer.Allocating.init(allo);
// defer allocating_writer.deinit();
//
// while (stdin_reader.interface.streamDelimiter(&allocating_writer.writer, '\n')) |_| {
// const line = allocating_writer.written();
// std.debug.print("you typed: {s}\n", .{line});
// allocating_writer.clearRetainingCapacity();
// stdin_reader.interface.toss(1); // skip newline char
// } else |err| {
//  std.debug.print("an error ocurred: {any}\n", .{err});
// }

// Example 2: Create 2 Writers
// var file: std.fs.File = try std.fs.cwd().openFile("./my_file.txt", .{.mode = .read_only});
// var buffer: [1024]u8 = undefined;
// var file_r: std.fs.File.Reader = file.reader(&buffer);
//
// var r_buf: [1024]u8 = undefined;
// var stdout_writer = std.fs.File.stdout().writer(&r_buf);
//
// var discarding = std.Io.Writer.Discarding.init(&.{});
// while (file_r.interface.peekByte()) |char| switch (char) {
//  '?' => try file_r.interface.streamExact(&discard_writer.writer, 1),
//  else => try file_r.interface.streamExact(&stdout_writer.interface, 1),
// } else |err| switch (err) {
// error.EndOfStream => {
//  try stdout_writer.interface.flush();
//  std.debug.print("\n{d} bytes discarded\n", .{discard_writer.fullCount()});
// },
// else => std.debug.print("An error occured: {any}", .{err}),
// }

// Types Of Writer:
// 1. Allocating
// 2. Failing
// 3. Hashed
// 4. Discarding
// 5. Hashing
// 6. Fixed
// Types Of Readers:
// 1. failing
// 2. hashed
// 3. fixed
// 4. ending
// 5. limited
