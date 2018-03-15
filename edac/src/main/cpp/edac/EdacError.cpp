#include <edac/EdacError.hpp>

#include <sstream>
#include <iomanip>
#include <limits>
#include <gmock/gmock-actions.h>

const std::map<std::uint32_t, std::pair<std::string, std::string> > ERRORCODEMAPPER =
{
    {0, {"EDAC_OK", "No Error."} },
    {1, {"EDAC_ERR_FAIL", "General failure."} },
    {std::numeric_limits<int>::max(), {"EDAC_ERR_LAST" , "No Error."} },
};

EdacError::EdacError(const ErrorsList::EdacErrSeverity sev_type, const ErrorsList::EdacErr code)
: m_error_code(code)
, m_sev(sev_type)
{
}

EdacError::~EdacError() 
{
}

void 
EdacError::setMessage(const std::string &msg) 
{ 
    m_err_message = msg; 
}

const std::string & 
EdacError::getMessage() const 
{ 
    return m_err_message; 
}

ErrorsList::EdacErr 
EdacError::getErrorCode() const 
{ 
    return m_error_code; 
}

ErrorsList::EdacErrSeverity 
EdacError::getErrorSeverity() const  
{ 
    return m_sev; 
}

const std::string 
EdacError::getErrorString(const EdacError &error)
{
    switch(error.getErrorSeverity())
    {
        case ErrorsList::EdacErrSeverity::EDAC_ERR_SEV_NONE:
        break;
        case ErrorsList::EdacErrSeverity::EDAC_ERR_SEV_INFO:
        break;
        case ErrorsList::EdacErrSeverity::EDAC_ERR_SEV_WARN:
        break;
        case ErrorsList::EdacErrSeverity::EDAC_ERR_SEV_ERROR:
        break;
        default:
        break;
    }
    
    return(std::string("SCHROEDINBUG Severity"));
}

void EdacError::appendErrorDetails(std::string & errStr, const EdacError & error)
{
    std::uint32_t code = static_cast<std::uint32_t>(error.getErrorCode());

    std::ostringstream oss;
    oss << "0x" << std::hex << std::setfill('0') << std::setw(8) << code;

    if(ERRORCODEMAPPER.find(code) != std::end(ERRORCODEMAPPER))
    {
        oss << " (" << code << ") [" << std::get<1>(ERRORCODEMAPPER.find(code)->second) << "]; ";
    }
    else
    {
        oss << " (unknown); ";
    }

    oss << error.getMessage();
    errStr = oss.str();
}
