include_directories(.)

set(SOURCE_FILES
    #cppbdd101/features/step_definitions/ItTest
    cppbdd101/features/step_definitions/ApplicationSteps
)

set(CUCUMBER_CORE_BOOST_LIBS thread system regex date_time program_options REQUIRED )
find_package(Boost COMPONENTS ${CUCUMBER_CORE_BOOST_LIBS})
include_directories(${Boost_INCLUDE_DIRS})
set(CUCUMBER_EXTRA_LIBRARIES ${CUCUMBER_EXTRA_LIBRARIES} ${Boost_THREAD_LIBRARY} ${Boost_SYSTEM_LIBRARY} ${Boost_REGEX_LIBRARY} ${Boost_DATE_TIME_LIBRARY})

#FIND_PACKAGE( Boost 1.64 COMPONENTS program_options REQUIRED )
#set(Boost_USE_STATIC_LIBS        ON)  # only find static libs
#set(Boost_USE_DEBUG_LIBS         OFF) # ignore debug libs and
#set(Boost_USE_RELEASE_LIBS       ON)  # only find release libs
#set(Boost_USE_MULTITHREADED      ON)
#set(Boost_USE_STATIC_RUNTIME    OFF)
#find_package(Boost 1.64 REQUIRED COMPONENTS date_time filesystem iostreams thread program_options)
#INCLUDE_DIRECTORIES( ${Boost_INCLUDE_DIR})
#set (DEP_LIBRARIES
#    boost_regex-mt
#    boost_atomic-mt
#    boost_chrono-mt
#    boost_date_time-mt
#    boost_filesystem-mt
#    boost_program_options-mt
#    boost_system-mt
#    boost_thread-mt
#)

#if(MINGW)
#    list(APPEND DEP_LIBRARIES ws2_32)     #ws2_32 for boost.asio on windows 7  ???
#endif(MINGW)

add_executable(${PROJECT_NAME}.bin-It-steps-Test ${SOURCE_FILES} )

target_link_libraries(${PROJECT_NAME}.bin-It-steps-Test 
    ${Boost_LIBRARIES}
    ${CUCUMBER_LIBRARY_RELEASE}
    #${THIRD_PARTY_LIB} 
    ${CUCUMBER_EXTRA_LIBRARIE}
#    ${DEP_LIBRARIES}
    ${GTEST_LIBRARIES}
    ${GTEST_LIBRARIES}
     pthread
)

add_custom_target(
    ${PROJECT_NAME}.bin-It-Test
#   DEPENDS ${PROJECT_NAME}.bin-Test
#   COMMAND ${PROJECT_NAME}.bin-It-Test --port=3902 >/dev/null & cucumber _2.0.0_ ${CMAKE_CURRENT_SOURCE_DIR}/features 
    COMMENT "Running ${PROJECT_NAME}.bin-It-steps-Test integration test"
)

#add_custom_command(TARGET RunAllTests
#    POST_BUILD
#    COMMAND RunTests
#    COMMAND SpeakerSteps 3902 &
#    COMMAND cucumber -s ${CMAKE_SOURCE_DIR}/features
#)