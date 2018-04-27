

#include <cppbdd101/edac/ErrorsList.hpp>

log4cxx::LoggerPtr ErrorsList::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.edac.ErrorsList") );
ErrorsList::ErrorsList()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

ErrorsList::~ErrorsList()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}
