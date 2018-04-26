set(OPENSPLICE_SOURCE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/opensplice)
set(OPENSPLICE_BUILD_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/opensplice-build)

set(OPENSPLICE_CONFIGURE_FLAGS
    "-DDDS_ROOT=/home/happyman/cppbdd101/external/src/main/cpp/cppbdd101/external/opendds/OpenDDS-DDS-3.12.2"
    "-DACE_ROOT=/home/happyman/cppbdd101/external/src/main/cpp/cppbdd101/external/opendds/OpenDDS-DDS-3.12.2/ACE_wrappers"
    "-DTAO_ROOT=/home/happyman/cppbdd101/external/src/main/cpp/cppbdd101/external/opendds/OpenDDS-DDS-3.12.2/ACE_wrappers/TAO"
    "-DMPC_ROOT=/home/happyman/cppbdd101/external/src/main/cpp/cppbdd101/external/opendds/OpenDDS-DDS-3.12.2/ACE_wrappers/MPC"
    "-DSPLICE_TARGET=x86_64.linux-dev"
    "-DSPLICE_HOST=x86_64.linux-dev"
    #"SPLICE_ORB="
)

add_custom_command(OUTPUT ${OPENSPLICE_SOURCE_DIRECTORY}/makefile
    COMMAND CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} ${OPENSPLICE_SOURCE_DIRECTORY}/configure ${OPENSPLICE_CONFIGURE_FLAGS}
    WORKING_DIRECTORY ${OPENSPLICE_SOURCE_DIRECTORY}
)

add_custom_target(openSplice ALL make
    DEPENDS ${OPENSPLICE_SOURCE_DIRECTORY}/makefile
    WORKING_DIRECTORY ${OPENSPLICE_SOURCE_DIRECTORY}
    COMMENT "Building Open SPlice Data Distribution Service"
)

#add_custom_command(TARGET openSplice
#    POST_BUILD
#    COMMAND ${CMAKE_MAKE_PROGRAM} install
#    WORKING_DIRECTORY ${OPENSPLICE_SOURCE_DIRECTORY}
#    COMMENT "Installing OpenSPLICE headers and libaries"
#)

