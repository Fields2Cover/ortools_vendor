cmake_minimum_required(VERSION 3.15)
project(ortools_vendor LANGUAGES CXX VERSION "9.9.0")

find_package(ament_cmake REQUIRED)
find_package(ament_cmake_vendor_package REQUIRED)

ament_vendor(ortools_vendor
  VCS_URL https://github.com/google/or-tools.git
  VCS_VERSION v9.9
  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE=Release
    -DBUILD_DEPS:BOOL=ON
    -DBUILD_SAMPLES:BOOL=OFF
    -DBUILD_EXAMPLES:BOOL=OFF
)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  set(ament_cmake_copyright_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package(
  CONFIG_EXTRAS_POST "ortools_vendor-extras.cmake.in"
)
