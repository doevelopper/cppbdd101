
#include <cppbdd101/lectures/CopyableAndMovable.hpp>

CopyableAndMovable::CopyableAndMovable() 
{
}


CopyableAndMovable::~CopyableAndMovable() 
{
}

CopyableAndMovable::CopyableAndMovable(const CopyableAndMovable& orig)
{
    
}
CopyableAndMovable & CopyableAndMovable::operator=(const CopyableAndMovable& orig)
{
    return *this;     
}

CopyableAndMovable & CopyableAndMovable::operator=(const CopyableAndMovable& orig)
{
    return *this; 
}