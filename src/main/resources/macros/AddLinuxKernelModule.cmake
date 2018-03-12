# Module to add a linux kernel module to the build
# it defines the function :
# add_linux_kernel_module(NAME module_name 
#                         [SOURCE_FILES file1 file2 ....]
#                         [KERNEL_NAME kernel_name]
#                         [MODULE_SOURCE_DIR dir]) 
#    - NAME : The name of the module
#    - SOURCE_FILES : list of c file needed by the module
#    - KERNEL_NAME : the name of the kernel, if not it set to `uname -r`
#    - MODULE_SOURCE_DIR : where to find the sources, if not present, set to CMAKE_CURRENT_SOURCE_DIR

include(CMakeParseArguments)

function(ADD_LINUX_KERNEL_MODULE)
    if(NOT CMAKE_SYSTEM_NAME STREQUAL "Linux")
        message(FATAL_ERROR "You could only build linux kernel module on a linux system ! (Obvious isn't?). Current system : ${CMAKE_SYSTEM_NAME}")
    endif(NOT CMAKE_SYSTEM_NAME STREQUAL "Linux")

    set(options  "")
    set(singular NAME KERNEL_NAME MODULE_SOURCE_DIR)
    set(multi    SOURCE_FILES)
    cmake_parse_arguments(ARG "${options}" "${singular}" "${multi}" ${ARGN})

    if(NOT ARG_NAME)
	message(FATAL_ERROR "You should give a name to the module")
    else(NOT ARG_NAME)
	string(TOLOWER ${ARG_NAME} MODULE_NAME)
    endif(NOT ARG_NAME)

    if(NOT ARG_MODULE_SOURCE_DIR)
        set(MODULE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
    else(NOT ARG_MODULE_SOURCE_DIR)
	set(MODULE_SOURCE_DIR ${ARG_MODULE_SOURCE_DIR})
    endif(NOT ARG_MODULE_SOURCE_DIR)

    if(ARG_SOURCE_FILES)
	foreach(f ${ARG_SOURCE_FILES})
            string(REGEX MATCH "^[^ ]+\\.c$" MATCHES ${f})
            if(MATCHES)
                list(APPEND MODULE_SOURCE_FILES ${f})
                if("${MODULE_NAME}.c" STREQUAL "${f}")
                    message(FATAL_ERROR "Whit multiple source module you cannot have one of the file having the same name of the module")
                endif("${MODULE_NAME}.c" STREQUAL "${f}")
                string(REPLACE ".c" ".o" fo ${f})
                set(MODULE_OBJECT_FILES "${MODULE_OBJECT_FILES} ${fo}")
            endif(MATCHES)
        endforeach(f ${ARG_SOURCE_FILES})
    endif(ARG_SOURCE_FILES)

    if(NOT ARG_KERNEL_NAME)
        execute_process(COMMAND uname -r
                        OUTPUT_VARIABLE CURRENT_KERNEL_NAME
		        OUTPUT_STRIP_TRAILING_WHITESPACE)
    else(NOT ARG_KERNEL_NAME)
        set(CURRENT_KERNEL_NAME ${ARG_KERNEL_NAME})
    endif(NOT ARG_KERNEL_NAME)

    set(KERNEL_BUILD_DIR "/lib/modules/${CURRENT_KERNEL_NAME}/build")

    set(KBUILD_COMMAND ${CMAKE_MAKE_PROGRAM} -C ${KERNEL_BUILD_DIR} M=${MODULE_SOURCE_DIR})
	
    file(WRITE ${MODULE_SOURCE_DIR}/Kbuild 
		"obj-m := ${MODULE_NAME}.o")

    if(MODULE_OBJECT_FILES)
        file(APPEND ${MODULE_SOURCE_DIR}/Kbuild
            "${MODULE_NAME}-objs := ${MODULE_OBJECT_FILES}")
	endif(MODULE_OBJECT_FILES)

	set(MODULE_BIN_FILE ${MODULE_SOURCE_DIR}/${MODULE_NAME}.ko)

	# add_custom_command(OUTPUT  ${MODULE_BIN_FILE}
	#                    COMMAND ${KBUILD_COMMAND} modules
	# 				     DEPENDS ${ARG_MODULE_SOURCE_FILES} VERBATIM
	# 				     COMMENT "Compiling module '${MODULE_BIN_FILE}'")

	# add_custom_target(modules-${MODULE_NAME} DEPENDS ${MODULE_BIN_FILE})

    add_custom_target(modules-${MODULE_NAME} 
                      COMMAND ${KBUILD_COMMAND} modules
                      WORKING_DIRECTORY ${MODULE_SOURCE_DIR}
                      COMMENT "Compiling module '${MODULE_BIN_FILE}'")

    add_custom_target(modules-clean-${MODULE_NAME} COMMAND ${KBUILD_COMMAND} clean
                      WORKING_DIRECTORY ${MODULE_SOURCE_DIR}
                      COMMENT "Cleaning module '${MODULE_BIN_FILE}'")

    if(NOT TARGET modules)
		add_custom_target(modules)
		add_custom_target(modules-clean)
    endif(NOT TARGET modules)

    add_dependencies(modules modules-${MODULE_NAME})
    add_dependencies(modules-clean modules-clean-${MODULE_NAME})
endfunction(ADD_LINUX_KERNEL_MODULE)