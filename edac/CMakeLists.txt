set(ModuleName "${PROJECT_NAME}.edac")

run_code_beautifier(
	${ModuleName}
	${CMAKE_CURRENT_BINARY_DIR}
)

add_cppcheck_analysis(
	${ModuleName}
	${CMAKE_CURRENT_BINARY_DIR}
)

add_cpp_linter_recursively(
	${ModuleName}
	${CMAKE_CURRENT_BINARY_DIR}
	${CMAKE_CURRENT_LIST_DIR} # for namespace guard
)


add_cyclomatic_complexity_analyzer(
	${ModuleName}
	${CMAKE_CURRENT_SOURCE_DIR}
)

# add_coverage_targets(
   # ${ModuleName}
   # ${ModuleName}.test.bin
   # ${CMAKE_CURRENT_LIST_DIR}
# )


add_subdirectory (src/main/cpp)
add_subdirectory (src/test/cpp)
#add_subdirectory (src/it)
