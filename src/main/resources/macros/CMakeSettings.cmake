set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_COLOR_MAKEFILE ON)
set(CMAKE_RULE_MESSAGES ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_INCLUDE_DIRECTORIES_PROJECT_BEFORE ON)
set(CMAKE_INCLUDE_CURRENT_DIR_IN_INTERFACE ON)
set(CMAKE_LINK_DEPENDS_NO_SHARED ON)

set(BUILD_SHARED_LIBS TRUE CACHE BOOL "If enabled, shared libs will be built by default, otherwise static libs")

# Force output directory destination, especially for MSVC (@so7747857).
# function(setTargetOutputDirectory target)
    # foreach(type RUNTIME LIBRARY ARCHIVE)
        # set_target_properties(${target} PROPERTIES
            # ${type}_OUTPUT_DIRECTORY         ${CMAKE_${type}_OUTPUT_DIRECTORY}
            # ${type}_OUTPUT_DIRECTORY_DEBUG   ${CMAKE_${type}_OUTPUT_DIRECTORY}
            # ${type}_OUTPUT_DIRECTORY_RELEASE ${CMAKE_${type}_OUTPUT_DIRECTORY}
        # )
    # endforeach()
# endfunction()

#Find Qt5 libraries.
#foreach(module Core Gui Widgets)
#    find_package(Qt5 REQUIRED COMPONENTS ${module})
#    list(APPEND QT_INCLUDE_DIRS "${Qt5${module}_INCLUDE_DIRS}")
#    list(APPEND QT_LIBRARIES    "${Qt5${module}_LIBRARIES}")
#    list(APPEND QT_FLAGS        "${Qt5${module}_EXECUTABLE_COMPILE_FLAGS}")
#    list(APPEND QT_DEFINITIONS  "${Qt5${module}_DEFINITIONS}")
#endforeach()
