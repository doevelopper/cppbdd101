
#include <cppbdd101/edac/ErrorCode.hpp>
#include <cppbdd101/edac/FutureError.hpp>
#include <cppbdd101/edac/GenericError.hpp>
#include <cppbdd101/edac/IOError.hpp>
#include <cppbdd101/edac/LowLevelApiError.hpp>
#include <cppbdd101/edac/SystemError.hpp>
#include <cppbdd101/edac/IsErrorActive.hpp>

ErrorCode::ErrorCode()
{
}

ErrorCode::~ErrorCode()
{
}

void ErrorCode::check(std::error_code ec)
{
    /*
       ec = std::error_code(errno, std::system_category());
       if(ec == std::errc::no_such_file_or_directory)
       {
        std::error_condition ec2(ec.default_error_condition());
       }
     */
}

const std::error_category & ErrorCode::future_category() noexcept
{
    static const FutureError impl{};

    return impl;
}

const std::error_category & ErrorCode::generic_category() noexcept
{
    static const GenericError impl{};

    return impl;
}

const std::error_category & ErrorCode::io_category() noexcept
{
    static const IOError impl{};

    return impl;
}

const std::error_category & ErrorCode::api_category() noexcept
{
    static const LowLevelApiError impl{};

    return impl;
}

const std::error_category & ErrorCode::sys_category() noexcept
{
    static const SystemError impl{};

    return impl;
}
