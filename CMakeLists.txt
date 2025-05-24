cmake_minimum_required(VERSION 3.14)
project(SimpleTriangle C)

# Enable FetchContent
include(FetchContent)

# Declare GLFW
FetchContent_Declare(
    glfw
    GIT_REPOSITORY https://github.com/glfw/glfw.git
    GIT_TAG 3.4
    GIT_SHALLOW		TRUE
)
FetchContent_MakeAvailable(glfw)

# Configure GLFW options
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)

# Add GLAD manually
# https://gen.glad.sh/
add_library(glad STATIC 
    ${CMAKE_SOURCE_DIR}/glad/src/gl.c
)
target_include_directories(glad PUBLIC 
    ${CMAKE_SOURCE_DIR}/glad/include
)

# Create executable
add_executable(simple_triangle src/main.c)

# Link libraries
target_link_libraries(simple_triangle PRIVATE
    glfw 
    glad
    opengl32
)

# # Include directories for GLAD
target_include_directories(simple_triangle PRIVATE
    ${CMAKE_SOURCE_DIR}/glad/include
)

# # Optional: Enable stricter compiler warnings
# target_compile_options(simple_triangle PRIVATE -Wall -Wextra)