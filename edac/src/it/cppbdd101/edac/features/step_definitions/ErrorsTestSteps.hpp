#ifndef CPPBDD101_EDAC_FEATURES_STEP_DEFINITIONS_ERRORSTESTSTEPS_HPP
#define CPPBDD101_EDAC_FEATURES_STEP_DEFINITIONS_ERRORSTESTSTEPS_HPP

#include <gtest/gtest.h>
#include <cucumber-cpp/autodetect.hpp>
#include <cstdint>
#include <cppbdd101/edac/LoggingService.hpp>

struct LoggingContext
{
    LoggingService logSrv;
};
struct EdacContext
{
    std::uint32_t e;
};

#endif
