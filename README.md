# Game Engine:
Experimental Engine

# To Do:
- implement flexible code that changes based on data
- implement image loader 
- experiment with different image compressions = want fast as possible + smaller size
- implement custom shader compilation into zig

# Builds
## Windows:
```zig
zig build -Dtarget=x86_64-windows -Doptimize=ReleaseFast run
```
## Macos:
```zig
zig build -Dtarget=macos -Doptimize=ReleaseFast run
```
## Linux:
```zig 
zig build -Dtarget=linux -Doptimize=ReleaseFast run
```

# Functionality:
- 3d + 2d Game Engine
- Uses custom parsed vulkan for easier to type fn signatures
# 
