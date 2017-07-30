
#include <Test.hpp>

cppbdd101::test::Test::Test() 
: m_testSuites(std::string())
, m_numberOfTestIteration(1)
{
}

cppbdd101::test::Test::Test(std::string & suite,unsigned int iteration)
: m_testSuites(suite)
, m_numberOfTestIteration(iteration)
{
    
}
cppbdd101::test::Test::~Test() 
{
}

int cppbdd101::test::Test::run (int argc, char * argv[])
{
	const std::string name = !m_testSuites.empty() ? m_testSuites : "AllTests";

	if( m_numberOfTestIteration > 0)
	{
		::testing::GTEST_FLAG(repeat) = m_numberOfTestIteration;
	}

	// ::testing::GTEST_FLAG(filter) = suite;

	 // GTEST_FLAG(output) = "xml:" + testOuputPath;

    ::testing::GTEST_FLAG(output) = "xml:Report.xml";
                                                                                                                                                                                                          ::testing::FLAGS_gmock_verbose = "verbose";
    //    ::testing::GTEST_FLAG(print_time) = false;

    try
    {
        // ::testing::InitGoogleTest(&argc , argv);
        ::testing::InitGoogleMock(&argc , argv);
    }
    catch (std::exception & e)
    {
        // LOG4_CXX_ERROR(didactics::test::logger , "Issues while innitializing test environment" << typeid (e).name () << ": " << e.what () );
		std::cerr << "Issues while innitializing test environment" << typeid (e).name () << ": " << e.what () <<std::endl;
    }
    catch (...)
    {
        std::cerr << "Unhandled exception" <<std::endl;
    }

    return RUN_ALL_TESTS();
}

