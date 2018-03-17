#ifndef CPPBDD101_EDAC_IOERROR_HPP
#define CPPBDD101_EDAC_IOERROR_HPP

#include <ios>
#include <system_error>

class IOError //: std::iostream_category
{
public:
IOError();
virtual ~IOError();
private:

};

#endif

