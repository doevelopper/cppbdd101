
#ifndef CPPBDD101_EDAC_ERRORSLIST_HPP
#define CPPBDD101_EDAC_ERRORSLIST_HPP

#include <log4cxx/logger.h>

class ErrorsList
{
    public:

        using HRESULT = std::uint32_t;
        HRESULT EDAC_SUCCESS = (std::uint32_t)( 0ULL );
        // HRESULT EDAC_ERROR = ( !EDAC_SUCCESS );
        HRESULT EDAC_ERROR = 0xFFFFFFFF;

        enum class EdacErr : std::uint32_t
        {
            EDAC_OK = 0,        /**< No Error. */
            EDAC_ERR_FAIL,      /**< General systemic failure. */
            EDAC_ERR_LAST
        };

        enum class EdacErrSeverity : std::uint32_t
        {
            EDAC_ERR_SEV_NONE,
            EDAC_ERR_SEV_ERROR, /**< Most severe error - perhaps fatal. */
            EDAC_ERR_SEV_WARN,  /**< Warning level. Inconsistent or incorrect data seen but can carry on decode processing */
            EDAC_ERR_SEV_INFO  /**< Information only message. Use for debugging code or suspect input data. */
        };

        enum class operation : std::uint32_t
        {
            EDAC_FLAG_RD = 0x80000000,  /* Allow reads of variable */
            EDAC_FLAG_WR = 0x40000000,  /* Allow writes to the variable */
            EDAC_FLAG_RW = (EDAC_FLAG_RD|EDAC_FLAG_WR)
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
