#ifndef CPPBDD101_ERRH_IOERROR_HPP
#define CPPBDD101_ERRH_IOERROR_HPP
#include <ios>
class IOError //: std::iostream_category
{
public:
    IOError();
    virtual ~IOError();
private:

};

#endif

