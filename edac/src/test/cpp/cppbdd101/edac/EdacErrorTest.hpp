
#ifndef CPPBDD101_EDAC_EDACERRORTEST_HPP
#define CPPBDD101_EDAC_EDACERRORTEST_HPP

#include <gmock/gmock.h>
#include <cppbdd101/edac/EdacError.hpp>

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
