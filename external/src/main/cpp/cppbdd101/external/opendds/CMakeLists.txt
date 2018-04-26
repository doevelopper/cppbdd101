
set(DDS_SOURCE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/OpenDDS-DDS-3.12.2)
set(DDS_BUILD_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/opendds-build)

set(JAVA__DDS_OPTIONAL
    --java=
)


set(OPEN_DDS_OPTIONAL
   "--boost="
   "--rapidjson"
)

set(OPEN_DDS_CONFIGURE_FLAGC
    #"--host=" 
    #"--target="
    "--prefix=${CMAKE_INSTALL_PREFIX}"
    "--static"
    #"--ace="
    #"--tao="
    #"--mpc="
    #"--no-tests"
#    ${OPEN_DDS_OPTIONAL}
)

add_custom_command(OUTPUT ${DDS_SOURCE_DIRECTORY}/GNUmakefile
    COMMAND CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER}  ${DDS_SOURCE_DIRECTORY}/configure ${OPEN_DDS_CONFIGURE_FLAGC}
    #COMMAND ${CMAKE_COMMAND} -E copy include/apr.h ${APR_SOURCE_DIRECTORY}/include
    WORKING_DIRECTORY ${DDS_SOURCE_DIRECTORY}
)

add_custom_target(openDDS ALL make
    DEPENDS ${DDS_SOURCE_DIRECTORY}/GNUmakefile
    WORKING_DIRECTORY ${DDS_SOURCE_DIRECTORY}
    COMMENT "Building Open Data Distribution Service"
)

add_custom_command(TARGET openDDS
    POST_BUILD
    COMMAND ${CMAKE_MAKE_PROGRAM} install
    WORKING_DIRECTORY ${OPENSPLICE_SOURCE_DIRECTORY}
    COMMENT "Installing OpendDDS headers and libaries"
)


