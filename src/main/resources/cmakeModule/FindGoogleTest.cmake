# Get the Google C++ Mocking Framework.
# (This file is almost an copy of the original FindGTest.cmake file,
#  altered to download and compile GMock and GTest if not found
#  in GMOCK_ROOT or GTEST_ROOT respectively,
#  feel free to use it as it is or modify it for your own needs.)
#
# Defines the following variables:
#
#   GMOCK_FOUND - Found or got the Google Mocking framework
#   GTEST_FOUND - Found or got the Google Testing framework
#   GMOCK_INCLUDE_DIRS - GMock include directory
#   GTEST_INCLUDE_DIRS - GTest include direcotry
#
# Also defines the library variables below as normal variables
#
#   GMOCK_BOTH_LIBRARIES - Both libgmock & libgmock_main
#   GMOCK_LIBRARIES - libgmock
#   GMOCK_MAIN_LIBRARIES - libgmock-main
#
#   GTEST_BOTH_LIBRARIES - Both libgtest & libgtest_main
#   GTEST_LIBRARIES - libgtest
#   GTEST_MAIN_LIBRARIES - libgtest_main
#
# Accepts the following variables as input:
#
#   GMOCK_ROOT - The root directory of the gmock install prefix
#   GTEST_ROOT - The root directory of the gtest install prefix
#   GMOCK_SRC_DIR -The directory of the gmock sources
#   GMOCK_VER - The version of the gmock sources to be downloaded
#
#-----------------------
# Example Usage:
#
#    set(GMOCK_ROOT "~/gmock")
#    find_package(GMock REQUIRED)
#    include_directories(${GMOCK_INCLUDE_DIRS})
#
#    add_executable(foo foo.cc)
#    target_link_libraries(foo ${GMOCK_BOTH_LIBRARIES})
#
#=============================================================================
# Copyright (c) 2016 Michel Estermann
# Copyright (c) 2016 Kamil Strzempowicz
# Copyright (c) 2011 Matej Svec
#
# CMake - Cross Platform Makefile Generator
# Copyright 2000-2016 Kitware, Inc.
# Copyright 2000-2011 Insight Software Consortium
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
#
# * Neither the names of Kitware, Inc., the Insight Software Consortium,
#   nor the names of their contributors may be used to endorse or promote
#   products derived from this software without specific prior written
#   permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# ------------------------------------------------------------------------------
#
# The above copyright and license notice applies to distributions of
# CMake in source and binary form.  Some source files contain additional
# notices of original copyright by their contributors; see each source
# for details.  Third-party software packages supplied with CMake under
# compatible licenses provide their own copyright notices documented in
# corresponding subdirectories.
#
# ------------------------------------------------------------------------------
#
# CMake was initially developed by Kitware with the following sponsorship:
#
#  * National Library of Medicine at the National Institutes of Health
#    as part of the Insight Segmentation and Registration Toolkit (ITK).
#
#  * US National Labs (Los Alamos, Livermore, Sandia) ASC Parallel
#    Visualization Initiative.
#
#  * National Alliance for Medical Image Computing (NAMIC) is funded by the
#    National Institutes of Health through the NIH Roadmap for Medical Research,
#    Grant U54 EB005149.
#
#  * Kitware, Inc.
#=============================================================================
# Thanks to Daniel Blezek <blezek@gmail.com> for the GTEST_ADD_TESTS code


