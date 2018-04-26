set(ModuleName "${PROJECT_NAME}.external")

# These are set in log4cxx/private/log4cxx.h(w), so not set here (for now)
#    add_definitions("/DLOG4CXX_HAVE_LIBESMTP=0")
#    add_definitions("/DLOG4CXX_HAVE_ODBC=1")      # technically it is better to add FindODBC.cmake but
#    add_definitions("/DLOG4CXX_HAVE_SYSLOG=0")    #   we can do that when the cmake builds support unix too

if(BUILD_SHARED_LIBS)
    add_definitions("-DLOG4CXX")
else()
    add_definitions("-DAPR_DECLARE_STATIC")
    add_definitions("-DLOG4CXX_STATIC")
endif()

add_subdirectory (src/main/cpp)
add_subdirectory (src/test/cpp)
add_subdirectory (src/it)
