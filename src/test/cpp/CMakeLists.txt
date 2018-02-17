include_directories(.)
add_subdirectory(cppbdd101/gl)
set(SOURCE_FILES
    cppbdd101/ApplicationTest
)

add_library(${PROJECT_NAME}Test ${SOURCE_FILES})
target_link_libraries(${PROJECT_NAME}Test  ${PROJECT_NAME} gl ${TEST_THIRD_PARTY_LIB})

set_target_properties(${PROJECT_NAME}Test PROPERTIES
    VERSION ${APP_VERSION_STR}
    SOVERSION ${PROJECT_VERSION_MAJOR}
)

add_executable(${PROJECT_NAME}Test.bin cppbdd101Test.cpp Test.cpp )
#add_test(${PROJECT_NAME}UnitTest ${PROJECT_NAME}Test.bin)
#add_test( NAME ${TARGET_NAME} COMMAND ${TARGET_NAME} -o report.xml -r junit)
target_link_libraries(${PROJECT_NAME}Test.bin  ${TEST_THIRD_PARTY_LIB}) #${PROJECT_NAME}
