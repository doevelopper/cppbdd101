set(libname "errh")
set(SOURCE_FILES
    cppbdd101/errh/FutureError
    cppbdd101/errh/IOError
    cppbdd101/errh/GenericError
    cppbdd101/errh/FutureError
)

add_library(${libname} ${SOURCE_FILES})

target_link_libraries(
    ${libname}
    PUBLIC LOG4CXX::LOG4CXX
)

target_include_directories(${libname} PUBLIC ${CMAKE_CURRENT_LIST_DIR})
target_compile_features(
    ${libname}
    PUBLIC
        cxx_strong_enums
        cxx_variadic_templates
        cxx_nullptr
    PRIVATE
        cxx_lambdas
        cxx_range_for
        $<$<CXX_COMPILER_ID:GNU>:cxx_attributes>
)
