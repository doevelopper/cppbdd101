
set(SOURCE_FILES
    # cppbdd101/edac/ErrorsList
    # cppbdd101/edac/EdacError
    # cppbdd101/edac/LoggingService
	# cppbdd101/edac/ErrnoMapper
	# cppbdd101/edac/SystemError
	# cppbdd101/edac/FutureError
	# cppbdd101/edac/GenericError
	# cppbdd101/edac/IOError
	# cppbdd101/edac/LowLevelApiError
	# cppbdd101/edac/IsErrorActive
	# cppbdd101/edac/private/ErrorCodePrivate
	cppbdd101/edac/Exceptions
)

add_library(${ModuleName}.main ${SOURCE_FILES})

target_compile_features(
    ${ModuleName}.main
    PUBLIC
        cxx_strong_enums
        cxx_variadic_templates
        cxx_nullptr
    PRIVATE
        cxx_lambdas
        cxx_range_for
        $<$<CXX_COMPILER_ID:GNU>:cxx_attributes>
)

target_link_libraries(
    ${ModuleName}.main
    # ${APR_LIBRARY} 
	# ${APRUTIL_LIBRARY} 
	# ${EXPAT_LIBRARY} 
	# ${LOG4CXX_LIBRARY}
	${APR_LIBRARY}
	${EXPAT_LIBRARY}
	${APRUTIL_LIBRARY}
	${LOG4CXX_LIBRARIES}
)

target_include_directories(${ModuleName}.main PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101>
  $<INSTALL_INTERFACE:${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/cppbdd101>  # <prefix>/include/edac
)

# target_link_libraries(
    # ${ModuleName}.main
    # PUBLIC LOG4CXX::LOG4CXX
# )


# add_dependencies(compile ${ModuleName}.main)


#target_sources(edac
#    PRIVATE EdacError EdacError
#    PUBLIC Header.hpp)

#target_compile_options(edac INTERFACE
#   #-std=c++17
#   $<$<CONFIG:Debug>:-g3 -O0 -fstack-protector>
#   $<$<CONFIG:Release>:-g0 -O2>)
