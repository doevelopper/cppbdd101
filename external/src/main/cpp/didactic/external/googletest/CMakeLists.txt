cmake_minimum_required(VERSION 2.6.2)

project( googletest-distribution )
include(External_GTest)

## Assuming this your tests/CMakeLists.txt (and your libs are setup in a root config)
## Just make sure to include(CTest) in your *root* cmake config.

## 3.9 adds support for "GoogleTest" which enumerates the tests inside
## of the code and adds them to ctest.
# cmake_minimum_required(VERSION 3.9)

## Configure google-test as a downloadable library.
# include(External_GTest.cmake)

# add_executable(myTests
    # src/main.cpp)

## This will automatically handle all of the lib linkage and include dirs
# target_link_libraries(myTests
    # libraryTargetOfCodeBeingTested
    # ${GTEST_LIBRARY}
# )

## Tell ctest about my tests
# include(GoogleTest)
# gtest_add_tests(
    # TARGET      myTests
    # TEST_LIST   myTests_targets
# )

## set each target to timeout if not finished within 10 sec
# set_tests_properties(${myTests_targets} PROPERTIES TIMEOUT 10)










# include(ExternalProject)
# set(EXTERNAL_DIR ${CMAKE_CURRENT_BINARY_DIR})
# ExternalProject_Add(eigen
                    # PREFIX ${EXTERNAL_DIR}/eigen
                    # DOWNLOAD_DIR /home/cdoucet/Downloads/eigen
                    # SOURCE_DIR ${EXTERNAL_DIR}/eigen/src
                    # BINARY_DIR ${EXTERNAL_DIR}/eigen/build
                    # INSTALL_DIR ${EXTERNAL_DIR}/eigen/install
                    # URL http://bitbucket.org/eigen/eigen/get/3.2.4.tar.gz
                    # URL_MD5 4d0d77e06fef87b4fcd2c9b72cc8dc55
                    # CMAKE_ARGS -D CMAKE_INSTALL_PREFIX=$<INSTALL_DIR>
# )
					
					
# enable_testing()

# option(BUILD_GTEST "Builds the googletest subproject" OFF)

# Note that googlemock target already builds googletest
# option(BUILD_GMOCK "Builds the googlemock subproject" ON)

# if(BUILD_GMOCK)
  # add_subdirectory( googlemock )
# elseif(BUILD_GTEST)
  # add_subdirectory( googletest )
# endif()

#COMMAND ${CMAKE_COMMAND} -E copy_directory googlemock/include/gmock ${TARGET_BUILD_DIRECTORY}/include
#COMMAND ${CMAKE_COMMAND} -E copy /libgtest.a ${TARGET_BUILD_DIRECTORY}/lib
#COMMAND ${CMAKE_COMMAND} -E copy /libgtest_main.a ${TARGET_BUILD_DIRECTORY}/lib



#ExternalProject_Add(external_gtest
#  GIT_REPOSITORY git@github.com:svn2github/googletest.git
#  PREFIX         ${CMAKE_CURRENT_BINARY_DIR}/external/gtest
#  INSTALL_DIR    ${CMAKE_CURRENT_BINARY_DIR}
#  CMAKE_ARGS     -DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}
#  INSTALL_COMMAND
#    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_BINARY_DIR}/external/gtest/src/external_gtest/include ${CMAKE_CURRENT_BINARY_DIR}/include
#    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_BINARY_DIR}/external/gtest/src/external_gtest-build/libgtest.a ${CMAKE_CURRENT_BINARY_DIR}/lib
#    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_BINARY_DIR}/external/gtest/src/external_gtest-build/libgtest_main.a ${CMAKE_CURRENT_BINARY_DIR}/lib
#)

