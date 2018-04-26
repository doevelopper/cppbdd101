#------------------------------------------------------------------------------------#
#-----------------------------FIND GOOGLE TEST---------------------------------------#
#------------------------------------------------------------------------------------#

# Try to find the Google Benchmark library and headers.
include(ExternalProject)

set(GOOGLETEST_BUILD_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-build)


#set(googletest_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}")
#set(googletest_INCLUDE_DIR "${CMAKE_INSTALL_INCLUDEDIR}")
#set(googletest_LIBRARY_DIR "${CMAKE_INSTALL_LIBDIR}")
#message (STATUS "CMAKE_INSTALL_PREFIX  ${CMAKE_INSTALL_PREFIX}")
#message (STATUS "CMAKE_ARCHIVE_OUTPUT_DIRECTORY  ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}")
#message (STATUS "CMAKE_LIBRARY_OUTPUT_DIRECTORY  ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
#message (STATUS "CMAKE_RUNTIME_OUTPUT_DIRECTORY  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")
#message (STATUS "CMAKE_INSTALL_SYSCONFDIR  ${CMAKE_INSTALL_SYSCONFDIR}")
#message (STATUS "CMAKE_INSTALL_INCLUDEDIR  ${CMAKE_INSTALL_INCLUDEDIR}")
#message (STATUS "CMAKE_INSTALL_LIBDIR  ${CMAKE_INSTALL_LIBDIR}")
#message (STATUS "CMAKE_INSTALL_BINDIR  ${CMAKE_INSTALL_BINDIR}")

ExternalProject_Add(extern_googletest
    PREFIX "${CMAKE_CURRENT_BINARY_DIR}/googletest"
    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/googletest"
    # configure
    CMAKE_ARGS
        -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
        -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
	-DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} #${googletest_INSTALL_DIR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
	-DBUILD_GMOCK=ON
    #-Dgtest_disable_pthreads=OFF
    #CMAKE_CACHE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
    # install
    #INSTALL_DIR ${googletest_INSTALL_DIR}
    #INSTALL_DIR "/home/happyman/cppbdd101/build/x86_64-Linux-GNU_GCC_7.2.0-DEBUG"
)

#add_library(googletest STATIC IMPORTED GLOBAL)

#set_target_properties(googletest
	#    PROPERTIES
    #    IMPORTED_LOCATION
    #            ${googletest_LIBRARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}googletest${CMAKE_STATIC_LIBRARY_SUFFIX}
	    #)
#add_dependencies(googletest extern_googletest)
#include_directories(${googletest_INCLUDE_DIR})

