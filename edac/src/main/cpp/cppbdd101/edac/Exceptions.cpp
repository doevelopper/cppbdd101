
#include <cppbdd101/edac/Exceptions.hpp>

Exceptions::Exceptions(std::terminate_handler handler)
{
    m_oldHandler = std::set_terminate(handler);
}

Exceptions::~Exceptions()
{
    std::set_terminate(m_oldHandler);
}
