# Build goals added hire are an adaptation for maven build licyle
# https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html
# common default goals name between maven and make 
if(NOT TARGET style)
    add_custom_target(style
        COMMENT "Prettying source code with uncrustify"
    )
endif()

if(NOT TARGET cyclomatic)
    add_custom_target(cyclomatic
        COMMENT "Cyclomatic Complexity Analyzer."
    )
endif()

if(NOT TARGET cppcheck)
    add_custom_target(cppcheck
        COMMENT "Static code analysis."
    )
endif()

if(NOT TARGET lint)
    add_custom_target(lint
        COMMENT "Check the C++ source code to analyze it for syntax errors and other faults."
    )
endif()

if(NOT TARGET coverage)
    add_custom_target(coverage
        COMMENT "Running coverage report."
    )
endif()

if(ENABLE_QA_CHECK)
    if(NOT TARGET qa-check)
        ADD_CUSTOM_TARGET(qa-check
            COMMENT "Software quality assurance: Style -> CPPCheck -> Cyclomatic -> CPPlint -> Coverage"
        )
        add_dependencies(qa-check coverage style cppcheck cyclomatic lint)
    endif(NOT TARGET qa-check)
else(ENABLE_QA_CHECK)
    add_custom_target(qa-check 
        COMMAND ${CMAKE_COMMAND} -E echo "Software quality assurance disabled"
    )
endif(ENABLE_QA_CHECK)

add_custom_target(cleanall
    COMMAND ${CMAKE_COMMAND} --target clean
    COMMENT "Cleaning target"
    VERBATIM
)

