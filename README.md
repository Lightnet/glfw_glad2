# glfw_glad2

# License: MIT

# Informtion:
    Using the msys2 to test build glfw and glad 2. Sample test for cmake build.

# Prerequisites
- msys2-x86_64-xxx.exe

```
pacman -S package_name
```

```
mingw-w64-x86_64-ninja
mingw-w64-ucrt-x86_64-cmake
mingw-w64-ucrt-x86_64-ninja
mingw-w64-ucrt-x86_64-python
mingw-w64-ucrt-x86_64-python-pip
```
- need correct package to install test.
- to keep the tool compiler size down.

## GLAD v2.0.8
- Generate GLAD code at https://gen.glad.sh with:
    - Generator: c
    - API: gl=3.3
    - Profile: Core
    - Options
        - Generate a loader: Checked

Download the zip and extract it to your project directory (e.g., project/glad).

```
project
├── glad/
│   ├── include/
│   │   ├── glad/gl.h
│   │   └── KHR/khrplatform.h
│   └── src/
│       └── gl.c
├── src/
│   └── main.c
├── CMakeLists.txt
└── build/
```

