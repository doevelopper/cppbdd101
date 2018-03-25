set(UNCRUSTIFY_CONFIG "${PROJECT_SOURCE_DIR}/src/main/resources/config/uncrustify.cfg")
# set(UNCRUSTIFY_FLAGS --no-backup -l CPP -q -c ${UNCRUSTIFY_CONFIG})
set(UNCRUSTIFY_FLAGS --no-backup -l CPP -c ${UNCRUSTIFY_CONFIG})
set(RUN_UNCRUSTIFY false)
	
if(ENABLE_FORMATING_STYLE)
    find_program(UNCRUSTIFY uncrustify
        DOC "Path of uncrustify program")
    if(UNCRUSTIFY)
        execute_process(
            COMMAND ${UNCRUSTIFY} --version OUTPUT_VARIABLE UNCRUSTIFY_VERSION
            OUTPUT_STRIP_TRAILING_WHITESPACE)
            string(REGEX REPLACE ".+([0-9]+\\.[0-9]+)" "\\1" UNCRUSTIFY_VERSION ${UNCRUSTIFY_VERSION}
        )
        # message(STATUS "${UNCRUSTIFY} : ${UNCRUSTIFY_VERSION}")
		set(RUN_UNCRUSTIFY true)
        mark_as_advanced(UNCRUSTIFY)

    endif(UNCRUSTIFY)

else(ENABLE_FORMATING_STYLE)
	set(RUN_UNCRUSTIFY false)
endif(ENABLE_FORMATING_STYLE)

function(run_code_beautifier STYLE_TARGET BASE_DIRECTORY)
	if(RUN_UNCRUSTIFY)
		if(NOT TARGET ${STYLE_TARGET}-style) 

			file(GLOB_RECURSE SRC ${BASE_DIRECTORY} *.cpp *.hpp)

			add_custom_target(${STYLE_TARGET}-style
				COMMENT "[STYLE-Target:${STYLE_TARGET}] ${BASE_DIRECTORY}"
				COMMAND "${UNCRUSTIFY}"  ${UNCRUSTIFY_FLAGS} ${SRC}
				WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
			)

		endif()

    else(RUN_UNCRUSTIFY)

        add_custom_target(${STYLE_TARGET}-style 
			COMMAND ${CMAKE_COMMAND} -E echo "[---SKIPPED---] Prettying source code. Define -DENABLE_FORMATING_STYLE=ON to enable."
			COMMENT "Source Code beautification."
		)
    endif(RUN_UNCRUSTIFY)

	add_dependencies(style ${STYLE_TARGET}-style)

endfunction(run_code_beautifier)