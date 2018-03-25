set (OCLINT_OPTIONS "-p")
if(ENABLE_CPPLINT)
    find_program(OCLINT  OCLint
        NAMES OCLint 
        PATHS  /usr/local/bin
#        NO_DEFAULT_PATH
    )

    if(OCLINT)
        mark_as_advanced(OCLINT)
        set(RUN_OCLINT ON)
    endif(OCLINT)

else(ENABLE_CPPLINT)
    # message(STATUS "Static code Analysis Skipped.")
    set(RUN_OCLINT OFF)
endif(ENABLE_CPPLINT)

function(add_oclint_analysis target_name bin_folder)
    if(RUN_OCLINT)

        set(WORKING_DIR "${bin_folder}/qa/oclint/${target_name}")
        file(MAKE_DIRECTORY ${WORKING_DIR})

        file(GLOB_RECURSE ALL_SOURCE_FILES ${bin_folder} *.cpp) 
        file(GLOB_RECURSE ALL_HEADER_FILES ${bin_folder} *.hpp)

        add_custom_target( ${target_name}-oclint
            COMMAND oclint  ${OCLINT_OPTIONS} ${ALL_SOURCE_FILES} ${ALL_HEADER_FILES} 
            WORKING_DIRECTORY ${bin_folder}
            DEPENDS ${ALL_SOURCE_FILES} ${ALL_HEADER_FILES}
            COMMENT "[OCLINT-Target] ${bin_folder}"
        )

    else(RUN_OCLINT)
        add_custom_target(
            ${target_name}-oclint 
            COMMAND ${CMAKE_COMMAND} -E echo "[---SKIPPED---] Static Code analysis. Add -DENABLE_CPPLINT=ON to Enable"
			COMMENT "Static code analysis."
        )
    endif(RUN_OCLINT)

    add_dependencies(lint ${target_name}-oclint)

endfunction(add_oclint_analysis)
