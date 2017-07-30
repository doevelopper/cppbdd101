include_directories(.)

set(SOURCE_FILES
    ExtendedTurtleTest
    FakeTurtle
    MockTurtle
    MockTurtleDelegate
    PainterTest
    SimpleTurtleTest
    TurtleTest
)
add_library(glTest ${SOURCE_FILES})
target_link_libraries(glTest ${THIRD_PARTY_LIB} ${TEST_THIRD_PARTY_LIB})
