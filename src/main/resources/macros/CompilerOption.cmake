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


set(CMAKE_CXX_EXTENSIONS                           OFF) ## If OFF ==> without compiler extensions like gnu++xx. Only -std=c++XX and not -std=gnu++XX
set(CXX_STANDARD_REQUIRED                          ON)
set(CMAKE_CXX_STANDARD_REQUIRED                    ON)
set(CMAKE_CXX_FLAGS                                "${CMAKE_CXX_FLAGS} -W -Wall -Wextra ")
set(CMAKE_CXX_FLAGS                                "${CMAKE_CXX_FLAGS} -Winit-self ") #-Wmissing-include-dirs 
set(CMAKE_CXX_FLAGS                                "${CMAKE_CXX_FLAGS} -Wno-pragmas -Wredundant-decls  -fpermissive ")
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

## gprof and gcov support
set(CMAKE_CXX_FLAGS_PROFILE "-O0 -pg -g -ggdb -W -Wreturn-type -Wno-shadow -Wall -Wextra")
set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_CXX_FLAGS_PROFILE} -Wunused-variable -Wunused-parameter")
set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_CXX_FLAGS_PROFILE} -Wunused-function -Wunused")
set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_CXX_FLAGS_PROFILE} -Woverloaded-virtual -Wno-system-headers")
set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_CXX_FLAGS_PROFILE} -Wno-non-virtual-dtor -pg -fprofile-arcs")
set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_CXX_FLAGS_PROFILE} -ftest-coverage")
    # Experimental
set(CMAKE_CXX_FLAGS_EXPERIMENTAL "-O0 -pg -g -ggdb -Wall -Werror -W -Wshadow")
set(CMAKE_CXX_FLAGS_EXPERIMENTAL "${CMAKE_CXX_FLAGS_EXPERIMENTAL} -Wunused-variable")
set(CMAKE_CXX_FLAGS_EXPERIMENTAL "${CMAKE_CXX_FLAGS_EXPERIMENTAL} -Wunused-parameter")
set(CMAKE_CXX_FLAGS_EXPERIMENTAL "${CMAKE_CXX_FLAGS_EXPERIMENTAL} -Wunused-function")
set(CMAKE_CXX_FLAGS_EXPERIMENTAL "${CMAKE_CXX_FLAGS_EXPERIMENTAL} -Wunused -Woverloaded-virtual")
set(CMAKE_CXX_FLAGS_EXPERIMENTAL "${CMAKE_CXX_FLAGS_EXPERIMENTAL} -Wno-system-headers")
set(CMAKE_CXX_FLAGS_EXPERIMENTAL "${CMAKE_CXX_FLAGS_EXPERIMENTAL} -Wno-non-virtual-dtor")
set(CMAKE_CXX_FLAGS_EXPERIMENTAL "${CMAKE_CXX_FLAGS_EXPERIMENTAL} -pg -fprofile-generate ")
set(CMAKE_CXX_FLAGS_EXPERIMENTAL "${CMAKE_CXX_FLAGS_EXPERIMENTAL} -fprofile-arcs -ftest-coverage")

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

SET(CMAKE_CXX_FLAGS_COVERAGE
    " -g -fprofile-arcs -ftest-coverage"
    CACHE STRING "Flags used by the C++ compiler during coverage builds."
    FORCE
)

SET(CMAKE_C_FLAGS_COVERAGE
    " -g -fprofile-arcs -ftest-coverage"
    CACHE STRING "Flags used by the C compiler during coverage builds."
    FORCE
)

SET(CMAKE_EXE_LINKER_FLAGS_COVERAGE
    ""
    CACHE STRING "Flags used for linking binaries during coverage builds."
    FORCE
)

SET(CMAKE_SHARED_LINKER_FLAGS_COVERAGE
    ""
    CACHE STRING "Flags used by the shared libraries linker during coverage builds."
    FORCE
)

MARK_AS_ADVANCED(
    CMAKE_CXX_FLAGS_COVERAGE
    CMAKE_C_FLAGS_COVERAGE
    CMAKE_EXE_LINKER_FLAGS_COVERAGE
    CMAKE_SHARED_LINKER_FLAGS_COVERAGE
)

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

