%{
    #include <driver.h>
    #include <scanner.h>
    #include <parser.hh>

    #undef  YY_DECL
    #define YY_DECL mp::parser::symbol_type mp::scanner::yylex(mp::driver &driver)


    #define yyterminate() return mp::parser::make_END();
%}


%option c++
%option yyclass="mp::scanner"
%option nodefault noyywrap


%%

"Thomas"                { return mp::parser::make_THOMAS(); }
"Doris"                 { return mp::parser::make_DORIS(); }
"Verena"                { return mp::parser::make_VERENA(); }

\n                      { return mp::parser::make_END(); }
<<EOF>>                 { return mp::parser::make_END(); }

.                       { }

%%

