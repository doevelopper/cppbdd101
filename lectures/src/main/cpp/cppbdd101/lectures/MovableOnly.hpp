
#ifndef CPPBDD101_LECTURES_MOVABLEONLY_HPP
#define CPPBDD101_LECTURES_MOVABLEONLY_HPP

class MovableOnly 
{
public:
    MovableOnly();
    MovableOnly(const MovableOnly& orig) = delete;
    MovableOnly(MovableOnly&& orig);
    MovableOnly & operator=(const MovableOnly& orig) = delete;
    MovableOnly & operator=(MovableOnly && orig);
    virtual ~MovableOnly();
private:

};

#endif

