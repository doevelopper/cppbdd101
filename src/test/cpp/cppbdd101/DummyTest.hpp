#ifndef CPPBD101_DUMMYTEST_HPP
#define CPPBD101_DUMMYTEST_HPP

#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <boost/shared_ptr.hpp>
#include <cppbdd101/Dummy.hpp>
#include <log4cxx/logger.h>

class DummyTest : public ::testing::Test
{
	static log4cxx::LoggerPtr logger;

    public:
	DummyTest(); 
        DummyTest(const DummyTest&) = default;
        DummyTest(DummyTest&&) = default;
        DummyTest& operator=(const DummyTest&) = default;
        DummyTest& operator=(DummyTest&&) = default;
        virtual ~DummyTest();

        virtual void SetUp ();
        virtual void TearDown ();

    private:
        //boost::shared_ptr<Dummy> testObject;
	cpp101::Dummy * objectToTest;
};
#endif

