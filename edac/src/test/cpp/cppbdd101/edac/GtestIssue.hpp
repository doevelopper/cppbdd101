
#ifndef BLABLA_HPP
#define BLABLA_HPP

#include <gtest/gtest.h>
#include <cppbdd101/edac/LoggingService.hpp>

class ExampleClass : public testing::Test 
{
public:
    ExampleClass();
    ~ExampleClass();
protected:
    virtual void SetUp(); 
    virtual void TearDown();

    std::vector<int> numbers;
 
    static log4cxx::LoggerPtr logger;
};

#endif

