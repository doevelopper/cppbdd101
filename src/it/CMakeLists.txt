include_directories(.)

set(SOURCE_FILES
    #cppbdd101/features/step_definitions/ItTest
    cppbdd101/features/step_definitions/ApplicationSteps
)

FIND_PACKAGE( Boost 1.64 COMPONENTS program_options REQUIRED )
INCLUDE_DIRECTORIES( ${Boost_INCLUDE_DIR})
set (DEP_LIBRARIES
    boost_regex-mt
    boost_atomic-mt
    boost_chrono-mt
    boost_date_time-mt
    boost_filesystem-mt
    boost_program_options-mt
    boost_system-mt
    boost_thread-mt
)

if(MINGW)
    list(APPEND DEP_LIBRARIES ws2_32)     #ws2_32 for boost.asio on windows 7  ???
endif(MINGW)

add_executable(${PROJECT_NAME}.bin-It-Test ${SOURCE_FILES} )

target_link_libraries(${PROJECT_NAME}.bin-It-Test 
    cucumber-cpp
    ${THIRD_PARTY_LIB} 
    ${TEST_THIRD_PARTY_LIB}
#    ${Boost_LIBRARIES}
    ${DEP_LIBRARIES}
)

add_custom_target(
    ${PROJECT_NAME}.bin-integration-test
#   DEPENDS ${PROJECT_NAME}.bin-It-Test
#   COMMAND ${PROJECT_NAME}.bin-It-Test --port=3902 >/dev/null & cucumber _2.0.0_ ${CMAKE_CURRENT_SOURCE_DIR}/features 
    COMMENT "Running ${PROJECT_NAME}.bin integration test"
)