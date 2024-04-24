list(APPEND CMAKE_MODULE_PATH "${ortools_vendor_DIR}/../../../opt/ortools_vendor")

set(ortools_ROOT "${ortools_vendor_DIR}/../../../opt/ortools_vendor/opt/ortools_vendor")
find_package(ortools REQUIRED)
find_package(protobuf REQUIRED)
find_package(ZLIB REQUIRED)

if(TARGET ortools::ortools)
  list(APPEND ortools_vendor_TARGETS ortools::ortools )
else()
  list(APPEND ortools_vendor_TARGETS ortools)
endif()

if(TARGET protobuf::libprotobuf)
  list(APPEND ortools_vendor_TARGETS protobuf::libprotobuf)
else()
  list(APPEND ortools_vendor_TARGETS libprotobuf)
endif()

if(TARGET ZLIB::ZLIB)
    list(APPEND ortools_vendor_TARGETS ZLIB::ZLIB)
endif()
