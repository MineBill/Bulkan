cmake_minimum_required(VERSION 3.15)
project(Bulkan)

set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>" CACHE INTERNAL "")

add_subdirectory(VulkanMemoryAllocator)