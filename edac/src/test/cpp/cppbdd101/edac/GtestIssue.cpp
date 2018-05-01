#include <cppbdd101/edac/GtestIssue.hpp>

log4cxx::LoggerPtr ExampleClass::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.edac.ExampleClass") );

ExampleClass::ExampleClass()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

ExampleClass::~ExampleClass()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}
void ExampleClass::SetUp()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    numbers.push_back(1);
    numbers.push_back(2);
    numbers.push_back(3);
}

void ExampleClass::TearDown()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    numbers.clear();
}



TEST_F(ExampleClass, Size) 
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);

    EXPECT_EQ(3, numbers.size());

    numbers.push_back(4);

    EXPECT_EQ(4, numbers.size());

    numbers.clear();

    EXPECT_EQ(0, numbers.size());
}

TEST_F(ExampleClass, Swap) 
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    EXPECT_EQ(2, numbers[1]);
    EXPECT_EQ(3, numbers[2]);

    std::swap(numbers[1], numbers[2]);
    EXPECT_EQ(3, numbers[1]);
    EXPECT_EQ(2, numbers[2]);
}

