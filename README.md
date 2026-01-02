# Game Engine:
Experimental Engine

# Key Features:
- create cube
- shade cube
- add physics to cube
- load models from blender
- place models
- ability to create a track from bezier curves
- ability to train a custom reinforcement learning algorithm
- ability to implement physics


# To Do:
- implement image loader 
    - try out different formats 
    - implement used formats 
    - goal is speed = fast to load, read, process
- implement data/image compression
- implement shader graph
    - instead of coding glsl, create nodes
- implement engines:
    - graphics engine 
        - flexible based on data
        - previous pipeline config
    - narration/quest engine
        - node based quest creation
        - needs website = anyone anywhere can send + recv data
    - visual/shader engine
        - node based shader creation
    - forge engine

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
