using System;

namespace Setup;

class Program
{
	private const StringView Commit = "f6d6e278a6989f854dcc03adf3360c873ca4bad1";

	static int32 Main()
	{
		BuildHelper.ExecuteCmd("git", "clone https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator");
		BuildHelper.ExecuteCmd("git", scope $"-C VulkanMemoryAllocator checkout {Commit}");

		CMake.Configure(".", "cmake-build", "-DVMA_DYNAMIC_VULKAN_FUNCTIONS=ON -DVMA_STATIC_VULKAN_FUNCTIONS=OFF");
		CMake.Build("cmake-build", .Debug);
		CMake.Build("cmake-build", .Release);

		let os = scope System.OperatingSystem();
		if (os.Platform == .Win32NT)
		{
			System.IO.Directory.CreateDirectory("../Bulkan.Utilities/dist/Debug-Win64/");
			System.IO.Directory.CreateDirectory("../Bulkan.Utilities/dist/Release-Win64/");

			System.IO.File.Copy("cmake-build/VulkanMemoryAllocator/src/Debug/VulkanMemoryAllocatord.lib", "../Bulkan.Utilities/dist/Debug-Win64/VulkanMemoryAllocatord.lib");
			System.IO.File.Copy("cmake-build/VulkanMemoryAllocator/src/Release/VulkanMemoryAllocator.lib", "../Bulkan.Utilities/dist/Release-Win64/VulkanMemoryAllocator.lib");
		} else
		{
			Runtime.Assert(false, "TODO");
		}
		return 0;
	}
}