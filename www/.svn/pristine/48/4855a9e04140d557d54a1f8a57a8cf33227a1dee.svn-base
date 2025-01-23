/*
 * flex
 */

%{
#define YYSTYPE double
#include "calc.tab.h"
#define yywrap() 1
%}

%%

[0-9]+(\.[0-9]*)?  {	
			double d;
			sscanf (yytext, "%lf", &d);
			yylval = d;
			return NUM;
		}
	
"+"     return PLUS;

"-"     return MINUS;

"*"     return ASTERISK;

"/"     return SLASH;

";"     return SEMICOLON;

"("     return OPENPAREN;

")"     return CLOSEPAREN;

[ \t\n]    ;

%%

