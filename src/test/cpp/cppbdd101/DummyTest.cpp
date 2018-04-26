#include <cppbdd101/DummyTest.hpp>

log4cxx::LoggerPtr DummyTest::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.DummyTest"));

void DummyTest::SetUp ()
{
	// objectUderTest = new SystemInfo();
}

void DummyTest::TearDown ()
{
	// delete objectUderTest;
}
