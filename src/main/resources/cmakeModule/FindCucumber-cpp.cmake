#.rst:
# FindCUCUMBER
# -------
#
# Find libcucumber-cpp, the official reference library for the CUCUMBER image format.
#
# Imported targets
# ^^^^^^^^^^^^^^^^
#
# This module defines the following :prop_tgt:`IMPORTED` target:
#
# ``CUCUMBER::CUCUMBER``
#   The libcucumber-cpp library, if found.
#
# Result variables
# ^^^^^^^^^^^^^^^^
#
# This module will set the following variables in your project:
#
# ``CUCUMBER_INCLUDE_DIRS``
#   where to find autodetect.hpp, etc.
# ``CUCUMBER_LIBRARIES``
#   the libraries to link against to use CUCUMBER.
# ``CUCUMBER_DEFINITIONS``
#   You should add_definitions(${CUCUMBER_DEFINITIONS}) before compiling code
#   that includes cucumber-cpp library files.
# ``CUCUMBER_FOUND``
#   If false, do not try to use CUCUMBER.
# ``CUCUMBER_VERSION_STRING``
#   the version of the CUCUMBER library found (since CMake 2.8.8)
#
# Obsolete variables
# ^^^^^^^^^^^^^^^^^^
#
# The following variables may also be set, for backwards compatibility:
#
# ``CUCUMBER_LIBRARY``
#   where to find the CUCUMBER library.
# ``CUCUMBER_INCLUDE_DIR``
#   where to find the CUCUMBER headers (same as CUCUMBER_INCLUDE_DIRS)
#
# Since CUCUMBER depends on the boost library, none of the above
# will be defined unless boost can be found.

find_package(Boost QUIET)

if(Boost_FOUND)
    #message (STATUS "BOOST found. Checking Cucumber")
    find_path(CUCUMBER_CUCUMBER_INCLUDE_DIR cucumber-cpp/autodetect.hpp
        #NAMES_PER_DIR
        /usr/local/include/cucumber-cpp
        /usr/include/cucumber-cpp
        /msys64/mingw64/include/cucumber-cpp
        /mingw64/include/cucumber-cpp
        /include/cucumber-cpp
    )
    list(APPEND CUCUMBER_NAMES cucumber-cpp libcucumber-cpp)
    list(APPEND CUCUMBER_NO_MAIN_NAMES cucumber-cpp-nomain libcucumber-cpp-nomain)
    unset(CUCUMBER_NAMES_DEBUG)
    #set(_CUCUMBER_VERSION_SUFFIXES 0.1 0.2 0.3 0.3.1 0.3.2 0.4)
    set(_CUCUMBER_VERSION_SUFFIXES )

    #message (STATUS "CUCUMBER_CUCUMBER_INCLUDE_DIR ${CUCUMBER_CUCUMBER_INCLUDE_DIR}")
#[==[
    #[=[

    #]=]
