
add_library(cppbdd101.main
    cppbdd101/Dummy
    cppbdd101/Interface
)

include(GenerateExportHeader)
generate_export_header(cppbdd101.main
    EXPORT_FILE_NAME "${CMAKE_CURRENT_BINARY_DIR}/Config.hpp"
    EXPORT_MACRO_NAME API_DECLS
    BASE_NAME cpp101
    PREFIX_NAME CB1_
)

# if(NOT TARGET MAIN::MAIN)
    # add_library(MAIN::MAIN UNKNOWN IMPORTED)
    # set_target_properties(MAIN::MAIN PROPERTIES
        # INTERFACE_COMPILE_DEFINITIONS "${MAIN_DEFINITIONS}"
        # IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
    # IMPORTED_LOCATION "${CMAKE_INSTALL_LIBDIR}/cppbdd101.main.a"
    # INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101"
    # )
# endif(NOT TARGET MAIN::MAIN)

target_compile_features(cppbdd101.main
    PUBLIC
        cxx_strong_enums
        cxx_variadic_templates
        cxx_nullptr
        cxx_alias_templates
        cxx_auto_type
        cxx_constexpr
        cxx_defaulted_functions
        cxx_final
        cxx_lambdas
        cxx_noexcept
        cxx_nullptr
        cxx_rvalue_references
        cxx_thread_local
        cxx_variadic_templates
    PRIVATE
        cxx_lambdas
        cxx_range_for
        $<$<CXX_COMPILER_ID:GNU>:cxx_attributes>
)

target_compile_options(cppbdd101.main
    INTERFACE
            -Wall
            $<$<CONFIG:Debug>:-g3 -O0 -fstack-protector>
            $<$<CONFIG:Release>:-g0 -O2>
    PUBLIC 
            "$<$<CONFIG:RELEASE>:${MY_RELEASE_OPTIONS}>"
            "$<$<CONFIG:Release>:-ffunction-sections>"
            "$<$<CONFIG:Release>:-fdata-sections>"
            "$<$<CONFIG:Release>:-Wl,--gc-sections>"
    PUBLIC  
            "$<$<CONFIG:DEBUG>:${MY_DEBUG_OPTIONS}>"
            "$<$<CONFIG:Debug>:-O0>"
            "$<$<CONFIG:Debug>:-ggdb>"
    PUBLIC
            "$<$<CONFIG:Release>:API_DECLS>"
            "$<$<CONFIG:Release>:LOG4CXX_STATIC>"
            "$<$<CONFIG:Release>:APR_DECLARE_STATIC>"
            "$<$<OR:$<CONFIG:Release>,$<CONFIG:PROF>>:DISABLE_VAR>"
)

target_include_directories(cppbdd101.main 
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101>
        $<INSTALL_INTERFACE:${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/cppbdd101>
)

target_link_libraries(cppbdd101.main
    PUBLIC cppbdd101.edac.main
)

# add_executable(cppbdd101.main.bin
    # cppbdd101/main
# )

# target_link_libraries(cppbdd101.main.bin
    # PUBLIC cppbdd101.main
# )

#target_include_directories(${ModuleName} 
    #PUBLIC
    #$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}>
    #$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101>
    #$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
#   PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101"
#)

#target_sources(edac
#    PRIVATE EdacError EdacError
#    PUBLIC Header.hpp)

#set_target_properties(${ModuleName} 
#    PROPERTIES
#    VERSION ${${PROJECT_NAME}_VERSION}
#)

#set_target_properties(${ModuleName}  PROPERTIES
#    DEFINE_SYMBOL MAKEDLL
#    PUBLIC_HEADER "${CMAKE_CURRENT_SOURCE_DIR}"
#)

#target_include_directories(${ModuleName} 
#	PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
#)

#INSTALL(TARGETS qjson EXPORT qjson-export
#        LIBRARY DESTINATION ${LIB_INSTALL_DIR}
#        RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
#        ARCHIVE DESTINATION ${LIB_INSTALL_DIR}
#        FRAMEWORK DESTINATION ${FRAMEWORK_INSTALL_DIR}
#        PUBLIC_HEADER DESTINATION ${INCLUDE_INSTALL_DIR}/qjson
#)

