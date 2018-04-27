
#include <cppbdd101/edac/Test.hpp>

log4cxx::LoggerPtr cppbdd101::edac::Test::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.edac.Test") );
const unsigned long cppbdd101::edac::Test::LOGGER_WATCH_DELAY = 5000UL;

cppbdd101::edac::Test::Test()
    : m_testSuites(std::string() )
    , m_numberOfTestIteration(1)
    , m_loggerService(new LoggingService(LOGGER_WATCH_DELAY))
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

cppbdd101::edac::Test::Test(std::string & suite, unsigned int iteration)
    : m_testSuites(suite)
    , m_numberOfTestIteration(iteration)
    , m_loggerService(new LoggingService(LOGGER_WATCH_DELAY))
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

cppbdd101::edac::Test::~Test()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    delete this->m_loggerService;
}


int cppbdd101::edac::Test::run (int argc, char * argv[])
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);

    if ( argc < 3 )
    {
        showUsage(argv[0]);

        return (EXIT_FAILURE);
    }

    std::vector< std::string > listOfTest;
    std::string outputPath;

    for ( unsigned int i = 1; i < argc; ++i )
    {
        std::string arg = argv[i];

        if ( ( arg == "-h" ) || ( arg == "--help" ) )
        {
            showUsage(argv[0]);

            return (EXIT_SUCCESS);
        }
        else if ( !( std::string(argv[i]).compare("-v") ) || ( !( std::string(argv[i]).compare("--verbose") ) ) )
        {

        }
        else if ( !( std::string(argv[i]).compare("-i") ) || ( !( std::string(argv[i]).compare("--iteration") ) ) )
        {
             m_numberOfTestIteration = atoi(argv[i + 1]);
        }
        else if ( !( std::string(argv[i]).compare("-o") ) || ( !( std::string(argv[i]).compare("--outputpath") ) ) )
        {
             outputPath = argv[i + 1];
        }
        else if ( !( std::string(argv[i]).compare("-d") ) ||
                      ( !( std::string(argv[i]).compare("--destination") ) ) )
        {
             if ( i + 1 < argc )
             {         // Make sure we aren't at the end of argv!
                    // destination = argv[i++]; // Increment 'i' so we don't get the argument as the next argv[i].
             }
             else
             {         // Uh-oh, there was no argument to the destination option.
                 LOG4CXX_ERROR(logger, "--destination option requires one argument.");

                 return (EXIT_FAILURE);
             }
        }
        else
        {
                // listOfTest.push_back(argv[i]);
        }
    }

    const std::string name = !m_testSuites.empty() ? m_testSuites : "AllTests";

    LOG4CXX_INFO(logger, "Execute tests with args: "
                 << "Number Of Iteration " << m_numberOfTestIteration
                 << "xml report ouput path " << outputPath);

    ::testing::GTEST_FLAG(repeat) = m_numberOfTestIteration;

    // ::testing::GTEST_FLAG(filter) = suite;
    // GTEST_FLAG(output) = "xml:" + testOuputPath;
    ::testing::GTEST_FLAG(output)  = "xml:Report.xml";
    // ::testing::FLAGS_gmock_verbose = "verbose";

    // ::testing::GTEST_FLAG(print_time) = false;
    // testing::GTEST_FLAG(also_run_disabled_tests);
    // testing::GTEST_FLAG(break_on_failure);
    // testing::GTEST_FLAG(catch_exceptions);
    testing::GTEST_FLAG(color);
    // testing::GTEST_FLAG(death_test_use_fork);
    // testing::GTEST_FLAG(filter);
    // testing::GTEST_FLAG(list_tests);
    // testing::GTEST_FLAG(random_seed);
    // testing::GTEST_FLAG(repeat);
    // testing::GTEST_FLAG(show_internal_stack_frames);
    // testing::GTEST_FLAG(shuffle);
    // testing::GTEST_FLAG(stack_trace_depth);
    // testing::GTEST_FLAG(stream_result_to);
    // testing::GTEST_FLAG(throw_on_failure)

    try
    {
        LOG4CXX_TRACE(logger , "Innitializing google mock");
        // ::testing::InitGoogleTest(&argc , argv);
		// ::testing::InitGoogleMock(&argc , argv);
    }
    catch ( std::exception & e )
    {
        LOG4CXX_ERROR(logger,"Issues while innitializing test environment" << typeid ( e ).name () << ": " << e.what () );

        // std::cerr << "Issues while innitializing test environment" << typeid ( e ).name () << ": " << e.what () <<std::endl;
    }
    catch ( ... )
    {
        LOG4CXX_FATAL(logger, "Unhandled exception!");

        // std::cerr << "Unhandled exception" <<std::endl;
    }

    const ::testing::TestInfo * const testInfo = ::testing::UnitTest::GetInstance()->current_test_info();
    LOG4CXX_TRACE(logger , ">>>>>>>>!!!!Test Name!!!!>>>>>>>> ("<< testInfo->name() <<")");
    LOG4CXX_TRACE(logger , ">>>>>>>>!!!!Test Case Name!!!!>>>>>>>> ("<< testInfo->test_case_name() <<")");

    LOG4CXX_TRACE(logger , ">>>>>>>>!!!!Star running unit test!!!!>>>>>>>> ("
                    << ::testing::UnitTest::GetInstance()->test_case_to_run_count() <<")");
    return RUN_ALL_TESTS();

}

void cppbdd101::edac::Test::showUsage(std::string name)
{
    LOG4CXX_TRACE(logger ,"Usage called");

    std::cerr << "Usage: " << name << " <option(s)> SOURCES"
              << "Options:\n"
              << "\t-h,--help\t\tShow this help message\n"
              << "\t-i,--iterration Number of iteration on test\t Default 1"
              << "\t-o,--outputpath Specify the destination path\t Default netx to executable"
              << "\t-l,--list Specify the list of tests to be executed\t Default netx to executable"
              << std::endl;
}

