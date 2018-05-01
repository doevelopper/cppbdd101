
#ifndef CPPBDD101_EDAC_TEST_HPP
#define CPPBDD101_EDAC_TEST_HPP

#include <vector>
#include <gmock/gmock.h>
#include <cppbdd101/edac/LoggingService.hpp>

namespace cppbdd101
{
    namespace edac
    {
        class Test
        {
            public:

                Test();
                Test(std::string & suite, unsigned int iteration = 1);
                Test(const Test & orig) = default;
                virtual ~Test();

                int run (int argc = 0, char * argv[] = NULL);
                static void showUsage(std::string name);

            private:

                std::string m_testSuites;
                unsigned int m_numberOfTestIteration;
		static const  unsigned long LOGGER_WATCH_DELAY;
   	        LoggingService * m_loggerService;
                /*!
                 * @brief Class logger.
                 */
                static log4cxx::LoggerPtr logger;
        };
    }
}

#endif
