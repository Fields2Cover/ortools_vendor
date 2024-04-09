cmake_minimum_required(VERSION 3.10)
project(ortools_vendor LANGUAGES CXX VERSION "9.9.0")

set(CMAKE_CXX_STANDARD 17)


find_package(ament_cmake REQUIRED)
find_package(ament_cmake_vendor_package REQUIRED)

ament_add_default_options()

find_package(ortools QUIET NO_CMAKE_PACKAGE_REGISTRY)

set(ORTOOLS_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

ament_vendor(ortools_vendor
  SATISFIED ${ortools_FOUND}
  VCS_URL https://github.com/google/or-tools.git
  VCS_VERSION v9.9
  CMAKE_ARGS
    "-DCMAKE_CXX_FLAGS=${ORTOOLS_CXX_FLAGS}"
    -DBUILD_DEPS:BOOL=ON
    -DBUILD_SAMPLES:BOOL=OFF
    -DBUILD_EXAMPLES:BOOL=OFF
)

ament_package(
  CONFIG_EXTRAS "ortools_vendor-extras.cmake.in"
)
