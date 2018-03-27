# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#.rst:
# FindPNG
# -------
#
# Find liblog4cxx, the official reference library for the LOG4CXX image format.
#
# Imported targets
# ^^^^^^^^^^^^^^^^
#
# This module defines the following :prop_tgt:`IMPORTED` target:
#
# ``LOG4CXX::LOG4CXX``
#   The liblog4cxx library, if found.
#
# Result variables
# ^^^^^^^^^^^^^^^^
#
# This module will set the following variables in your project:
#
# ``LOG4CXX_INCLUDE_DIRS``
#   where to find log4cxx.h, etc.
# ``LOG4CXX_LIBRARIES``
#   the libraries to link against to use LOG4CXX.
# ``LOG4CXX_DEFINITIONS``
#   You should add_definitions(${LOG4CXX_DEFINITIONS}) before compiling code
#   that includes log4cxx library files.
# ``LOG4CXX_FOUND``
#   If false, do not try to use LOG4CXX.
# ``LOG4CXX_VERSION_STRING``
#   the version of the LOG4CXX library found (since CMake 2.8.8)
#
# Obsolete variables
# ^^^^^^^^^^^^^^^^^^
#
# The following variables may also be set, for backwards compatibility:
#
# ``LOG4CXX_LIBRARY``
#   where to find the LOG4CXX library.
# ``LOG4CXX_INCLUDE_DIR``
#   where to find the LOG4CXX headers (same as LOG4CXX_INCLUDE_DIRS)
#
# Since LOG4CXX depends on the apr, apr-util and expat , none of the above
# will be defined unless apr, apr-util and expat are found.

#find_path(LOG4CXX_INCLUDE_DIR
#    NAMES logger.h
#    PATHS ${PC_RapidJSON_INCLUDE_DIRS}
#    PATH_SUFFIXES log4cxx
#)

find_package(ApacheRuntime QUIET)
# find_package(APR QUIET)
# find_package(APR-util QUIET)
find_package(EXPAT QUIET)

if(APR_FOUND AND APRUTIL_FOUND)
    find_path(LOG4CXX_LOG4CXX_INCLUDE_DIR 
    log4cxx/logger.h
    /usr/local/include/log4cxx
    /mingw64/include/log4cxx)

    unset(LOG4CXX_NAMES_DEBUG)
    list(APPEND LOG4CXX_NAMES log4cxx liblog4cxx)
    list(APPEND LOG4CXX_NAMES_DEBUG log4cxxd liblog4cxxd)

    if(NOT LOG4CXX_LIBRARY)
        find_library(LOG4CXX_LIBRARY_RELEASE NAMES ${LOG4CXX_NAMES})
        find_library(LOG4CXX_LIBRARY_DEBUG NAMES ${LOG4CXX_NAMES_DEBUG})
        include(SelectLibraryConfigurations)
        select_library_configurations(LOG4CXX)
        mark_as_advanced(LOG4CXX_LIBRARY_RELEASE LOG4CXX_LIBRARY_DEBUG)
    endif(NOT LOG4CXX_LIBRARY)

    unset(LOG4CXX_NAMES)
    unset(LOG4CXX_NAMES_DEBUG)
    unset(LOG4CXX_FOUND)

    if(LOG4CXX_LIBRARY AND LOG4CXX_LOG4CXX_INCLUDE_DIR)
        # message(STATUS "LOG4CXX_LOG4CXX_INCLUDE_DIR ${LOG4CXX_LOG4CXX_INCLUDE_DIR}")
        # message(STATUS "LOG4CXX_LIBRARY ${LOG4CXX_LIBRARY}")
        set(LOG4CXX_INCLUDE_DIRS ${LOG4CXX_LOG4CXX_INCLUDE_DIR} ${APR_INCLUDE_DIR} )
        set(LOG4CXX_INCLUDE_DIR ${LOG4CXX_LOG4CXX_INCLUDE_DIR} ) # for backward compatibility
        set(LOG4CXX_LIBRARIES ${LOG4CXX_LIBRARY} ${APR_LIBRARY} ${EXPAT_LIBRARY} ${APRUTIL_LIBRARY})
        # set(LOG4CXX_DEFINITIONS -DLOG4CXX_STATIC)

        if(NOT TARGET LOG4CXX::LOG4CXX)
            add_library(LOG4CXX::LOG4CXX UNKNOWN IMPORTED)
            set_target_properties(LOG4CXX::LOG4CXX PROPERTIES
            # INTERFACE_COMPILE_DEFINITIONS "${LOG4CXX_DEFINITIONS}"
            INTERFACE_INCLUDE_DIRECTORIES "${LOG4CXX_INCLUDE_DIRS}"
            INTERFACE_LINK_LIBRARIES ${APR_LIBRARY};${EXPAT_LIBRARY};${APRUTIL_LIBRARY})

            if(EXISTS "${LOG4CXX_LIBRARY}")
                set_target_properties(LOG4CXX::LOG4CXX PROPERTIES
                    IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
                    IMPORTED_LOCATION "${LOG4CXX_LIBRARY}")
            endif(EXISTS "${LOG4CXX_LIBRARY}")

            if(EXISTS "${LOG4CXX_LIBRARY_RELEASE}")
                set_property(TARGET LOG4CXX::LOG4CXX APPEND PROPERTY
                    IMPORTED_CONFIGURATIONS RELEASE)
                set_target_properties(LOG4CXX::LOG4CXX PROPERTIES
                    IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
                    IMPORTED_LOCATION_RELEASE "${LOG4CXX_LIBRARY_RELEASE}")
            endif(EXISTS "${LOG4CXX_LIBRARY_RELEASE}")

            if(EXISTS "${LOG4CXX_LIBRARY_DEBUG}")
                set_property(TARGET LOG4CXX::LOG4CXX APPEND PROPERTY
                    IMPORTED_CONFIGURATIONS DEBUG)
                set_target_properties(LOG4CXX::LOG4CXX PROPERTIES
                    IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
                    IMPORTED_LOCATION_DEBUG "${LOG4CXX_LIBRARY_DEBUG}")
            endif(EXISTS "${LOG4CXX_LIBRARY_DEBUG}")

        endif(NOT TARGET LOG4CXX::LOG4CXX)

    endif (LOG4CXX_LIBRARY AND LOG4CXX_LOG4CXX_INCLUDE_DIR)

    include(FindPackageHandleStandardArgs)
    find_package_handle_standard_args(LOG4CXX
                                      REQUIRED_VARS LOG4CXX_LIBRARY LOG4CXX_LOG4CXX_INCLUDE_DIR
                                      VERSION_VAR LOG4CXX_VERSION_STRING)
else(APR_FOUND AND APRUTIL_FOUND)
    MESSAGE(FATAL_ERROR "Could not find APR/APRu library")
endif(APR_FOUND AND APRUTIL_FOUND)
# message (STATUS "LOG4CXX_LIBRARY ${LOG4CXX_LIBRARY}")
# message (STATUS "LOG4CXX_LOG4CXX_INCLUDE_DIR ${LOG4CXX_LOG4CXX_INCLUDE_DIR}")
mark_as_advanced(LOG4CXX_LOG4CXX_INCLUDE_DIR LOG4CXX_LIBRARY )
