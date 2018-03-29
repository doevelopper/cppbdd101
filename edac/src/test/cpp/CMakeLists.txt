set(SOURCE_FILES
    cppbdd101/edac/ErrorsListTest
    cppbdd101/edac/EdacErrorTest
    cppbdd101/edac/Test
)

add_library(${ModuleName}.test ${SOURCE_FILES})

target_include_directories(${ModuleName}.test PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101/edac>
  $<INSTALL_INTERFACE:${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/cppbdd101/edac>  # <prefix>/include/edac
)

add_executable(${ModuleName}.test.bin
    # cppbdd101/edac/Test
    cppbdd101/edac/cppbdd101Test
)


target_link_libraries(${ModuleName}.test PRIVATE ${GTEST_LIBRARY} ${ModuleName}.main)


target_link_libraries (${ModuleName}.test.bin
                        ${LOG4CXX_LIBRARIES}
                        ${APRUTIL_LIBRARY}
                        ${APR_LIBRARY}
                        ${EXPAT_LIBRARY}
                        ${GTEST_LIBRARY}
                        ## ${GMOCK_LIBRARIES}
                        ## gmock_main.d
                        # pthread
                        ${ModuleName}.main
						${ModuleName}.test
)


# target_link_libraries(${ModuleName}.test PRIVATE ${GTEST_LIBRARY} ${ModuleName}.main) #${LOG4CXX_LIBRARY_RELEASE}
# target_link_libraries( ${ModuleName}.test.bin
    # ${ModuleName}.test
    # ${APR_LIBRARY}
    # ${ModuleName}.main
    # ${APR_LIBRARY}
    # ${EXPAT_LIBRARY}
    # ${APRUTIL_LIBRARY}
    # ${LOG4CXX_LIBRARY_RELEASE}
# )

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
            "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/config")

add_dependencies(${ModuleName}.test copy_cfg)