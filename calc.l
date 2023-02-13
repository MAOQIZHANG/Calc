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
"gbp_to_usd"|"GBP_TO_USD" {
    printf("T_GBP_TO_USD  ");
	return FUNC_GBP_TO_USD;
}
"usd_to_gbp"|"USD_TO_GBP" {
    printf("T_USD_TO_GBP  ");
	return FUNC_USD_TO_GBP;
}
"gbp_to_euro"|"GBP_TO_EURO" {
    printf("T_GBP_TO_EURO  ");
	return FUNC_GBP_TO_EURO;
}
"euro_to_gbp"|"EURO_TO_GBP"{
    printf("T_EURO_TO_GBP  ");
	return FUNC_EURO_TO_GBP;
}
 "usd_to_euro"|"USD_TO_EURO" {
    printf("T_USD_TO_EURO  ");
	return FUNC_USD_TO_EURO;
}
"euro_to_usd"|"EURO_TO_USD" {
    printf("T_EURO_TO_USD ");
	return FUNC_EURO_TO_USD;
}
"cel_to_fah"|"CEL_To_FAH" {
    printf("T_CEL_TO_FAH  ");
	return FUNC_CEL_TO_FAH;
}
"fah_to_cel"|"FAH_TO_CEL" {
    printf("T_FAH_TO_CEL  ");
	return FUNC_FAH_TO_CEL;
}
"mi_to_km"|"MI_TO_KM"{
    printf("T_MI_TO_KM  ");
	return FUNC_MI_TO_KM;
}
"km_to_mi"|"KM_TO_MI" {
    printf("T_KM_TO_MI ");
	return FUNC_KM_TO_MI;
}
"var"|"VAR" {
    printf("T_VAR  ");
    return VAR;
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
