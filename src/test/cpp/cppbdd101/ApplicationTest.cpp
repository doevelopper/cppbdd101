#include <cppbdd101/ApplicationTest.hpp>
log4cxx::LoggerPtr ApplicationTest::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.ApplicationTest"));

ApplicationTest::ApplicationTest()
:m_objectUnderTest(nullptr)
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}

ApplicationTest::ApplicationTest(const ApplicationTest& orig)
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}

ApplicationTest::~ApplicationTest()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}


void ApplicationTest::SetUp ()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
    m_objectUnderTest = new Application();
}

void ApplicationTest::TearDown ()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
    delete m_objectUnderTest ;
}

