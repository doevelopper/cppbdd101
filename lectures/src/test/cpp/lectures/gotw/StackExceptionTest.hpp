
#ifndef STACKEXCEPTIONTEST_HPP
#define STACKEXCEPTIONTEST_HPP
#include <gtest/gtest.h>
#include <lectures/gotw/StackException.hpp>
class StackExceptionTest : public ::testing::Test 
{
public:
    StackExceptionTest();
    virtual ~StackExceptionTest();

    virtual void SetUp();
    virtual void TearDown ();
protected:
        /*!
         * @brief Object that is about to be tested. 
         */
        //StackException<int> * objectUnderTest;
        /*!
         * @brief Class logger. 
         */
        static log4cxx::LoggerPtr logger;

private:

};

#endif
