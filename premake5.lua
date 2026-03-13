project "lz4"
    kind "StaticLib"
    language "C"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir    ("bin-int/" .. outputdir .. "/%{prj.name}")

    includedirs { "vendor/lz4/lib" }

    files {
        "vendor/lz4/lib/lz4.c",
        "vendor/lz4/lib/lz4hc.c",
        "vendor/lz4/lib/lz4frame.c",  -- needed for streaming
        "vendor/lz4/lib/xxhash.c",    -- lz4frame depends on this
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"
    symbols "off"