%{
#include <stdio.h>
int yylex();
int yyerror(char* msg) {
    printf("Error: %s\n", msg);
}

%}
%define api.value.type {char*}
%token LEFT_BRACKET RIGHT_BRACKET EQUAL NAME VALUE
%%
file: 
    |file record
    |file section
    ;
record: NAME EQUAL VALUE {
    printf("%s equals %s", $1, $3);
    free($1);
    free($3);
};

record: NAME EQUAL NAME {
    printf("%s equals %s", $1, $3);
    free($1);
    free($3);
};

section: LEFT_BRACKET NAME RIGHT_BRACKET {
    printf("found section %s", $2);
    free($2);
};

%% 
int main() {
    yyparse();
    return 0;
}

