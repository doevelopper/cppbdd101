set(ModuleName "cppbdd101.test")

add_library(${ModuleName}
    cppbdd101/DummyTest
    cppbdd101/MockInterface
    cppbdd101/InterfaceTest
)

#set_target_properties(
#    ${ModuleName} 
#    PROPERTIES IMPORTED_LOCATION             
#    "${CMAKE_CURRENT_LIST_DIR}/vendor/foo.a"
#)

#set_target_properties(
#    ${ModuleName} PROPERTIES 
#    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101"
#)

target_include_directories(${ModuleName} PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101>
    $<INSTALL_INTERFACE:${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/cppbdd101>
)

add_executable (
    ${ModuleName}.bin
    cppbdd101/unitTest.cpp
)

target_link_libraries(${ModuleName}
    PUBLIC cppbdd101.main
    #PUBLIC LOG4CXX::LOG4CXX
    PUBLIC GMock::GMock
    PUBLIC GTest::GTest
    #PUBLIC BENCHMARK::BENCHMARK
)

target_link_libraries(${ModuleName}.bin
    PUBLIC ${ModuleName}
)

add_test(NAME ${ModuleName}.bin
    WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} 
    COMMAND ${ModuleName}.bin
)
#target_include_directories(${ModuleName} PUBLIC
#    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}>
#    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101>
#    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/cppbdd101>
#)

#target_compile_definitions(${ModuleName} PUBLIC
#    ${TEST_BUILD_OPTIONS}
#    $<$<OR:$<CONFIG:Release>,$<CONFIG:Profiling>>:DISABLE_CONF>
#)

