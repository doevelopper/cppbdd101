set(SRCS 
    lectures/ggltest/Simple

    lectures/gotw/Complex
    lectures/gotw/StackException
    lectures/gotw/Stack
)

add_library(${ModuleName}.main ${SRCS})

#target_compile_features(
#    ${ModuleName}.main
#    PUBLIC
#        cxx_strong_enums
#        cxx_variadic_templates
#        cxx_nullptr
#    PRIVATE
#        cxx_lambdas
#        cxx_range_for
#        $<$<CXX_COMPILER_ID:GNU>:cxx_attributes>
#)

#target_link_libraries(
#    ${ModuleName}.main
#    PUBLIC LOG4CXX::LOG4CXX
#)

target_include_directories(${ModuleName}.main PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/lectures/ggltest>
  $<INSTALL_INTERFACE:include/lectures/ggltest>
)
