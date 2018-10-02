#ifndef CPPBDD101_LECTURES_COPYABLEANDMOVABLE_HPP
#define CPPBDD101_LECTURES_COPYABLEANDMOVABLE_HPP

class CopyableAndMovable {
public:
    CopyableAndMovable();
    CopyableAndMovable(const CopyableAndMovable& orig);
    CopyableAndMovable(CopyableAndMovable&& orig);
    CopyableAndMovable & operator=(const CopyableAndMovable& orig);
    CopyableAndMovable & operator=(CopyableAndMovable && orig);
    virtual ~CopyableAndMovable();
private:

};

#endif

