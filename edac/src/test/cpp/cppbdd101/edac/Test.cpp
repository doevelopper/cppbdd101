
#include <cppbdd101/edac/Test.hpp>

log4cxx::LoggerPtr cppbdd101::edac::Test::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.edac.Test") );
const unsigned long cppbdd101::edac::Test::LOGGER_WATCH_DELAY = 5000UL;


cppbdd101::edac::Test::Test()
    : m_testSuites(std::string())
    , m_xmlTestReportName(std::string("Edac.xml"))
    , m_numberOfTestIteration(1)
    , m_loggerService(new LoggingService(LOGGER_WATCH_DELAY))
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

cppbdd101::edac::Test::Test(std::string & suite, unsigned int iteration)
    : m_testSuites(suite)
    , m_xmlTestReportName(std::string("Edac.xml"))
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

    std::vector< std::string > listOfTest;
    std::string outputPath;

    //LOG4CXX_INFO(logger, "Execute tests with args: "  << "Number Of Iteration " << m_numberOfTestIteration 
    // /*<< "xml report ouput path " << outputPath*/);
    //::testing::GTEST_FLAG(repeat) = m_numberOfTestIteration;
    // ::testing::GTEST_FLAG(filter) = suite;
    ::testing::GTEST_FLAG(output) = "xml:Report.xml";// + outputPath + xmlTestReportName ;
    // ::testing::GTEST_FLAG(print_time) = false;
    // testing::GTEST_FLAG(also_run_disabled_tests);
    // testing::GTEST_FLAG(break_on_failure);
    // testing::GTEST_FLAG(catch_exceptions);
    //::testing::GTEST_FLAG(color) = "yes";
    // testing::GTEST_FLAG(death_test_use_fork);
    // testing::GTEST_FLAG(filter);
    //::testing::GTEST_FLAG(list_tests) = true;
    // testing::GTEST_FLAG(random_seed);
    // testing::GTEST_FLAG(repeat);
    // testing::GTEST_FLAG(show_internal_stack_frames);
    // testing::GTEST_FLAG(shuffle);
    // testing::GTEST_FLAG(stack_trace_depth);
    // testing::GTEST_FLAG(stream_result_to);
    // testing::GTEST_FLAG(throw_on_failure)

    ::testing::InitGoogleTest(&argc , argv);
    return RUN_ALL_TESTS();
}

void cppbdd101::edac::Test::showUsage(std::string name)
{
    LOG4CXX_TRACE(logger ,"Usage called");

    std::cerr << "Usage: " << name << " <option(s)> SOURCES \n"
              << "Options:\n"
              << "\t-h,--help \t Show this help message\n"
              << "\t-i,--iterration \t Number of iteration on test Default 1\n"
              << "\t-o,--outputpath \t Specify the destination path Default netx to executable\n"
	      << "\t-m,--module \t The name of xml test report to be generated\n"
              << "\t-l,--list \t Specify the list of tests to be executed Default netx to executable\n"
              << std::endl;
}

