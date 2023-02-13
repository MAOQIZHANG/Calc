%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define YYSTYPE double

int yylex(void);
void yyerror(char*);

%}
%token V_PI
%token T_FLOAT T_INT  

%token EOL
%token SYM_PRNL SYM_PRNR SYM_COMMA
%token FUNC_L FUNC_R
%token FUNC_SQRT FUNC_ABS FUNC_FLOOR FUNC_CEIL FUNC_SIN FUNC_COS FUNC_TAN FUNC_LOG2 FUNC_LOG10

%token CMD_EXT
%token T_IDEN

%left OP_ADD OP_SUB
%left OP_MUL OP_DIV 
%left OP_POW 
%right OP_EQL FUNC_FACT

%right FUNC_GBP_TO_USD FUNC_USD_TO_GBP FUNC_GBP_TO_EURO FUNC_EURO_TO_GBP FUNC_USD_TO_EURO FUNC_EURO_TO_USD
%right FUNC_FAH_TO_CEL FUNC_CEL_TO_FAH FUNC_MI_TO_KM FUNC_KM_TO_MI
%%

strt: strt stmt EOL { printf("= %lf\n", $2); }
	| strt EOL { printf("\n"); }
	| strt CMD_EXT { printf(">> Bye!\n"); exit(0); }
	|
;

stmt: T_IDEN OP_EQL expr           { $$ = $3; $1 = $3; }
    | expr                         { $$ = $1; }
;

expr: expr OP_ADD term          { $$ = $1 + $3; }
    | expr OP_SUB term         { $$ = $1 - $3; }
    | term  { $$ = $1; }
;

term: term OP_MUL unary     { $$ = $1 * $3; }
    | term OP_DIV unary       { $$ = $1 / $3; }
    | unary                     { $$ = $1; }
;

unary: OP_SUB unary            { $$ = $2 * -1; }
    | pow                       { $$ = $1; }
;

pow: factor OP_POW pow           { $$ = pow($1,$3); }
    | factor                    { $$ = $1; }
;

factor: T_IDEN                                      { $$ = $1; }
	| V_PI  										{ $$ = 3.14; }
    | T_INT                                         { $$ = $1; }
    | T_FLOAT                                       { $$ = $1; }
    | SYM_PRNL expr SYM_PRNR                        { $$ = ($2); }
    | FUNC_SQRT SYM_PRNL expr SYM_PRNR              { $$ = sqrt($3); }
    | FUNC_ABS SYM_PRNL expr SYM_PRNR               { $$ = fabs($3); }
	| FUNC_FLOOR SYM_PRNL expr SYM_PRNR             { $$ = floor($3); }
    | FUNC_CEIL SYM_PRNL expr SYM_PRNR              { $$ = ceil($3); }
	| FUNC_SIN SYM_PRNL expr SYM_PRNR               { $$ = sin($3); }
    | FUNC_COS SYM_PRNL expr SYM_PRNR               { $$ = cos($3); }
	| FUNC_TAN SYM_PRNL expr SYM_PRNR               { $$ = tan($3); }
    | FUNC_LOG2 SYM_PRNL expr SYM_PRNR              { $$ = log2($3); }
	| FUNC_LOG10 SYM_PRNL expr SYM_PRNR             { $$ = log10($3); }
    | expr FUNC_GBP_TO_USD              			{ $$ = 1.20*$1; }
	| expr FUNC_USD_TO_GBP              			{ $$ = 0.83*$1; }
	| expr FUNC_GBP_TO_EURO             			{ $$ = 1.13*$1; }
	| expr FUNC_EURO_TO_GBP             			{ $$ = 0.89*$1; }
	| expr FUNC_USD_TO_EURO              			{ $$ = 0.94*$1; }
	| expr FUNC_EURO_TO_USD              			{ $$ = 1.07*$1; }	
	| expr FUNC_FACT              					{ $$ = tgamma($1); }
	| expr FUNC_MI_TO_KM              				{ $$ = 1.60*$1; }
	| expr FUNC_KM_TO_MI             				{ $$ = 0.62*$1; }
	| expr FUNC_FAH_TO_CEL              			{ $$ = 5/9*($1-32); }
	| expr FUNC_CEL_TO_FAH             				{ $$ = 1.8*$1+32; }	
;

%%
void yyerror(char *s)
{
	fprintf(stderr, ">> %s\n", s);
}
int main()
{
	yyparse();
	return 0;
}
