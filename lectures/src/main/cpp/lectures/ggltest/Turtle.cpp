#include <cppbdd101/gl/Turtle.hpp>

Turtle::Turtle()
: logger (log4cxx::Logger::getLogger(std::string("cppbdd101.gl.Turtle")))
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}

Turtle::~Turtle()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}