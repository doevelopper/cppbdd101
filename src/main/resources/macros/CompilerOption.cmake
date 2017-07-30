
include(CMakeParseArguments)
include(CheckCXXCompilerFlag)

# set (pedantic_opt "-Werror -Wconversion -D_FORTIFY_SOURCE=2 -Wsign-conversion -fstack-protector-all -Wstack-protector --param ssp-buffer-size=4")
set (pedantic_opt "-Wconversion -D_FORTIFY_SOURCE=2 -Wsign-conversion -fstack-protector-all -Wstack-protector --param ssp-buffer-size=4")

#set(COVERAGE_FLAGS "-g -O0 --coverage -Wall -ftime-report -fmem-report -fvar-tracking -fvar-tracking-assignments")
#set(COVERAGE_FLAGS "-g -O0 --coverage -Wall -Q ftime-report -fmem-report")


set(GCC_COMMON_WARNING_FLAGS "-Wall -Wextra -Wcast-align -Wchar-subscripts" 
#                                  "-Wformat-security -Wno-long-long" 
#                                  "-Wpointer-arith -Wundef -Wdelete-non-virtual-dtor -Wzero-as-null-pointer-constant" 
#                                  "-W -Wshadow -Wunused-variable  -Wunused-parameter" 
#                                  "-Wunused-function -Wunused -Wno-system-headers" 
#                                  "-Wno-deprecated -Woverloaded-virtual -Wwrite-strings"
)

set(COMMON_CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wall -Wextra -Wpedantic" 
)

set(PARANO_CMAKE_CXX_FLAGS "${COMMON_CMAKE_CXX_FLAGS} -Werror -pedantic"
)

if(CMAKE_C_COMPILER_ID STREQUAL "GNU" OR CMAKE_C_COMPILER_ID STREQUAL "Clang")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${GCC_COMMON_WARNING_FLAGS} -Wmissing-format-attribute -Wwrite-strings")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror=implicit-function-declaration")
endif()

if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GCC_COMMON_WARNING_FLAGS} -Wnon-virtual-dtor -Woverloaded-virtual")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror=return-type -Werror=shadow -Werror=switch-default -Werror=unused-result")
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS                                                        "${CMAKE_CXX_FLAGS} -std=c++17")
set(CMAKE_CXX_FLAGS_DEBUG                                                  "${CMAKE_CXX_FLAGS} -O0 -g")
set(CMAKE_CXX_FLAGS_MINSIZEREL                                             "${CMAKE_CXX_FLAGS} -Os -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELEASE                                                "${CMAKE_CXX_FLAGS} -O4 -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO                                         "${CMAKE_CXX_FLAGS} -O2 -g")
set(CMAKE_CXX_EXTENSIONS                                                   OFF) ## on g++ this ensures: -std=c++XX and not -std=gnu++XX
set(CXX_STANDARD_REQUIRED                                                  ON)

## turn on some more warnings
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG}                            ${COMMON_CMAKE_CXX_FLAGS} ")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}                                        ${COMMON_CMAKE_CXX_FLAGS} ")
set(CMAKE_C_FLAGS_COVERAGE "${CMAKE_C_FLAGS_DEBUG}                         -O0 --coverage")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}                        -Wall -Wextra")

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}                        ${COMMON_CMAKE_CXX_FLAGS}")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}                    ${COMMON_CMAKE_CXX_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}                                    ${COMMON_CMAKE_CXX_FLAGS}")
set(CMAKE_CXX_FLAGS_COVERAGE "${CMAKE_CXX_FLAGS_DEBUG}                     -g -O0 --coverage")
set(CMAKE_EXE_LINKER_FLAGS_COVERAGE "${CMAKE_EXE_LINKER_FLAGS_DEBUG}       --coverage")#-lgcov 

# foreach(compilerFeatures ${CMAKE_CXX_COMPILE_FEATURES})
    # message("compile Feature ${compilerFeatures}")
# endforeach()

# get_property(known_features GLOBAL PROPERTY CMAKE_CXX_KNOWN_FEATURES)
# foreach(i ${known_features})
    # message("Known compile feature ${i}")
# endforeach()
