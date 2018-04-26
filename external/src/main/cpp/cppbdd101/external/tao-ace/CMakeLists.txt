
message (STATUS "BUILDTING ACE TAO as DDS dependencies")

set(ACE_TAO_SOURCE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/ACE_wrappers)
set(ACE_TAO_BUILD_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/ace-tao-build)

set(ACE_ROOT "${ACE_TAO_SOURCE_DIRECTORY}")
set(TAO_ROOT "${ACE_ROOT}/TAO")

file(MAKE_DIRECTORY
    ${ACE_TAO_BUILD_DIRECTORY}
)


#file(WRITE "${ACE_TAO_SOURCE_DIRECTORY}/ace/config.h"
#    "#include \"config-linux.h\""
#)

message(STATUS "ACE_TAO_SOURCE_DIRECTORY ${ACE_TAO_SOURCE_DIRECTORY}")
message(STATUS "CMAKE_BUILD_TOOL ${CMAKE_BUILD_TOOL}")

include(ExternalProject)
ExternalProject_Add(extern_acetao
    SOURCE_DIR "${ACE_TAO_SOURCE_DIRECTORY}"
    INSTALL_DIR "${CMAKE_INSTALL_PREFIX}"
    #COMMAND ${CMAKE_COMMAND} -E echo "$<CONFIG> building ACE TAO"
    #    CMAKE_ARGS -DACE_ROOT="${ACE_TAO_SOURCE_DIRECTORY}/ACE_wrappers"
    #         -DTAO_ROOT="${ACE_TAO_SOURCE_DIRECTORY}/ACE_wrappers/TAO"
    #         -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR> 
    #         -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS} 
    #         -DCMAKE_C_FLAGS=${CMAKE_C_FLAGS} 
    #         -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    #	 -DINSTALL_PREFIX="${CMAKE_INSTALL_PREFIX}"
    #COMMAND ${CMAKE_COMMAND} -E echo "Generating ${ACE_TAO_SOURCE_DIRECTORY}/ace/config.h"
    #COMMAND ${CMAKE_COMMAND} -E echo "\#include <gtk/gtk.h>" > "${ACE_TAO_SOURCE_DIRECTORY}/ace/config.h"
    #COMMAND ${CMAKE_COMMAND} -E echo "Generating include ${ACE_ROOT}/include/makeinclude/platform_linux.GNU"
    #COMMAND ${CMAKE_COMMAND} -E echo "include ${ACE_ROOT}/include/makeinclude/platform_linux.GNU" >> "${ACE_ROOT}/include/makeinclude/platform_macros.GNU"
    #COMMAND ${CMAKE_COMMAND} -E echo "INSTALL_PREFIX=${CMAKE_INSTALL_LIBDIR}" >> "${ACE_ROOT}/include/makeinclude/platform_macros.GNU"

    COMMAND ${CMAKE_COMMAND} -E echo "Building in $<CONFIG> mode"
    #BUILD_COMMAND ${CMAKE_BUILD_TOOL} 
    BUILD_COMMAND  make -c ${ACE_TAO_SOURCE_DIRECTORY} 
    INSTALL_COMMAND ${CMAKE_BUILD_TOOL} install
    BUILD_IN_SOURCE ON
    #    LOG_DOWNLOAD ON
    #LOG_UPDATE ON
    #LOG_CONFIGURE ON
    #LOG_BUILD ON
    #LOG_INSTALL ON
    #    COMMAND ${CMAKE_COMMAND} -E echo "$<CONFIG> building ACE TAO ended"
    #)

    #add_custom_command(OUTPUT ${ACE_TAO_SOURCE_DIRECTORY}/ace/config.h
#    COMMAND echo "\"""#include""config-linux.h" "\"" > ${ACE_TAO_BUILD_DIRECTORY}/ace/config.h
#    WORKING_DIRECTORY ${ACE_TAO_SOURCE_DIRECTORY}
#    COMMENT "Generating Config.h in ${ACE_TAO_SOURCE_DIRECTORY}"
)

#add_custom_target(ALL make
#    DEPENDS ${ACE_TAO_SOURCE_DIRECTORY}/ace/config.h
#    WORKING_DIRECTORY ${ACE_TAO_SOURCE_DIRECTORY}
#    COMMENT "ACE TAO librarry"
#)

#target_compile_definitions( acetao
#    PUBLIC 
#        ACE_ROOT="${CMAKE_CURRENT_SOURCE_DIR}/ACE_wrappers"$
#        TAO_ROOT="${CMAKE_CURRENT_SOURCE_DIR}/ACE_wrappers/TAO"
#)

