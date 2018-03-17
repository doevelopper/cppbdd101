#include <edac/EdacErrorTest.hpp>
log4cxx::LoggerPtr EdacErrorTest::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.edac.EdacErrorTest"));
EdacErrorTest::EdacErrorTest() 
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}

EdacErrorTest::~EdacErrorTest() 
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}

void EdacErrorTest::SetUp ()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
    objectUnderTest = new EdacError();
}

void EdacErrorTest::TearDown ()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
    delete objectUnderTest;
}

TEST_F(EdacErrorTest , testEQTrue)
{
    EXPECT_EQ(1, 1);
}

TEST_F(EdacErrorTest , testTrue)
{
    EXPECT_TRUE(true);
}

TEST_F(EdacErrorTest , testSucceed)
{
    SUCCEED();
}

TEST_F(EdacErrorTest , testFail)
{
    FAIL();
}
