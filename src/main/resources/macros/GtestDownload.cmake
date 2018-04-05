# Single download(git clone)
ExternalProject_Add(
    googletest-master
    DOWNLOAD_DIR "googletest-master/src" # The only dir option which is required
    GIT_REPOSITORY https://github.com/google/googletest.git
    TIMEOUT 10
    LOG_DOWNLOAD ON
    # Disable all other steps
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)

# Build gtest from existing sources
ExternalProject_Add(
    gtest
    DOWNLOAD_COMMAND "" # No download required
    SOURCE_DIR "googletest-master/src/googletest" # Use specific source dir
    PREFIX "googletest-master" # But use prefix for compute other dirs
    INSTALL_COMMAND ""
    LOG_CONFIGURE ON
    LOG_BUILD ON
)

# gtest should be build after being downloaded
add_dependencies(gtest googletest-master)

# Build gmock from existing sources
ExternalProject_Add(
    gmock
    DOWNLOAD_COMMAND "" # No download required
    SOURCE_DIR "googletest-master/src/googlemock" # Use specific source dir
    PREFIX "googletest-master" # But use prefix for compute other dirs
    INSTALL_COMMAND ""
    LOG_CONFIGURE ON
    LOG_BUILD ON
)

# gmock should be build after being downloaded
add_dependencies(gmock googletest-master)