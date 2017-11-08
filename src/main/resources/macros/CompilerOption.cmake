include(CMakeParseArguments)
include(CheckCCompilerFlag)
#check_c_compiler_flag("-std=c11" COMPILER_SUPPORTS_C11)
#
#if(COMPILER_SUPPORTS_C11)
#    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c11")
#    set(CMAKE_C_STANDARD 11)
#else()
#    message(FATAL_ERROR "The compiler ${CMAKE_C_COMPILER} has no C11 or later support. Please use a different C++ compiler.")
#endif()

include(CheckCXXCompilerFlag)

CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++14" COMPILER_SUPPORTS_CXX14)
CHECK_CXX_COMPILER_FLAG("-std=c++17" COMPILER_SUPPORTS_CXX17)

if(COMPILER_SUPPORTS_CXX17)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")
    set(CMAKE_CXX_STANDARD 17)
elseif(COMPILER_SUPPORTS_CXX14)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
    set(CMAKE_CXX_STANDARD 14)
elseif(COMPILER_SUPPORTS_CXX11)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
    set(CMAKE_CXX_STANDARD 11)
else()
    message(FATAL_ERROR "The compiler ${CMAKE_CXX_COMPILER} has no C++11 or later support. Please use a different C++ compiler.")
endif()


set(CMAKE_CXX_EXTENSIONS                           ON) ## on g++ this ensures: -std=c++XX and not -std=gnu++XX
set(CXX_STANDARD_REQUIRED                          ON)
set(CMAKE_CXX_STANDARD_REQUIRED                    ON)
set(CMAKE_CXX_FLAGS                                "${CMAKE_CXX_FLAGS} -std=c++17 -W -Wall -Wextra ")
set(CMAKE_CXX_FLAGS_DEBUG                          "${CMAKE_CXX_FLAGS} -O0 -g")
set(CMAKE_CXX_FLAGS_DEBUG                          "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D_FORTIFY_SOURCE=2 ")
set(CMAKE_CXX_FLAGS_DEBUG                          "${CMAKE_CXX_FLAGS_DEBUG} -fno-omit-frame-pointer ") # -fno-strict-aliasing 

set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Wabi")
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Wcast-qual")                # Cast for removing type qualifiers
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Wconversion")               # Implicit conversions that may alter a value
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Wfloat-equal")              # Floating values used in equality comparisons
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Winline")                   # If a inline declared function couldn't be inlined
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Wmissing-declarations")     # If a global function is defined without a previous declaration
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Wmissing-format-attribute") #
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Woverloaded-virtual")       # when a function declaration hides virtual functions from a base class
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Wpacked")                   #
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Wredundant-decls")          # if anything is declared more than once in the same scope
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Wshadow")                   # whenever a local variable or type declaration shadows another one
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Wsign-promo")               #
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Wno-missing-field-initializers")
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Wno-missing-braces")
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -Wno-sign-compare")
set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -fdiagnostics-show-option")

set(GCC_COMMON_WARNING_FLAGS "${GCC_COMMON_WARNING_FLAGS} -fcheck-new ") #-fdiagnostics-parseable-fixits
set(GCC_COMMON_WARNING_FLAGS "${GCC_COMMON_WARNING_FLAGS} -Wcast-align -Wchar-subscripts ") #-Wimplicit-fallthrough
set(GCC_COMMON_WARNING_FLAGS "${GCC_COMMON_WARNING_FLAGS} -Wformat-security -Wctor-dtor-privacy -Wstrict-aliasing")
set(GCC_COMMON_WARNING_FLAGS "${GCC_COMMON_WARNING_FLAGS} -Wunused-variable  -Wunused-parameter")
set(GCC_COMMON_WARNING_FLAGS "${GCC_COMMON_WARNING_FLAGS} -Wpointer-arith -Wundef -Wdelete-non-virtual-dtor -Wzero-as-null-pointer-constant" )
set(GCC_COMMON_WARNING_FLAGS "${GCC_COMMON_WARNING_FLAGS} -Wunused-function -Wunused -Wno-system-headers")
set(GCC_COMMON_WARNING_FLAGS "${GCC_COMMON_WARNING_FLAGS} -Wno-deprecated -Wwrite-strings")
set(GCC_COMMON_WARNING_FLAGS "${GCC_COMMON_WARNING_FLAGS} -Wconversion -D_FORTIFY_SOURCE=2 -Wsign-conversion -fstack-protector-all")
set(GCC_COMMON_WARNING_FLAGS "${GCC_COMMON_WARNING_FLAGS} -Wstack-protector --param ssp-buffer-size=4")

