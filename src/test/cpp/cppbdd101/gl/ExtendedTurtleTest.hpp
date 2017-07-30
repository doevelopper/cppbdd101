
#ifndef CPPBDD101_GL_EXTENDEDTURTLETEST_HPP
#define CPPBDD101_GL_EXTENDEDTURTLETEST_HPP

#include  <cppbdd101/gl/MockTurtleDelegate.hpp>

class ExtendedTurtleTest : public ::testing::Test
{
public:

    ExtendedTurtleTest();
    ExtendedTurtleTest(const ExtendedTurtleTest & orig);
    virtual ~ExtendedTurtleTest();

    virtual void SetUp ();

    virtual void TearDown ();

protected:

    static MockTurtleDelegate * objectUnderTest;
    static log4cxx::LoggerPtr logger;

private:
};


#endif
