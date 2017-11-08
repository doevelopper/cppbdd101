#ifndef EXERCISES_LOGGINGSERVICE_HPP
#define EXERCISES_LOGGINGSERVICE_HPP
/*! 
 * @file LoggingService.hpp
 * @brief Function prototypes for the console driver.
 *         This contains the prototypes for the console
 * @bug No known bugs.
 * @version APP_VERSION_STR 
 * @section DESCRIPTION
 *  
 *  This is a little program that reads a list of names from
 *  a specified file or from standard input and then sorts
 *  the names in ascending order and prints them to standard
 *  output.
 *  
 *  Command line arguments are used to specify where the
 *  list of names should be read from.  If the program
 *  doesn't receive any command line arguments then it reads
 *  the names from standard input. If the program receives
 *  a single command line argument then it reads the names
 *  from the corresponding file.  If more than one command
 *  line argument is specified the program prints a usage
 *  message and terminates.
 *
 */
#include <string>
#include <stdexcept>
#include <apr-1/apr.h>
#include <log4cxx/logger.h>
#include <log4cxx/appender.h>
#include <log4cxx/basicconfigurator.h>
#include <log4cxx/propertyconfigurator.h>
#include <log4cxx/helpers/exception.h>
#include <log4cxx/consoleappender.h>                              // CONSOLE Appender
#include <log4cxx/fileappender.h>                                 // FILE Appender
#include <log4cxx/rolling/rollingfileappender.h>                  // ROLLING FILE Appender
#include <log4cxx/nt/nteventlogappender.h>                        // NT EVENT LOG Appender
#include <log4cxx/nt/outputdebugstringappender.h>                 // NT OUTPUTDEBUGSTRING Appender
#include <log4cxx/net/socketappender.h>                           // SOCKET Appender
#include <log4cxx/simplelayout.h>                                 // needed for simple layout
#include <log4cxx/patternlayout.h>                                // needed for pattern layout
#include <log4cxx/logmanager.h>
#include <log4cxx/logstring.h>                                    // has typedefed string type used in log4cxx
#include <log4cxx/rolling/rollingpolicy.h>
#include <log4cxx/rolling/rollingpolicybase.h>
#include <log4cxx/rolling/triggeringpolicy.h>
#include <log4cxx/rolling/sizebasedtriggeringpolicy.h>
#include <log4cxx/rolling/fixedwindowrollingpolicy.h>
#include <log4cxx/xml/domconfigurator.h>
/*!
 *  @brief Function prototypes for the console driver.
 *         This contains the prototypes for the console
 *  @bug No known bugs.
 */
class LoggingService 
{
public:
/*!
 * @brief 
 * @param delay Volue in ms to check if logger config level has changed.
 */
    LoggingService(unsigned long delay = 5000L);
/*!
 * @brief 
 * @param delay Volue in ms to check if logger config level has changed.
 */
    LoggingService(const LoggingService & rsh);
/*!
 * @brief 
 */
    virtual ~LoggingService();
/*!
 * @brief 
 */    
    log4cxx::LoggerPtr operator -> (void)
    {
        return this->m_logger;
    }
/*!
 * @brief 
 */
    log4cxx::LoggerPtr operator = (const LoggingService &logger)
    {
        return this->m_logger;
    }
/*!
 * @brief Retrieve valy of delay beetween the read of config file
 * @param  s is a char array containing a proper C-string 
 * @return value do delay (minus null) as an usigned int
 */
    unsigned long periodicalCheck () const;
/*!
 * @brief 
 */
    bool loggerReset ();
/*!
 * @brief
 * @param[in]  loggerName  The Logger name to get reference from. 
 */
    log4cxx::LoggerPtr getLoggerByName (const char * loggerName);

private:
    /*!
     *  @brief 
     *  @return logger configuration status 
     */
    bool checkLogManagerStatus ();
    /*!
     *  @brief
     *  @param[in,out] dest 
     *  @return file extension  
     */
    std::string getFileExtension (const std::string & s);

    static const char * configEnv;      ///< Array of MPEG frame sizes (bytes)
    log4cxx::LoggerPtr m_logger;  ///< Array of MPEG frame sizes (bytes)
    unsigned long m_watchPeriod;  ///< Value for periodical check if configFilename has been created or modified!
};

#endif

