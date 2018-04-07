%{
    #include <driver.h>
    #include <scanner.h>
    #include <parser.hh>
    #include <location.hh>

    static mp::location loc;

    #undef  YY_DECL
    #define YY_DECL mp::parser::symbol_type mp::scanner::yylex(mp::driver &driver)

    #define yyterminate() return mp::parser::make_END(loc);
%}


%option c++
%option yyclass="mp::scanner"
%option nodefault noyywrap


%%

"Thomas"                { return mp::parser::make_THOMAS(loc); }
"Doris"                 { return mp::parser::make_DORIS(loc); }
"Verena"                { return mp::parser::make_VERENA(loc); }

\n                      { return mp::parser::make_END(loc); }
<<EOF>>                 { return mp::parser::make_END(loc); }

.                       { }

%%

