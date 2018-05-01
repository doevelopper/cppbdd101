
find_package(Cucumber-cpp)

#add_library(${ModuleName}.it-test ""
    #cppbdd101/features/step_definitions/ItTest
    #cppbdd101/features/step_definitions/ApplicationSteps
#)

add_executable(${ModuleName}.it-test.bin
    cppbdd101/edac/features/step_definitions/ErrorsTestSteps
)

add_executable(${ModuleName}-integ::exe ALIAS ${ModuleName}.it-test.bin)

target_link_libraries(${ModuleName}.it-test.bin
    PUBLIC  ${ModuleName}.main
    PUBLIC LOG4CXX::LOG4CXX
    PUBLIC CUCUMBER-CPP::CUCUMBER-CPP
    #PUBLIC BENCHMARK::BENCHMARK
)

add_custom_target(${ModuleName}.integration
    COMMAND ${ModuleName}.it-test.bin  --host localhost --port 3902  >/dev/null &
    COMMAND cucumber --format pretty --color --strict ${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101/edac/features
    DEPENDS ${ModuleName}.it-test.bin
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

#add_test(NAME ${ModuleName}.feature
#	make ${ModuleName}.integration
#)
#add_test(NAME ${ModuleName}.integration 
	#COMMAND ${ModuleName}.it-test.bin  --host localhost --port 3902  >/dev/null & 
	#COMMAND cucumber --format pretty --color --strict ${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101/edac/features
	#DEPENDS ${ModuleName}.it-test.bin
	#)

#add_custom_command(TARGET integration_tests_runner
#    POST_BUILD
#        COMMAND ${CMAKE_COMMAND} -E copy_if_different
#	        ${CMAKE_SOURCE_DIR}/start_dds.sh
#	        ${CMAKE_CURRENT_BINARY_DIR}
#)

#add_custom_command(TARGET integration_tests_runner
#    POST_BUILD
#        COMMAND ${CMAKE_COMMAND} -E copy_if_different
#	        ${CMAKE_SOURCE_DIR}/stop_dds.sh
#	        ${CMAKE_CURRENT_BINARY_DIR}
#)

#add_custom_command(TARGET Run-IT-Tests
#    POST_BUILD
#    COMMAND ${ModuleName}.test
#    COMMAND ${ModuleName}.it-test.bin --port=3902 &
#    COMMAND cucumber -s ${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101/edac/features
#)
