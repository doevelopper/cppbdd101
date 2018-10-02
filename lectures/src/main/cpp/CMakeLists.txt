
add_library(cppbdd101.lectures.main

    cppbdd101/lectures/ggltest/Simple
    cppbdd101/lectures/gotw/Complex
    cppbdd101/lectures/gotw/StackException
    cppbdd101/lectures/gotw/Stack

)

target_compile_features(
    cppbdd101.lectures.main
    PUBLIC
        cxx_strong_enums
        cxx_variadic_templates
        cxx_nullptr
    PRIVATE
        cxx_lambdas
        cxx_range_for
        $<$<CXX_COMPILER_ID:GNU>:cxx_attributes>
)

target_link_libraries(cppbdd101.lectures.main
    PUBLIC 
		LOG4CXX::LOG4CXX
		cppbdd101.edac.main
)

target_include_directories(cppbdd101.lectures.main PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/lectures/ggltest>
  $<INSTALL_INTERFACE:include/lectures/ggltest>
)
