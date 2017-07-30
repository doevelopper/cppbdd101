include_directories(.)
add_subdirectory(cppbdd101/gl)
set(SOURCE_FILES
    cppbdd101/ApplicationTest
)

add_library(${PROJECT_NAME}Test ${SOURCE_FILES})
add_executable(${PROJECT_NAME}Test.bin cppbdd101Test.cpp Test.cpp )

target_link_libraries(${PROJECT_NAME}Test.bin  ${TEST_THIRD_PARTY_LIB})