#]==]
    if (CUCUMBER_FIND_VERSION MATCHES "^([0-9]+)\\.([0-9]+)(\\..*)?$")
        set(_CUCUMBER_VERSION_SUFFIX_MIN "${CMAKE_MATCH_1}${CMAKE_MATCH_2}")
        if (CUCUMBER_FIND_VERSION_EXACT)
            set(_CUCUMBER_VERSION_SUFFIXES ${_CUCUMBER_VERSION_SUFFIX_MIN})
        else ()
            string(REGEX REPLACE
                "${_CUCUMBER_VERSION_SUFFIX_MIN}.*" "${_CUCUMBER_VERSION_SUFFIX_MIN}"
                _CUCUMBER_VERSION_SUFFIXES "${_CUCUMBER_VERSION_SUFFIXES}")
        endif ()
        unset(_CUCUMBER_VERSION_SUFFIX_MIN)
    endif ()

    foreach(v IN LISTS _CUCUMBER_VERSION_SUFFIXES)
        list(APPEND CUCUMBER_NAMES cucumber-cpp${v} libcucumber-cpp${v})
        list(APPEND CUCUMBER_NAMES_DEBUG cucumber-cpp${v}d libcucumber-cpp${v}d)
        list(APPEND CUCUMBER_NO_MAIN_NAMES cucumber-cpp-nomain${v} libcucumber-cpp-nomain${v})
        list(APPEND CUCUMBER_NO_MAIN_NAMES_DEBUG cucumber-cpp-nomain${v}d libcucumber-cpp-nomain${v}d)
    endforeach()
    #message (STATUS "CUCUMBER_NAMES ${CUCUMBER_NAMES}")
    #message (STATUS "CUCUMBER_NAMES_DEBUG ${CUCUMBER_NAMES_DEBUG}")

    unset(_CUCUMBER_VERSION_SUFFIXES)

    if(NOT CUCUMBER_LIBRARY)
        find_library(CUCUMBER_LIBRARY_RELEASE NAMES ${CUCUMBER_NAMES})
        find_library(CUCUMBER_LIBRARY_DEBUG NAMES ${CUCUMBER_NAMES_DEBUG})
        find_library(CUCUMBER_NO_MAIN_LIBRARY_RELEASE NAMES ${CUCUMBER_NO_MAIN_NAMES})
        find_library(CUCUMBER_NO_MAIN_LIBRARY_DEBUG NAMES ${CUCUMBER_NO_MAIN_NAMES_DEBUG})
        include(SelectLibraryConfigurations)
        select_library_configurations(CUCUMBER)
        mark_as_advanced(CUCUMBER_LIBRARY_RELEASE CUCUMBER_LIBRARY_DEBUG)
    endif()

    unset(CUCUMBER_NAMES)
    unset(CUCUMBER_NAMES_DEBUG)
    unset(CUCUMBER_NO_MAIN_NAMES)
    unset(CUCUMBER_NO_MAIN_NAMES_DEBUG)
    # Set by select_library_configurations(), but we want the one from
    # find_package_handle_standard_args() below.

    unset(CUCUMBER_FOUND)

    if (CUCUMBER_LIBRARY AND CUCUMBER_CUCUMBER_INCLUDE_DIR)
        #message (STATUS "CUCUMBER_LIBRARY ${CUCUMBER_LIBRARY}")
        #message (STATUS "CUCUMBER_CUCUMBER_INCLUDE_DIR ${CUCUMBER_CUCUMBER_INCLUDE_DIR}")
        set(CUCUMBER_INCLUDE_DIRS ${CUCUMBER_CUCUMBER_INCLUDE_DIR} ${BOOST_INCLUDE_DIR} )
        set(CUCUMBER_INCLUDE_DIR ${CUCUMBER_INCLUDE_DIRS} ) # for backward compatibility
        set(CUCUMBER_LIBRARIES ${CUCUMBER_LIBRARY} ${BOOST_LIBRARY})
        set(CUCUMBER_DEFINITIONS -DCUCUMBER_STATIC)

        if(NOT TARGET CUCUMBER-CPP::CUCUMBER-CPP)
            add_library(CUCUMBER-CPP::CUCUMBER-CPP UNKNOWN IMPORTED)
            set_target_properties(CUCUMBER-CPP::CUCUMBER-CPP PROPERTIES
                INTERFACE_COMPILE_DEFINITIONS "${CUCUMBER_DEFINITIONS}"
                INTERFACE_INCLUDE_DIRECTORIES "${CUCUMBER_INCLUDE_DIRS}"
                INTERFACE_LINK_LIBRARIES Boost::Boost)

                if(EXISTS "${CUCUMBER_LIBRARY}")
                    #message (STATUS "CUCUMBER_LIBRARY SET PROPERTY ${CUCUMBER_LIBRARY}")
                    set_target_properties(CUCUMBER-CPP::CUCUMBER-CPP PROPERTIES
                        IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
                        IMPORTED_LOCATION "${CUCUMBER_LIBRARY}")
                endif(EXISTS "${CUCUMBER_LIBRARY}")

                if(EXISTS "${CUCUMBER_LIBRARY_RELEASE}")
                    #message (STATUS "CUCUMBER_LIBRARY_RELEASE SET PROPERTY")
                    set_property(TARGET CUCUMBER-CPP::CUCUMBER-CPP APPEND PROPERTY
                        IMPORTED_CONFIGURATIONS RELEASE)
                    set_target_properties(CUCUMBER-CPP::CUCUMBER-CPP PROPERTIES
                        IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
                        IMPORTED_LOCATION_RELEASE "${CUCUMBER_LIBRARY_RELEASE}")
                endif(EXISTS "${CUCUMBER_LIBRARY_RELEASE}")

                if(EXISTS "${CUCUMBER_LIBRARY_DEBUG}")
                        #message (STATUS "CUCUMBER_LIBRARY_DEBUG SET PROPERTY")
                        set_property(TARGET CUCUMBER::CUCUMBER APPEND PROPERTY
                            IMPORTED_CONFIGURATIONS DEBUG)
                        set_target_properties(CUCUMBER-CPP::CUCUMBER-CPP PROPERTIES
                            IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
                            IMPORTED_LOCATION_DEBUG "${CUCUMBER_LIBRARY_DEBUG}")
                endif(EXISTS "${CUCUMBER_LIBRARY_DEBUG}")
        endif (NOT TARGET CUCUMBER-CPP::CUCUMBER-CPP)
    endif(CUCUMBER_LIBRARY AND CUCUMBER_CUCUMBER_INCLUDE_DIR)

    if (CUCUMBER_CUCUMBER_INCLUDE_DIR AND EXISTS "${CUCUMBER_CUCUMBER_INCLUDE_DIR}/cucumber-cpp/autodetect.hpp")
        file(STRINGS "${CUCUMBER_CUCUMBER_INCLUDE_DIR}/cucumber-cpp/autodetect.hpp" cucumber_cpp_version_str REGEX "^#define[ \t]+CUCUMBER_LIBCUCUMBER_VER_STRING[ \t]+\".+\"")
        string(REGEX REPLACE "^#define[ \t]+CUCUMBER_LIBCUCUMBER_VER_STRING[ \t]+\"([^\"]+)\".*" "\\1" CUCUMBER_VERSION_STRING "${cucumber_cpp_version_str}")
        #message (STATUS "CUCUMBER_VERSION_STRING ${CUCUMBER_VERSION_STRING}")
        unset(cucumber_cpp_version_str)
    endif ()

    include(FindPackageHandleStandardArgs)
    find_package_handle_standard_args(CUCUMBER-CPP
        REQUIRED_VARS CUCUMBER_LIBRARY CUCUMBER_CUCUMBER_INCLUDE_DIR
        VERSION_VAR CUCUMBER_VERSION_STRING)
    mark_as_advanced(CUCUMBER_CUCUMBER_INCLUDE_DIR CUCUMBER_LIBRARY)
endif(Boost_FOUND)