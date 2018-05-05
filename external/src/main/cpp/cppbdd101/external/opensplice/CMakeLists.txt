set(OPENSPLICE_SOURCE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/VortexOpenSplice-6.7.180404OSS)
set(OPENSPLICE_BUILD_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/opensplice-build)

set(TARGET_OSPL_LINUX "x86_64.linux-release")
set(TARGET_OSPL_DEBUG "x86_64.linux-debug")
set(TARGET_OSPL "x86_64.linux-dev")
set(DEV_ARM_TARGET_OSPL "armv8.linux-dev")
set(REL_ARM_TARGET_OSPL "armv8.linux-release")
 
set(OPENSPLICE_CONFIGURE_FLAGS
    "-DDDS_ROOT=/home/happyman/cppbdd101/external/src/main/cpp/cppbdd101/external/opendds/OpenDDS-DDS-3.12.2"
    "-DACE_ROOT=/home/happyman/cppbdd101/external/src/main/cpp/cppbdd101/external/opendds/OpenDDS-DDS-3.12.2/ACE_wrappers"
    "-DTAO_ROOT=/home/happyman/cppbdd101/external/src/main/cpp/cppbdd101/external/opendds/OpenDDS-DDS-3.12.2/ACE_wrappers/TAO"
    "-DMPC_ROOT=/home/happyman/cppbdd101/external/src/main/cpp/cppbdd101/external/opendds/OpenDDS-DDS-3.12.2/ACE_wrappers/MPC"
    "-DSPLICE_TARGET=x86_64.linux-dev"
    "-DSPLICE_HOST=x86_64.linux-dev"
    #"SPLICE_ORB="
)


add_custom_command(OUTPUT ${OPENSPLICE_SOURCE_DIRECTORY}/configure
    #COMMAND CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} ${OPENSPLICE_SOURCE_DIRECTORY}/configure ${OPENSPLICE_CONFIGURE_FLAGS}
    COMMAND CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} ${OPENSPLICE_SOURCE_DIRECTORY}/configure ${TARGET_OSPL_LINUX}
    WORKING_DIRECTORY ${OPENSPLICE_SOURCE_DIRECTORY}
)

add_custom_target(openSplice ALL
    DEPENDS ${OPENSPLICE_SOURCE_DIRECTORY}/configure
    WORKING_DIRECTORY ${OPENSPLICE_SOURCE_DIRECTORY}
    COMMENT "Building Open SPlice Data Distribution Service"
)

#add_custom_command(TARGET openSplice
#    POST_BUILD
#    COMMAND ${CMAKE_MAKE_PROGRAM} install
#    WORKING_DIRECTORY ${OPENSPLICE_SOURCE_DIRECTORY}
#    COMMENT "Installing OpenSPLICE headers and libaries"
#)

