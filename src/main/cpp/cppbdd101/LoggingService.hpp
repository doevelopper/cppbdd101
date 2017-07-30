#ifndef EXERCISES_LOGGINGSERVICE_HPP
#define EXERCISES_LOGGINGSERVICE_HPP

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

class LoggingService 
{
public:
    LoggingService(unsigned long delay = 5000L);
    LoggingService(const LoggingService & rsh);
    virtual ~LoggingService();
    
    log4cxx::LoggerPtr operator -> (void)
    {
        return this->m_logger;
    }

    log4cxx::LoggerPtr operator = (const LoggingService &logger)
    {
        return this->m_logger;
    }

    unsigned long periodicalCheck () const;

    bool loggerReset ();
    log4cxx::LoggerPtr getLoggerByName (const char * loggerName);

private:
    static const char * configEnv;
    log4cxx::LoggerPtr m_logger;
    bool checkLogManagerStatus ();
    std::string getFileExtension (const std::string & s);
    /*!
     *  @brief Value for periodical check if configFilename has been created or modified!
     */
    unsigned long m_watchPeriod;
};

#endif

