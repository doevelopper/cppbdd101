
#include <map>
#include <cppbdd101/edac/Demangle.hpp>

using namespace cppbdd101::edac;

log4cxx::LoggerPtr Demangle::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.edac.Demangle") );

Demangle::Demangle() 
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}

Demangle::~Demangle() 
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
}

const char*  Demangle::cxaDemangle(const std::type_info &typeInfo)
{
    LOG4CXX_TRACE(logger , __LOG4CXX_FUNC__);
    static std::map<std::type_index, std::unique_ptr<char, void (*)(void *)>> cache;
    auto typeIndex = std::type_index(typeInfo);
    auto iter = cache.find(typeIndex);

    if (iter != std::end(cache)) 
    {
        return iter->second.get();
    }
    
    int status;

    std::unique_ptr<char, void (*)(void *)> result(
        abi::__cxa_demangle(typeInfo.name(), nullptr, nullptr, &status),
        std::free
    );

    if (status != 0) 
    {
	LOG4CXX_ERROR(logger,"Demangle failed.");
        //throw std::runtime_error("Demangle failed.");
    }

    std::tie(iter, std::ignore) = cache.emplace(typeIndex, std::move(result));

    return (iter->second.get());
}
