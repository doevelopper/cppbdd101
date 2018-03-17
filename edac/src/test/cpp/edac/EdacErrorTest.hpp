#ifndef EDAC_EDACERRORTEST_HPP
#define EDAC_EDACERRORTEST_HPP
#include <edac/EdacError.hpp>
#include <gmock/gmock.h>
using ::testing::AtLeast;

class EdacErrorTest : public ::testing::Test
{
    public:
        EdacErrorTest();
        virtual ~EdacErrorTest();
        virtual void SetUp ();
        virtual void TearDown();
        
    protected:
        /*!
         * @brief Object that is about to be tested. 
         */
        EdacError * objectUnderTest;
        /*!
         * @brief Class logger. 
         */
        static log4cxx::LoggerPtr logger;
    private:

};

#endif

