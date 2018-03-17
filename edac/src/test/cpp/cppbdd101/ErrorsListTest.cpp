#include <cppbdd101/edac/ErrorsListTest.hpp>

log4cxx::LoggerPtr ErrorsListTest::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.edac.ErrorsListTest"));
ErrorsListTest::ErrorsListTest() 
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}


ErrorsListTest::~ErrorsListTest() 
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}

void ErrorsListTest::SetUp ()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
    objectUnderTest = new ErrorsList();
}

void ErrorsListTest::TearDown ()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
    delete objectUnderTest;
}

TEST_F(ErrorsListTest , testCpy1)
{
    EXPECT_EQ(1, 1);
}

TEST_F(ErrorsListTest , testCpy2)
{
    EXPECT_TRUE(true);
}