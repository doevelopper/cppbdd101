
#include <cppbdd101/edac/DemangleTest.hpp>

log4cxx::LoggerPtr logger = log4cxx::Logger::getLogger(std::string("cppbdd101.edac.DemangleTest") );

DemangleTest::DemangleTest() 
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

DemangleTest::~DemangleTest() 
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

void DemangleTest::SetUp ()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    objectUnderTest = new cppbdd101::edac::Demangle();
}

void DemangleTest::TearDown ()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    delete objectUnderTest;
}

TEST_F(DemangleTest, test_demangling) 
{
    EXPECT_EQ(objectUnderTest->template cxaDemangle<int>(), std::string("int"));
    EXPECT_EQ(objectUnderTest->template cxaDemangle<const int>(), std::string("int"));
    EXPECT_EQ(objectUnderTest->template cxaDemangle<int &>(), std::string("int"));
    EXPECT_EQ(objectUnderTest->template cxaDemangle<const int &&>(), std::string("int"));
    EXPECT_EQ(objectUnderTest->template cxaDemangle<int []>(), std::string("int []"));
    EXPECT_EQ(objectUnderTest->template cxaDemangle<int *>(), std::string("int*"));
    EXPECT_EQ(objectUnderTest->template cxaDemangle<const int *>(), std::string("int const*"));
    EXPECT_EQ(objectUnderTest->template cxaDemangle<int *>(), std::string("int*"));
    EXPECT_EQ(objectUnderTest->template cxaDemangle<std::string>(), std::string("std::string"));
    EXPECT_EQ(objectUnderTest->template cxaDemangle(typeid(std::string)), std::string("std::string"));
    EXPECT_EQ(objectUnderTest->template cxaDemangle(typeid(Base)), std::string("Base"));
    EXPECT_EQ(objectUnderTest->template cxaDemangle(typeid(Derived)), std::string("Derived"));

    Derived derived;
    const Base &base = derived;

    EXPECT_EQ(objectUnderTest->template cxaDemangle(typeid(base)), std::string("Derived"));
}

