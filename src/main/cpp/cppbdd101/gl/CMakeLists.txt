include_directories(.)

set(SOURCE_FILES
    Painter
    Turtle
)
add_library(gl ${SOURCE_FILES})
target_link_libraries(gl ${THIRD_PARTY_LIB})