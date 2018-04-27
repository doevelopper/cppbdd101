
include(ExternalProject)

set(CATCH_BUILD_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/benchmark-build)

ExternalProject_Add(extern_catch2
    PREFIX "${CMAKE_CURRENT_BINARY_DIR}/catch2-v2.2.2"
    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/catch2-v2.2.2"
    # configure
    CMAKE_ARGS
            -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
            -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
	    -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
            -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    # install
    #INSTALL_DIR ${catch2_INSTALL_DIR}

    DEPENDS extern_googletest
        STEP_TARGETS CopyConfigFileToInstall
    )

ExternalProject_Add_Step(extern_catch2 CopyConfigFileToInstall
   # COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/.... ${CMAKE_INSTALL_PREFIX}/...
   COMMENT "Blabla blabla Install configuration file"
)

