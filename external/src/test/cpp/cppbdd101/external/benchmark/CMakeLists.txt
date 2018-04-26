#------------------------------------------------------------------------------------#
#-----------------------------FIND GOOGLE BENCHMARK----------------------------------#
#------------------------------------------------------------------------------------#

# Try to find the Google Benchmark library and headers.
#  Benchmark_FOUND        - system has benchmark lib
#  Benchmark_INCLUDE_DIRS - the benchmark include directory
#  Benchmark_LIBRARIES    - libraries needed to use benchmark
include(ExternalProject)
#find_path(Benchmark_INCLUDE_DIR
#    NAMES benchmark/benchmark.h
#    NO_SYSTEM_ENVIRONMENT_PATH
#    DOC "The directory where benchmark includes reside"
#)
#
#find_library(Benchmark_LIBRARY
#    NAMES benchmark
#    NO_SYSTEM_ENVIRONMENT_PATH
#    DOC "The benchmark library"
#)
#
#set(Benchmark_INCLUDE_DIRS ${Benchmark_INCLUDE_DIR})
#set(Benchmark_LIBRARIES    ${Benchmark_LIBRARY})
#
#include(FindPackageHandleStandardArgs)
#find_package_handle_standard_args(Benchmark
#    FOUND_VAR Benchmark_FOUND
#    REQUIRED_VARS Benchmark_INCLUDE_DIR Benchmark_LIBRARY
#)
#
#mark_as_advanced(Benchmark_FOUND)

# Use ExternalProject to get the missing benchmark lib
set(BENCHMARK_SOURCE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/benchmark)
set(BENCHMARK_BUILD_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/benchmark-build)

#if (NOT Benchmark_FOUND)
#
#    include(ExternalProject)
#
#    # Set default ExternalProject root directory
##    set_directory_properties(PROPERTIES EP_PREFIX ${CMAKE_BINARY_DIR}/external)
#
#    ExternalProject_Add(
#        googlebenchmark
#        PREFIX "${CMAKE_CURRENT_BINARY_DIR}/benchmark"
#        SOURCE_DIR "${BENCHMARK_SOURCE_DIRECTORY}"
#        BINARY_DIR "${BENCHMARK_BUILD_DIRECTORY}"
#        INSTALL_DIR "${CMAKE_INSTALL_INCLUDEDIR}"
##        GIT_REPOSITORY https://github.com/google/benchmark.git
#        INSTALL_COMMAND ""
#        CMAKE_ARGS -DBENCHMARK_ENABLE_GTEST_TESTS=OFF -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
#        # Wrap download, configure and build steps in a script to log output
#        LOG_DOWNLOAD ON
#        LOG_CONFIGURE ON
#        LOG_BUILD ON
#    )
#
#    add_library(benchmark STATIC IMPORTED)
#
#    set_target_properties(benchmark
#	PROPERTIES
#        IMPORTED_LOCATION  ${benchmark_LIBRARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}benchmark${CMAKE_STATIC_LIBRARY_SUFFIX}
#	)
#    add_dependencies(benchmark googlebenchmark)

#    ExternalProject_Get_Property(googlebenchmark source_dir)
#    set(Benchmark_INCLUDE_DIRS ${source_dir}/include)
#    include_directories(${Benchmark_INCLUDE_DIRS})
#
#    ExternalProject_Get_Property(googlebenchmark binary_dir)
#
#    set(Benchmark_LIBRARIES ${binary_dir}/src/${CMAKE_FIND_LIBRARY_PREFIXES}benchmark.a)
#    set(Benchmark_LIBRARY benchmark)

#    add_library(googlebenchmark UNKNOWN IMPORTED)
#    add_library(${Benchmark_LIBRARY} UNKNOWN IMPORTED)

#    set_target_properties(googlebenchmark #${Benchmark_LIBRARY} 
#        PROPERTIES
#        IMPORTED_LOCATION ${Benchmark_LIBRARIES}
#        IMPORTED_LINK_INTERFACE_LIBRARIES ${CMAKE_THREAD_LIBS_INIT}
#    )
#
#    set_target_properties(
##		${Benchmark_LIBRARY} PROPERTIES
#		googlebenchmark PROPERTIES
#		"IMPORTED_LOCATION" "${binary_dir}/benchmark/libbenchmark.a"
#		"IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
#		"INTERFACE_INCLUDE_DIRECTORIES" "${Benchmark_INCLUDE_DIRS}"
#    )
#
#    set_target_properties(googlebenchmark 
#        PROPERTIES 
#        VERSION "1.4.0" 
#        SOVERSION "1.4"
#    )

#    add_dependencies(${Benchmark_LIBRARY} googlebenchmark)
    
#endif()

#cmake_minimum_required(VERSION 3.10.0)
#project(google-benchmark-distribution )
#include(GBenchmarkDownload)

#include(ExternalProject)
#
#ExternalProject_Add(
#    benchmark
#    DOWNLOAD_COMMAND ""
#    INSTALL_COMMAND ""
#    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR} 
#    BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/benchmark-build
#    CMAKE_ARGS
#      -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
#      -DCMAKE_VERBOSE_MAKEFILE:BOOL=${CMAKE_VERBOSE_MAKEFILE}
#  )
#
#ExternalProject_Get_Property(benchmark install_dir)
#include_directories(${install_dir}/include)

#set(benchmark_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}")
#set(benchmark_INCLUDE_DIR "${CMAKE_INSTALL_INCLUDEDIR}")
#set(benchmark_LIBRARY_DIR "${CMAKE_INSTALL_LIBDIR}")

ExternalProject_Add(extern_benchmark
    PREFIX "${CMAKE_CURRENT_BINARY_DIR}/benchmark"
    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/benchmark"
    # configure
    CMAKE_ARGS
        -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
        -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
	-DBENCHMARK_ENABLE_TESTING=OFF
    DEPENDS extern_googletest
    STEP_TARGETS CopyConfigFileToInstall
)

ExternalProject_Add_Step(extern_benchmark CopyConfigFileToInstall 
   # COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/.... ${CMAKE_INSTALL_PREFIX}/...
    COMMENT "Blabla blabla Install configuration file"
)

#add_library(benchmark STATIC IMPORTED)

#set_target_properties(benchmark
#    PROPERTIES
#    IMPORTED_LOCATION
#            ${benchmark_LIBRARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}benchmark${CMAKE_STATIC_LIBRARY_SUFFIX}
#)
#add_dependencies(benchmark extern_benchmark)
#include_directories(${benchmark_INCLUDE_DIR})

