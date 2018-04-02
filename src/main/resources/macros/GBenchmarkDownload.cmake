
include(ExternalProject)
ExternalProject_Add(
    benchmark
    GIT_REPOSITORY https://github.com/google/benchmark.git
    GIT_TAG master
    # SOURCE_DIR "${CMAKE_BINARY_DIR}/benchmark-src"
    # BINARY_DIR "${CMAKE_BINARY_DIR}/benchmark-build"
    # TEST_COMMAND ""
    # CONFIGURE_COMMAND ""
    # BUILD_COMMAND ""	
    UPDATE_COMMAND ""
    INSTALL_COMMAND ""
    LOG_DOWNLOAD ON
    LOG_CONFIGURE ON
    LOG_BUILD ON
    INSTALL_DIR "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/benchmark"
    # CMAKE_ARGS -D CMAKE_INSTALL_PREFIX=$<INSTALL_DIR>
    CMAKE_ARGS "-DCMAKE_INSTALL_PREFIX=$<INSTALL_DIR>"
)

# Get benchmark source and binary directories from CMake project
ExternalProject_Get_Property(benchmark source_dir binary_dir)
add_library(libbenchmark IMPORTED STATIC GLOBAL)
# Create a libbenchmark target to be used as a dependency by test programs
# add_library(libbenchmark INTERFACE)

add_dependencies(libbenchmark benchmark)
set_target_properties(
	libbenchmark PROPERTIES
    "IMPORTED_LOCATION" "${binary_dir}/benchmark/libbenchmark.a"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    "INTERFACE_INCLUDE_DIRECTORIES" "${GTEST_INCLUDE_DIRS}"
)
	
# Single download(git clone)
# ExternalProject_Add(
    # benchmark-master
    # DOWNLOAD_DIR "google-benchmark-master/src" # The only dir option which is required
    # GIT_REPOSITORY https://github.com/google/benchmark.git
    # TIMEOUT 10
    # LOG_DOWNLOAD ON
    # Disable all other steps
    # CONFIGURE_COMMAND ""
    # BUILD_COMMAND ""
    # INSTALL_COMMAND ""
# )

# Build benchmark from existing sources
# ExternalProject_Add(
    # benchmark
    # DOWNLOAD_COMMAND "" # No download required
    # SOURCE_DIR "google-benchmark-master/src/benchmark" # Use specific source dir
    # PREFIX "google-benchmark-master" # But use prefix for compute other dirs
    # INSTALL_COMMAND ""
    # LOG_CONFIGURE ON
    # LOG_BUILD ON
    # INSTALL_DIR ${EXTERNAL_DIR}/googletest/install
    # CMAKE_ARGS -D CMAKE_INSTALL_PREFIX=$<INSTALL_DIR>
# )

# benchmark should be build after being downloaded
# add_dependencies(benchmark google-benchmark-master)
