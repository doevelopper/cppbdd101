
set(LOG4CXX_SOURCE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/log4cxx-0.11.0-SNAPSHOT)
set(LOG4CXX_BUILD_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/apache-log4cxx-build)

set(LOG4CXX_SOURCE_INCLUDE_DIRECTORY ${LOG4CXX_SOURCE_DIRECTORY}/src/main/include)
set(LOG4CXX_BUILD_INCLUDE_DIRECTORY ${LOG4CXX_BUILD_DIRECTORY}/src/main/include)

set(LOG4CXX_LIBS_DIRECTORY ${LOG4CXX_BUILD_DIRECTORY}/src/main/cpp/.libs)

file(MAKE_DIRECTORY
    ${LOG4CXX_BUILD_DIRECTORY}
)

add_definitions(-Wno-narrowing -std=gnu++14)

set(CONFIGURE_FLAGS "")
set(COMMON_CONFIGURE_FLAGS
    "--with-apr=${CMAKE_CURRENT_BINARY_DIR}/../apr/apr-build"
    "--with-apr-util=${CMAKE_CURRENT_BINARY_DIR}/../apru/apr-util-build"
#    "--with-expat=${EXPAT_SOURCE_DIRECTORY}"
#    "LDFLAGS=-L${EXPAT_LIBS_DIRECTORY}"
)

set(CONFIGURE_FLAGS ${COMMON_CONFIGURE_FLAGS})

#include(ExternalProject)
#ExternalProject_Add(
#    liblog4cxx
#    SOURCE_DIR ${LOG4CXX_SOURCE_DIRECTORY}
#    CONFIGURE_COMMAND ${LOG4CXX_SOURCE_DIRECTORY}/autogen.sh
##    COMMAND ${LOG4CXX_SOURCE_DIRECTORY}/configure ${CONFIGURE_FLAGS}
##    PREFIX ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/lib/
##    BUILD_COMMAND make
#    BUILD_IN_SOURCE 1
#)

add_custom_command(OUTPUT ${LOG4CXX_BUILD_DIRECTORY}/Makefile
#    COMMAND ${LOG4CXX_SOURCE_DIRECTORY}/autogen.sh
    COMMAND CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} ${LOG4CXX_SOURCE_DIRECTORY}/configure ${CONFIGURE_FLAGS}
    DEPENDS apr-1
    DEPENDS expat
    DEPENDS apr-util
    WORKING_DIRECTORY ${LOG4CXX_BUILD_DIRECTORY}
)


add_custom_target(liblog4cxx ALL make
    DEPENDS ${LOG4CXX_BUILD_DIRECTORY}/Makefile
    WORKING_DIRECTORY ${LOG4CXX_BUILD_DIRECTORY}
)

install(
    DIRECTORY ${LOG4CXX_LIBS_DIRECTORY}/
    DESTINATION ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}
    USE_SOURCE_PERMISSIONS
    FILES_MATCHING PATTERN liblog4cxx.*
)

install(
    DIRECTORY ${LOG4CXX_SOURCE_INCLUDE_DIRECTORY}/
    DESTINATION ${CMAKE_INSTALL_PREFIX}/include
    USE_SOURCE_PERMISSIONS
    FILES_MATCHING PATTERN *.h
)

install(
    DIRECTORY ${LOG4CXX_BUILD_INCLUDE_DIRECTORY}/
    DESTINATION ${CMAKE_INSTALL_PREFIX}/include
    USE_SOURCE_PERMISSIONS
    FILES_MATCHING PATTERN *.h
)



#To Configure Log4CXX, you need some more tools.
#LIBTOOL
#AUTOMAKE
#AUTOCONF
#
#Make sure you have them already installed or install them.
#apt-get install automake
#
#Generate configure script:
# autoreconf --force --install
#
#Set environment variables in to configure file using autogen.sh script
# ./autogen.sh
#
#Configure Log4CXX configure file with APR and APR-Utils paths
# ./configure --with-apr=../apr-1.5.0 --with-apr-util=../apr-util-1.5.3
#make
#make install
