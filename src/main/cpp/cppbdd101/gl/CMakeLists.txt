
set(SOURCE_FILES
    Painter
    Turtle
)

add_library(gl ${SOURCE_FILES})

target_link_libraries(gl ${THIRD_PARTY_LIB})
target_include_directories(gl PUBLIC ${CMAKE_CURRENT_LIST_DIR})

#target_compile_features(
#    gl
#    PUBLIC
#        cxx_strong_enums
#        cxx_variadic_templates
#        cxx_nullptr
#    PRIVATE
#        cxx_lambdas
#        cxx_range_for
#        $<$<CXX_COMPILER_ID:GNU>:cxx_attributes>
#)
#
#target_link_libraries(
#    gl
#    PUBLIC LOG4CXX::LOG4CXX
#)
