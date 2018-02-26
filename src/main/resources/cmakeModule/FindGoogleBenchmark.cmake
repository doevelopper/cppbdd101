# Findbenchmark.cmake
# - Try to find benchmark
#
# The following variables are optionally searched for defaults
#  benchmark_ROOT_DIR:  Base directory where all benchmark components are found
#
# Once done this will define
#  benchmark_FOUND - System has benchmark
#  benchmark_INCLUDE_DIRS - The benchmark include directories
#  benchmark_LIBRARIES - The libraries needed to use benchmark
#include <benchmark\benchmark.h>

#static void StandardString(benchmark::State& state)
#{
#    if (state.thread_index == 0)
#    {
#        // Prepare
#    }
#    while (state.KeepRunning())
#    {
#           std::string myString;
#   }
#   if (state.thread_index == 0)
#   {
#       // Teardown
#      }
#}

#BENCHMARK(StandardString);
#BENCHMARK_MAIN();
#
#cmake_minimum_required(VERSION 2.8)
#project(MicroBenchmark CXX)

#set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake_modules" ${CMAKE_MODULE_PATH})
#find_package(GoogleBenchmark REQUIRED)

#include_directories(${benchmark_INCLUDE_DIRS})
#include_directories(headers)

#file(GLOB_RECURSE SOURCE_FILES headers/* src/*)

#add_executable(MicroBenchmark ${SOURCE_FILES})

#target_link_libraries(MicroBenchmark ${benchmark_LIBRARIES})
#if ("${CMAKE_SYSTEM_NAME}" MATCHES "Windows")
#    target_link_libraries(MicroBenchmark Shlwapi)
#endif()

set(benchmark_ROOT_DIR "" CACHE PATH "Folder containing benchmark")

find_path(benchmark_INCLUDE_DIR "benchmark/benchmark.h"
  PATHS ${benchmark_ROOT_DIR}
  PATH_SUFFIXES include
  NO_DEFAULT_PATH)
find_path(benchmark_INCLUDE_DIR "benchmark/benchmark.h")

find_library(benchmark_LIBRARY NAMES "benchmark"
  PATHS ${benchmark_ROOT_DIR}
  PATH_SUFFIXES lib lib64
  NO_DEFAULT_PATH)
find_library(benchmark_LIBRARY NAMES "benchmark")

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set benchmark_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(benchmark FOUND_VAR benchmark_FOUND
  REQUIRED_VARS benchmark_LIBRARY
  benchmark_INCLUDE_DIR)

if(benchmark_FOUND)
  set(benchmark_LIBRARIES ${benchmark_LIBRARY})
  set(benchmark_INCLUDE_DIRS ${benchmark_INCLUDE_DIR})
endif()

mark_as_advanced(benchmark_INCLUDE_DIR benchmark_LIBRARY)



## Import target "benchmark::GoogleBenchmarkMain" for configuration "Release"
#set_property(TARGET benchmark::GoogleBenchmarkMain APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
#set_target_properties(benchmark::GoogleBenchmarkMain PROPERTIES
#  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
#  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libGoogleBenchmarkMain.a"
#  )

#list(APPEND _IMPORT_CHECK_TARGETS benchmark::GoogleBenchmarkMain )
#list(APPEND _IMPORT_CHECK_FILES_FOR_benchmark::GoogleBenchmarkMain "${_IMPORT_PREFIX}/lib/libGoogleBenchmarkMain.a" )

## Commands beyond this point should not need to know the version.
#set(CMAKE_IMPORT_FILE_VERSION)