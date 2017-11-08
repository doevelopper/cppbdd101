
add_subdirectory(cppbdd101/gl)

set(SOURCE_FILES
    cppbdd101/Application
    cppbdd101/errh/FutureError
    cppbdd101/errh/IOError
    cppbdd101/errh/GenericError
    cppbdd101/errh/FutureError
)

add_library(${PROJECT_NAME} ${SOURCE_FILES})
add_executable(${PROJECT_NAME}.bin cppbdd101.cpp )

target_link_libraries(${PROJECT_NAME} ${THIRD_PARTY_LIB})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_LIST_DIR})

#set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 17)
#set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD_REQUIRED ON)
#target_compile_options(${PROJECT_NAME} INTERFACE 
#    -std=c++17
#    $<$<CONFIG:Debug>:-g3 -O0 -fstack-protector>
#    $<$<CONFIG:Release>:-g0 -O2>)