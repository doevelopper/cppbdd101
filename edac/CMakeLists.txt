set(ModuleName "cppbdd101.edac")

if(ENABLE_FORMATING_STYLE)
    apply_style_targets(
        ${ModuleName}
        ${CMAKE_CURRENT_BINARY_DIR}
    )
endif(ENABLE_FORMATING_STYLE)

add_subdirectory (src/main/cpp)
add_subdirectory (src/test/cpp)

#add_subdirectory (src/it)
