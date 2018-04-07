#pragma once

#include <iostream>

namespace mp {

    class driver {
    public:
        driver() {};
        virtual ~driver() {};

        int parse(std::istream& in, std::ostream& out);
        void update_location(int length);

        friend class parser;
        friend class scanner;
    };
}