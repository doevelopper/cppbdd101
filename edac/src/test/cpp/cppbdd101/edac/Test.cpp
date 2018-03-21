
#include <cppbdd101/edac/Test.hpp>

cppbdd101::test::Test::Test()
    : m_testSuites(std::string() )
    , m_numberOfTestIteration(1)
{
}

cppbdd101::test::Test::Test(std::string & suite, unsigned int iteration)
    : m_testSuites(suite)
    , m_numberOfTestIteration(iteration)
{
}

cppbdd101::test::Test::~Test()
{
}

int cppbdd101::test::Test::run (int argc, char * argv[])
{
	if (argc < 3) 
	{
        showUsage(argv[0]);
        return 1;
    }
	std::vector <std::string> listOfTest;
    for (int i = 1; i < argc; ++i) 
	{
        std::string arg = argv[i];
        if ((arg == "-h") || (arg == "--help")) 
		{
            showUsage(argv[0]);
            return 0;
        } 
		else if ((std::string(argv[i]) == "-v") || (std::string(argv[i]) == "--verbose")) 
		{
		}
		else if ((std::string(argv[i]) == "-i") || (std::string(argv[i]) == "--iteration")) 
		{
			// m_numberOfTestIteration = argv[i+1];
		}
		else if ((std::string(argv[i]) == "-o") || (std::string(argv[i]) == "--outputpath")) 
		{
		}
		else if ((std::string(argv[i]) == "-d") || (arg std::string(argv[i]) "--destination")) 
		{
            if (i + 1 < argc) 
			{ // Make sure we aren't at the end of argv!
                // destination = argv[i++]; // Increment 'i' so we don't get the argument as the next argv[i].
            } 
			else 
			{ // Uh-oh, there was no argument to the destination option.
                  std::cerr << "--destination option requires one argument." << std::endl;
                return 1;
            }  
        } 
		else 
		{
            // listOfTest.push_back(argv[i]);
        }
    }

    const std::string name = !m_testSuites.empty() ? m_testSuites : "AllTests";

    if( m_numberOfTestIteration > 0 )
    {
        ::testing::GTEST_FLAG(repeat) = m_numberOfTestIteration;
    }

    // ::testing::GTEST_FLAG(filter) = suite;

    // GTEST_FLAG(output) = "xml:" + testOuputPath;

    ::testing::GTEST_FLAG(output)  = "xml:Report.xml";
    ::testing::FLAGS_gmock_verbose = "verbose";

    //    ::testing::GTEST_FLAG(print_time) = false;

    try
    {
        // ::testing::InitGoogleTest(&argc , argv);
        ::testing::InitGoogleMock(&argc, argv);
    }
    catch ( std::exception & e )
    {
        // LOG4_CXX_ERROR(didactics::test::logger , "Issues while innitializing test environment" << typeid (e).name () << ": " << e.what () );
        std::cerr << "Issues while innitializing test environment" << typeid ( e ).name () << ": " << e.what () <<
        std::endl;
    }
    catch ( ... )
    {
        std::cerr << "Unhandled exception" <<std::endl;
    }

    return RUN_ALL_TESTS();
}

void cppbdd101::test::Test::showUsage(std::string name)
{
    std::cerr << "Usage: " << argv[0] << " <option(s)> SOURCES"
              << "Options:\n"
              << "\t-h,--help\t\tShow this help message\n"
              << "\t-i,--iterration Number of iteration on test\t Default 1"
              << "\t-o,--outputpath Specify the destination path\t Default netx to executable"
              << "\t-l,--list Specify the list of tests to be executed\t Default netx to executable"
              << std::endl;
}