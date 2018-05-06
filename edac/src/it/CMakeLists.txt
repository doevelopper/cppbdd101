
add_executable(cppbdd101.edac.it-test.steps
    cppbdd101/edac/features/step_definitions/ErrorsTestSteps
)

target_link_libraries(cppbdd101.edac.it-test.steps
    PUBLIC 
        cppbdd101.edac.main
        CUCUMBER-CPP::CUCUMBER-CPP
        #BENCHMARK::BENCHMARK
)

add_custom_target(cppbdd101.edac.integration-test
    COMMAND cppbdd101.edac.it-test.steps --port 3902  >/dev/null &
    # COMMAND cucumber --verbose --format progress --backtrace --format html --color --out ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/edac-cucumber-report.html --strict ${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101/edac/features 
    COMMAND cucumber --format progress --backtrace --format html --color --out ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/edac-cucumber-report.html --strict ${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101/edac/features 
    # DEPENDS cppbdd101.edac.it-test.steps
    # DEPENDS cppbdd101.edac.test
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

#add_custom_command(TARGET integration_tests_runner
#    POST_BUILD
#        COMMAND ${CMAKE_COMMAND} -E copy_if_different
#            ${CMAKE_SOURCE_DIR}/start_dds.sh
#            ${CMAKE_CURRENT_BINARY_DIR}
#)

#add_custom_command(TARGET integration_tests_runner
#    POST_BUILD
#        COMMAND ${CMAKE_COMMAND} -E copy_if_different
#            ${CMAKE_SOURCE_DIR}/stop_dds.sh
#            ${CMAKE_CURRENT_BINARY_DIR}
#)

#add_custom_command(TARGET Run-IT-Tests
#    POST_BUILD
#    COMMAND cppbdd101.edac.test
#    COMMAND cppbdd101.edac.it-test.steps --port=3902 &
#    COMMAND cucumber -s ${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101/edac/features
#)
