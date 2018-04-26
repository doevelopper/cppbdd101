set(BOOST_SOURCE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/boost_1_66_0)
set(BOOST_BUILD_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/boost_1_66_0-build)
set(Boost_Version "1.66.0")
set(Boost_Version_Underscore "boost_1_66_0")
set(BOOST_BUILD_CMD ${BOOST_SOURCE_DIRECTORY}/b2) 
set(BOOST_BOOTSTRAP_CMD ./${BOOST_DIR}/bootstrap.sh) 
set(BOOST_BUILD_CMD_ARGS 
#    --prefix=${CMAKE_INSTALL_INCLUDEDIR}
    --prefix=${CMAKE_INSTALL_PREFIX}
    --includedir=${CMAKE_INSTALL_LIBDIR}
    --libdir=${CMAKE_INSTALL_LIBDIR}
    --with-program_options address-model=64 
    #    --stagedir=
    # --build-type=complete 
#    address-model=32_64
    link=static
    toolset=gcc
    stage
    threading=multi
    runtime-link=shared
    --build-dir=${BOOST_BUILD_DIRECTORY}
#    -d+2
#    --hash
#    --ignore-site-config
)

file(MAKE_DIRECTORY
    ${BOOST_BUILD_DIRECTORY}
)

include(ExternalProject)
ExternalProject_Add(extern_boost
  #URL http://downloads.sourceforge.net/project/boost/boost/1.60.0/boost_1_60_0.tar.bz2
  SOURCE_DIR "${BOOST_SOURCE_DIRECTORY}"
  INSTALL_DIR "${CMAKE_INSTALL_PREFIX}"
  CONFIGURE_COMMAND ./bootstrap.sh --prefix=<INSTALL_DIR>
  BUILD_COMMAND ./b2 ${BOOST_BUILD_CMD_ARGS}
  INSTALL_COMMAND ./b2 install
  BUILD_IN_SOURCE ON ### addet --build fir, should remove BUILD_IN_SOURCE
  LOG_DOWNLOAD ON
  LOG_UPDATE ON
  LOG_CONFIGURE ON
  LOG_BUILD ON
  LOG_INSTALL ON
)

set( BOOST_ROOT ${CMAKE_INSTALL_PREFIX}  CACHE STRING "" FORCE )
set( Boost_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include CACHE STRING "" FORCE )
set( Boost_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib CACHE STRING "" FORCE)
set( Boost_LIBRARY_DIRS ${CMAKE_INSTALL_PREFIX}/lib CACHE STRING "" FORCE)
set( Boost_DEBUG ON CACHE STRING "" FORCE)
set( Boost_FOUND ON CACHE STRING "" FORCE)
set( Boost_DIR ${CMAKE_INSTALL_PREFIX} CACHE STRING "" FORCE)
#ExternalProject_Add (boost
##    URL http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_66_0.tar.bz2/download
##    URL_MD5 d6eef4b4cacb2183f2bf265a5a03a354
#    URL https://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.gz
##    URL_SHA256 bd0df411efd9a585e5a2212275f8762079fed8842264954675a4fddc46cfcf60
#    CONFIGURE_COMMAND ./bootstrap.sh --with-libraries=atomic,date_time,filesystem,program_options,system,thread
#    BUILD_COMMAND ./b2 link=static
#    BUILD_IN_SOURCE 1
#    INSTALL_COMMAND ""
#    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_INCLUDEDIR} #--with-python=/usr/bin/python --with-python-root=
#    LOG_DOWNLOAD ON 
#    LOG_UPDATE ON 
#    LOG_CONFIGURE ON 
#    LOG_BUILD ON 
#    LOG_INSTALL ON 
#)

#include(ExternalProject)
#ExternalProject_Add(
#    boost
##    PREFIX ${BOOST_BUILD_DIRECTORY}
#    URL https://dl.bintray.com/boostorg/release/${Boost_Version}/source/boost_${Boost_Version_Underscore}.tar.gz
##    URL_HASH ALGO=SHA256
#
#    CONFIGURE_COMMAND ./bootstrap.sh 
#    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_INCLUDEDIR}
#    BUILD_COMMAND ./bjam  ${BOOST_BUILD_CMD_ARGS}
##    BUILD_IN_SOURCE 1
#    INSTALL_COMMAND ./bjam install
#    LOG_CONFIGURE ON 
#    LOG_BUILD ON 
#    LOG_INSTALL ON
#    USES_TERMINAL_BUILD ON
#    USES_TERMINAL_INSTALL ON
#)

#ExternalProject_Add_Step(
#  Boost CopyBoostToBin
#  COMMAND ${CMAKE_COMMAND} -E copy_directory ${GLOBAL_OUTPUT_PATH}/boost/bin ${GLOBAL_OUTPUT_PATH}
#  COMMAND ${CMAKE_COMMAND} -E copy_directory ${GLOBAL_OUTPUT_PATH}/boost/lib ${GLOBAL_OUTPUT_PATH}
#  DEPENDEES install
#)
