#ifndef EDAC_EDACERROR_HPP
#define EDAC_EDACERROR_HPP

#include <cstdint>
#include <string>
#include <map>
#include <edac/ErrorsList.hpp>

/*!
 * @class ocsdError   
 * 
 *  @brief  This class is the error object for the Ocsd. 
 *          Errors are created with a severity (ocsd_err_severity_t) and a standard ocsd_err_t error code.
 *          Errors can optionally be created with a trace index (offset from start of capture buffer), and 
 *          trace CoreSight source channel ID.
 *
 *          A custom error message can be appended to the error.
 *
 *          The ocsdError class contains a static function to output a formatted string representation of an error.
 * 
 */

class EdacError 
{
public:
    using Index = std::uint32_t;
    EdacError();
    /*!
     *  @brief Default error constructor with severity and error code. 
     */
    EdacError(const ErrorsList::EdacErrSeverity sev_type, const ErrorsList::EdacErr code);
    /*!
     *  @brief Constructor with optional trace index. 
     */
    EdacError(const ErrorsList::EdacErrSeverity sev_type, const ErrorsList::EdacErr code, const Index idx);
    /*!
     * @brief Constructor with optional trace index and channel ID. 
     */
    EdacError(const ErrorsList::EdacErrSeverity sev_type, const ErrorsList::EdacErr code, const Index idx, const uint8_t chan_id);
    /*!
     * @brief Default error constructor with severity and error code - plus message. 
     */
    EdacError(const ErrorsList::EdacErrSeverity sev_type, const ErrorsList::EdacErr code, const std::string &msg);
    /*!
     * @brief Constructor with optional trace index - plus message. 
     */
    EdacError(const ErrorsList::EdacErrSeverity sev_type, const ErrorsList::EdacErr code, const Index idx, const std::string &msg);
    /*!
     * @brief Constructor with optional trace index and channel ID - plus message. 
     */
    EdacError(const ErrorsList::EdacErrSeverity sev_type, const ErrorsList::EdacErr code, const Index idx, const uint8_t chan_id, const std::string &msg);
   /*!
    * @brief Copy constructor 
    */
    EdacError(const EdacError *pError);
   /*!
    * @brief Copy constructor 
    */
    EdacError(const EdacError &Error);
    EdacError& operator=(const EdacError *p_err);
    EdacError& operator=(const EdacError &err);
    /*!
     * @brief Destructor 
     */
    virtual ~EdacError();
    /*!
     * @brief Set custom error message 
     */
    void setMessage(const std::string &msg);
    /*!
     * @brief Get custom error message 
     */
    const std::string &getMessage() const;
    /*!
     * @brief Get error code. 
     */
    ErrorsList::EdacErr getErrorCode() const;
    /*!
     * @brief Get error severity. 
     */
    ErrorsList::EdacErrSeverity getErrorSeverity() const;;
    /*!
     * @brief Generate a formatted error string for the supplied error. 
     */
    static const std::string getErrorString(const EdacError &error);

private:
    /*!
     * @brief build the error string. 
     */
    static void appendErrorDetails(std::string &errStr, const EdacError &error);
    /*!
     * @brief Make no parameter default constructor inaccessible.
     */
    //EdacError();

    ErrorsList::EdacErr m_error_code;   ///< Error code for this error
    ErrorsList::EdacErrSeverity m_sev;  ///< severity for this error
    Index m_idx;                        ///< Trace buffer index associated with this error (optional) */
    std::uint8_t m_chan_ID;             ///< trace  source ID associated with this error (optional) */
    std::string m_err_message;          ///< Additional text associated with this error (optional) */
    
    static const std::map<std::uint32_t, std::pair<std::string, std::string> > ERRORCODEMAPPER;

};

inline EdacError& EdacError::operator=(const EdacError *pErr)
{
    this->m_error_code = pErr->getErrorCode();
    this->m_sev = pErr->getErrorSeverity();
    //this->m_idx = p_err->getErrorIndex();
    //this->m_chan_ID = p_err->getErrorChanID();
    this->m_err_message = pErr->getMessage();
    return *this;
}

inline EdacError& EdacError::operator=(const EdacError &err)
{
    return (*this = &err);
}


#endif

