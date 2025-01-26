@echo off

git clone https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator

pushd VulkanMemoryAllocator
git checkout f6d6e278a6989f854dcc03adf3360c873ca4bad1
popd

cmake -S . -B cmake-build -DVMA_DYNAMIC_VULKAN_FUNCTIONS=ON -DVMA_STATIC_VULKAN_FUNCTIONS=OFF
cmake --build cmake-build --config Debug
cmake --build cmake-build --config Release

mkdir ..\Bulkan.Utilities\dist\Debug-Win64\
mkdir ..\Bulkan.Utilities\dist\Release-Win64\

copy cmake-build\VulkanMemoryAllocator\src\Debug\VulkanMemoryAllocatord.lib ..\Bulkan.Utilities\dist\Debug-Win64\
copy cmake-build\VulkanMemoryAllocator\src\Release\VulkanMemoryAllocator.lib ..\Bulkan.Utilities\dist\Release-Win64\
