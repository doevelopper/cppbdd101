
#ifndef CPPBDD101_LECTURES_NONCOPYABLENORMOVABLE_HPP
#define CPPBDD101_LECTURES_NONCOPYABLENORMOVABLE_HPP

class NonCopyableNorMovable 
{
public:
    NonCopyableNorMovable();
    NonCopyableNorMovable(const NonCopyableNorMovable& orig) = delete;
    NonCopyableNorMovable(NonCopyableNorMovable&& orig) = delete;
    NonCopyableNorMovable & operator=(const NonCopyableNorMovable& orig) = delete;
    NonCopyableNorMovable & operator=(NonCopyableNorMovable && orig) = delete;
    virtual ~NonCopyableNorMovable() = default;
private:

};

#endif

