
#ifndef CPPBDD101_EDAC_GOOGLETESTCUSTOMEVENTLISTENER_HPP
#define CPPBDD101_EDAC_GOOGLETESTCUSTOMEVENTLISTENER_HPP

#include <gmock/gmock.h>
#include <cppbdd101/edac/LoggingService.hpp>

namespace cppbdd101
{
    namespace edac
    {
        class GoogleTestCustomEventListener : public ::testing::TestEventListener 
        {
        public:
            GoogleTestCustomEventListener(::testing::TestEventListener * eventListener,
                bool showProgramStartEnd,
                            bool showIterationsStartEnd,
                            bool showTestCases,
                bool showTestNames,
                bool showSuccesses,
                bool showFailures,
                bool showInlineFailures,
                bool showEnvironment);
            virtual ~GoogleTestCustomEventListener()  override ;

            class Parameters
            {
                Parameters( ::testing::TestEventListener* eventListener)
                {
                    this->eventListener = eventListener;
                }

                Parameters showProgramStartEnd() 
                {
                    programStartEnd = true;
                    return *this;
                }

                Parameters showIterationsStartEnd() 
                {
                    iterationsStartEnd = true;
                    return *this;
                }

                Parameters showTestCases() 
                {
                    testCases = true;
                    return *this;
                }
                Parameters showTestNames() 
                {
                    testNames = true;
                    return *this;
                }

                Parameters showSuccesses() 
                {
                    successes = true;
                    return *this;
                }

                Parameters showFailures() 
                {
                    failures = true;
                    return *this;
                }

                Parameters showInlineFailures() 
                {
                    inlineFailures = true;
                    return *this;
                }

                Parameters showEnvironment() 
                {
                    environment = true;
                    return *this;
                }
                
		GoogleTestCustomEventListener * set()
		{
		    return new GoogleTestCustomEventListener(this->eventListener, 
				                         this->programStartEnd, 
							 this->iterationsStartEnd,
				                         this->testCases, 
							 this->testNames, 
							 this->successes, 
							 this->failures, 
							 this->inlineFailures,
							 this->environment);
		}

            private:
                ::testing::TestEventListener * eventListener;
                bool programStartEnd = false;
                bool iterationsStartEnd = false;
                bool testCases = false;
                bool testNames = false;
                bool successes = false;
                bool failures = false;
                bool inlineFailures = false;
                bool environment = false;
            };

            virtual void OnTestProgramStart(const ::testing::UnitTest & unit_test) override;
            virtual void OnTestIterationStart(const ::testing::UnitTest & unit_test, int iteration) override;
            virtual void OnEnvironmentsSetUpStart(const ::testing::UnitTest& unit_test) override;
            virtual void OnEnvironmentsSetUpEnd(const ::testing::UnitTest& unit_test) override;
            virtual void OnTestCaseStart(const ::testing::TestCase& test_case) override;
            virtual void OnTestStart(const ::testing::TestInfo& test_info) override;
            virtual void OnTestPartResult(const ::testing::TestPartResult& result) override;
            virtual void OnTestEnd(const ::testing::TestInfo& test_info) override;
            virtual void OnTestCaseEnd(const ::testing::TestCase& test_case) override;
            virtual void OnEnvironmentsTearDownStart(const ::testing::UnitTest& unit_test) override;
            virtual void OnEnvironmentsTearDownEnd(const ::testing::UnitTest& unit_test) override;
            virtual void OnTestIterationEnd(const ::testing::UnitTest& unit_test, int iteration) override;
            virtual void OnTestProgramEnd(const ::testing::UnitTest& unit_test) override;

            protected:

            private:

            ::testing::TestEventListener* m_eventListener;
            const bool m_showProgramStartEnd = false;
            const bool m_showIterationsStartEnd = false;
            const bool m_showTestCases = false;
            const bool m_showTestNames = false;
            const bool m_showSuccesses = false;
            const bool m_showFailures = false;
            const bool m_showInlineFailures = false;
            const bool m_showEnvironment = false;

            /*!
            * @brief Class logger.
            */
             static log4cxx::LoggerPtr logger;
       };
    }
}


#endif
