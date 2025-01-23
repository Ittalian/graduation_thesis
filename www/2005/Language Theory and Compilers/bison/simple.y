/* Very simple grammar  */

%{
/* includes and definitions go here */
#include <stdio.h>
#include <stdlib.h>

/* type of semantic value, int is default so this is not needed */
#define YYSTYPE int

/* set to 1 for debugging, otherwise to 0 */
#define YYDEBUG 0

/* yylex function, returns token type */
int yylex (void);

/* error function, called when error is detected */
void yyerror (char const *);
%}
     
%token NUM

%%
/* Grammar rules and actions  */

exp:      term '+' term { printf ("Result is %d\n", $1 + $3); }
;

term:     NUM { $$ = $1; }
;
     
%%

/* lexical analyzer:
   - returns token NUM, or numeric code of character (for '+')
   - stores integer value for NUM in &yylval
   - skips all blanks, tabs, and newlines
   - returns 0 for end-of-input
*/
     
int yylex (void)
{
    int c, n=0;
     
    /* Skip white space.  */
    while ((c=getchar())==' ' || c=='\t' || c=='\n')
        ;

    /* Process number  */
    if (isdigit (c)) {
        ungetc (c, stdin);
        scanf ("%d", &yylval);
        return NUM;
    }

    /* Return end-of-input.  */
    if (c == EOF)
        return 0;

    /* Return a single char.  */
    return c;
}

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

