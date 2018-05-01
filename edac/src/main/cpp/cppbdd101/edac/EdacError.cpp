
#include <cppbdd101/edac/EdacError.hpp>
#include <sstream>
#include <iomanip>
#include <limits>

log4cxx::LoggerPtr EdacError::logger = log4cxx::Logger::getLogger(std::string("cppbdd101.edac.EdacError") );

const std::map< std::uint32_t, std::pair< std::string, std::string > > ERRORCODEMAPPER =
{
    {0, {"EDAC_OK", "No Error."} },
    {1, {"EDAC_ERR_FAIL", "General failure."} },
    {std::numeric_limits< int >::max(), {"EDAC_ERR_LAST", "No Error."} },
};

EdacError::EdacError()
  : m_error_code(ErrorsList::EdacErr::EDAC_OK)
  , m_sev(ErrorsList::EdacErrSeverity::EDAC_ERR_SEV_NONE)
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

EdacError::EdacError(const ErrorsList::EdacErrSeverity sev_type, const ErrorsList::EdacErr code)
    : m_error_code(code)
    , m_sev(sev_type)
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

EdacError::~EdacError()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

void
EdacError::setMessage(const std::string & msg)
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    m_err_message = msg;
}

const std::string &
EdacError::getMessage() const
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);

    return (m_err_message);
}

ErrorsList::EdacErr
EdacError::getErrorCode() const
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);

    return (m_error_code);
}

ErrorsList::EdacErrSeverity
EdacError::getErrorSeverity() const
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);

    return (m_sev);
}

const std::string
EdacError::getErrorString(const EdacError & error)
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);

    switch( error.getErrorSeverity() )
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

    return( std::string("SCHROEDINBUG Severity") );
}

void EdacError::appendErrorDetails(std::string & errStr, const EdacError & error)
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    std::uint32_t code = static_cast< std::uint32_t >( error.getErrorCode() );
/*
    std::ostringstream oss;
    oss << "0x" << std::hex << std::setfill('0') << std::setw(8) << code;

    if( ERRORCODEMAPPER.find(code) != std::end(ERRORCODEMAPPER) )
    {
        oss << " (" << code << ") [" << std::get< 1 >(ERRORCODEMAPPER.find(code)->second) << "]; ";
    }
    else
    {
        oss << " (unknown); ";
    }

    oss << error.getMessage();
    errStr = oss.str();
*/
}
