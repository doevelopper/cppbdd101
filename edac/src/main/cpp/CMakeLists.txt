
set(SOURCE_FILES
    edac/ErrorsList
    edac/EdacError
)

add_library(edac ${SOURCE_FILES})

target_compile_features(
    edac
    PUBLIC
        cxx_strong_enums
        cxx_variadic_templates
        cxx_nullptr
    PRIVATE
        cxx_lambdas
        cxx_range_for
        $<$<CXX_COMPILER_ID:GNU>:cxx_attributes>
)

target_link_libraries(
    edac
    PUBLIC LOG4CXX::LOG4CXX
)

target_include_directories(edac PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/mylib>
  $<INSTALL_INTERFACE:include/edac>  # <prefix>/include/edac
)

#target_sources(edac
#    PRIVATE EdacError EdacError
#    PUBLIC Header.hpp)

#target_compile_options(edac INTERFACE
#   #-std=c++17
#   $<$<CONFIG:Debug>:-g3 -O0 -fstack-protector>
#   $<$<CONFIG:Release>:-g0 -O2>)
