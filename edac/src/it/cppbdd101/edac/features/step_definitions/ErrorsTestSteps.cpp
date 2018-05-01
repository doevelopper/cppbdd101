#include <cppbdd101/edac/features/step_definitions/ErrorsTestSteps.hpp>

using cucumber::ScenarioScope;

GIVEN("^I have crated a logger and set (\\d+)ms as file watch period$") 
{
    REGEX_PARAM(double, n);
    //ScenarioScope<LoggingContext> context;
    //context->calc.push(n);
}
