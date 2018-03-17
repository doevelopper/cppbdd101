#ifndef CPPBDD101_GL_PAINTERTEST_HPP
#define CPPBDD101_GL_PAINTERTEST_HPP
#include <gmock/gmock.h>
#include  <cppbdd101/gl/MockTurtle.hpp>
#include  <cppbdd101/gl/Painter.hpp>

using ::testing::AtLeast;

class PainterTest : public ::testing::Test
{

public:

    PainterTest();
    PainterTest(const PainterTest & orig);
    virtual ~PainterTest();

protected:

    void canDrawSomething ();
    static Painter * objectUnderTest;
    static MockTurtle * turtleMock;
    static log4cxx::LoggerPtr logger;

private:

};


#endif
