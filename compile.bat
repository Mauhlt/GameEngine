@echo off
set glslc=%CD%\Vulkan\Bin\glslc.exe
set shaders=%CD%\src\Shaders
set vert_in=%shaders%\tri.vert
set frag_in=%shaders%\tri.frag
set vert_out=%shaders%\vert.spv
set frag_out=%shaders%\frag.spv
%glslc% %vert_in% -o %vert_out%
%glslc% %frag_in% -o %frag_out%
