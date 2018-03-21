
#ifndef CPPBDD101_EDAC_TEST_HPP
#define CPPBDD101_EDAC_TEST_HPP

#include <vector>
#include <gmock/gmock.h>
#include <logger/logger.h>
namespace cppbdd101
{
    namespace test
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
        /*!
         * @brief Class logger.
         */
        static log4cxx::LoggerPtr logger;
        };
    }
}

#endif