function(set_gcc_compile_options theTarget)
    # set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-error=shadow -Wno-error=switch -Wno-error=switch-enum -Wno-error=empty-body -Wno-error=overloaded-virtual -Wno-error=suggest-final-methods -Wno-error=suggest-final-types -Wno-error=suggest-override -Wno-error=maybe-uninitialized")
    target_compile_options(${theTarget} PUBLIC
        -Wno-div-by-zero
        -Wsuggest-final-types
        -Wsuggest-final-methods
        -Wsuggest-override
        -Wpointer-arith
        -Wsuggest-attribute=noreturn
        -Wno-missing-braces
        -Wmissing-field-initializers
        -Wformat=2
        -Wno-format-nonliteral
        -Wpedantic
        -Werror=return-local-addr
    )

    if(NOT SCORE_SANITIZE)
        target_compile_options(${theTarget} PUBLIC
            "$<$<CONFIG:Release>:-ffunction-sections>"
            "$<$<CONFIG:Release>:-fdata-sections>"
            "$<$<CONFIG:Release>:-Wl,--gc-sections>"
            "$<$<CONFIG:Debug>:-O0>"
            "$<$<CONFIG:Debug>:-ggdb>"
        )

        if(SCORE_SPLIT_DEBUG)
            target_link_libraries(${theTarget} PUBLIC
            #          "$<$<CONFIG:Debug>:-Wa,--compress-debug-sections>"
            #          "$<$<CONFIG:Debug>:-Wl,--compress-debug-sections=zlib>"
            "$<$<CONFIG:Debug>:-fvar-tracking-assignments>"
            "$<$<CONFIG:Debug>:-Wl,--gdb-index>"
        )
        endif()

        get_target_property(NO_LTO ${theTarget} SCORE_TARGET_NO_LTO)

        if(NOT ${NO_LTO})
            target_compile_options(${theTarget} PUBLIC
  #            "$<$<BOOL:${SCORE_ENABLE_LTO}>:-s>"
  #            "$<$<BOOL:${SCORE_ENABLE_LTO}>:-flto>"
  #            "$<$<BOOL:${SCORE_ENABLE_LTO}>:-fuse-linker-plugin>"
  #            "$<$<BOOL:${SCORE_ENABLE_LTO}>:-fno-fat-lto-objects>"
            )
        endif()

        target_link_libraries(${theTarget} PUBLIC
            "$<$<CONFIG:Release>:-ffunction-sections>"
            "$<$<CONFIG:Release>:-fdata-sections>"
            "$<$<CONFIG:Release>:-Wl,--gc-sections>"
            "$<$<CONFIG:Debug>:-fvar-tracking-assignments>"
            "$<$<CONFIG:Debug>:-O0>"
            "$<$<CONFIG:Debug>:-ggdb>"
#          "$<$<BOOL:${SCORE_ENABLE_LTO}>:-s>"
#          "$<$<BOOL:${SCORE_ENABLE_LTO}>:-flto>"
#          "$<$<BOOL:${SCORE_ENABLE_LTO}>:-fuse-linker-plugin>"
#          "$<$<BOOL:${SCORE_ENABLE_LTO}>:-fno-fat-lto-objects>"
        )

        if(SCORE_SPLIT_DEBUG)
            target_link_libraries(${theTarget} PUBLIC
            #          "$<$<CONFIG:Debug>:-Wa,--compress-debug-sections>"
            #          "$<$<CONFIG:Debug>:-Wl,--compress-debug-sections=zlib>"
            "$<$<CONFIG:Debug>:-gsplit-dwarf>"
            "$<$<CONFIG:Debug>:-Wl,--gdb-index>"
            "$<$<CONFIG:Debug>:-fdebug-types-section>"
            "$<$<CONFIG:Debug>:-ggnu-pubnames>"
        )
        endif()

      endif()
      # -Wcast-qual is nice but requires more work...
      # -Wzero-as-null-pointer-constant  is garbage
      # Too much clutter :set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wswitch-enum -Wshadow  -Wsuggest-attribute=const  -Wsuggest-attribute=pure ")
endfunction()

function(score_set_clang_compile_options theTarget)
    target_compile_options(${theTarget} PUBLIC
        -Wno-gnu-string-literal-operator-template
        -Wno-missing-braces
        -Werror=return-stack-address
        -Wmissing-field-initializers
        -Wno-gnu-statement-expression
        -ftemplate-backtrace-limit=0
        "$<$<CONFIG:Debug>:-O0>"
        )
    #if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Weverything -Wno-c++98-compat -Wno-exit-time-destructors -Wno-padded")
    #endif()
endfunction()

