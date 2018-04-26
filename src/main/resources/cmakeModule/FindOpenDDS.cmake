#.rst:
# FindOpenDDS
# -------
#
# This module attempts to finds OpenDDS.
# 
# It defines the following variables:
#
# * OpenDDS_FOUND                - True if OpenDDS was found
# * OpenDDS_INCLUDE_DIRS
# * OpenDDS_LIBRARY_DIRS
# * OpenDDS_LIBRARIES
# * OpenDDSTAO_IDL_COMMAND_EXECUTABLE
# * OpenDDS_IDL_EXECUTABLE
# * OpenDDS_ROOT_DIR
# * OpenDDS_FLAGS
# * OpenDDS_TAO_FLAGS
#
# Provides following function to compile idl files:
# * dds_compile_idl(<file-list> <output-variable;generated_source_files> <output-variable;generated_header_files> )

# find IDL compilers
find_program(TAO_IDL_COMMAND "tao_idl"
    HINTS 
        ${CMAKE_INSTALL_BINDIR}
        ${CMAKE_INSTALL_INCLUDEDIR}
)

find_program(OPENDDS_IDL_COMMAND "opendds_idl"
    HINTS 
        ${CMAKE_INSTALL_BINDIR}
        ${CMAKE_INSTALL_INCLUDEDIR}
)

if (TAO_IDL_COMMAND AND OPENDDS_IDL_COMMAND)

    set(OpenDDS_IDL_EXECUTABLE ${OPENDDS_IDL_COMMAND} PARENT_SCOPE)
    set(OpenDDSTAO_IDL_COMMAND_EXECUTABLE ${TAO_IDL_COMMAND} PARENT_SCOPE)
    set(_FOUND TRUE)

    if(NOT OpenDDS_FIND_QUIETLY)
        message("OpenDDS found")
    endif()

else(OPENDDS_IDL_COMMAND_)

    set(_FOUND FALSE)

    if(NOT OpenDDS_FIND_QUIETLY)
        message(WARNING "OpenDDS not found")
    endif()

endif()
    
set(OpenDDS_FOUND ${_FOUND} PARENT_SCOPE)
    
if (_FOUND)
    set(TAO_FLAGS "")
    list(APPEND TAO_FLAGS "-I$ENV{TAO_ROOT}")
    list(APPEND TAO_FLAGS "-I$ENV{DDS_ROOT}")
    list(APPEND TAO_FLAGS "-I.")
    list(APPEND TAO_FLAGS "-Wb,pre_include=ace/pre.h")
    list(APPEND TAO_FLAGS "-Wb,post_include=ace/post.h")
    list(APPEND TAO_FLAGS "-Sa")
    list(APPEND TAO_FLAGS "-St")

    set(OPENDDS_FLAGS "")
    list(APPEND OPENDDS_FLAGS "-Lspcpp")
    list(APPEND OPENDDS_FLAGS "-I$ENV{DDS_ROOT}")
    list(APPEND OPENDDS_FLAGS "-I.")
    list(APPEND OPENDDS_FLAGS "-Sa")
    list(APPEND OPENDDS_FLAGS "-St")


    set(OpenDDS_FLAGS "${OPENDDS_FLAGS}" PARENT_SCOPE)
    set(OpenDDS_TAO_FLAGS "${TAO_FLAGS}" PARENT_SCOPE)
    set(OpenDDS_ROOT_DIR $ENV{DDS_ROOT} PARENT_SCOPE)

    set(_include_dirs "")
    list(APPEND _include_dirs $ENV{DDS_ROOT})
    list(APPEND _include_dirs $ENV{ACE_ROOT})
    list(APPEND _include_dirs $ENV{TAO_ROOT})
    set(OpenDDS_INCLUDE_DIRS ${_include_dirs} PARENT_SCOPE)


    set(_library_dirs "")
    list(APPEND _library_dirs $ENV{DDS_ROOT}/lib)
    list(APPEND _library_dirs $ENV{ACE_ROOT}/lib)
    list(APPEND _library_dirs $ENV{TAO_ROOT}/lib)
    set(OpenDDS_LIBRARY_DIRS ${_library_dirs} PARENT_SCOPE)

    set(_all_libs "")
    foreach(_lib_dir ${_library_dirs})
        file(GLOB _libs "${_lib_dir}/*.so")
        foreach(_lib ${_libs})
            list(APPEND _all_libs "${_lib}")
        endforeach(_lib)
    endforeach(_lib_dir)
    set(OpenDDS_LIBRARIES ${_all_libs} PARENT_SCOPE)

endif(_FOUND)


