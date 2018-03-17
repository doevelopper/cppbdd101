
set(SRCS 
    lectures/ggltest/SimpleTest
    lectures/gotw/ComplexTest
    lectures/gotw/StackTest
    lectures/gotw/StackExceptionTest
)

add_library(${ModuleName}.test ${SRCS})
target_link_libraries(${ModuleName}.test PRIVATE GTest::GTest ${ModuleName}.main)#GTest::GTestMain
#add_executable(${ModuleName}.test.bin ${SRCS})
#target_link_libraries(${ModuleName}.test.bin PRIVATE ${ModuleName}.test)

#set_target_properties(${ModuleName}.test PROPERTIES COMPILE_FLAGS -pthread LINK_FLAGS -pthread)
#set_property(TARGET ${ModuleName}.test PROPERTY CXX_STANDARD 17)
# Links the test program with GTest
# Links the binary
#target_link_libraries(${ModuleName}.test PRIVATE GTest::GTest ${ModuleName}.main)
# Links the headers directory
#target_include_directories(${ModuleName}.test PUBLIC ${GTEST_INCLUDE_DIRS})
# target_include_directories(${ModuleName}.test PUBLIC
  # $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/lectures/ggltest>
  # $<INSTALL_INTERFACE:include/lectures/ggltest>  # <prefix>/include/edac
# )
# target_link_libraries(${ModuleName}.test  ${ModuleName}.main)#GTest::GTestMain
# Adds the test program to CMake test
# add_test(NAME ${TEST_TARGET_NAME} COMMAND ${TEST_TARGET_NAME})
#add_executable(edacTest.bin)