
add_executable(cppbdd101.it-test.steps
	cppbdd101/features/step_definitions/DummyTestSteps
	cppbdd101/features/step_definitions/ApplicationSteps
    cppbdd101/features/step_definitions/MockInterfaceContext
)

target_link_libraries(cppbdd101.it-test.steps
    PUBLIC  cppbdd101.main
	        cppbdd101.test
            CUCUMBER-CPP::CUCUMBER-CPP
    ##PUBLIC BENCHMARK::BENCHMARK
)

add_custom_target(start-cucumber-wireserver
    COMMAND cppbdd101.it-test.steps --port 3902  >/dev/null &
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    COMMENT "Start cucumber's wireserver."
)

add_custom_target(cppbdd101.integration-test
    COMMAND cppbdd101.it-test.steps --port 3902  >/dev/null &
    COMMAND cucumber --format progress --backtrace --format html --color --out ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/cppbdd101-cucumber-report.html --strict ${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101/features
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    COMMENT "Start wire server and run integration test."
)

# Target: run wip features
# Run cucumber with --wip argument and run only features tagged @wip

#add_custom_target(run_wip_features
#    ${CUCUMBER_RUBY} -P --tags @wip --wip --tags ~@proposal --no-color -f pretty -s features
#    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
#    COMMENT "Running cucumber (wip features)."
#)

# Target: document features
# Run all features except features tagged @wip or @proposal and generate html output

#add_custom_target(document_features
#    ${CUCUMBER_RUBY} -P --tags ~@wip --tags ~@proposal --no-color -f pretty --no-source -f html -o ${DOC_DIR}/Features.html features
#    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
#    COMMENT "Running cucumber (features documentation)."
#)

##target_sources( ddsShapeDemo
##	PRIVATE Ishape.cpp
##	PUBLIC ${CMAKE_CURRENT_LIST_DIR}/Ishape.hpp
##)

##target_include_directories(
##    ddsShapeDemo
##    PUBLIC ${CMAKE_CURRENT_LIST_DIR}
##)


# target_link_libraries(cppbdd101.it-test
    # PUBLIC  cppbdd101.test
    ##PUBLIC LOG4CXX::LOG4CXX
    # PUBLIC CUCUMBER-CPP::CUCUMBER-CPP
    ##PUBLIC BENCHMARK::BENCHMARK
# )

# target_link_libraries(${ModuleName}.bin
    # PRIVATE ${ModuleName}
    ##PUBLIC  cppbdd101.test
    ##PUBLIC LOG4CXX::LOG4CXX
    # PUBLIC CUCUMBER-CPP::CUCUMBER-CPP
    ##PUBLIC BENCHMARK::BENCHMARK
# )

# target_include_directories(${ModuleName} PUBLIC
    # $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}>
    # $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101>
    # $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/cppbdd101>
# )

########################################################################################
#      I am using Googletes.  Beaware of using gtest driver, not generic driver
#      GTEST WAS not available at co,pile time for cucumber-cpp
# Manually add gtest driver

#set_property(
#    TARGET cucumber-cpp 
#    APPEND PROPERTY SOURCES
#    $<BUILD_INTERFACE:${CUKE_SOURCE_DIR}/drivers/GTestDriver.cpp>
#)