function(dds_compile_idl idl_filenames generated_source_files generated_header_files)

    if (NOT OpenDDS_FOUND)
        message(FATAL_ERROR "OpenDDS not found")
    endif()

    set(_res_cpp "")
    set(_res_h "")

    foreach(filename ${idl_filenames})
        # split path
        # get_filename_component(filename_wd ${filename} NAME)
        get_filename_component(filename_we ${filename} NAME_WE)
        get_filename_component(filename_abs ${filename} ABSOLUTE)
        get_filename_component(directory ${filename_abs} DIRECTORY)

        # copy idl file to build directory to work on it
        configure_file(${filename} ${filename} COPYONLY)

        ###### The OpenDDS IDL is first processed by the TAO IDL compiler.

        # construct tao_idl result filenames
        set( IDL_C_CPP "${CMAKE_CURRENT_BINARY_DIR}/${filename_we}C.cpp" )
        set( IDL_C_H   "${CMAKE_CURRENT_BINARY_DIR}/${filename_we}C.h" )
        set( IDL_C_INL "${CMAKE_CURRENT_BINARY_DIR}/${filename_we}C.inl" )
        set( IDL_S_CPP "${CMAKE_CURRENT_BINARY_DIR}/${filename_we}S.cpp" )
        set( IDL_S_H   "${CMAKE_CURRENT_BINARY_DIR}/${filename_we}S.h" )

        # append result filenames
        list(APPEND _res_cpp ${IDL_C_CPP})
        list(APPEND _res_cpp ${IDL_S_CPP})
        list(APPEND _res_h   ${IDL_C_H})
        list(APPEND _res_h   ${IDL_C_INL})
        list(APPEND _res_h   ${IDL_S_H})

        # compile tao_idl
        add_custom_command(
            OUTPUT ${IDL_C_CPP} ${IDL_C_H} ${IDL_C_INL} ${IDL_S_CPP} ${IDL_S_H}
            DEPENDS ${filename}
            COMMAND ${OpenDDSTAO_IDL_COMMAND_EXECUTABLE} 
            ARGS ${OpenDDS_TAO_FLAGS} ${filename}
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        )

        ###### In addition, we need to process the IDL file with the OpenDDS IDL compiler to generate the
        ###### serialization and key support code that OpenDDS requires to marshal and demarshal the
        ###### Message, as well as the type support code for the data readers and writers.

        # construct opendds_idl result filenames
        set( TYPE_SUPPORT_IDL "${CMAKE_CURRENT_BINARY_DIR}/${filename_we}TypeSupport.idl" )
        set( TYPE_SUPPORT_H   "${CMAKE_CURRENT_BINARY_DIR}/${filename_we}TypeSupportImpl.h" )
        set( TYPE_SUPPORT_CPP "${CMAKE_CURRENT_BINARY_DIR}/${filename_we}TypeSupportImpl.cpp" )
        # append result filenames
        list(APPEND _res_cpp ${TYPE_SUPPORT_CPP})
        list(APPEND _res_h ${TYPE_SUPPORT_H})
        list(APPEND _res_h ${TYPE_SUPPORT_IDL})

        set(res "${res};${TYPE_SUPPORT_IDL};${TYPE_SUPPORT_H};${TYPE_SUPPORT_CPP}")

        # compile opendds_idl
        add_custom_command(
            OUTPUT ${TYPE_SUPPORT_IDL} ${TYPE_SUPPORT_H} ${TYPE_SUPPORT_CPP}
            DEPENDS ${filename} ${IDL_C_CPP} ${IDL_C_H} ${IDL_C_INL} ${IDL_S_CPP} ${IDL_S_H}
            COMMAND ${OpenDDS_IDL_EXECUTABLE} 
            ARGS ${OpenDDS_FLAGS} ${filename}
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        )

        ###### The generated IDL file should itself be compiled with
        ###### the TAO IDL compiler to generate stubs and skeletons

        # construct tao_idl result filenames
        set( TYPE_SUPPORT_IDL_C_CPP "${CMAKE_CURRENT_BINARY_DIR}/${filename_we}TypeSupportC.cpp" )
        set( TYPE_SUPPORT_IDL_C_H   "${CMAKE_CURRENT_BINARY_DIR}/${filename_we}TypeSupportC.h" )
        set( TYPE_SUPPORT_IDL_C_INL "${CMAKE_CURRENT_BINARY_DIR}/${filename_we}TypeSupportC.inl" )
        set( TYPE_SUPPORT_IDL_S_CPP "${CMAKE_CURRENT_BINARY_DIR}/${filename_we}TypeSupportS.cpp" )
        set( TYPE_SUPPORT_IDL_S_H   "${CMAKE_CURRENT_BINARY_DIR}/${filename_we}TypeSupportS.h" )

        # append result filenames
        list(APPEND _res_cpp ${TYPE_SUPPORT_IDL_C_CPP})
        list(APPEND _res_cpp ${TYPE_SUPPORT_IDL_S_CPP})
        list(APPEND _res_h   ${TYPE_SUPPORT_IDL_C_H})
        list(APPEND _res_h   ${TYPE_SUPPORT_IDL_C_INL})
        list(APPEND _res_h   ${TYPE_SUPPORT_IDL_S_H})

        # compile tao_idl
        add_custom_command(
            OUTPUT ${TYPE_SUPPORT_IDL_C_CPP} ${TYPE_SUPPORT_IDL_C_H} ${TYPE_SUPPORT_IDL_C_INL} ${TYPE_SUPPORT_IDL_S_CPP} ${TYPE_SUPPORT_IDL_S_H}
            DEPENDS ${TYPE_SUPPORT_IDL}
            COMMAND ${OpenDDSTAO_IDL_COMMAND_EXECUTABLE} 
            ARGS ${OpenDDS_TAO_FLAGS} ${TYPE_SUPPORT_IDL} 
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        )

    endforeach(filename)

    # output result filenames
    set(${generated_source_files} ${_res_cpp} PARENT_SCOPE)
    set(${generated_header_files} ${_res_h} PARENT_SCOPE)

endfunction()