function(gtest_add_tests executable extra_args)

    if(NOT ARGN)
        message(FATAL_ERROR "Missing ARGN: Read the documentation for GTEST_ADD_TESTS")
    endif()

    if(ARGN STREQUAL "AUTO")
        # obtain sources used for building that executable
        get_property(ARGN TARGET ${executable} PROPERTY SOURCES)
    endif()

    set(gtest_case_name_regex ".*\\( *([A-Za-z_0-9]+) *, *([A-Za-z_0-9]+) *\\).*")
    set(gtest_test_type_regex "(TYPED_TEST|TEST_?[FP]?)")

    foreach(source ${ARGN})
        file(READ "${source}" contents)
        string(REGEX MATCHALL "${gtest_test_type_regex} *\\(([A-Za-z_0-9 ,]+)\\)" found_tests ${contents})
        foreach(hit ${found_tests})
            string(REGEX MATCH "${gtest_test_type_regex}" test_type ${hit})
            # Parameterized tests have a different signature for the filter
            if("x${test_type}" STREQUAL "xTEST_P")
                string(REGEX REPLACE ${gtest_case_name_regex} "*/\\1.\\2/*" test_name ${hit})
            elseif("x${test_type}" STREQUAL "xTEST_F" OR "x${test_type}" STREQUAL "xTEST")
                string(REGEX REPLACE ${gtest_case_name_regex} "\\1.\\2" test_name ${hit})
            elseif("x${test_type}" STREQUAL "xTYPED_TEST")
                string(REGEX REPLACE ${gtest_case_name_regex} "\\1/*.\\2" test_name ${hit})
            else()
                message(WARNING "Could not parse GTest ${hit} for adding to CTest.")
                continue()
            endif()
            add_test(NAME ${test_name} COMMAND ${executable} --gtest_filter=${test_name} ${extra_args})
        endforeach()
    endforeach()
endfunction()

function(_import_library _target _var _config)
    if(_config)
        set(_config_suffix "_${_config}")
    else()
        set(_config_suffix "")
    endif()

    set(_lib "${${_var}${_config_suffix}}")
    if(EXISTS "${_lib}")
        if(_config)
            set_property(TARGET ${_target} APPEND PROPERTY
                IMPORTED_CONFIGURATIONS ${_config})
        endif()
        set_target_properties(${_target} PROPERTIES
            IMPORTED_LINK_INTERFACE_LANGUAGES${_config_suffix} "CXX")
        if(WIN32 AND ${_var}_TYPE STREQUAL SHARED)
            set_target_properties(${_target} PROPERTIES
                IMPORTED_IMPLIB${_config_suffix} "${_lib}")
        else()
            set_target_properties(${_target} PROPERTIES
                IMPORTED_LOCATION${_config_suffix} "${_lib}")
        endif()
    endif()
endfunction()

function(_append_debugs _endvar _library)
    if(${_library} AND ${_library}_DEBUG)
        set(_output optimized ${${_library}} debug ${${_library}_DEBUG})
    else()
        set(_output ${${_library}})
    endif()
    set(${_endvar} ${_output} PARENT_SCOPE)
endfunction()

function(_gmock_find_library _name)
    find_library(${_name}
        NAMES ${ARGN}
        HINTS
        ENV GMOCK_ROOT
        ${GMOCK_ROOT}
        PATH_SUFFIXES ${_gmock_libpath_suffixes})
    mark_as_advanced(${_name})
endfunction()

function(_gtest_find_library _name)
    find_library(${_name}
        NAMES ${ARGN}
        HINTS
        ENV GTEST_ROOT
        ${GTEST_ROOT}
        PATH_SUFFIXES ${_gtest_libpath_suffixes})
    mark_as_advanced(${_name})
endfunction()

set(_gmock_libpath_suffixes lib)
set(_gtest_libpath_suffixes lib)

if(MSVC)
    if(GMOCK_MSVC_SEARCH STREQUAL "MD")
        list(APPEND _gmock_libpath_suffixes
            msvc/gmock-md/Debug
            msvc/gmock-md/Release)
        list(APPEND _gtest_libpath_suffixes
            msvc/gtest-md/Debug
            msvc/gtest-md/Release)
    elseif(GMOCK_MSVC_SEARCH STREQUAL "MT")
        list(APPEND _gmock_libpath_suffixes
            msvc/gmock/Debug
            msvc/gmock/Release)
        list(APPEND _gtest_libpath_suffixes
            msvc/gtest/Debug
            msvc/gtest/Release)
    endif()
endif()

find_path(GMOCK_INCLUDE_DIR gmock/gmock.h
    HINTS
    $ENV{GMOCK_ROOT}/include
    ${GMOCK_ROOT}/include
    /usr/local/include/cucumber-cpp
    /usr/include/cucumber-cpp
    /msys64/mingw64/include/cucumber-cpp
    /mingw64/include/cucumber-cpp
    /include/cucumber-cpp
)

