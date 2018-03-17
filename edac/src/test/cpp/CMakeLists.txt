set(SOURCE_FILES
    edac/ErrorsListTest
    edac/EdacErrorTest
)

add_library(${ModuleName}.test ${SOURCE_FILES})
target_link_libraries(${ModuleName}.test PRIVATE GTest::GTest ${ModuleName}.main)#GTest::GTestMain
#add_executable(edacTest.bin)
