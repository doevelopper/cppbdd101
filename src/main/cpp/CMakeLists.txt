
set(ModuleName "cppbdd101.main")

add_library(${ModuleName}
	cppbdd101/Dummy	
	cppbdd101/Interface
)

target_include_directories(${ModuleName} PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101>
    $<INSTALL_INTERFACE:${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/cppbdd101>
)

#set_target_properties(
#    ${ModuleName}
#    PROPERTIES INTERFACE_INCLUDE_DIRECTORIES
#    "${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101"
#)

add_executable (
    ${ModuleName}.bin
    cppbdd101/main
)

include(GenerateExportHeader)
generate_export_header(${ModuleName}
    EXPORT_FILE_NAME "${CMAKE_CURRENT_BINARY_DIR}/Config.hpp"
    EXPORT_MACRO_NAME API_DECLS
    BASE_NAME cpp101
    PREFIX_NAME CB1_
)

target_compile_features(${ModuleName}
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

target_link_libraries(
    ${ModuleName}
    PUBLIC LOG4CXX::LOG4CXX
)

target_link_libraries(${ModuleName}.bin
    PUBLIC ${ModuleName}
)


#target_compile_options(${ModuleName} INTERFACE
#   -Wall
#   $<$<CONFIG:Debug>:-g3 -O0 -fstack-protector>
#   $<$<CONFIG:Release>:-g0 -O2>
#)

#target_include_directories(${ModuleName} 
	#PUBLIC
    #$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}>
	#$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101>
	#$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
#	PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101"
#)

#target_sources(edac
#    PRIVATE EdacError EdacError
#    PUBLIC Header.hpp)

#target_compile_options(edac INTERFACE
#   #-std=c++17
#   $<$<CONFIG:Debug>:-g3 -O0 -fstack-protector>
#   $<$<CONFIG:Release>:-g0 -O2>)

#target_compile_definitions(${ModuleName} 
#   PUBLIC
#    $<$<CONFIG:Release>:API_DECLS>
#    $<$<CONFIG:Release>:LOG4CXX_STATIC>
#    $<$<CONFIG:Release>:APR_DECLARE_STATIC>
#    $<$<OR:$<CONFIG:Release>,$<CONFIG:PROF>>:DISABLE_VAR>
#)

#target_compile_options(${ModuleName} 
#    PUBLIC "$<$<CONFIG:DEBUG>:${MY_DEBUG_OPTIONS}>"
#           "$<$<CONFIG:Debug>:-O0>"
#           "$<$<CONFIG:Debug>:-ggdb>"
#)

#target_compile_options(${ModuleName} 
#    PUBLIC "$<$<CONFIG:RELEASE>:${MY_RELEASE_OPTIONS}>"
#           "$<$<CONFIG:Release>:-ffunction-sections>"
#           "$<$<CONFIG:Release>:-fdata-sections>"
#           "$<$<CONFIG:Release>:-Wl,--gc-sections>"
#)

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

