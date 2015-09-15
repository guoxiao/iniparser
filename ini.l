%{
#include <string.h>
#include "ini.tab.h"
%}

value [A-Za-z0-9]+
name [A-Za-z][A-Za-z0-9]*

%%
[" "\t]    ;
"["  {return LEFT_BRACKET;}
"]"  {return RIGHT_BRACKET;}
{name} {
    yylval = strdup(yytext);
    return NAME;}
{value} {
    yylval = strdup(yytext);
    return VALUE;}
"="  {return EQUAL;}
%%

int yywrap() {return 1;}

