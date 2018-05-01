
#ifndef CPPBDD101_EDAC_ERRORSLISTTEST_HPP
#define CPPBDD101_EDAC_ERRORSLISTTEST_HPP

#include <gtest/gtest.h>
#include <cppbdd101/edac/ErrorsList.hpp>

class ErrorsListTest :
    public ::testing::Test
{
    public:

        ErrorsListTest();
        virtual ~ErrorsListTest();
        /*!
         * @brief Code here will be called immediately after the constructor (right
         *        before each test).
         */
        virtual void SetUp();
        /*!
         * @brief Code here will be called immediately after each test (right
         *        before the destructor)
         */
        virtual void TearDown ();

    protected:

        /*!
         * @brief Object that is about to be tested.
         */
        ErrorsList * errorsList;
        /*!
         * @brief Class logger.
         */
        static log4cxx::LoggerPtr logger;

    private:
};

#endif
