
#ifndef CPPBDD101_EDAC_DEMANGLETEST_HPP
#define CPPBDD101_EDAC_DEMANGLETEST_HPP

#include <gtest/gtest.h>
#include <cppbdd101/edac/Demangle.hpp>

class DemangleTest : public ::testing::Test
{
    public:
        DemangleTest();
        virtual ~DemangleTest();

        virtual void SetUp();
        virtual void TearDown();

protected:

    struct Base
    {
        virtual ~Base() {}
    };

    struct Derived : Base {};

    cppbdd101::edac::Demangle * objectUnderTest;
    /*!
     * @brief Class logger.
     */
    static log4cxx::LoggerPtr logger;    
private:

};
#endif

