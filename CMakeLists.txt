cmake_minimum_required(VERSION 3.16)
project(fugubox C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

add_subdirectory(bsd_compat)
add_subdirectory(bin/cat)
add_subdirectory(bin/echo)
add_subdirectory(bin/pwd)
