
if(NOT TARGET style)
    add_custom_target(style
        COMMENT "Prettying source code with uncrustify"
    )
endif()

if(NOT TARGET cyclomatic)
    add_custom_target(cyclomatic
        COMMENT "Cyclomatic Complexity Analyzer."
    )
endif()

if(NOT TARGET cppcheck)
    add_custom_target(cppcheck
        COMMENT "Static code analysis."
    )
endif()

if(NOT TARGET lint)
    add_custom_target(lint
        COMMENT "Check the C++ source code to analyze it for syntax errors and other faults."
    )
endif()

if(NOT TARGET coverage)
    add_custom_target(coverage
        COMMENT "Running coverage report."
    )
endif()

if(ENABLE_QA_CHECK)
    if(NOT TARGET qa-check)
        ADD_CUSTOM_TARGET(qa-check
            COMMENT "Software quality assurance: Style -> CPPCheck -> Cyclomatic -> CPPlint -> Coverage"
        )
        add_dependencies(qa-check coverage style cppcheck cyclomatic lint)
    endif(NOT TARGET qa-check)
else(ENABLE_QA_CHECK)
    add_custom_target(qa-check 
        COMMAND ${CMAKE_COMMAND} -E echo "Software quality assurance disabled"
    )
endif(ENABLE_QA_CHECK)


# 32 bits build
add_custom_target(i386
    COMMAND ${CMAKE_COMMAND}
    --build ${IA32_BINARY_DIR}
    --config ${CMAKE_BUILD_TYPE}
    COMMENT "Building for i386"
    VERBATIM
)

# x86_64 version
add_custom_target(x64
    COMMAND ${CMAKE_COMMAND}
    --clean-first
    --build ${X64_BINARY_DIR}
    --config ${CMAKE_BUILD_TYPE}
    COMMENT "Building for x86_64"
VERBATIM
)

#ARM build 
add_custom_target(arm
    COMMAND ${CMAKE_COMMAND}
    --build ${ARM_BINARY_DIR}
    --config ${CMAKE_BUILD_TYPE}
    COMMENT "Building for armv7, armv7s,armv8-a, arm64"
    VERBATIM
)
#ARM build 
add_custom_target(cleanall
    COMMAND ${CMAKE_COMMAND}
    --target clean
    COMMENT "Cleaning target"
    VERBATIM
)

add_custom_target (distclean
    COMMAND rm -vf ${CMAKE_SOURCE_DIR}/*.log
    COMMAND rm -vf ${CMAKE_SOURCE_DIR}/Makefile
    COMMAND rm -vf ${CMAKE_SOURCE_DIR}/install_manifest.txt
    COMMAND rm -vf ${CMAKE_SOURCE_DIR}/cmake_install.cmake
    COMMAND find ${CMAKE_SOURCE_DIR} -type f -name CMakeCache.txt | xargs -r rm -vf
    COMMAND find ${CMAKE_SOURCE_DIR} -type d -name CMakeFiles | xargs -r rm -rvf
    COMMAND find ${CMAKE_SOURCE_DIR} -type f -name "*.marks" | xargs -r rm -vf
	COMMENT "Cleaning target"
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
)

