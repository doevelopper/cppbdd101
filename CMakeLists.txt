project (CppBdd101 CXX)
cmake_minimum_required( VERSION 3.7 FATAL_ERROR)

#<major>.<minor>.<micro>.<patch>[-rc<n>]
#<major>.<minor>.<micro>.<patch>[.<tweak>][-rc<n>][-<date>][-<id>]

set(${PROJECT_NAME}_MAJOR_VERSION       "${MAJOR}")
set(${PROJECT_NAME}_MINOR_VERSION       "${MINOR}")
set(${PROJECT_NAME}_MICRO_VERSION       "${MICRO}")
set(${PROJECT_NAME}_PATCH_VERSION       "${PATCH}")
set(${PROJECT_NAME}_PATCH_LEVEL         "${PATCH}")
set(${PROJECT_NAME}_REVISION_VERSION    "${REV}")
set( ${PROJECT_NAME}_VERSION
    "${${PROJECT_NAME}_MAJOR_VERSION}.${${PROJECT_NAME}_MINOR_VERSION}.${${PROJECT_NAME}_PATCH_LEVEL}" )
      # these variables are used to set the correct numbering of
#set(VSTR MAJOR MINOR MICRO PATCH TWEAK PREFIX)

option(ENABLE_QA_CHECK              "Software quality. Conformance to one or more standards"    OFF)
option(ENABLE_COVERAGE              "Build the project with coverage support"                   OFF)
option(ENABLE_CPPLINT               "Ensure that code conforms to Google's coding style guides" OFF)
option(ENABLE_FORMATING_STYLE       "Code Beautifier"                                           OFF)
option(ENABLE_CYCLOMATIC_COMPLEXITY "Cyclomatic Complexity Analyzer"                            OFF)
option(ENABLE_CPPCHECK              "Static code analysis tool "                                OFF)
option(BUILD_SHARED_LIBS            "If enabled, shared libs will be built by default, otherwise static libs" OFF)

list(APPEND CMAKE_MODULE_PATH
    "${CMAKE_SOURCE_DIR}/src/main/resources/cmakeModule"
    "${CMAKE_SOURCE_DIR}/src/main/resources/toolChains"
    "${CMAKE_SOURCE_DIR}/src/main/resources/macros"
    "${CMAKE_SOURCE_DIR}/src/main/resources/config"
    "${CMAKE_SOURCE_DIR}/src/test/resources/cmakeTestModule"
)

set (NSPACE "L")

include(PreventInSourceBuilds)
include(DefinePlatformSpecifc)
include(ProcessorCount)
ProcessorCount(Ncpu)
include(goals)
include(CompilerOption)
include(CodingStyle)
include(cppcheck)
include(CpplintWrapper)
include(cyclomatic)
include(GccCoverage)
include(Rules)

find_package(Log4cxx REQUIRED)
find_package(Threads REQUIRED)
find_package(GTest REQUIRED)
find_package(GMock REQUIRED)
find_package(Cucumber-cpp REQUIRED)
find_package(GoogleBenchmark REQUIRED)
find_package(Doxygen  REQUIRED
             dot
             OPTIONAL_COMPONENTS mscgen dia
)

configure_file("${PROJECT_SOURCE_DIR}/src/main/resources/Config.hpp.in"
               "${CMAKE_CURRENT_BINARY_DIR}/cppbdd101/Config.hpp"
				@ONLY
)

enable_testing()

add_subdirectory(edac)
add_subdirectory(lectures)

#find_package(Boost REQUIRED)
#add_library(boost INTERFACE IMPORTED)
#set_property(TARGET boost PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIR})
#include_directories(src/main/cpp src/test/cpp)
#add_subdirectory (src/main/cpp)
#add_subdirectory (src/test/cpp)
#add_subdirectory (src/it)

#include(InstallRequiredSystemLibraries)
#set(CPACK_PACKAGE_VERSION "${PROJECT_VERSION}")
#set(CPACK_PACKAGE_FILE_NAME "${PROJECT_NAME}-${PROJECT_VERSION}")
#set(CPACK_PACKAGE_INSTALL_DIRECTORY "${PROJECT_NAME}-${PROJECT_VERSION}")
#set(CPACK_GENERATOR "ZIP;TGZ")
#set(CPACK_SOURCE_GENERATOR "ZIP;TGZ")
#include(CPack)
