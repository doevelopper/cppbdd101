
add_library(cppbdd101.edac.main
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

target_compile_features(cppbdd101.edac.main
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

if(NOT TARGET EDAC-MAIN::EDAC-MAIN)
    add_library(EDAC-MAIN::EDAC-MAIN UNKNOWN IMPORTED)
    set_target_properties(EDAC-MAIN::EDAC-MAIN PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "${EDAC_MAIN_DEFINITIONS}"
        IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
        IMPORTED_LOCATION "${CMAKE_INSTALL_LIBDIR}/cppbdd101.edac.main.a"
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101"
        INTERFACE_LINK_LIBRARIES "LOG4CXX::LOG4CXX"
    )
endif(NOT TARGET EDAC-MAIN::EDAC-MAIN)

target_compile_options(cppbdd101.edac.main INTERFACE
#-std=c++17
# $<$<CONFIG:Debug>:-g3 -O0 -fstack-protector>
$<$<CONFIG:Release>:-g0 -O2>
)

target_link_libraries(cppbdd101.edac.main
    LOG4CXX::LOG4CXX
)

target_include_directories(cppbdd101.edac.main
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101/edac>
        $<INSTALL_INTERFACE:${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/cppbdd101/edac>
)
