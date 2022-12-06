CppApplication {
    condition: qbs.toolchain.contains("tcc") && qbs.architecture === "arm"

    Depends { name: "sdk" }

    cpp.staticLibraries: ["Lib_L2_L6"]

    files: [ "screenshot.c" ]
}
