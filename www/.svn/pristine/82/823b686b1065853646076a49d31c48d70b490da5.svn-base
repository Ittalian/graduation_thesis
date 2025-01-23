/* Very simple grammar  */

%{
/* includes and definitions go here */
#include <stdio.h>
#include <stdlib.h>

/* type of semantic value, int is default so this is not needed */
#define YYSTYPE double

/* set to 1 for debugging, otherwise to 0 */
#define YYDEBUG 0

/* yylex function, returns token type */
int yylex (void);

/* error function, called when error is detected */
void yyerror (char const *);
%}
     
%token NUM PLUS MINUS ASTERISK SLASH
%token SEMICOLON OPENPAREN CLOSEPAREN

%%
/* Grammar rules and actions  */

statements: statement { }
          | statements statement { }
;

statement: exp SEMICOLON { printf ("Result is %g\n", $1); }
;

exp:      exp PLUS term { $$= $1 + $3; }
        | exp MINUS term {$$= $1 - $3; }
        | term { $$ = $1; }
;
term:     term ASTERISK fac {$$=$1*$3; }
        | term SLASH fac {$$= $1 / $3; }
        | fac
;

fac:      NUM { $$ = $1; }
        | MINUS fac { $$ = -$2; }
        | OPENPAREN exp CLOSEPAREN { $$ = $2; }
;
     
%%

int main (void)
{
#if YYDEBUG != 0
    yydebug = YYDEBUG; /* for debugging */
#endif
    return yyparse ();
}
     
     
/* Called by yyparse on error.  */
void yyerror (char const *s)
{
     fprintf (stderr, "%s\n", s);
}

