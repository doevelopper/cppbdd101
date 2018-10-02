

add_library(cppbdd101.lectures.test 
	cppbdd101/lectures/Test
)

target_include_directories(cppbdd101.lectures.test
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101/lectures>
        $<INSTALL_INTERFACE:${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/cppbdd101/lectures>
)

target_link_libraries(cppbdd101.lectures.test 
	PUBLIC 
		cppbdd101.lectures.main
		GMock::GMock
		GTest::GTest
)

add_executable (cppbdd101.lectures.test.bin
	cppbdd101/lectures/unitTest
    cppbdd101/lectures/ggltest/SimpleTest
    cppbdd101/lectures/gotw/ComplexTest
    cppbdd101/lectures/gotw/StackTest
    cppbdd101/lectures/gotw/StackExceptionTest
)

target_link_libraries(cppbdd101.lectures.test.bin
    PUBLIC cppbdd101.lectures.test
)

gtest_discover_tests(cppbdd101.lectures.test.bin
    TEST_PREFIX "LECTURES:-: "
    TEST_SUFFIX ----
    PROPERTIES LABELS CPPBDD101 TEST
    DISCOVERY_TIMEOUT 10
    EXTRA_ARGS --iterration 1 --outputpath ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} --module cppbdd101.lectures.test
    WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
)


#add_executable(cppbdd101.lectures.test.bin ${SRCS})
#target_link_libraries(cppbdd101.lectures.test.bin PRIVATE cppbdd101.lectures.test)

#set_target_properties(cppbdd101.lectures.test PROPERTIES COMPILE_FLAGS -pthread LINK_FLAGS -pthread)
#set_property(TARGET cppbdd101.lectures.test PROPERTY CXX_STANDARD 17)
# Links the test program with GTest
# Links the binary
#target_link_libraries(cppbdd101.lectures.test PRIVATE GTest::GTest cppbdd101.lectures.main)
# Links the headers directory
#target_include_directories(cppbdd101.lectures.test PUBLIC ${GTEST_INCLUDE_DIRS})
# target_include_directories(cppbdd101.lectures.test PUBLIC
  # $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/lectures/ggltest>
  # $<INSTALL_INTERFACE:include/lectures/ggltest>  # <prefix>/include/edac
# )
# target_link_libraries(cppbdd101.lectures.test  cppbdd101.lectures.main)#GTest::GTestMain
# Adds the test program to CMake test
# add_test(NAME ${TEST_TARGET_NAME} COMMAND ${TEST_TARGET_NAME})
#add_executable(edacTest.bin)