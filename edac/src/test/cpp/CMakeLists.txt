
add_library(cppbdd101.edac.test STATIC
    cppbdd101/edac/GoogleTestCustomEventListener
    cppbdd101/edac/Test
)

# if(NOT TARGET EDAC-TEST::EDAC-TEST)
    # add_library(EDAC-TEST::EDAC-TEST UNKNOWN IMPORTED)
    # set_target_properties(EDAC-TEST::EDAC-TEST PROPERTIES
        # INTERFACE_COMPILE_DEFINITIONS "${EDAC_TEST_DEFINITIONS}"
        # IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
        # IMPORTED_LOCATION "${CMAKE_INSTALL_LIBDIR}/cppbdd101.edac.test.a"
        # INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101"
        # INTERFACE_LINK_LIBRARIES "GMock::GMock;GTest::GTest" #BENCHMARK::BENCHMARK
    # )
# endif(NOT TARGET EDAC-TEST::EDAC-TEST)

target_include_directories(cppbdd101.edac.test 
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101/edac>
        $<INSTALL_INTERFACE:${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/cppbdd101/edac>
)

target_link_libraries(cppbdd101.edac.test
    PUBLIC 
		GMock::GMock 
		GTest::GTest 
		cppbdd101.edac.main
)

add_executable(cppbdd101.edac.test.bin
    cppbdd101/edac/unitTest
    cppbdd101/edac/GtestIssue
    cppbdd101/edac/DemangleTest
    cppbdd101/edac/ErrorsListTest
    cppbdd101/edac/EdacErrorTest
)

target_link_libraries (cppbdd101.edac.test.bin
    PUBLIC 
        cppbdd101.edac.test
)

gtest_discover_tests(cppbdd101.edac.test.bin
	WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
	TEST_PREFIX "EDAC:-: "
	TEST_SUFFIX ---- 
	PROPERTIES LABELS EDAC TEST
	DISCOVERY_TIMEOUT 10
	EXTRA_ARGS --iterration 1 --outputpath ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} --module ${ModuleName}.test
)

# if(ENABLE_COVERAGE)
   # add_coverage_targets(${PROJECT_NAME}CoreTest.bin ${PROJECT_NAME}CoreTest ${CORE_MODULE_ROOT_DIRECTORY})
# endif(ENABLE_COVERAGE)


#add_library(example "")
#target_sources(example
#    PRIVATE
#        cppbdd101/edac/ErrorsListTest
#    # PUBLIC
#    #${CMAKE_CURRENT_LIST_DIR}/example.h
#)
#target_link_libraries(example GTest::GTest ${ModuleName}.main)
#target_include_directories( example
#    PUBLIC
#      ${CMAKE_CURRENT_LIST_DIR}
#)



# add_dependencies(compile ${ModuleName}.main ${ModuleName}.test)

# add_test(NAME ${ModuleName}.test.exec
    # COMMAND ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${ModuleName}.test.bin
    # WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/bin
# )
# set_tests_properties(${ModuleName}.test.exec
    # PROPERTIES PASS_REGULAR_EXPRESSION "mse\\=1\\.2345e\\-6")

#add_custom_target(copy_cfg ALL
#    COMMENT "Copying cfg files"
#)

#add_custom_command(
#    TARGET copy_cfg
#    COMMAND ${CMAKE_COMMAND} -E copy_directory "${PROJECT_SOURCE_DIR}/src/main/resources/config"
#            "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/config"
#)

#add_dependencies(${ModuleName}.test copy_cfg)

