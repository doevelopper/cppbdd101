
#ifndef LECTURES_GOTW_COMPLEXTEST_HPP
#define LECTURES_GOTW_COMPLEXTEST_HPP
#include <lectures/gotw/Complex.hpp>
#include <gtest/gtest.h>
#include <log4cxx/logger.h>

class ComplexTest : public ::testing::Test
{
public:
    ComplexTest();
    virtual ~ComplexTest();

    virtual void SetUp();
    virtual void TearDown ();

protected:
        /*!
         * @brief Object that is about to be tested. 
         */
        Complex * objectUnderTest;
        /*!
         * @brief Class logger. 
         */
        static log4cxx::LoggerPtr logger;
private:

};

#endif

