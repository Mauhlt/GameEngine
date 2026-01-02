const std = @import("std");
const net = std.net;
const posix = std.posix;

// currently client can block server indefinitely

pub fn ver2() !void {
    std.debug.print("Started\n", .{});
    const addr = try std.net.Address.parseIp("127.0.0.1", 5882); // tells os to choose port for us

    const tpe: u32 = posix.SOCK.STREAM;
    const proto = posix.IPPROTO.TCP;
    const listener = try posix.socket(addr.any.family, tpe, proto);
    defer posix.close(listener);

    var handle1 = try std.Thread.spawn(.{}, server, .{ addr, listener });
    handle1.join();

    var handle2 = try std.Thread.spawn(.{}, client, .{listener});
    handle2.join();

    std.debug.print("Ended\n", .{});
}

fn server(addr: net.Address, listener: posix.socket_t) !void {
    // must be *os.windows.ws2_32.socket
    // allo addr reuse
    try posix.setsockopt(listener, posix.SOL.SOCKET, posix.SO.REUSEADDR, &std.mem.toBytes(@as(c_int, 1)));
    // binds socket to addr
    try posix.bind(listener, &addr.any, addr.getOsSockLen());
    // listen = turns code into server = handle incoming requests
    // pass in socket + backlog
    // backlog = hint for # of conns we want os to queue while waiting for accepted connections
    try posix.listen(listener, 128);

    var i: usize = 0;
    while (i < 1_000_0000) : (i += 1) {
        var client_addr: net.Address = undefined;
        var client_addr_len: posix.socklen_t = @sizeOf(net.Address);

        const socket = posix.accept(listener, &client_addr.any, &client_addr_len, 0) catch |err| {
            std.debug.print("Error Accept: {s}\n", .{@errorName(err)});
            continue;
        };
        defer posix.close(socket);

        std.debug.print("{any} connected.\n", .{client_addr});
        write(socket, "Hello (and goodbye)") catch |err| {
            std.debug.print("Error Writing: {s}\n", .{@errorName(err)});
        };
    }
}

fn client(listener: posix.socket_t) !void {
    var buf: [128]u8 = undefined;

    var i: usize = 0;
    while (i < 1_000_000) : (i += 1) {
        var client_addr: net.Address = undefined;
        var client_addr_len: posix.socklen_t = @sizeOf(net.Address);
        const socket = posix.accept(listener, &client_addr.any, &client_addr_len, 0) catch |err| {
            std.debug.print("Accept Error: {}\n", .{err});
            continue;
        };
        defer posix.close(socket);

        std.debug.print("{} connected.\n", .{client_addr.in.getPort()});

        const read = posix.read(socket, &buf) catch |err| {
            std.debug.print("Read Error: {}\n", .{err});
            continue;
        };

        if (read == 0) continue;

        write(socket, buf[0..read]) catch |err| {
            std.debug.print("Write Error: {}\n", .{err});
        };
    }
}

fn write(socket: posix.socket_t, msg: []const u8) !void {
    // should be able to run socat - TCP:127.0.0.1:5882
    var pos: usize = 0;
    while (pos < msg.len) {
        const written = try posix.write(socket, msg[pos..]);
        if (written == 0) return error.Closed;
        pos += written;
    }
}
