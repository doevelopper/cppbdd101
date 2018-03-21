set(ModuleName "cppbdd101.edac")

if(ENABLE_FORMATING_STYLE)
    apply_style_targets(
        ${ModuleName}
        ${CMAKE_CURRENT_BINARY_DIR}
    )
endif(ENABLE_FORMATING_STYLE)

if(ENABLE_CPPCHECK)
    ADD_CPPCHECK_ANALYSIS(
        ${ModuleName}
        ${CMAKE_CURRENT_BINARY_DIR}
    )
endif(ENABLE_CPPCHECK)

if(ENABLE_CPPLINT)
    CPPLINT_RECURSIVE(
        ${ModuleName}
        ${CMAKE_CURRENT_BINARY_DIR}
        ${CMAKE_CURRENT_LIST_DIR} # for namespace guard
)
endif(ENABLE_CPPLINT)

if(ENABLE_CYCLOMATIC_COMPLEXITY)
    CYCLOMATIC_COMPLEXITY_ANALYZER(
        ${ModuleName}
        ${CMAKE_CURRENT_SOURCE_DIR}
    )
endif(ENABLE_CYCLOMATIC_COMPLEXITY)


#if(ENABLE_COVERAGE)
#    add_coverage_targets(
#        ${PROJECT_NAME}-hal
#        ${PROJECT_NAME}-halTest
#        ${CMAKE_CURRENT_LIST_DIR}
#    )
#
#endif(ENABLE_COVERAGE)

add_subdirectory (src/main/cpp)
add_subdirectory (src/test/cpp)

#add_subdirectory (src/it)
