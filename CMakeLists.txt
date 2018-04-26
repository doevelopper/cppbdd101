#message (STATUS "CUCUMBER_CUCUMBER_INCLUDE_DIR ${CUCUMBER_CUCUMBER_INCLUDE_DIR}")
#[==[
    #[=[

    #]=]
#]==]

project (CPPBDD101 C CXX)  # Some external  libaries ahs c extention

cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

#<major>.<minor>.<micro>.<patch>[.<tweak>][-rc<n>][-<date>][-<id>]

set(${PROJECT_NAME}_MAJOR_VERSION       "1")
set(${PROJECT_NAME}_MINOR_VERSION       "0")
set(${PROJECT_NAME}_MICRO_VERSION       "0")
set(${PROJECT_NAME}_PATCH_VERSION       "-")
set(${PROJECT_NAME}_PATCH_LEVEL         "0")
set(${PROJECT_NAME}_REVISION_VERSION    "0")
set(${PROJECT_NAME}_VERSION
    "${${PROJECT_NAME}_MAJOR_VERSION}.${${PROJECT_NAME}_MINOR_VERSION}.${${PROJECT_NAME}_PATCH_LEVEL}" )
      # these variables are used to set the correct numbering of
#set(VSTR MAJOR MINOR MICRO PATCH TWEAK PREFIX)

option(BUILD_SHARED_LIBS            "If enabled, shared libs will be built by default, otherwise static libs" OFF)
add_definitions(-DRELEASE_LEVEL="SNAPSHOOT") # SNAPSHOOT ,ALPHA , BETA , CANDIDATE , FINAL.

list(APPEND CMAKE_MODULE_PATH
    "${CMAKE_SOURCE_DIR}/src/main/resources/macros"
    "${CMAKE_SOURCE_DIR}/src/main/resources/cmakeModule"
)

include(TestBigEndian)
TEST_BIG_ENDIAN(IS_BIG_ENDIAN)

if(IS_BIG_ENDIAN)
     message(FATAL_ERROR "Big endian isn't supported !!!")
endif(IS_BIG_ENDIAN)

include(ProcessorCount)
ProcessorCount(N)

include(Rules)

add_subdirectory (external)

#set(Boost_NO_SYSTEM_PATHS TRUE)
#if(Boost_NO_SYSTEM_PATHS)
   #set(BOOST_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/../../external/boost")
   #   set(BOOST_ROOT "${CMAKE_INSTALL_PREFIX}")
   #set(BOOST_INCLUDE_DIRS "${BOOST_ROOT}/include")
   #set(BOOST_LIBRARY_DIRS "${BOOST_ROOT}/lib")
#endif (Boost_NO_SYSTEM_PATHS)


find_package(Log4cxx)
find_package(GoogleTest)

include(CTest)

add_subdirectory (src/main/cpp)
add_subdirectory (src/test/cpp)
add_subdirectory (src/it)

