
#ifndef CPPBDD101_EDAC_EXCEPTIONS_HPP
#define CPPBDD101_EDAC_EXCEPTIONS_HPP

#include <memory>
#include <stdexcept>

/*!
 * @brief Base class for every exception thrown in <>.
 *        C - Computational problem
 *        H - Hardware problem
 *        I - I/O and file problem
 *        L - Library function problem
 *        D - Data input problem
 *        R - Return value problem: function or procedure call
 *        E - External user/client problem  (in embedded systems this may include control network exceptions)
 *        N - Null pointer or memory problems
 */

class Exceptions : public std::exception
{
    /*!
     *  @brief  Wrapper class to define a different terminate handler. The terminate
     *          handler is the function that will be called by the runtime system when
     *          exception handling must be abandoned.
     */
    class TerminateHandler
    {
        /*!
         * @brief Options that set the behavior of this class:
         */
        enum class TerminateAction
        {
            NOTHING           = 0x0,      /*! Do nothing. Don't even install termination handlers. */
            BACKTRACE         = 0x1,      /*! Load gdb and get a stack dump using gdb bt command.  */
            WEAK_BACKTRACE    = 0x2,      /*! Get backtrace using glibc::backtrace. */
            TRAP_MANY_SIGNALS = 0x4,      /*! Trap a lot of signals not normally trapped. */
            USE_CURRENT       = 0x8,      /*! Inherit values already existing in previous handlers. */
            LOCAL_VARIABLES   = 0x10      /*! Attempt to additionaly display local variables. */
        };
    };

    public:

        Exceptions();
        Exceptions(const Exceptions & orig) = delete;
        Exceptions(Exceptions && orig) = delete;
        Exceptions & operator=(const Exceptions & orig) = delete;
        Exceptions & operator=(Exceptions && orig) = delete;
        virtual ~Exceptions();
        /*!
         * @brief Gets the nested exception which caused this exception.
         * @return The nested exception, or <code>NULL</code> if there is none.
         */
        const Exceptions * cause () const noexcept;
        /*!
         * @brief Return a description of the error
         * @return Pointer to a string containing the error message
         */
        const char * what() const noexcept;
        /*!
         * @brief Return the error location (file + line + function)
         * @return String containing the error location
         */
        const char * where() const noexcept;
        /*!
         * @brief Return the error summary description
         * @return String containing the error location
         */
        std::string summary () const;

    protected:

        explicit Exceptions(const std::string & message);
        explicit Exceptions(std::terminate_handler handler);

    private:

        void create( std::size_t nSize);
        std::shared_ptr< std::string > m_message;

        // std::string m_message;          ///< Error message
        const std::string m_who;             ///< name of function throwing exception
        const std::string m_where;           ///< source:line info
        const std::string m_reason;          ///< optional, provides context-specific reason
        std::terminate_handler m_oldHandler; ///< old terminate handler. We need it in the destructor.
        unsigned long m_code;                ///< Error code
};

#endif
