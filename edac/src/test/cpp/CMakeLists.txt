set(SOURCE_FILES
    cppbdd101/edac/ErrorsListTest
    cppbdd101/edac/EdacErrorTest
	cppbdd101/edac/Test
)

add_library(${ModuleName}.test ${SOURCE_FILES})
target_link_libraries(${ModuleName}.test PRIVATE GTest::GTest ${ModuleName}.main)

add_executable(${ModuleName}.test.bin
	# cppbdd101/edac/Test
	cppbdd101/edac/cppbdd101Test
)

target_link_libraries( ${ModuleName}.test.bin ${ModuleName}.test )

# add_dependencies(compile ${ModuleName}.main ${ModuleName}.test)

add_test(NAME ${ModuleName}.test
    COMMAND ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${ModuleName}.test
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/bin
)

add_custom_target(copy_cfg ALL
        COMMENT "Copying cfg files"
)

add_custom_command(
	TARGET copy_cfg
	COMMAND ${CMAKE_COMMAND} -E copy_directory "${PROJECT_SOURCE_DIR}/src/main/resources/config"
            "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/config")

add_dependencies(${ModuleName}.test copy_cfg)