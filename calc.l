%{
#include <stdlib.h>
#include <stdio.h>

#include "calc.tab.h"
extern YYSTYPE yylval;
void yyerror(char*);
%}

%%
"PI" {
	return V_PI;
}
"-" {
    printf("T_SUB  ");
	return OP_SUB;
}
"+" {
    printf("T_ADD  ");
	return OP_ADD;
}
"*" {
    printf("T_MUL  ");
	return OP_MUL;
}
"/" {
    printf("T_DIV  ");
	return OP_DIV;
}
"^" {
    printf("T_POW  ");
	return OP_POW;
}
"%" {
    printf("T_MOD  ");
	return OP_MOD;
}
"=" {
    printf("T_EQL  ");
	return OP_EQL;
}
"(" {
    printf("T_PRNL  ");
	return SYM_PRNL;
}
")" {
    printf("T_PRNR  ");
	return SYM_PRNR;
}
"sqrt"|"SQRT" {
    printf("T_SQRT  ");
	return FUNC_SQRT;
}
"!" {
    printf("T_FACT  ");
	return FUNC_FACT;
}
"abs"|"ABS" {
    printf("T_ABS  ");
	return FUNC_ABS;
}
"floor"|"FLOOR" {
    printf("T_FLOOR  ");
	return FUNC_FLOOR;
}
"ceil"|"CEIL" {
    printf("T_CEIL  ");
	return FUNC_CEIL;
}
"cos"|"COS" {
    printf("T_COS  ");
	return FUNC_COS;
}
"sin"|"SIN" {
    printf("T_SIN  ");
	return FUNC_SIN;
}
"tan"|"TAN" {
    printf("T_TAN  ");
    return FUNC_TAN;
}
"log2"|"LOG2" {
    printf("T_LOG2  ");
    return FUNC_LOG2;
}
"log10"|"LOG10" {
    printf("T_LOG10  ");
    return FUNC_LOG10;
}
[0-9]+ {
    printf("T_INT  ");
	sscanf(yytext, "%lf", &yylval);
	return T_INT;
}
[0-9]+(\.?[0-9]*e?-?[0-9]*)?  {
	sscanf(yytext, "%lf", &yylval);
	printf("T_FLOAT  ");
	return T_FLOAT;
}
[a-zA-Z]([a-zA-Z]|[0-9])* {
printf("T_IDEN  ");

return T_IDEN;
}
\n {
	return EOL;
}
[ \t]+ {}

"quit"|"exit" {
	return CMD_EXT;
}
. {
	yyerror("ERROR: Undefined symbol");
}

%%

int yywrap()
{
	return 1;
}