add_custom_target (distclean
    COMMAND rm -vf ${CMAKE_SOURCE_DIR}/*.log
    COMMAND rm -vf ${CMAKE_SOURCE_DIR}/Makefile
    COMMAND rm -vf ${CMAKE_SOURCE_DIR}/install_manifest.txt
    COMMAND rm -vf ${CMAKE_SOURCE_DIR}/cmake_install.cmake
    COMMAND find ${CMAKE_SOURCE_DIR} -type f -name CMakeCache.txt | xargs -r rm -vf
    COMMAND find ${CMAKE_SOURCE_DIR} -type d -name CMakeFiles | xargs -r rm -rvf
    COMMAND find ${CMAKE_SOURCE_DIR} -type f -name "*.marks" | xargs -r rm -vf
	COMMENT "Cleaning target"
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
)



if(NOT TARGET pre-clean)
    add_custom_target(pre-clean
        COMMENT "Execute processes needed prior to the actual project cleaning."
    )
endif()

if(NOT TARGET m-clean)
    add_custom_target(m-clean
        COMMENT "Remove all files generated by the previous build."
        DEPENDS pre-clean
    )
endif()

if(NOT TARGET post-clean)
    add_custom_target(post-clean
        COMMENT "Execute processes needed to finalize the project cleaning."
        DEPENDS m-clean
    )
endif()

if(NOT TARGET pre-site)
    add_custom_target(pre-site
        COMMENT "Execute processes needed prior to the actual project site generation."
    )
endif()

if(NOT TARGET site)
    add_custom_target(site
        COMMENT "Generate the project's site documentation."
        DEPENDS pre-site
    )
endif()

if(NOT TARGET post-site)
    add_custom_target(post-site
        COMMENT "Execute processes needed to finalize the site generation, and to prepare for site deployment."
        DEPENDS site
    )
endif()

if(NOT TARGET site-deploy)
    add_custom_target(site-deploy
        COMMENT "Deploy the generated site documentation to the specified web server."
        DEPENDS post-site
    )
endif()


if(NOT TARGET validate)
    add_custom_target(validate
        COMMENT "Validate the project is correct and all necessary information is available."
    )
endif()

if(NOT TARGET initialize)
    add_custom_target(initialize
        COMMENT "Initialize build state, e.g. set properties or create directories."
        DEPENDS validate
    )
endif()

if(NOT TARGET generate-sources)
    add_custom_target(generate-sources
        COMMENT "Generate any source code for inclusion in compilation."
        DEPENDS initialize
    )
endif()

if(NOT TARGET process-sources)
    add_custom_target(process-sources
        COMMENT "Process the source code, for example to filter any values."
        DEPENDS generate-sources
    )
endif()

if(NOT TARGET generate-resources)
    add_custom_target(generate-resources
        COMMENT "Generate resources for inclusion in the package."
        DEPENDS process-sources
    )
endif()

if(NOT TARGET process-resources)
    add_custom_target(process-resources
        COMMENT "Copy and process the resources into the destination directory, ready for packaging."
        DEPENDS generate-resources
    )
endif()

if(NOT TARGET compile)
    add_custom_target(compile
        COMMENT "Compile the source code of the project."
        DEPENDS process-resources
    )
endif()

if(NOT TARGET process-classes)
    add_custom_target(process-classes
        COMMENT "Post-process the generated files from compilation."
        DEPENDS compile
    )
endif()

if(NOT TARGET generate-test-sources)
    add_custom_target(generate-test-sources
        COMMENT "Generate any test source code for inclusion in compilation."
        DEPENDS process-classes
    )
endif()

if(NOT TARGET process-test-sources)
    add_custom_target(process-test-sources
        COMMENT "Process the test source code, for example to filter any values."
        DEPENDS generate-test-sources
    )
endif()

if(NOT TARGET generate-test-resources)
    add_custom_target(generate-test-resources
        COMMENT "Create resources for testing."
        DEPENDS process-test-sources
    )
endif()

if(NOT TARGET process-test-resources)
    add_custom_target(process-test-resources
        COMMENT "Copy and process the resources into the test destination directory."
        DEPENDS generate-test-resources
    )
endif()

if(NOT TARGET test-compile)
    add_custom_target(test-compile
        COMMENT "Compile the test source code into the test destination directory."
        DEPENDS process-test-resources
    )
endif()

if(NOT TARGET process-test-classes)
    add_custom_target(process-test-classes
        COMMENT "Post-process the generated files from test compilation."
        DEPENDS test-compile
    )
endif()

if(NOT TARGET m-test)
    add_custom_target(m-test
        COMMENT "Run tests using a suitable unit testing framework. These tests should not require the code be packaged or deployed."
        DEPENDS process-test-classes
    )
endif()

if(NOT TARGET prepare-package)
    add_custom_target(prepare-package
        COMMENT "Perform any operations necessary to prepare a package before the actual packaging."
        DEPENDS m-test
    )
endif()

if(NOT TARGET m-package)
    add_custom_target(m-package
        COMMENT "Take the compiled code and package it in its distributable format, such as a ZIP."
        DEPENDS prepare-package
    )
endif()

if(NOT TARGET pre-integration-test)
    add_custom_target(pre-integration-test
        COMMENT "Perform actions required before integration tests are executed. This may involve things such as setting up the required environment."
        DEPENDS m-package
    )
endif()

if(NOT TARGET integration-test)
    add_custom_target(integration-test
        COMMENT "Process and deploy the package if necessary into an environment where integration tests can be run."
        DEPENDS pre-integration-test
    )
endif()

if(NOT TARGET post-integration-test)
    add_custom_target(post-integration-test
        COMMENT "Perform actions required after integration tests have been executed. This may including cleaning up the environment."
        DEPENDS integration-test
    )
endif()

if(NOT TARGET verify)
    add_custom_target(verify
        COMMENT "Rrun any checks to verify the package is valid and meets quality criteria."
        DEPENDS post-integration-test
    )
endif()

if(NOT TARGET m-install)
    add_custom_target(m-install
        COMMENT "Install the package into the local repository, for use as a dependency in other projects locally."
        DEPENDS verify
    )
endif()

if(NOT TARGET deploy)
    add_custom_target(deploy
        COMMENT "Integration or release environment, copies the final package to the remote repository for sharing with other developers and projects."
        DEPENDS m-install
    )
endif()
