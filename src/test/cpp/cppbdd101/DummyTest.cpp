#include <cppbdd101/DummyTest.hpp>

log4cxx::LoggerPtr DummyTest::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.DummyTest"));

DummyTest::DummyTest()
{

}

DummyTest::~DummyTest()
{

}

void DummyTest::SetUp ()
{
	// objectUderTest = new SystemInfo();
}

void DummyTest::TearDown ()
{
	// delete objectUderTest;
}

TEST_F(DummyTest, testDummyCompare)
{
   ASSERT_TRUE(1 == 1);
}

TEST_F(DummyTest, testDummyCompare0)
{
   ASSERT_TRUE(1 == 1);
}

TEST_F(DummyTest, testDummyCompare1)
{
   ASSERT_TRUE(1 == 1);
}

TEST_F(DummyTest, testDummyCompare2)
{
   ASSERT_TRUE(1 == 1);
}

