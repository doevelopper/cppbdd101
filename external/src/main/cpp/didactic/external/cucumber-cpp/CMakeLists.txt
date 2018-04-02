set(CUKE_BOOST_LIBS thread system regex date_time program_options)
find_package(Boost COMPONENTS ${CUKE_BOOST_LIBS} QUIET)

if(Boost_FOUND)
	include(ExternalProject)
	set(CUCUMBER_ROOT "${CMAKE_CURRENT_BINARY_DIR}/cucumber")
	set(CUCUMBER_LIBRARY "${CUCUMBER_ROOT}/src/cucumber-cpp-build/src/libcucumber-cpp.a")
	set(CUCUMBER_LIBRARY_NO_MAIN "${CUCUMBER_ROOT}/src/cucumber-cpp-build/src/libcucumber-cpp-nomain.a")
	ExternalProject_Add(
            cucumber-cpp 
            # GIT_REPOSITORY https://github.com/konserw/cucumber-cpp.git
            GIT_REPOSITORY https://github.com/cucumber/cucumber-cpp.git
            GIT_TAG master
            PREFIX ${CUCUMBER_ROOT}
            CMAKE_ARGS -DCUKE_DISABLE_BOOST_TEST:bool=on -DCUKE_DISABLE_GTEST:bool=on -DCUKE_DISABLE_E2E_TESTS:bool=on -DCUKE_DISABLE_UNIT_TESTS:bool=on -DCUKE_ENABLE_EXAMPLES:bool=off -DGMOCK_VER:string=1.7.0
            INSTALL_COMMAND ""
            LOG_DOWNLOAD ON
            LOG_CONFIGURE ON
            LOG_BUILD ON
            BUILD_BYPRODUCTS "${CUCUMBER_LIBRARY}"
       #     BUILD_BYPRODUCTS "${CUCUMBER_LIBRARY_NO_MAIN}"
	)

	add_library(libcucumber-cpp IMPORTED STATIC GLOBAL)
	# add_dependencies(libcucumber-cpp cucumber-cpp)

	ExternalProject_Get_Property(cucumber-cpp source_dir binary_dir)

	if(NOT TARGET Cucumber::Cucumber-cpp)
		add_library(Cucumber::Cucumber-cpp UNKNOWN IMPORTED)
		set_target_properties(
			Cucumber::Cucumber-cpp PROPERTIES
			IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
			IMPORTED_LOCATION "${CUKE_LIBRARY}"
			INTERFACE_LINK_LIBRARIES "Threads::Threads"
			INTERFACE_INCLUDE_DIRECTORIES "${CUKE_INCLUDE_DIRS}"
		)
	endif(NOT TARGET Cucumber::Cucumber-cpp)	

endif(Boost_FOUND)