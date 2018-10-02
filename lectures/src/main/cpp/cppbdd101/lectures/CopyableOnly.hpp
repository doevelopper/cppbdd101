
#ifndef CPPBDD101_LECTURES_COPYABLEONLY_HPP
#define CPPBDD101_LECTURES_COPYABLEONLY_HPP

class CopyableOnly {
public:
    CopyableOnly();
    CopyableOnly(const CopyableOnly& orig);
    CopyableOnly(CopyableOnly&& orig) = delete;
    CopyableOnly & operator=(const CopyableOnly& orig);
    CopyableOnly & operator=(CopyableOnly && orig) = delete;
    virtual ~CopyableOnly();
private:

};

#endif

