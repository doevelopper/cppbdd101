#include <edac/EdacError.hpp>

#include <sstream>
#include <iomanip>
#include <map>
#include <limits>

std::map<std::string, std::pair<int, std::string> > errorC =
{
    {"EDAC_OK", {0, "No Error."} },
    {"EDAC_ERR_LAST", { std::numeric_limits<int>::max(), "No Error."} },
};
        
std::map<std::string, std::string> errorCodeDescription =
{
    std::pair <std::string, std::string> ("EDAC_OK", "No Error."),
    std::pair <std::string, std::string> ("EDAC_ERR_LAST", "No error - error code end marker."),
};

static const char *s_errorCodeDescs[][2] = 
{
    {"EDAC_OK", "No Error."},
    {"EDAC_ERR_FAIL","General failure."},
    {"EDAC_ERR_LAST", "No error - error code end marker"}
}

EdacError::EdacError(const ErrorsList::EdacErrSeverity sev_type, const ErrorsList::EdacErr code)
: m_error_code(code)
, m_sev(sev_type)
{
}

EdacError::~EdacError() 
{
}

const std::string EdacError::getErrorString(const EdacError &error)
{
    
}

void EdacError::appendErrorDetails(std::string &errStr, const EdacError &error)
{
    int numerrstr = ((sizeof(s_errorCodeDescs) / sizeof(const char *)) / 2);
    int code = (int)error.getErrorCode
    Index idx = error.getErrorIndex();
    std::uint8_t chan_ID = error.getErrorChanID

    std::ostringstream oss;
    oss << "0x" << std::hex << std::setfill('0') << std::setw(4) << code;
    if(code < numerrstr)
    {
        oss << " (" << s_errorCodeDescs[code][0] << ") [" << s_errorCodeDescs[code][1] << "]; ";
    }
    else
    {
        oss << " (unknown); ";
    }

    if(idx != OCSD_BAD_TRC_INDEX)
    {
        oss << "TrcIdx=" << std::dec << idx << "; ";
    }

    if(chan_ID != OCSD_BAD_CS_SRC_ID)
    {
        oss << "CS ID=" << std::hex << std::setfill('0') << std::setw(2) << (std::uint16_t)chan_ID << "; ";
    }

    oss << error.getMessage();
    errStr = oss.str();
}
