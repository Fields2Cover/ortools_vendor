cmake_minimum_required(VERSION 3.15)
project(ortools_vendor LANGUAGES CXX VERSION "9.9.0")

set(CMAKE_CXX_STANDARD 17)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif(NOT CMAKE_BUILD_TYPE)


if(ament_cmake_FOUND)
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
else(ament_cmake_FOUND)
  set(BUILD_DEPS ON)
  set(BUILD_SAMPLES OFF)
  set(BUILD_EXAMPLES OFF)
  include(FetchContent)
  FetchContent_Declare(ortools FETCHCONTENT_UPDATES_DISCONNECTED
    GIT_REPOSITORY https://github.com/google/or-tools.git
    GIT_TAG v9.2
  )
  FetchContent_MakeAvailable(ortools)

  install(FILES package.xml DESTINATION share/ortools)
endif(ament_cmake_FOUND)
