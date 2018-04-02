find_package(Threads REQUIRED)

include(ExternalProject)

ExternalProject_Add(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    # GIT_TAG master
    # SOURCE_DIR "${CMAKE_BINARY_DIR}/googletest-src"
    # BINARY_DIR "${CMAKE_BINARY_DIR}/googletest-build"
    # TEST_COMMAND ""
    # CONFIGURE_COMMAND ""
    # BUILD_COMMAND ""	
    UPDATE_COMMAND ""
    INSTALL_COMMAND ""
    LOG_DOWNLOAD ON
    LOG_CONFIGURE ON
    LOG_BUILD ON
)

# ExternalProject_Add(
    # googletest
    # PREFIX ${EXTERNAL_DIR}/googletest
    # DOWNLOAD_DIR /home/cdoucet/Downloads/googletest
    # SOURCE_DIR ${EXTERNAL_DIR}/googletest/src
    # BINARY_DIR ${EXTERNAL_DIR}/googletest/build
    # INSTALL_DIR ${EXTERNAL_DIR}/googletest/install
    # URL https://github.com/google/googletest/archive/master.zip
    # URL_MD5 4d0d77e06fef87b4fcd2c9b72cc8dc55
    # CMAKE_ARGS -D CMAKE_INSTALL_PREFIX=$<INSTALL_DIR>
# )
	

ExternalProject_Get_Property(googletest source_dir)

set(GTEST_INCLUDE_DIRS ${source_dir}/googletest/include)
set(GMOCK_INCLUDE_DIRS ${source_dir}/googlemock/include)

file(MAKE_DIRECTORY ${GTEST_INCLUDE_DIRS})
file(MAKE_DIRECTORY ${GMOCK_INCLUDE_DIRS})

ExternalProject_Get_Property(googletest binary_dir)

set(GTEST_LIBRARY_PATH ${binary_dir}/googlemock/gtest/${CMAKE_FIND_LIBRARY_PREFIXES}gtest.a)
set(GTEST_LIBRARY gtest)

add_library(${GTEST_LIBRARY} UNKNOWN IMPORTED)

# ExternalProject_Get_Property(gtest source_dir binary_dir)
# #Create a libgtest target to be used as a dependency by test programs
# add_library(libgtest INTERFACE)
# add_dependencies(libgtest gtest)
# target_link_libraries(libgtest INTERFACE Threads::Threads "${binary_dir}/libgtest.a" "${binary_dir}/libgtest_main.a")
# target_include_directories(libgtest INTERFACE "${source_dir}/include")

set_target_properties(
    ${GTEST_LIBRARY} PROPERTIES
    "IMPORTED_LOCATION" "${GTEST_LIBRARY_PATH}"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    "INTERFACE_INCLUDE_DIRECTORIES" "${GTEST_INCLUDE_DIRS}"
)

add_dependencies(${GTEST_LIBRARY} googletest)

set(GTEST_MAIN_LIBRARY_PATH ${binary_dir}/googlemock/gtest/${CMAKE_FIND_LIBRARY_PREFIXES}gtest_main.a)
set(GTEST_MAIN_LIBRARY gtest_main)

add_library(${GTEST_MAIN_LIBRARY} UNKNOWN IMPORTED)

set_target_properties(
    ${GTEST_MAIN_LIBRARY} PROPERTIES
    "IMPORTED_LOCATION" "${GTEST_MAIN_LIBRARY_PATH}"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    "INTERFACE_INCLUDE_DIRECTORIES" "${GTEST_INCLUDE_DIRS}"
)

add_dependencies(${GTEST_MAIN_LIBRARY} googletest)

set(GMOCK_LIBRARY_PATH ${binary_dir}/googlemock/${CMAKE_FIND_LIBRARY_PREFIXES}gmock.a)
set(GMOCK_LIBRARY gmock)

add_library(${GMOCK_LIBRARY} UNKNOWN IMPORTED)

set_target_properties(
    ${GMOCK_LIBRARY} PROPERTIES
    "IMPORTED_LOCATION" "${GMOCK_LIBRARY_PATH}"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    "INTERFACE_INCLUDE_DIRECTORIES" "${GMOCK_INCLUDE_DIRS}"
)

add_dependencies(${GMOCK_LIBRARY} googletest)

set(GMOCK_MAIN_LIBRARY_PATH ${binary_dir}/googlemock/${CMAKE_FIND_LIBRARY_PREFIXES}gmock_main.a)
set(GMOCK_MAIN_LIBRARY gmock_main)

add_library(${GMOCK_MAIN_LIBRARY} UNKNOWN IMPORTED)

set_target_properties(
    ${GMOCK_MAIN_LIBRARY} PROPERTIES
    "IMPORTED_LOCATION" "${GMOCK_MAIN_LIBRARY_PATH}"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    "INTERFACE_INCLUDE_DIRECTORIES" "${GMOCK_INCLUDE_DIRS}"
)
	
add_dependencies(${GMOCK_MAIN_LIBRARY} ${GTEST_LIBRARY})

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
	