
#ifndef CPPBDD101_EDAC_DEMANGLE_HPP
#define CPPBDD101_EDAC_DEMANGLE_HPP

#include <memory>
#include <stdexcept>
#include <typeindex>
#include <typeinfo>
#include <cxxabi.h>

namespace cppbdd101 
{
    namespace edac
    {
        class Demangle 
        {
        public:
            Demangle();
            virtual ~Demangle();
            /* Use __cxa_demangle to demangle a mangled name.
             * Since abi::__cxa_demangle returns a `char *` to a 
             * heap-allocated string, we cache based on the `type_index`. 
             */
            cxaDemangle(const std::type_info &type_info);
            template <typename T>
            const char * cxaDemangle()
            {
                static const char *result = cxaDemangle(typeid(T));
                return result;
            }
        private:

        };
    }
}
#endif

