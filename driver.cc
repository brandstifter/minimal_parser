#include "driver.h"

#include <scanner.h>
#include <parser.hh>


int mp::driver::parse(std::istream& in, std::ostream& out) {

    mp::scanner scanner {*this};
    mp::parser parser {*this, scanner};

    int res = parser.parse();

    return res;
}
