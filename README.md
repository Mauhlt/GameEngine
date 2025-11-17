# Game Engine:
EXPERIMENTAL!!!
Just testing how to create an engine

# Windows Build:
zig build -Dtarget=x86_64-windows -Doptimize=ReleaseFast run
- 

# Macos Build:

# Linux Build:


# Functionality:
Zig Notes:
-fn sigs in c must have the same name - name matters!

# TODO:
- Create inputs to zig file -> outputs correct shader program


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

