
#include <iostream>
#include <cstdlib>
#include <cppbdd101/edac/Test.hpp>

int main(int argc, char * argv[])
{
	// Logger * whole = new Logger(5000);
    // LOG4CXX_TRACE(didactics::test::logger , __LOG4CXX_FUNC__ );
    // int numberOfTestFailure = didactics::core::test::execute(argc , argv);

    // LOG4CXX_INFO(didactics::test::logger , "Number of test FAILED: " << numberOfTestFailure);
    //// LOG4CXX_INFO(didactics::test::logger , "Number of test FAILED: " << numberOfTestFailure <<"/"<<didactics::test::trInfo.at(0).second);

	// delete whole;

    cppbdd101::test::Test cppbdd101Test;    // = new cppbdd101::test::Test();

    // cppbdd101Test.run(&argc,&argv);
    return ( EXIT_SUCCESS );
}
