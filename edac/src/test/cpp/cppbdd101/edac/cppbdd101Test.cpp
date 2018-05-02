
#include <iostream>
#include <cstdlib>
#include <cppbdd101/edac/Test.hpp>

int main(int argc, char * argv[])
{
    // int numberOfTestFailure =  ::test::execute(argc , argv);
    // LOG4CXX_INFO(log4cxx::Logger::getRootLogger() , "Number of test FAILED: " << numberOfTestFailure);
    //// LOG4CXX_INFO(log4cxx::Logger::getRootLogger() , "Number of test FAILED: " << numberOfTestFailure <<"/"<<didactics::test::trInfo.at(0).second);

    cppbdd101::edac::Test cppbdd101Test;
    LOG4CXX_INFO(log4cxx::Logger::getRootLogger() , __LOG4CXX_FUNC__ );
    int numberOfTestFailure = cppbdd101Test.run(argc,argv);
    LOG4CXX_INFO(log4cxx::Logger::getRootLogger() , "Number of test FAILED: " << numberOfTestFailure);
    return ( EXIT_SUCCESS );
}

