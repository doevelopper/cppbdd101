#ifndef CPPBDD101_GL_TURTLETEST_HPP
#define CPPBDD101_GL_TURTLETEST_HPP

#include <gtest/gtest.h>
#include  <cppbdd101/gl/MockTurtle.hpp>
#include  <cppbdd101/gl/FakeTurtle.hpp>
#include  <cppbdd101/gl/MockTurtleDelegate.hpp>


class TurtleTest : public ::testing::Test
{

public:

    TurtleTest();
    TurtleTest(const TurtleTest & orig);
    virtual ~TurtleTest();

    virtual void SetUp ();
    virtual void TearDown ();

protected:

    MockTurtle * objectUnderTest;
    static log4cxx::LoggerPtr logger;

};


#endif
