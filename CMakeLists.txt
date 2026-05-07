cmake_minimum_required(VERSION 3.15)
project(ortools_vendor LANGUAGES CXX VERSION "9.9.0")

find_package(ament_cmake REQUIRED)
find_package(ament_cmake_vendor_package REQUIRED)

ament_vendor(
  ortools_vendor
  VCS_URL https://github.com/google/or-tools.git
  VCS_VERSION v9.9
  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE=Release
    -DBUILD_DEPS:BOOL=ON
    -DCMAKE_POLICY_VERSION_MINIMUM:STRING=3.5
    -DBUILD_SAMPLES:BOOL=OFF
    -DBUILD_EXAMPLES:BOOL=OFF
    -DBUILD_PYTHON:BOOL=OFF
    -DBUILD_JAVA:BOOL=OFF
    -DBUILD_DOTNET:BOOL=OFF
    -DBUILD_TESTING:BOOL=OFF
    -DBUILD_FLATZINC:BOOL=ON
    -DBUILD_LP_PARSER:BOOL=ON
    -DBUILD_MATH_OPT:BOOL=ON
    -DUSE_COINOR:BOOL=OFF
    -DUSE_GLPK:BOOL=OFF
    -DUSE_HIGHS:BOOL=OFF
    -DUSE_PDLP:BOOL=OFF
    -DUSE_SCIP:BOOL=OFF
    -DUSE_CPLEX:BOOL=OFF
  PATCHES patches
)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  set(ament_cmake_copyright_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package(
  CONFIG_EXTRAS_POST "ortools_vendor-extras.cmake.in"
)