if(CHECK_MEMORY)
   set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -fsanitize=memory")
   set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -fsanitize-memory-track-origins=2")
   set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -fno-omit-frame-pointer")
elseif(CHECK_ADDRESS)
   set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -fsanitize=address")
   set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -fno-omit-frame-pointer")
elseif(CHECK_THREAD)
   set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -fsanitize=thread")
endif()

if(CHECK_UNDEFINED)
   set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -fsanitize=undefined-trap")
   set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -fsanitize-undefined-trap-on-error")
   set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -fno-sanitize-recover")
endif()

if(CHECK_DATAFLOW)
   set(EXTRA_CXX_FLAGS "${EXTRA_CXX_FLAGS} -fsanitize=dataflow")
endif()

set(EFFECTIVE_CPP_FLAGS "-Weffc++ -Wpedantic")


#set(COMMON_CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

set(PARANO_CMAKE_CXX_FLAGS "${COMMON_CMAKE_CXX_FLAGS} -Werror -ansi -pedantic")
set(PARANO_CMAKE_CXX_FLAGS "${COMMON_CMAKE_CXX_FLAGS} -Werror=switch-default -Werror=unused-result")
set(PARANO_CMAKE_CXX_FLAGS "${PARANO_CMAKE_CXX_FLAGS} -Werror=return-type -Werror=shadow")
set(PARANO_CMAKE_CXX_FLAGS "${PARANO_CMAKE_CXX_FLAGS} -Werror=implicit-function-declaration")
set(PARANO_CMAKE_CXX_FLAGS "${PARANO_CMAKE_CXX_FLAGS} -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point")
set(PARANO_CMAKE_CXX_FLAGS "${PARANO_CMAKE_CXX_FLAGS} -Werror=unused-result")
set(PARANO_CMAKE_CXX_FLAGS "${PARANO_CMAKE_CXX_FLAGS} -Werror=format-security -Wformat")

if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GCC_COMMON_WARNING_FLAGS} -Wnon-virtual-dtor -Woverloaded-virtual")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GCC_COMMON_WARNING_FLAGS} -Wno-long-long -Wformat")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GCC_COMMON_WARNING_FLAGS} -Wfloat-equal -Wdisabled-optimization")
    #set(CMAKE_CXX_FLAGS "${PARANO_CMAKE_CXX_FLAGS}")
endif()

set(CMAKE_CXX_FLAGS_DEBUG               "${CMAKE_CXX_FLAGS_DEBUG}         ${COMMON_CMAKE_CXX_FLAGS}")
set(CMAKE_CXX_FLAGS_RELEASE             "${CMAKE_CXX_FLAGS_RELEASE}       ${COMMON_CMAKE_CXX_FLAGS}")
set(CMAKE_CXX_FLAGS                     "${CMAKE_CXX_FLAGS}               ${COMMON_CMAKE_CXX_FLAGS}")


# foreach(compilerFeatures ${CMAKE_CXX_COMPILE_FEATURES})
#     message("compile Feature ${compilerFeatures}")
# endforeach()

# get_property(known_features GLOBAL PROPERTY CMAKE_CXX_KNOWN_FEATURES)
# foreach(i ${known_features})
#     message("Known compile feature ${i}")
# endforeach()


# set (pedantic_opt "-Werror -Wconversion -D_FORTIFY_SOURCE=2 -Wsign-conversion -fstack-protector-all -Wstack-protector --param ssp-buffer-size=4")
# set (pedantic_opt "-Wconversion -D_FORTIFY_SOURCE=2 -Wsign-conversion -fstack-protector-all -Wstack-protector --param ssp-buffer-size=4")

#set(COVERAGE_FLAGS "-g -O0 --coverage -Wall -ftime-report -fmem-report -fvar-tracking -fvar-tracking-assignments")
#set(COVERAGE_FLAGS "-g -O0 --coverage -Wall -Q ftime-report -fmem-report")
