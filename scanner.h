#pragma once



#undef YY_DECL
#define YY_DECL mp::parser::symbol_type mp::scanner::yylex()

#include <iostream>

#ifndef yyFlexLexerOnce
#include <FlexLexer.h>
#endif

#include <parser.hh>
#include <location.hh>

namespace mp {

    // forward declare to avoid an include
    class driver;

    class scanner : public yyFlexLexer {
    public:
        scanner(driver &driver) : yyFlexLexer(std::cin, std::cout), _driver(driver) {}
        virtual ~scanner() {}
        virtual mp::parser::symbol_type yylex(mp::driver &driver);
    private:
        driver &_driver;
    };
}