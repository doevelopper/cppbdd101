
set(ModuleName "cppbdd101.it-test")

find_package(Cucumber-cpp)

add_library(${ModuleName}
    cppbdd101/features/step_definitions/ItTest
    #cppbdd101/features/step_definitions/ApplicationSteps
)

#target_sources( ddsShapeDemo
#	PRIVATE Ishape.cpp
#	PUBLIC ${CMAKE_CURRENT_LIST_DIR}/Ishape.hpp
#)

#target_include_directories(
#    ddsShapeDemo
#    PUBLIC ${CMAKE_CURRENT_LIST_DIR}
#)

add_executable(${ModuleName}.bin
    cppbdd101/features/step_definitions/ApplicationSteps
)

target_link_libraries(${ModuleName}
    PUBLIC  cppbdd101.test
    #PUBLIC LOG4CXX::LOG4CXX
    PUBLIC CUCUMBER-CPP::CUCUMBER-CPP
    #PUBLIC BENCHMARK::BENCHMARK
)

target_link_libraries(${ModuleName}.bin
    PRIVATE ${ModuleName}
    #PUBLIC  cppbdd101.test
    #PUBLIC LOG4CXX::LOG4CXX
    PUBLIC CUCUMBER-CPP::CUCUMBER-CPP
    #PUBLIC BENCHMARK::BENCHMARK
)

target_include_directories(${ModuleName} PUBLIC
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/cppbdd101>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/cppbdd101>
)
########################################################################################
#      I am using Googletes.  Beaware of using gtest driver, not generic driver
#      GTEST WAS not available at co,pile time for cucumber-cpp
# Manually add gtest driver

#set_property(
#    TARGET cucumber-cpp 
#    APPEND PROPERTY SOURCES
#    $<BUILD_INTERFACE:${CUKE_SOURCE_DIR}/drivers/GTestDriver.cpp>
#)