mark_as_advanced(GMOCK_INCLUDE_DIR)

find_path(GTEST_INCLUDE_DIR gtest/gtest.h
    HINTS
    $ENV{GTEST_ROOT}/include
    ${GTEST_ROOT}/include
    /usr/local/include/cucumber-cpp
    /usr/include/cucumber-cpp
    /msys64/mingw64/include/cucumber-cpp
    /mingw64/include/cucumber-cpp
    /include/cucumber-cpp
)

mark_as_advanced(GTEST_INCLUDE_DIR)

if(MSVC AND GMOCK_MSVC_SEARCH STREQUAL "MD")
    # The provided /MD project files for Google Mock add -md suffixes to the
    # library names.
    _gmock_find_library(GMOCK_LIBRARY               gmock-md        gmock)
    _gmock_find_library(GMOCK_LIBRARY_DEBUG         gmock-mdd       gmockd)
    _gmock_find_library(GMOCK_MAIN_LIBRARY          gmock_main-md   gmock_main)
    _gmock_find_library(GMOCK_MAIN_LIBRARY_DEBUG    gmock_main-mdd  gmock_maind)

    _gtest_find_library(GTEST_LIBRARY               gtest-md        gtest)
    _gtest_find_library(GTEST_LIBRARY_DEBUG         gtest-mdd       gtestd)
    _gtest_find_library(GTEST_MAIN_LIBRARY          gtest_main-md   gtest_main)
    _gtest_find_library(GTEST_MAIN_LIBRARY_DEBUG    gtest_main-mdd  gtest_maind)
else()
    _gmock_find_library(GMOCK_LIBRARY               gmock)
    _gmock_find_library(GMOCK_LIBRARY_DEBUG         gmockd)
    _gmock_find_library(GMOCK_MAIN_LIBRARY          gmock_main)
    _gmock_find_library(GMOCK_MAIN_LIBRARY_DEBUG    gmock_maind)

    _gtest_find_library(GTEST_LIBRARY               gtest)
    _gtest_find_library(GTEST_LIBRARY_DEBUG         gtestd)
    _gtest_find_library(GTEST_MAIN_LIBRARY          gtest_main)
    _gtest_find_library(GTEST_MAIN_LIBRARY_DEBUG    gtest_maind)
endif()

if(NOT TARGET GTest::GTest)
    add_library(GTest::GTest UNKNOWN IMPORTED)
endif()

if(NOT TARGET GTest::Main)
    add_library(GTest::Main UNKNOWN IMPORTED)
endif()

if(NOT TARGET GMock::GMock)
    add_library(GMock::GMock UNKNOWN IMPORTED)
endif()

if(NOT TARGET GMock::Main)
    add_library(GMock::Main UNKNOWN IMPORTED)
endif()

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GMock DEFAULT_MSG GMOCK_LIBRARY GMOCK_INCLUDE_DIR GMOCK_MAIN_LIBRARY)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GTest DEFAULT_MSG GTEST_LIBRARY GTEST_INCLUDE_DIR GTEST_MAIN_LIBRARY)

