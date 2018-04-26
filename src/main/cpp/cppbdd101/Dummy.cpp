#include <cppbdd101/Dummy.hpp>

log4cxx::LoggerPtr cpp101::Dummy::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.Dummy"));

cpp101::Dummy::Dummy()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}

cpp101::Dummy::~Dummy()
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}

