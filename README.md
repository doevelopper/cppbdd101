```
 CCCCC  PPPPPP  PPPPPP     BBBBB   DDDDD   DDDDD       1   00000   1  
CC    C PP   PP PP   PP    BB   B  DD  DD  DD  DD     111 00   00 111 
CC      PPPPPP  PPPPPP     BBBBBB  DD   DD DD   DD     11 00   00  11 
CC    C PP      PP         BB   BB DD   DD DD   DD     11 00   00  11 
 CCCCC  PP      PP         BBBBBB  DDDDDD  DDDDDD     111  00000  111
........................................................................................
....01000011 01010000 01010000  01000010 01000100 01000100  00110001 00110000 00110001 
                                  --A.H.L
```

![tbd](https://img.shields.io/badge/development%20status-active-green.svg)
![tbd](https://img.shields.io/badge/platforms-osx%20|%20win%20|%20linux-lightgrey.svg)
[![tbd](https://img.shields.io/conda/pn/conda-forge/python.svg?style=plastic)]()
[![tbd](https://img.shields.io/crates/l/rustc-serialize.svg?style=plastic)]()

This is my first tutorial for the fundamental concepts of C++.
This with respoect to modern best practices of software engineering.

Todo
----

* [ ] :feet: CI script covering many cloud ci and local storage ci solutions
* [ ] :skull: Provide custom script for runing static coverage analysis tools
* [ ] :fu: Provide ability to generate specifications from code sources
* [ ] :ok_hand: Provide seamless integration with common IDE CLion/Eclipse-cdt/Netbeans... 
* [ ] :zzz: More specific FAQ and Troubleshooting help
* [ ] :cyclone: C++11/14/17 Features
* [ ] :alien: Design patterns lectures
* [ ] :trollface: Offuscated c++ snippets...

## Build status
Branch      | Linux/OSX | Windows | Coverage | Documentation | Test |
------------|-----------|---------|----------|---------------|--------|
 ✅ [master](https://github.com/doevelopper/cppbdd101/tree/master)   | [![Build Status](https://travis-ci.org/Levitics/levitics-arkhe-gcs.svg?branch=master "Build status of branch master")](https://travis-ci.org/Levitics/levitics-arkhe-gcs)  | [![Build status](https://ci.appveyor.com/api/projects/status/g0llpbvhpjuxjnlw/branch/master?svg=true)](https://ci.appveyor.com/project/vinniefalco/beast/branch/master)   | [![codecov](https://codecov.io/gh/boostorg/Beast/branch/master/graph/badge.svg)](https://codecov.io/gh/boostorg/beast/branch/master)   | [![Documentation](https://img.shields.io/badge/documentation-master-brightgreen.svg)](http://www.boost.org/doc/libs/master/libs/beast/doc/html/beast.html)  | [![Matrix](https://img.shields.io/badge/matrix-master-brightgreen.svg)](http://www.boost.org/development/tests/master/developer/beast.html)
 ✅ [develop](https://github.com/doevelopper/cppbdd101/tree/develop) | [![Build Status](https://travis-ci.org/Levitics/levitics-arkhe-gcs.svg?branch=develop "Build status of branch develop")](https://travis-ci.org/Levitics/levitics-arkhe-gcs) | [![Build status](https://ci.appveyor.com/api/projects/status/g0llpbvhpjuxjnlw/branch/develop?svg=true)](https://ci.appveyor.com/project/vinniefalco/beast/branch/develop) | [![codecov](https://codecov.io/gh/boostorg/Beast/branch/develop/graph/badge.svg)](https://codecov.io/gh/boostorg/beast/branch/develop) | [![Documentation](https://img.shields.io/badge/documentation-develop-brightgreen.svg)](http://www.boost.org/doc/libs/develop/libs/beast/) | [![Matrix](https://img.shields.io/badge/matrix-develop-brightgreen.svg)](http://www.boost.org/development/tests/develop/developer/beast.html)
 ✅ [releases](https://github.com/doevelopper/cppbdd101/tree/releases) | [![Build Status](https://travis-ci.org/Levitics/levitics-arkhe-gcs.svg?branch=releases "Build status of branch releases")](https://travis-ci.org/Levitics/levitics-arkhe-gcs) | [![Build status](https://ci.appveyor.com/api/projects/status/g0llpbvhpjuxjnlw/branch/develop?svg=true)](https://ci.appveyor.com/project/vinniefalco/beast/branch/releases) | [![codecov](https://codecov.io/gh/boostorg/Beast/branch/develop/graph/badge.svg)](https://codecov.io/gh/boostorg/beast/branch/releases) | [![Documentation](https://img.shields.io/badge/documentation-develop-brightgreen.svg)](http://www.boost.org/doc/libs/develop/libs/beast/) | [![Matrix](https://img.shields.io/badge/matrix-develop-brightgreen.svg)](http://www.boost.org/development/tests/develop/developer/beast.html)

## Binaries Distribution management
| Distribution  Chanel         | Description                                                                                                                                                                                   |
|------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| :bangbang: [__Nightly__](#www.tbd.acme) | Builds created out of the central repository every night, packaged up every night for bleeding-edge testers to install and test.These are not qualified by QA.                                                                                                      |
| :heavy_exclamation_mark: [__Aurora__](#www.tbd.acme) | Builds created out of the aurora repository, which is synced from central repository every weeks.There is a small amount of QA at the start of the 1 week period before the updates are offered.as such its status is roughly "experimental".  |
| :interrobang: [__Beta__](#www.tbd.acme)  | Builds created out of the master repository, qualified by QA as being of sufficient quality to release to beta users.                                                                         |
| :heavy_check_mark: [__Release__](#www.tbd.acme) | Builds created out of the release repository, qualified by QA as being of sufficient quality to release to hundreds of millions of people.                                                    |

## Requirements Ubuntu/Debian ![Dependencies](https://img.shields.io/badge/dependencies-up%20to%20date-brightgreen.svg)

> * _Build tools_

```sh
    # Intall boost libraries
    $ sudo apt-get install libboost1.63-dev libboost1.63-all-dev libboost1.63-tools-dev
    $ sudo apt-get install
    # Intall make and cmake 3.8 or later
    $ sudo apt-get install  make cmake  cmake-extra cmake-data 
```

* _D-Bus_
>
> [dbus interprocess messaging system](https://dbus.freedesktop.org/releases/dbus/dbus-1.10.22.tar.gz) `[sudo] apt-get install libdbus-cpp-dev/libdbus-cpp5/ libdbusmenu-jsonloader-dev`


* _cucumber-cpp_

```sh
    $ git clone https://github.com/cucumber/cucumber-cpp.git
    $ cd cucumber-cpp
    $ gem install bundler
    $ bundle install
    $ git submodule init
    $ git submodule update
    $ cmake -E chdir build cmake -DCUKE_ENABLE_EXAMPLES=on -DCMAKE_INSTALL_PREFIX=/usr/ ..
    $ cmake --build build
    $ cmake --build build --target test
    $ cmake --build build --target features
    $ cmake --build build --target install
```

* _googletest_

```sh
    $ git clone https://github.com/google/googletest.git
    $ cd googletest
    $ cmake -E chdir build cmake -DCMAKE_INSTALL_PREFIX=/usr/ ..
    $ cmake --build build
    $ cmake --build build --target install
```

* _microbenchmark_

```sh
    $ git clone https://github.com/google/benchmark.git
    $ cd benchmark
    $ cmake -E chdir build cmake -DCMAKE_INSTALL_PREFIX=/usr/ ..
    $ cmake --build build
    $ cmake --build build --target install
```

* _Style and coverage_ [![XO code style](https://img.shields.io/badge/code_style-XO-5ed9c7.svg)](https://github.com/google/styleguide)
>
> [Automated C++ style guide checker](https://pypi.python.org/pypi/cpplint). `[sudo] pip install cpplint`
>
> [Cyclomatic Complexity Analyzer](https://pypi.python.org/pypi/lizard) `[sudo] pip install lizard`
>
> [Source Code Beautifier](http://uncrustify.sourceforge.net) `[sudo] apt-get install Uncrustify`
>
> [Static analysis tool ](http://uncrustify.sourceforge.net) `[sudo] apt-get install  cppcheck`
>
> [Converts cpplint output to JUnit format.](https://pypi.python.org/pypi/cpplint-junit) `[sudo] apt-get install/--upgrade  cpplint-junit`

## Versioning [![Semver v2.0.0](http://img.shields.io/SemVer/2.0.0.png)](http://semver.org/spec/v2.0.0.html)

For transparency of our release cycle and in striving to maintain backward compatibility, **CPPBDD** is maintained under the Semantic Versioning guidelines . Sometimes we screw up, but we'll adhere to those rules whenever possible.

## Code Review
Here are some resources to learn more about
code reviews:

* <a href="https://blog.scottnonnenberg.com/top-ten-pull-request-review-mistakes/">Top 10 Pull Request Review Mistakes</a>
* <a href="https://smartbear.com/SmartBear/media/pdfs/best-kept-secrets-of-peer-code-review.pdf">Best Kept Secrets of Peer Code Review (pdf)</a>
* <a href="http://support.smartbear.com/support/media/resources/cc/11_Best_Practices_for_Peer_Code_Review.pdf">11 Best Practices for Peer Code Review (pdf)</a>
* <a href="http://www.evoketechnologies.com/blog/code-review-checklist-perform-effective-code-reviews/">Code Review Checklist – To Perform Effective Code Reviews</a>
* <a href="https://www.codeproject.com/Articles/524235/Codeplusreviewplusguidelines">Code review guidelines</a>
* <a href="https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md">C++ Core Guidelines</a>
* <a href="https://doc.lagout.org/programmation/C/CPP101.pdf">C++ Coding Standards (Sutter & Andrescu)</a>

## Platfrom

| Target Board     | Linux/Ubuntu/Debian | Windows 7/10  |    OSx    |
|:----------------:|:-------------------:|:-------------:|:---------:|
|   Qemu arm-x64   |  [ ]                |     [ ]       |     [ ]   |
|   Fox Board G20  |  [ ]                |     [ ]       |     [ ]   |
|  RaspBerry PI 3  |  [ ]                |     [ ]       |     [ ]   |
|     i386/X_64    |  [ ]                |     [ ]       |     [ ]   |

## Links

The project provides feature-rich development and collaboration
environment using advanced tools such as GCC compilers, git, Atlassian
JIRA Software, Atlassian Confluence, Atlassian FishEye, Atlassian Crucible, Atlassian Bamboo, github mirror and forums.

* [Main project front-end](http://www.tbd.acme/) (redirect to wiki)
* [Project forums](http://services.tbd.acme/)
* [Wiki, docs and manuals](http://documentations.tbd.acme) (Atlassian Confluence)
* [Bug and issue tracker](http://defects.tbd.acme/) (Atlassian JIRA Software)
* [Project build server](http://cicd.tbd.acme/) (Atlassian Bamboo , Jenkins-CI)
* [Repository browser](http://code.tbd.acmeg/)   (FishEye, Crucible)
* [Read/write git repository](ssh://git@code.tbd.acme)  (bitbucket with keys)
* [Read-only official mirror](https://github.com/doevelopper/cppbdd101) (GitHub)
* [Toolchain downloads](http://downloads.tbd.acme)  (Env orchestration scripts)

## Contributions ![Contributions welcome](https://img.shields.io/badge/contributions-welcome-orange.svg)

Any contributions you make to this effort **are of course greatly appreciated**.

### Copyright Notice and License

All our own materials are released under a [![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/) licence.

#### Choosing a licence

You are free to select whatever licence you feel comfortable with, and you are entitled to use the methods described in this document without sharing your work. If you would like to share your resources with other educators, we would recommend you follow our lead and use the CC BY-SA licence as above.
Submissions of resources are appreciated, provided they are available under a Creative Commons license such as CC BY-SA. Please [contact us](http://www.tbd.acme/contact-us/) for more information.

#### Software licences

Creative Commons covers use of creative works such as written material, music or photography. Software projects use a different set of licences which state the use and distribution of software. Such licences are suitable for software libraries or products/services, but small examples of code used in the context of a learning resource can be covered by the Creative Commons licence relating to the creative works.

In most cases, software licences would be unnecessary in learning resources, but if you created a general-purpose software library to go with your resource, you should look at choosing an appropriate licence for the library.

© 2011-2018 ACME SYSTEMS, Inc. All Rights Reserved.
Copyright the authors and contributors. See individual source files
for details.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 SUCH DAMAGE.

- Code and documentation copyright 2011-2018 ACME SYSTEMS, Inc.
- Code are released under [![License](https://img.shields.io/badge/license-Apache%20license%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
- Docs are released under [![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
- CI/CD Scripts are under [![License: LGPL v3](https://img.shields.io/badge/License-LGPL%20v3-blue.svg)](http://www.gnu.org/licenses/lgpl-3.0)  

## Contact

---

> Portal [acme](https://www.tbd.acme) &nbsp;&middot;&nbsp;
> GitHub [@doevelopper](https://github.com/doevelopper) &nbsp;&middot;&nbsp;
> Twitter [@doevelopper](https://twitter.com/doevelopper)
