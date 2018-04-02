set(CUKE_BOOST_LIBS thread system regex date_time program_options)
find_package(Boost COMPONENTS ${CUKE_BOOST_LIBS})

if(Boost_FOUND)
	include(ExternalProject)
	set(CUCUMBER_ROOT "${CMAKE_CURRENT_BINARY_DIR}/cucumber")
	set(CUCUMBER_LIBRARY "${CUCUMBER_ROOT}/src/cucumber-cpp-build/src/libcucumber-cpp.a")
	ExternalProject_Add(
            cucumber-cpp
            # GIT_REPOSITORY https://github.com/konserw/cucumber-cpp.git
            GIT_REPOSITORY https://github.com/cucumber/cucumber-cpp.git
            GIT_TAG master
            PREFIX ${CUCUMBER_ROOT}
            CMAKE_ARGS -DCUKE_DISABLE_BOOST_TEST:bool=on -DCUKE_DISABLE_GTEST:bool=on -DCUKE_DISABLE_UNIT_TESTS:bool=on -DCUKE_ENABLE_EXAMPLES:bool=off -DGMOCK_VER:string=1.7.0
            INSTALL_COMMAND ""
            LOG_DOWNLOAD ON
            LOG_CONFIGURE ON
            LOG_BUILD ON
            BUILD_BYPRODUCTS "${CUCUMBER_LIBRARY}"
       #     BUILD_BYPRODUCTS "${CUCUMBER_MAIN_LIBRARY}"
			# COMMAND ${CMAKE_COMMAND} -E copy_directory "${CUCUMBER_ROOT}/src/cucumber-cpp/include" "${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}"
	)

	# ExternalProject_Add_Step( cucumber-cpp copy-cuke-libs
		# COMMENT "Copy library and headers to install dir"     # Text printed when step executes
		# COMMAND ${CMAKE_COMMAND} -E echo "Copy library and headers to install dir"
		# COMMAND ${CMAKE_COMMAND} -E copy_directory "${CUCUMBER_ROOT}/src/cucumber-cpp/include" "${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}"
		# DEPENDERS download 
	# )

endif(Boost_FOUND)

set(CUCUMBERTEST_TEST_DEPENDENCIES
		${CUCUMBER_LIBRARY}
		# ${GTEST_BOTH_LIBRARIES}
		${GTEST_LIBRARIES}
		cucumberTest
		${CMAKE_THREAD_LIBS_INIT}
		# ${GMOCK_BOTH_LIBRARIES}
		${GMOCK_LIBRARIES}
		${Boost_LIBRARIES}
)


macro(add_new_cucumber_test TEST_SOURCE FOLDER_NAME)
    set (TARGET_NAME ${TEST_SOURCE}_TESTTARGET)
    add_executable(${TARGET_NAME} ${CMAKE_SOURCE_DIR}/features/step_definitions/${TEST_SOURCE})
    target_link_libraries(${TARGET_NAME} ${CUCUMBERTEST_TEST_DEPENDENCIES})
    add_test(NAME ${TEST_SOURCE} COMMAND ${TARGET_NAME})
    set_property(TARGET ${TARGET_NAME} PROPERTY FOLDER ${FOLDER_NAME})
endmacro()

# add_new_cucumber_test test_source(AdditionTest  "cucumberTest_tests")