#ifndef CPPBDD101_APPLICATIONTEST_HPP
#define CPPBDD101_APPLICATIONTEST_HPP
#include <gtest/gtest.h>
#include <cppbdd101/LoggingService.hpp>
#include <cppbdd101/Application.hpp>
class ApplicationTest  : public ::testing::Test
{
public:
    ApplicationTest();
    ApplicationTest(const ApplicationTest& orig);
    virtual ~ApplicationTest();
    
    virtual void SetUp ();
    virtual void TearDown ();

protected:
    Application * m_objectUnderTest;
    static log4cxx::LoggerPtr logger;

private:
};

#endif

