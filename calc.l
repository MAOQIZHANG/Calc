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
"gbp_to_usd"|"GBP_TO_USD" {
	return FUNC_GBP_TO_USD;
}
"usd_to_gbp"|"USD_TO_GBP" {
	return FUNC_USD_TO_GBP;
}
"gbp_to_euro"|"GBP_TO_EURO" {
	return FUNC_GBP_TO_EURO;
}
"euro_to_gbp"|"EURO_TO_GBP"{
	return FUNC_EURO_TO_GBP;
}
 "usd_to_euro"|"USD_TO_EURO" {
	return FUNC_USD_TO_EURO;
}
"euro_to_usd"|"EURO_TO_USD" {
	return FUNC_EURO_TO_USD;
}
"cel_to_fah"|"CEL_To_FAH" {
	return FUNC_CEL_TO_FAH;
}
"fah_to_cel"|"FAH_TO_CEL" {
	return FUNC_FAH_TO_CEL;
}
"mi_to_km"|"MI_TO_KM"{
	return FUNC_MI_TO_KM;
}
"km_to_mi"|"KM_TO_MI" {
	return FUNC_KM_TO_MI;
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
