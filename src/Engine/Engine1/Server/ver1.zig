const std = @import("std");
const net = std.net;
const posix = std.posix;

pub fn ver1() !void {
    // local host, port 5882
    // domain = INET or INET6
    // TCP = SOCK.STREAM
    // UDP = SOCK.DGRAM
    // const addr = try std.net.Address.parseIp("127.0.0.1", 5882);
    const addr = try std.net.Address.parseIp("127.0.0.1", 0); // tells os to choose port for us

    const tpe: u32 = posix.SOCK.STREAM;
    const proto = posix.IPPROTO.TCP;
    const listener = try posix.socket(addr.any.family, tpe, proto);
    defer posix.close(listener);

    // allo addr reuse
    try posix.setsockopt(listener, posix.SOL.SOCKET, posix.SO.REUSEADDR, &std.mem.toBytes(@as(c_int, 1)));
    // binds socket to addr
    try posix.bind(listener, &addr.any, addr.getOsSockLen());
    // listen = turns code into server = handle incoming requests
    // pass in socket + backlog
    // backlog = hint for # of conns we want os to queue while waiting for accepted connections
    try posix.listen(listener, 128);

    while (true) {
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

fn write(socket: posix.socket_t, msg: []const u8) !void {
    // should be able to run socat - TCP:127.0.0.1:5882
    var pos: usize = 0;
    while (pos < msg.len) {
        const written = try posix.write(socket, msg[pos..]);
        if (written == 0) return error.Closed;
        pos += written;
    }
}

fn printAddr(socket: posix.socket_t) !void {
    var addr: net.Address = undefined;
    var len: posix.socketlen_t = @sizeOf(net.Address);

    try posix.getsockname(socket, &addr.any, &len);
    std.debug.print("{}\n", .{addr});
}
