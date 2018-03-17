set(SOURCE_FILES
    edac/ErrorsListTest
    edac/EdacErrorTest
)

add_library(edacTest ${SOURCE_FILES})
target_link_libraries(edacTest PRIVATE GTest::GTest edac)#GTest::GTestMain
#add_executable(edacTest.bin)