if(GMOCK_FOUND AND GTEST_FOUND)
    #message( STATUS "GTEST_FOUND and GMOCK_FOUND")
    set(GMOCK_INCLUDE_DIRS ${GMOCK_INCLUDE_DIR})
    _append_debugs(GMOCK_LIBRARIES      GMOCK_LIBRARY)
    _append_debugs(GMOCK_MAIN_LIBRARIES GMOCK_MAIN_LIBRARY)
    set(GMOCK_BOTH_LIBRARIES ${GMOCK_LIBRARIES} ${GMOCK_MAIN_LIBRARIES})

    set(GTEST_INCLUDE_DIRS ${GTEST_INCLUDE_DIR})
    _append_debugs(GTEST_LIBRARIES      GTEST_LIBRARY)
    _append_debugs(GTEST_MAIN_LIBRARIES GTEST_MAIN_LIBRARY)
    set(GTEST_BOTH_LIBRARIES ${GTEST_LIBRARIES} ${GTEST_MAIN_LIBRARIES})

    find_package(Threads QUIET)

    if(NOT TARGET GTest::GTest)
        #__gtest_determine_library_type(GTEST_LIBRARY)
        add_library(GTest::GTest ${GTEST_LIBRARY_TYPE} IMPORTED)

        if(TARGET Threads::Threads)
            set_target_properties(GTest::GTest PROPERTIES
                INTERFACE_LINK_LIBRARIES Threads::Threads)
        endif(TARGET Threads::Threads)

        if(GTEST_LIBRARY_TYPE STREQUAL "SHARED")
            set_target_properties(GTest::GTest PROPERTIES
                INTERFACE_COMPILE_DEFINITIONS "GTEST_LINKED_AS_SHARED_LIBRARY=1")
        endif(GTEST_LIBRARY_TYPE STREQUAL "SHARED")

        if(GTEST_INCLUDE_DIRS)
            set_target_properties(GTest::GTest PROPERTIES
                INTERFACE_INCLUDE_DIRECTORIES "${GTEST_INCLUDE_DIRS}")
        endif(GTEST_INCLUDE_DIRS)

        _import_library(GTest::GTest GTEST_LIBRARY "")
        _import_library(GTest::GTest GTEST_LIBRARY "RELEASE")
        _import_library(GTest::GTest GTEST_LIBRARY "DEBUG")
    endif(NOT TARGET GTest::GTest)

    if(NOT TARGET GTest::Main)
        #__gtest_determine_library_type(GTEST_MAIN_LIBRARY)
        add_library(GTest::Main ${GTEST_MAIN_LIBRARY_TYPE} IMPORTED)
        set_target_properties(GTest::Main PROPERTIES
            INTERFACE_LINK_LIBRARIES "GTest::GTest")
        _import_library(GTest::Main GTEST_MAIN_LIBRARY "")
        _import_library(GTest::Main GTEST_MAIN_LIBRARY "RELEASE")
        _import_library(GTest::Main GTEST_MAIN_LIBRARY "DEBUG")
    endif(NOT TARGET GTest::Main)

    if(NOT TARGET GMock::GMock )
        #__gtest_determine_library_type(GTEST_LIBRARY)
        add_library(GMock::GMock  ${GMOCK_LIBRARY_TYPE} IMPORTED)

        if(TARGET Threads::Threads)
            set_target_properties(GMock::GMock  PROPERTIES
                INTERFACE_LINK_LIBRARIES Threads::Threads)
        endif(TARGET Threads::Threads)

        if(GMOCK_LIBRARY_TYPE STREQUAL "SHARED")
            set_target_properties(GMock::GMock  PROPERTIES
                INTERFACE_COMPILE_DEFINITIONS "GTEST_LINKED_AS_SHARED_LIBRARY=1")
        endif(GMOCK_LIBRARY_TYPE STREQUAL "SHARED")

        if(GMOCK_INCLUDE_DIRS)
            set_target_properties(GMock::GMock  PROPERTIES
                INTERFACE_INCLUDE_DIRECTORIES "${GMOCK_INCLUDE_DIRS}")
        endif(GMOCK_INCLUDE_DIRS)

        _import_library(GMock::GMock GMOCK_LIBRARY "")
        _import_library(GMock::GMock GMOCK_LIBRARY "RELEASE")
        _import_library(GMock::GMock GMOCK_LIBRARY "DEBUG")
    endif(NOT TARGET GMock::GMock)

    if(NOT TARGET GMock::Main)
        __gtest_determine_library_type(GTEST_MAIN_LIBRARY)
        add_library(GMock::Main ${GTEST_MAIN_LIBRARY_TYPE} IMPORTED)
        set_target_properties(GMock::Main PROPERTIES
            INTERFACE_LINK_LIBRARIES "GMock::GMock")
        _import_library(GMock::Main GMOCK_MAIN_LIBRARY "")
        _import_library(GMock::Main GMOCK_MAIN_LIBRARY "RELEASE")
        _import_library(GMock::Main GMOCK_MAIN_LIBRARY "DEBUG")
    endif(NOT TARGET GMock::Main)
endif()
