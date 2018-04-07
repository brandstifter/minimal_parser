#pragma once

#include <iostream>

#include <location.hh>

namespace mp {

    class parser;

    class driver {
    public:
        driver() {};
        virtual ~driver() {};

        int parse(std::istream& in, std::ostream& out);

        friend class parser;
        friend class scanner;
    };
}