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
    # - Generator: c
    # - API: gl=3.3
    # - Profile: Core
    # - Options
    #     - Generate a loader: Checked
add_library(glad STATIC 
    ${CMAKE_SOURCE_DIR}/glad/src/gl.c
)
target_include_directories(glad PUBLIC 
    ${CMAKE_SOURCE_DIR}/glad/include
)

set(APP_NAME simple_triangle)

# Create executable
add_executable(${APP_NAME} src/main.c)

# Link libraries
target_link_libraries(${APP_NAME} PRIVATE
    glfw 
    glad
    opengl32
)

# # Include directories for GLAD
target_include_directories(${APP_NAME} PRIVATE
    ${CMAKE_SOURCE_DIR}/glad/include
)

# # Optional: Enable stricter compiler warnings
target_compile_options(${APP_NAME} PRIVATE -Wall -Wextra)