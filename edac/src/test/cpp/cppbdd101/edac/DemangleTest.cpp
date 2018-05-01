
#include <cppbdd101/edac/DemangleTest.hpp>

log4cxx::LoggerPtr DemangleTest::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.edac.DemangleTest") );

DemangleTest::DemangleTest()
  :demangle()	
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
    demangle = new cppbdd101::edac::Demangle();
}

void DemangleTest::TearDown ()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    delete demangle;
}

TEST_F(DemangleTest, test_demangling) 
{
    EXPECT_EQ(demangle->template cxaDemangle<int>(), std::string("int"));
    EXPECT_EQ(demangle->template cxaDemangle<const int>(), std::string("int"));
    EXPECT_EQ(demangle->template cxaDemangle<int &>(), std::string("int"));
    EXPECT_EQ(demangle->template cxaDemangle<const int &&>(), std::string("int"));
    EXPECT_EQ(demangle->template cxaDemangle<int []>(), std::string("int []"));
    EXPECT_EQ(demangle->template cxaDemangle<int *>(), std::string("int*"));
    EXPECT_EQ(demangle->template cxaDemangle<const int *>(), std::string("int const*"));
    EXPECT_EQ(demangle->template cxaDemangle<int *>(), std::string("int*"));
   // EXPECT_EQ(demangle->template cxaDemangle<std::string>(), std::string("std::string"));
   // EXPECT_EQ(demangle->template cxaDemangle(typeid(std::string)), std::string("std::string"));
   // EXPECT_EQ(demangle->template cxaDemangle(typeid(Base)), std::string("Base"));
   // EXPECT_EQ(demangle->template cxaDemangle(typeid(Derived)), std::string("Derived"));

    Derived derived;
    const Base &base = derived;

   //EXPECT_EQ(demangle->template cxaDemangle(typeid(base)), std::string("Derived"));
}

