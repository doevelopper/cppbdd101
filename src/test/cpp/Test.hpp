#ifndef TEST_HPP
#define TEST_HPP
#include <vector>
#include <gmock/gmock.h>
namespace cppbdd101 
{
	namespace test
	{	
            class Test 
            {
            public:
                Test();
                Test(std::string & suite,unsigned int iteration = 1);
                Test(const Test& orig) = default;
                virtual ~Test();
                
                int run (int argc = 0 , char * argv[] = NULL);
            private:
		std::string m_testSuites;
		unsigned int m_numberOfTestIteration;
            };
        }
}

#endif

