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
	return OP_SUB;
}
"+" {
	return OP_ADD;
}
"*" {
	return OP_MUL;
}
"/" {
	return OP_DIV;
}
"^" {
	return OP_POW;
}
"%" {
	return OP_MOD;
}

"=" {
	return OP_EQL;
}
"(" {
	return SYM_PRNL;
}
")" {
	return SYM_PRNR;
}
"," {
	return SYM_COMMA;
}
"sqrt"|"SQRT" {
	return FUNC_SQRT;
}
"!" {
	return FUNC_FACT;
}
"abs"|"ABS" {
	return FUNC_ABS;
}
"floor"|"FLOOR" {
	return FUNC_FLOOR;
}
"ceil"|"CEIL" {
	return FUNC_CEIL;
}
"cos"|"COS" {
	return FUNC_COS;
}
"sin"|"SIN" {
	return FUNC_SIN;
}
"tan"|"TAN" {
    return FUNC_TAN;
}
"log2"|"LOG2" {
    return FUNC_LOG2;
}
"log10"|"LOG10" {
    return FUNC_LOG10;
}
[0-9]+ {
	sscanf(yytext, "%lf", &yylval);
	return T_INT;
}
[0-9]+(\.?[0-9]*e?-?[0-9]*)?  {
	sscanf(yytext, "%lf", &yylval);
	return T_FLOAT;
}
[a-zA-Z]([a-zA-Z]|[0-9])* {
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
