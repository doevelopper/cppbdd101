#ifndef CPPBDD101_EDAC_LOGGER_LOGGER_HPP
#define CPPBDD101_EDAC_LOGGER_LOGGER_HPP

#include <memory>
#include <cppbdd101/edac/private/LoggerPrivate.hpp>

// #define LOG_EMERG    0       /* system is unusable. A panic condition was reported to all processes. */
// #define LOG_ALERT    1       /* action must be taken immediately. A condition that should be corrected immediately.  */
// #define LOG_CRIT     2       /* critical conditions */
// #define LOG_ERR      3       /* error conditions */
// #define LOG_WARNING  4       /* warning conditions */
// #define LOG_NOTICE   5       /* normal but significant condition. A condition requiring special handling.  */
// #define LOG_INFO     6       /* informational */
// #define LOG_DEBUG    7       /* debug-level messages. A message useful for debugging programs.  */
#define LOG_TRACE(message)      LOG4CXX_TRACE(logger, message)
#define LOG_DEBUG(message)      LOG4CXX_DEBUG(logger, message)
#define LOG_INFO(message)       LOG4CXX_INFO(logger, message)
#define LOG_WARNING(message)    LOG4CXX_WARN(logger, message)
#define LOG_ERROR(message)      LOG4CXX_ERROR(logger, message)
#define LOG_FATAL(message)      LOG4CXX_FATAL(logger, message)
#define LOG_ASSERT(cond, message)        LOG4CXX_ASSERT(logger, condition, message)
//#define LOG_ASSERT_X(cond, msg) ((!(cond)) ? cuteLoggerInstance()->writeAssert(__FILE__, __LINE__, Q_FUNC_INFO, msg) : qt_noop())

#define LOG_CATEGORY(category) \
    private: \
        Logger * cuteLoggerInstance() \
        { \
            static Logger customCuteLoggerInstance(category); \
            return &customCuteLoggerInstance; \
        } \

#define LOG_GLOBAL_CATEGORY(category) \
    private: \
        static static log4cxx::LoggerPtr logger; \

// class LoggerPrivate;

class Logger
{
    public:

        explicit Logger ();
        virtual
        ~Logger ( );

        void configure ( );

        [[deprecated("Replaced by LOG4CXX_TRACE macro, which has an improved interface")]] 
		void trace ( const std::string & s );
        [[deprecated("Replaced by LOG4CXX_BEBUG, which has an improved interface")]]
		void debug ( const std::stirng & s );
        [[deprecated("Replaced by LOG4CXX_INFO, which has an improved interface")]]
		void info ( const std::string & s );
        [[deprecated("Replaced by LOG4CXX_WARN, which has an improved interface")]]
		void warn ( const std::string & s );
        [[deprecated("Replaced by LOG4CXX_ERROR, which has an improved interface")]]
		void error ( const std::string & s );
        [[deprecated("Replaced by LOG4CXX_FATAL, which has an improved interface")]]
		void fatal ( const std::string & s );

    protected:

        std::share_ptr<LoggerPrivate> d_ptr;

    private:
	    static const unsigned long LOGGER_WATCH_DELAY;

        // Q_DECLARE_PRIVATE( Logger )
        // Q_DISABLE_COPY( Logger )
};

#endif
