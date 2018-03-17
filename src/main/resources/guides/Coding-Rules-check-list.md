### Assign Severity to Review Finding
    The severity to find issues with code should go as below. Reviewer must focus on issues with High severity first and then to Medium severity and then Low severity issues.

    1.  Naming Conventions and Coding style = Low
    2.  Control Structures and Logical issues = Medium or High
    3.  Redundant Code = High
    4.  Performance Issues =High
    5.  Security Issues = High
    6.  Scalability Issues= High
    7.  Functional Issues =High
    8.  Error Handling = High
    9.  Reusability = Medium

####Include files
    .hpp files should be included in the follwing order:
        (for .cpp files only) ClassName.hpp
        .hpp files from same namespace
        project .hpp files
        ext includes
        other includes
        boost includes
        stl includes