function(score_set_linux_compile_options theTarget)
    #use_gold(${theTarget})
    if(NOT SCORE_SANITIZE AND LINKER_IS_GOLD AND SCORE_SPLIT_DEBUG)
        target_compile_options(${theTarget} PUBLIC
            # Debug options
            "$<$<CONFIG:Debug>:-gsplit-dwarf>")
    endif()
    target_compile_options(${theTarget} PUBLIC
        # Debug options
        "$<$<CONFIG:Debug>:-ggdb>"
        "$<$<CONFIG:Debug>:-O0>")
    target_link_libraries(${theTarget} PUBLIC
        # Debug options
        "$<$<CONFIG:Debug>:-ggdb>"
        "$<$<CONFIG:Debug>:-O0>")
endfunction()

function(score_set_unix_compile_options theTarget)
    # General options

    #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wabi -Wctor-dtor-privacy -Wnon-virtual-dtor -Wreorder -Wstrict-null-sentinel -Wno-non-template-friend -Woverloaded-virtual -Wno-pmf-conversions -Wsign-promo -Wextra -Wall -Waddress -Waggregate-return -Warray-bounds -Wno-attributes -Wno-builtin-macro-redefined")
    #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wc++0x-compat -Wcast-align -Wcast-qual -Wchar-subscripts -Wclobbered -Wcomment -Wconversion -Wcoverage-mismatch -Wno-deprecated -Wno-deprecated-declarations -Wdisabled-optimization -Wno-div-by-zero -Wempty-body -Wenum-compare")

    target_compile_options(${theTarget} PUBLIC
    -Wall
    -Wextra
    -Wno-unused-parameter
    -Wno-unknown-pragmas
    -Wnon-virtual-dtor
    -pedantic
    -Woverloaded-virtual
    -pipe
    -Wno-missing-declarations
    -Werror=redundant-decls
    -Werror=return-type
    -Werror=trigraphs

    # Release options
    "$<$<AND:$<CONFIG:Release>,$<BOOL:${NACL}>>:-O3>"
    "$<$<AND:$<CONFIG:Release>,$<NOT:$<BOOL:${NACL}>>>:-Ofast>"
    "$<$<AND:$<CONFIG:Release>,$<NOT:$<BOOL:${NACL}>>>:-fno-finite-math-only>"
    "$<$<AND:$<CONFIG:Release>,$<BOOL:${SCORE_ENABLE_OPTIMIZE_CUSTOM}>>:-march=native>"
    )

    target_link_libraries(${theTarget} PUBLIC
        "$<$<CONFIG:Release>:-Ofast>"
        "$<$<CONFIG:Release>:-fno-finite-math-only>"
        "$<$<AND:$<CONFIG:Release>,$<BOOL:${SCORE_ENABLE_OPTIMIZE_CUSTOM}>>:-march=native>")
endfunction()

function(score_set_compile_options theTarget)
  if(${CMAKE_VERSION} VERSION_LESS 3.8.0 OR ANDROID OR APPLE)
    set_target_properties(${TheTarget} PROPERTIES CXX_STANDARD 14)
  else()
    set_target_properties(${TheTarget} PROPERTIES CXX_STANDARD 17)
  endif()
  target_compile_definitions(${TheTarget} PUBLIC
      $<$<CONFIG:Debug>:SCORE_DEBUG>
      $<$<CONFIG:Debug>:BOOST_MULTI_INDEX_ENABLE_INVARIANT_CHECKING>
      $<$<CONFIG:Debug>:BOOST_MULTI_INDEX_ENABLE_SAFE_MODE>

# various options

      $<$<BOOL:${SCORE_IEEE}>:SCORE_IEEE_SKIN>
      $<$<BOOL:${SCORE_WEBSOCKETS}>:SCORE_WEBSOCKETS>
      $<$<BOOL:${SCORE_OPENGL}>:SCORE_OPENGL>
      $<$<BOOL:${DEPLOYMENT_BUILD}>:SCORE_DEPLOYMENT_BUILD>
      $<$<BOOL:${SCORE_STATIC_PLUGINS}>:SCORE_STATIC_PLUGINS>
      )
  get_target_property(theType ${theTarget} TYPE)

  if(${theType} MATCHES STATIC_LIBRARY)
    target_compile_definitions(${TheTarget} PRIVATE
      $<$<BOOL:${SCORE_STATIC_PLUGINS}>:QT_STATICPLUGIN>
    )
  endif()

  if(SCORE_SANITIZE)
      get_target_property(NO_SANITIZE ${theTarget} SCORE_TARGET_NO_SANITIZE)
      if(NOT "${NO_SANITIZE}")
          sanitize_build(${theTarget})
      endif()
      # debugmode_build(${theTarget})
  endif()

  if (CXX_IS_GCC OR CXX_IS_CLANG)
    score_set_unix_compile_options(${theTarget})
  endif()

  if (CXX_IS_CLANG)
      score_set_clang_compile_options(${theTarget})
  endif()

  if (CXX_IS_MSVC)
      score_set_msvc_compile_options(${theTarget})
  endif()

  if(CXX_IS_GCC)
      score_set_gcc_compile_options(${theTarget})
  endif()

  # OS X
  if(APPLE)
      score_set_apple_compile_options(${theTarget})
  endif()

  # Linux
  if(NOT APPLE AND NOT WIN32)
      score_set_linux_compile_options(${theTarget})
  endif()

  # currently breaks build : add_linker_warnings(${theTarget})
