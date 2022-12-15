cmake_minimum_required(VERSION 3.13)

project(tds)

set(CMAKE_EXPORT_COMPILE_COMMANDS on)

file(GLOB_RECURSE SRC
 ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c)

add_executable(tds ${SRC})

if(MINGW)
 target_compile_options(tds PRIVATE -Dmain=SDL_main)
endif()

target_compile_options(tds PRIVATE -fdiagnostics-color=always)

if (CMAKE_C_COMPILER_ID STREQUAL "Clang")
 target_compile_options(tds PRIVATE
  -Weverything
  -Wpedantic)
elseif (CMAKE_C_COMPILER_ID STREQUAL "GNU")
 target_compile_options(tds PRIVATE
  -Wall
  -Wextra
  -Wshadow
  -Wpedantic
  -Wduplicated-cond
  -Wduplicated-branches
  -Wlogical-op)
elseif (CMAKE_C_COMPILER_ID STREQUAL "MSVC")
 target_compile_options(tds PRIVATE
  /W4)
endif()

if (CMAKE_C_COMPILER_ID STREQUAL "TinyCC")
 target_compile_options(tds PRIVATE
  -DSDL_DISABLE_IMMINTRIN_H)
 target_link_directories(tds PRIVATE
  /lib/x86_64-linux-gnu/pulseaudio/)
endif()

target_link_directories(tds PRIVATE
build)

if(MINGW)
 target_link_libraries(tds PRIVATE
  mingw32
  SDL2main)
elseif(UNIX)
 target_link_libraries(tds PRIVATE
  pthread)
endif()

target_link_libraries(tds PRIVATE
 m
 SDL2
 SDL2_image 
 SDL2_mixer
 SDL2_net
 SDL2_ttf)

target_include_directories(tds PRIVATE
 SYSTEM /usr/include/SDL2
 SYSTEM ${CMAKE_CURRENT_SOURCE_DIR}/lib/SDL2_image-2.0.5/x86_64-w64-mingw32/include/SDL2
 SYSTEM ${CMAKE_CURRENT_SOURCE_DIR}/lib/SDL2_mixer-2.0.4/x86_64-w64-mingw32/include/SDL2
 SYSTEM ${CMAKE_CURRENT_SOURCE_DIR}/lib/SDL2_net-2.0.1/x86_64-w64-mingw32/include/SDL2
 SYSTEM ${CMAKE_CURRENT_SOURCE_DIR}/lib/SDL2_ttf-2.0.15/x86_64-w64-mingw32/include/SDL2
 SYSTEM ${CMAKE_CURRENT_SOURCE_DIR}/lib/SDL2-2.0.18/x86_64-w64-mingw32/include/SDL2
 SYSTEM ${CMAKE_CURRENT_SOURCE_DIR}/lib/Chipmunk2D/include
 SYSTEM ${CMAKE_CURRENT_SOURCE_DIR}/lib/minicoro)
