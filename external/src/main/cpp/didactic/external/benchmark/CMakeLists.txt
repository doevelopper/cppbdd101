#------------------------------------------------------------------------------------#
#-----------------------------FIND GOOGLE BENCHMARK----------------------------------#
#------------------------------------------------------------------------------------#

# Try to find the Google Benchmark library and headers.
#  Benchmark_FOUND        - system has benchmark lib
#  Benchmark_INCLUDE_DIRS - the benchmark include directory
#  Benchmark_LIBRARIES    - libraries needed to use benchmark

find_path(Benchmark_INCLUDE_DIR
    NAMES benchmark/benchmark.h
    NO_SYSTEM_ENVIRONMENT_PATH
    DOC "The directory where benchmark includes reside"
)

find_library(Benchmark_LIBRARY
    NAMES benchmark
    NO_SYSTEM_ENVIRONMENT_PATH
    DOC "The benchmark library"
)

set(Benchmark_INCLUDE_DIRS ${Benchmark_INCLUDE_DIR})
set(Benchmark_LIBRARIES    ${Benchmark_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Benchmark
    FOUND_VAR Benchmark_FOUND
    REQUIRED_VARS Benchmark_INCLUDE_DIR Benchmark_LIBRARY
)

mark_as_advanced(Benchmark_FOUND)

# Use ExternalProject to get the missig benchmark lib
if (NOT Benchmark_FOUND)
    # Enable ExternalProject CMake module
    include(ExternalProject)

    # Set default ExternalProject root directory
    set_directory_properties(PROPERTIES EP_PREFIX ${CMAKE_BINARY_DIR}/third_party)

    ExternalProject_Add(
        goolebenchmark
        GIT_REPOSITORY https://github.com/google/benchmark.git
        INSTALL_COMMAND ""
        CMAKE_ARGS "-DBENCHMARK_ENABLE_GTEST_TESTS=OFF"
        # Wrap download, configure and build steps in a script to log output
        LOG_DOWNLOAD ON
        LOG_CONFIGURE ON
        LOG_BUILD ON
    )

    ExternalProject_Get_Property(googlebenchmark source_dir)
    set(Benchmark_INCLUDE_DIRS ${source_dir}/include)
    include_directories(${Benchmark_INCLUDE_DIRS})

    ExternalProject_Get_Property(goolebenchmark binary_dir)

    set(Benchmark_LIBRARIES ${binary_dir}/src/${CMAKE_FIND_LIBRARY_PREFIXES}benchmark.a)
    set(Benchmark_LIBRARY benchmark)

    add_library(${Benchmark_LIBRARY} UNKNOWN IMPORTED)

    set_target_properties(${Benchmark_LIBRARY} PROPERTIES
        IMPORTED_LOCATION ${Benchmark_LIBRARIES}
        IMPORTED_LINK_INTERFACE_LIBRARIES ${CMAKE_THREAD_LIBS_INIT}
    )

	set_target_properties(
		${Benchmark_LIBRARY} PROPERTIES
		"IMPORTED_LOCATION" "${binary_dir}/benchmark/libbenchmark.a"
		"IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
		"INTERFACE_INCLUDE_DIRECTORIES" "${Benchmark_INCLUDE_DIRS}"
	)
    add_dependencies(${Benchmark_LIBRARY} googlebenchmark)
    
endif()


# cmake_minimum_required(VERSION 2.6.2)

# project(google-benchmark-distribution )
# include(GBenchmarkDownload)