endfunction()

function(setup_score_common_features TheTarget)
  score_set_compile_options(${TheTarget})
  score_cotire_pre(${TheTarget})

  if(ENABLE_LTO)
    set_property(TARGET ${TheTarget}
                 PROPERTY INTERPROCEDURAL_OPTIMIZATION True)
  endif()

  if(SCORE_STATIC_PLUGINS)
    target_compile_definitions(${TheTarget}
                               PUBLIC SCORE_STATIC_PLUGINS)
  endif()

  target_include_directories(${TheTarget} INTERFACE "${CMAKE_CURRENT_BINARY_DIR}")
endfunction()


### Initialization of common stuff ###
function(setup_score_common_exe_features TheTarget)
    setup_score_common_features("${TheTarget}")
  score_cotire_post("${TheTarget}")
endfunction()

function(setup_score_common_test_features TheTarget)
    setup_score_common_features("${TheTarget}")
endfunction()

function(setup_score_common_lib_features TheTarget)
  setup_score_common_features("${TheTarget}")

  generate_export_header(${TheTarget})
  if(NOT SCORE_STATIC_PLUGINS)
    set_target_properties(${TheTarget} PROPERTIES CXX_VISIBILITY_PRESET hidden)
      set_target_properties(${TheTarget} PROPERTIES VISIBILITY_INLINES_HIDDEN 1)
  endif()

  string(TOUPPER "${TheTarget}" UPPERCASE_PLUGIN_NAME)
  set_property(TARGET ${TheTarget} APPEND
               PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}")
  set_property(TARGET ${TheTarget} APPEND
               PROPERTY INTERFACE_COMPILE_DEFINITIONS "${UPPERCASE_PLUGIN_NAME}")
endfunction()


### Call with a library target ###
function(setup_score_library PluginName)
  setup_score_common_lib_features("${PluginName}")

  set(SCORE_LIBRARIES_LIST ${SCORE_LIBRARIES_LIST} "${PluginName}" CACHE INTERNAL "List of libraries")
  set_target_properties(${PluginName} PROPERTIES
      LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/plugins/"
      RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/plugins/")

  if(NOT SCORE_STATIC_PLUGINS)
    if(SCORE_BUILD_FOR_PACKAGE_MANAGER)
      install(TARGETS "${PluginName}"
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)
    else()
      install(TARGETS "${PluginName}"
        LIBRARY DESTINATION .
        ARCHIVE DESTINATION static_lib
        RUNTIME DESTINATION bin)
    endif()
  endif()

  score_cotire_post("${PluginName}")
endfunction()


### Call with a plug-in target ###
function(setup_score_plugin PluginName)
  setup_score_common_lib_features("${PluginName}")

  set(SCORE_PLUGINS_LIST ${SCORE_PLUGINS_LIST} "${PluginName}" CACHE INTERNAL "List of plugins")

  set_target_properties(${PluginName} PROPERTIES
      LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/plugins/"
      RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/plugins/")
  if(NOT SCORE_STATIC_PLUGINS)
    if(SCORE_BUILD_FOR_PACKAGE_MANAGER)
      install(TARGETS "${PluginName}"
        LIBRARY DESTINATION lib/score
        ARCHIVE DESTINATION lib/score)
    else()
      install(TARGETS "${PluginName}"
        LIBRARY DESTINATION plugins
        ARCHIVE DESTINATION static_plugins
        RUNTIME DESTINATION bin/plugins)
    endif()
  endif()

  score_cotire_post("${PluginName}")
endfunction()
