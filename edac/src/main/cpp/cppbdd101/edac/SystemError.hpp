
#ifndef CPPBDD101_EDAC_SYSTEMERROR_HPP
#define CPPBDD101_EDAC_SYSTEMERROR_HPP

class SystemError {
    public:

        SystemError();
        SystemError(const SystemError & orig);
        virtual ~SystemError();

        const char * name() const noexcept override;
        std::string message(int ev) const override;
        bool equivalent(const std::error_code & code, int condition) const noexcept override;

    private:
};

#endif
