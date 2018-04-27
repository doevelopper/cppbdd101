#------------------------------------------------------------------------------------#
#-----------------------------FIND CUCUMBER-CPP----------------------------------#
#------------------------------------------------------------------------------------#

include(ExternalProject)

set(CUCUMBER_CPP_BUILD_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-build)

#set(cucumber_cpp_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}")
#set(cucumber_cpp_INCLUDE_DIR "${CMAKE_INSTALL_INCLUDEDIR}")
#set(cucumber_cpp_LIBRARY_DIR "${CMAKE_INSTALL_LIBDIR}")

ExternalProject_Add(extern_cucumber_cpp
    PREFIX "${CMAKE_CURRENT_BINARY_DIR}/cucumber-cpp"
    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/cucumber-cpp-v0.4"
    CMAKE_ARGS
        -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
        -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
	-DCUKE_DISABLE_BOOST_TEST:bool=ON 
	-DCUKE_DISABLE_GTEST:bool=OFF
	-DCUKE_USE_STATIC_GTEST:bool=ON	
	-DCUKE_DISABLE_E2E_TESTS:bool=ON
	-DCUKE_DISABLE_UNIT_TESTS:bool=ON 
	-DCUKE_ENABLE_EXAMPLES:bool=OFF
	-DGTEST_ROOT:string="${CMAKE_INSTALL_LIBDIR} ${CMAKE_INSTALL_INCLUDEDIR}" 
	-DGMOCK_ROOT:string="${CMAKE_INSTALL_LIBDIR} ${CMAKE_INSTALL_INCLUDEDIR}"
        -DGMOCK_VER:string="1.8.0"
    #INSTALL_DIR ${cucumber_cpp_INSTALL_DIR}
    DEPENDS extern_googletest extern_boost
    STEP_TARGETS CopyConfigFileToInstall
)

ExternalProject_Add_Step(extern_cucumber_cpp CopyConfigFileToInstall
  # COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/.... ${CMAKE_INSTALL_PREFIX}/...
  COMMENT "Step target Install configuration file"
)

#add_library(cucumber-cpp STATIC IMPORTED)

#set_target_properties(cucumber-cpp
#    PROPERTIES
#    IMPORTED_LOCATION
#            ${cucumber_cpp_LIBRARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}cucumber_cpp${CMAKE_STATIC_LIBRARY_SUFFIX}
#)
#add_dependencies(cucumber-cpp extern_cucumber_cpp)
#include_directories(${cucumber_cpp_INCLUDE_DIR})


#set(CUKE_BOOST_LIBS thread system regex date_time program_options)
#find_package(Boost COMPONENTS ${CUKE_BOOST_LIBS} QUIET)
#
#if(Boost_FOUND)
#	include(ExternalProject)
#	set(CUCUMBER_ROOT "${CMAKE_CURRENT_BINARY_DIR}/cucumber")
#	set(CUCUMBER_LIBRARY "${CUCUMBER_ROOT}/src/cucumber-cpp-build/src/libcucumber-cpp.a")
#	set(CUCUMBER_LIBRARY_NO_MAIN "${CUCUMBER_ROOT}/src/cucumber-cpp-build/src/libcucumber-cpp-nomain.a")
#	ExternalProject_Add(
#            cucumber-cpp 
#            # GIT_REPOSITORY https://github.com/konserw/cucumber-cpp.git
#            #GIT_REPOSITORY https://github.com/cucumber/cucumber-cpp.git
#            #GIT_TAG master
#            PREFIX ${CUCUMBER_ROOT}
#            CMAKE_ARGS -DCUKE_DISABLE_BOOST_TEST:bool=on -DCUKE_DISABLE_GTEST:bool=on -DCUKE_DISABLE_E2E_TESTS:bool=on -DCUKE_DISABLE_UNIT_TESTS:bool=on -DCUKE_ENABLE_EXAMPLES:bool=off -DGMOCK_VER:string=1.7.0
#            INSTALL_COMMAND ""
#            LOG_DOWNLOAD ON
#            LOG_CONFIGURE ON
#            LOG_BUILD ON
#            BUILD_BYPRODUCTS "${CUCUMBER_LIBRARY}"
#       #     BUILD_BYPRODUCTS "${CUCUMBER_LIBRARY_NO_MAIN}"
#	)
#
#	add_library(libcucumber-cpp IMPORTED STATIC GLOBAL)
#	# add_dependencies(libcucumber-cpp cucumber-cpp)
#
#	ExternalProject_Get_Property(cucumber-cpp source_dir binary_dir)
#
#	if(NOT TARGET Cucumber::Cucumber-cpp)
#		add_library(Cucumber::Cucumber-cpp UNKNOWN IMPORTED)
#		set_target_properties(
#			Cucumber::Cucumber-cpp PROPERTIES
#			IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
#			IMPORTED_LOCATION "${CUKE_LIBRARY}"
#			INTERFACE_LINK_LIBRARIES "Threads::Threads"
#			INTERFACE_INCLUDE_DIRECTORIES "${CUKE_INCLUDE_DIRS}"
#		)
#	endif(NOT TARGET Cucumber::Cucumber-cpp)	
#
#endif(Boost_FOUND)
