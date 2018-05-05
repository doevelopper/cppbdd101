
#include <iostream>
#include <cstdlib>
#include <cppbdd101/edac/Test.hpp>

int main(int argc, char * argv[])
{

    cppbdd101::edac::Test cppbdd101Test;

    LOG4CXX_TRACE(log4cxx::Logger::getRootLogger(),"TEST CPP-101: Running EDAC UT");

    int numberOfTestFailure = cppbdd101Test.run(argc,argv);

    LOG4CXX_INFO(log4cxx::Logger::getRootLogger() , "Number of test FAILED: " << numberOfTestFailure);

    return ( EXIT_SUCCESS );
}

