
#include <cppbdd101/edac/GoogleTestCustomEventListener.hpp>

log4cxx::LoggerPtr cppbdd101::edac::GoogleTestCustomEventListener::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.edac.GoogleTestCustomEventListener") );

cppbdd101::edac::GoogleTestCustomEventListener::GoogleTestCustomEventListener(
		::testing::TestEventListener* eventListener,
                bool showProgramStartEnd,
                bool showIterationsStartEnd,
                bool showTestCases,
                bool showTestNames,
                bool showSuccesses,                                                                                                                                       bool showFailures,
                bool showInlineFailures,
                bool showEnvironment
)
  : m_eventListener(eventListener)
  , m_showProgramStartEnd(showProgramStartEnd)
  , m_showIterationsStartEnd(showIterationsStartEnd)
  , m_showTestCases(showTestCases)
  , m_showTestNames(showTestNames)
  , m_showSuccesses(showSuccesses)
  , m_showFailures(showFailures)
  , m_showInlineFailures(showInlineFailures)
  , m_showEnvironment(showEnvironment)
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

cppbdd101::edac::GoogleTestCustomEventListener::~GoogleTestCustomEventListener()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    delete m_eventListener;
}

void cppbdd101::edac::GoogleTestCustomEventListener::OnTestProgramStart(const ::testing::UnitTest & unit_test)
{
    if (m_showProgramStartEnd) 
    {
         m_eventListener->OnTestProgramStart(unit_test);
    }
}

void cppbdd101::edac::GoogleTestCustomEventListener::OnTestIterationStart(const ::testing::UnitTest & unit_test, int iteration)
{
    if (m_showIterationsStartEnd) 
    {
        m_eventListener->OnTestIterationStart(unit_test, iteration);
    }
}

void cppbdd101::edac::GoogleTestCustomEventListener::OnEnvironmentsSetUpStart(const ::testing::UnitTest& unit_test)
{
    if (m_showEnvironment) 
    {
        m_eventListener->OnEnvironmentsSetUpStart(unit_test);
    }
}


void cppbdd101::edac::GoogleTestCustomEventListener::OnEnvironmentsSetUpEnd(const ::testing::UnitTest& unit_test)
{
    if (m_showEnvironment) 
    {
          m_eventListener->OnEnvironmentsSetUpEnd(unit_test);
    }
}


void cppbdd101::edac::GoogleTestCustomEventListener::OnTestCaseStart(const ::testing::TestCase& test_case)
{
   if (m_showTestCases) 
   {
	m_eventListener->OnTestCaseStart(test_case);
   }
}

void cppbdd101::edac::GoogleTestCustomEventListener::OnTestStart(const ::testing::TestInfo& test_info)
{
       if (m_showTestNames) 
       {
	   m_eventListener->OnTestStart(test_info);
        }
}

void cppbdd101::edac::GoogleTestCustomEventListener::OnTestPartResult(const ::testing::TestPartResult& result)
{
    if (m_showSuccesses && result.passed()) 
    {
           m_eventListener->OnTestPartResult(result);
     }

     if (m_showFailures && result.failed()) 
     {
           m_eventListener->OnTestPartResult(result);
     }
}

void cppbdd101::edac::GoogleTestCustomEventListener::OnTestEnd(const ::testing::TestInfo& test_info)
{
    if ((m_showInlineFailures && test_info.result()->Failed())
                || (m_showSuccesses && !test_info.result()->Failed())) 
    {
        m_eventListener->OnTestEnd(test_info);
    }
}

void cppbdd101::edac::GoogleTestCustomEventListener::OnTestCaseEnd(const ::testing::TestCase& test_case) 
{
    if (m_showTestCases) 
    {
       m_eventListener->OnTestCaseEnd(test_case);
    }
}

void cppbdd101::edac::GoogleTestCustomEventListener::OnEnvironmentsTearDownStart(const ::testing::UnitTest& unit_test) 
{
  if (m_showEnvironment) 
  {
    m_eventListener->OnEnvironmentsTearDownStart(unit_test);
  }
}

void cppbdd101::edac::GoogleTestCustomEventListener::OnEnvironmentsTearDownEnd(const ::testing::UnitTest& unit_test)
{
  if (m_showEnvironment) 
  {
      m_eventListener->OnEnvironmentsTearDownEnd(unit_test);
  }
}

void cppbdd101::edac::GoogleTestCustomEventListener::OnTestIterationEnd(const ::testing::UnitTest& unit_test, int iteration)
{
  if (m_showIterationsStartEnd) 
  {
         m_eventListener->OnTestIterationEnd(unit_test, iteration);
  }
}

void cppbdd101::edac::GoogleTestCustomEventListener::OnTestProgramEnd(const ::testing::UnitTest& unit_test)
{
    if (m_showProgramStartEnd) 
    {
            m_eventListener->OnTestProgramEnd(unit_test);
    }
}



