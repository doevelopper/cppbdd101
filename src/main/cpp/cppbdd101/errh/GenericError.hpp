#ifndef CPPBDD101_ERRH_GENERICERROR_HPP
#define CPPBDD101_ERRH_GENERICERROR_HPP

#include <system_error>
#include <cerrno>
class GenericError //: std::generic_category
{
public:
    GenericError();
    GenericError(const GenericError& orig);
    virtual ~GenericError();
private:

};

#endif

