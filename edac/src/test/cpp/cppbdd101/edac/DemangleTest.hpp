
#ifndef CPPBDD101_EDAC_DEMANGLETEST_HPP
#define CPPBDD101_EDAC_DEMANGLETEST_HPP

#include <gtest/gtest.h>
#include <cppbdd101/edac/Demangle.hpp>

class DemangleTest :
    public ::testing::Test
{
public:
    DemangleTest();
    virtual ~DemangleTest();

    virtual void SetUp();
    virtual void TearDown ();

private:
    Demangle * objectUnderTest;
};

#endif

