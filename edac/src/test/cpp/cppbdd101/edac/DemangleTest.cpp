
#include <cppbdd101/edac/DemangleTest.hpp>

DemangleTest::DemangleTest() 
{
//    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

DemangleTest::~DemangleTest() 
{
//    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

void DemangleTest::SetUp ()
{
//    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    objectUnderTest = new Demangle();
}

void DemangleTest::TearDown ()
{
//    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    delete objectUnderTest;
}


struct Base 
{
  virtual ~Base() {}
};
struct Derived : Base {};

TEST_F(DemangleTest, demangling) 
{
    /*
    EXPECT_EQ(cxaDemangle<int>(), std::string("int"));
    EXPECT_EQ(cxaDemangle<const int>(), std::string("int"));
    EXPECT_EQ(cxaDemangle<int &>(), std::string("int"));
    EXPECT_EQ(cxaDemangle<const int &&>(), std::string("int"));
    EXPECT_EQ(cxaDemangle<int []>(), std::string("int []"));
    EXPECT_EQ(cxaDemangle<int *>(), std::string("int*"));
    EXPECT_EQ(cxaDemangle<const int *>(), std::string("int const*"));
    EXPECT_EQ(cxaDemangle<int *>(), std::string("int*"));
    EXPECT_EQ(cxaDemangle<std::string>(), std::string("std::string"));
    EXPECT_EQ(cxaDemangle(typeid(std::string)), std::string("std::string"));
    EXPECT_EQ(cxaDemangle(typeid(Base)), std::string("Base"));
    EXPECT_EQ(cxaDemangle(typeid(Derived)), std::string("Derived"));

    Derived derived;
    const Base &base = derived;

    EXPECT_EQ(cxaDemangle(typeid(base)), std::string("Derived"));
    */
}