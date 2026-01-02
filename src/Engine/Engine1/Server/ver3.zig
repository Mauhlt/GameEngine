const std = @import("std");
const posix = std.posix;
const net = std.net;

// added 2.5s timeout to subsequent reads = run + connect w/o data = return would.Block after 2.5s
// posix.read = blocking
// posix.write = blocking = data not sent to other computer = instead os made copy of data + aware to send it out

pub fn ver3() !void {
    // base
    std.debug.print("Base\n", .{});
    const addr = try std.net.Address.parseIp("127.0.0.1", 5882); // tells os to choose port for us
    // listen sockets
    const tpe: u32 = posix.SOCK.STREAM;
    const proto = posix.IPPROTO.TCP;
    const listener = try posix.socket(addr.any.family, tpe, proto);
    defer posix.close(listener);
    // options
    try posix.setsockopt(listener, posix.SOL.SOCKET, posix.SO.REUSEADDR, &std.mem.toBytes(@as(c_int, 1)));
    try posix.bind(listener, &addr.any, addr.getOsSockLen());
    try posix.listen(listener, 128);
    // loop
    var buf: [128]u8 = undefined;
    while (true) {
        var client_addr: net.Address = undefined;
        var client_addr_len: posix.socklen_t = @sizeOf(net.Address);
        // socket
        const socket = posix.accept(listener, &client_addr.any, &client_addr_len, 0) catch |err| {
            std.debug.print("Accept Error: {}\n", .{err});
            continue;
        };
        defer posix.close(socket);
    }
    std.debug.print("{} connected\n", .{client_addr});
    // timeout
    const timeout = posix.timeval{ .sec = 2, .usec = 500_000 };
    // read timeout
    try posix.setsockopt(socket, posix.SOL.SOCKET, posix.SO.RCVTIMEO, &std.mem.toBytes(timeout));
    // write timeout
    try posix.setsockopt(socket, posix.SOL.SOCKET, posix.SO.SNDTIMEO, &std.mem.toBytes(timeout));
    // write
    const read = posix.read(socket, &buf) catch |err| {
        std.debug.print("Read Error: {}\n", .{err});
        continue;
    };
}
