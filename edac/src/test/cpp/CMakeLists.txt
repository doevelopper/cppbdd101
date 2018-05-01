
add_library(${ModuleName}.test STATIC
    #cppbdd101/edac/ErrorsListTest
    #cppbdd101/edac/EdacErrorTest
    #cppbdd101/edac/DemangleTest
    cppbdd101/edac/GoogleTestCustomEventListener
    cppbdd101/edac/Test
    #cppbdd101/edac/GtestIssue
)

#add_library(example "")
#target_sources(example
#    PRIVATE
#        cppbdd101/edac/ErrorsListTest
#	# PUBLIC
#	#${CMAKE_CURRENT_LIST_DIR}/example.h
#)
#target_link_libraries(example GTest::GTest ${ModuleName}.main)
#target_include_directories( example
#    PUBLIC
#      ${CMAKE_CURRENT_LIST_DIR}
#)


target_include_directories(${ModuleName}.test 
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101/edac>
        $<INSTALL_INTERFACE:${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/cppbdd101/edac>
)

add_executable(${ModuleName}.test.bin
    cppbdd101/edac/cppbdd101Test
    #cppbdd101/edac/GtestIssue
    cppbdd101/edac/DemangleTest
    cppbdd101/edac/ErrorsListTest
    cppbdd101/edac/EdacErrorTest
)

target_link_libraries(${ModuleName}.test
    PUBLIC
        ${ModuleName}.main
         GMock::GMock
         GTest::GTest
         #PUBLIC BENCHMARK::BENCHMARK
)

target_link_libraries (${ModuleName}.test.bin
    PUBLIC 
        ${ModuleName}.test
        ${ModuleName}.main
    #   GMock::GMock
    #   GTest::GTest
)

add_test(NAME ${ModuleName}.bin
    WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} 
    COMMAND ${ModuleName}.test.bin #--iterration 1 --outputpath ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} --module ${ModuleName}.test
)


# if(ENABLE_COVERAGE)
   # add_coverage_targets(${PROJECT_NAME}CoreTest.bin ${PROJECT_NAME}CoreTest ${CORE_MODULE_ROOT_DIRECTORY})
# endif(ENABLE_COVERAGE)


# add_dependencies(compile ${ModuleName}.main ${ModuleName}.test)

# add_test(NAME ${ModuleName}.test.exec
    # COMMAND ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${ModuleName}.test.bin
    # WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/bin
# )
# set_tests_properties(${ModuleName}.test.exec
    # PROPERTIES PASS_REGULAR_EXPRESSION "mse\\=1\\.2345e\\-6")

add_custom_target(copy_cfg ALL
    COMMENT "Copying cfg files"
)

add_custom_command(
    TARGET copy_cfg
    COMMAND ${CMAKE_COMMAND} -E copy_directory "${PROJECT_SOURCE_DIR}/src/main/resources/config"
            "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/config"
)

add_dependencies(${ModuleName}.test copy_cfg)

