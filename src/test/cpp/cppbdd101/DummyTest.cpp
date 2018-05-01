#include <cppbdd101/DummyTest.hpp>

log4cxx::LoggerPtr DummyTest::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.DummyTest"));

DummyTest::DummyTest()
: dummy()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}

DummyTest::~DummyTest()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}

void DummyTest::SetUp ()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
    dummy = new cpp101::Dummy();
}

void DummyTest::TearDown ()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
    delete dummy;
}

TEST_F(DummyTest, test_speachless)
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
    ASSERT_TRUE(dummy->speechless());
}

TEST_F(DummyTest, test_verbose)
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
    cpp101::Dummy d{"Hello", "World"};
    ASSERT_TRUE(d.speechless());
}

TEST_F(DummyTest, test_correct_speach)
{
   LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
   cpp101::Dummy d{"Hello", "World"};
   ASSERT_STREQ("Hello World", d.speak().c_str());
}

