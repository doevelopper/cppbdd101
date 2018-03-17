#ifndef EDAC_ERRORSLIST_HPP
#define EDAC_ERRORSLIST_HPP
#include <log4cxx/logger.h>

class ErrorsList 
{
public:
    enum class EdacErr
    {
        EDAC_OK = 0,         /**< No Error. */
        EDAC_ERR_FAIL,      /**< General systemic failure. */
        EDAC_ERR_LAST
    };
    enum class EdacErrSeverity
    {
        EDAC_ERR_SEV_NONE,     
        EDAC_ERR_SEV_ERROR,    /**< Most severe error - perhaps fatal. */
        EDAC_ERR_SEV_WARN,     /**< Warning level. Inconsistent or incorrect data seen but can carry on decode processing */
        EDAC_ERR_SEV_INFO,     /**< Information only message. Use for debugging code or suspect input data. */
    };

    ErrorsList();
    virtual ~ErrorsList();
private:
    /*!
     * @brief Class logger. 
     */
    static log4cxx::LoggerPtr logger;
};

#endif

