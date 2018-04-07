%skeleton "lalr1.cc"
%require  "3.0"

%defines
%define api.namespace { mp }
%define parser_class_name {parser}
%define api.value.type variant
%define api.token.constructor
%define parse.assert true
%define parse.error verbose
%locations


%param {mp::driver &driver}
//%lex-param {mp::parser::location_type &loc}
%parse-param {mp::scanner &scanner}

%code requires {

    namespace mp {
        class scanner;
        class driver;
    }

    #ifndef YYDEBUG
        #define YYDEBUG 1
    #endif

    #define YY_NULLPTR nullptr
}


%{

    #include <cassert>
    #include <iostream>

    #include <driver.h>
    #include <scanner.h>

    #include <parser.hh>
    #include <location.hh>

    #undef yylex
    #define yylex scanner.yylex
%}


%token THOMAS DORIS VERENA
%token END

%start file
%%

file: names END { YYACCEPT; }

names
    : THOMAS    { std::cout << "Hello Thomas"; }
    | DORIS     { std::cout << "Hello Doris"; }
    | VERENA    { std::cout << "Hello Verena"; }
    ;

%%

void mp::parser::error(const location_type &, const std::string& message) {
    std::cerr << "parser error: " << message << std::endl;
}