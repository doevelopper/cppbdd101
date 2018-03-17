#ifndef CPPBDD101_EDAC_GENERICERROR_HPP
#define CPPBDD101_EDAC_GENERICERROR_HPP

#include <system_error>
#include <cerrno>
class GenericError //: std::generic_category
{
public:

GenericError();
GenericError(GenericError const &) = delete;
GenericError(GenericError &&) = delete;
GenericError & operator=(GenericError const &) = delete;
GenericError & operator=(GenericError &&) = delete;
virtual ~GenericError();

private:
std::error_condition econd;
};

#endif

