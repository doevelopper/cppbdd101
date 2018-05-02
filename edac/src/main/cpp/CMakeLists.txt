

add_library(${ModuleName}.main
    cppbdd101/edac/ErrorsList
    cppbdd101/edac/EdacError
    cppbdd101/edac/LoggingService
    cppbdd101/edac/ErrnoMapper
    cppbdd101/edac/SystemError
    cppbdd101/edac/FutureError
    cppbdd101/edac/GenericError
    cppbdd101/edac/IOError
    cppbdd101/edac/LowLevelApiError
    cppbdd101/edac/IsErrorActive
    cppbdd101/edac/Demangle
    # cppbdd101/edac/private/ErrorCodePrivate
    cppbdd101/edac/Exceptions
)

target_compile_features(
    ${ModuleName}.main
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
    ${ModuleName}.main
    LOG4CXX::LOG4CXX
)

target_include_directories(${ModuleName}.main 
  PUBLIC
      $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101>
      $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101/edac>
      $<INSTALL_INTERFACE:${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/cppbdd101/edac>  # <prefix>/include/edac
)

if(NOT TARGET MAIN::MAIN)
    add_library(MAIN::MAIN UNKNOWN IMPORTED)
    set_target_properties(MAIN::MAIN PROPERTIES
       INTERFACE_COMPILE_DEFINITIONS "${MAIN_DEFINITIONS}"
        IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
	IMPORTED_LOCATION "${CMAKE_INSTALL_LIBDIR}/${ModuleName}.main"
	INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101"
	#INTERFACE_LINK_LIBRARIES ${APR_LIBRARY};${EXPAT_LIBRARY};${APRUTIL_LIBRARY}
    )
endif(NOT TARGET MAIN::MAIN)


# target_link_libraries(
    # ${ModuleName}.main
    # PUBLIC LOG4CXX::LOG4CXX
# )


# add_dependencies(compile ${ModuleName}.main)


#target_sources(edac
#    PRIVATE EdacError EdacError
#    PUBLIC Header.hpp)

#target_compile_options(edac INTERFACE
#   #-std=c++17
#   $<$<CONFIG:Debug>:-g3 -O0 -fstack-protector>
#   $<$<CONFIG:Release>:-g0 -O2>)
