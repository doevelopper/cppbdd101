#ifndef CPPBDD101_DUMMY_HPP
#define CPPBDD101_DUMMY_HPP

#include <log4cxx/logger.h>

namespace cpp101
{
    class Dummy
    {

        static log4cxx::LoggerPtr logger;

     public:

         Dummy();
         Dummy(const Dummy&) = default;
         Dummy(Dummy&&) = default;
         Dummy& operator=(const Dummy&) = default;
         Dummy& operator=(Dummy&&) = default;
         virtual ~Dummy();

     private:
    };
}
#endif

