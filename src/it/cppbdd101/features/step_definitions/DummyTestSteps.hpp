#ifndef CPPBDD101_FEATURES_STEP_DEFINITIONS_DUMMYTESTSTEPS_HPP
#define CPPBDD101_FEATURES_STEP_DEFINITIONS_DUMMYTESTSTEPS_HPP

#include <string>
#include <vector>
#include <gtest/gtest.h>
#include <cucumber-cpp/autodetect.hpp>

#include <cppbdd101/Dummy.hpp>

struct DummyCtx
{
    std::vector<cppbdd101::Dummy> dummies{};
    std::string say_hello_result{};
};


#endif
