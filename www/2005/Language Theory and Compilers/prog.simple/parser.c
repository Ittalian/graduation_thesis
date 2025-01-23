/* parser for simple expressions */
/* Expression :== Term (('+'|'-') Term)* */
/* Term :== Factor ('*' Factor)* */
/* Factor :== '(' Expression ')' | number */

#include <stdio.h>
#include "scanner.h"

token nextToken;

int Expression();
int Term();
int Factor();


main () {
    int value;
    
    initScanner();
    nextToken = getNextToken(); /* get first token */
    value = Expression();
    printf ("Result is %d\n", value);
}

int Expression() {
    int r;
    ttype t;
    
    r = Term();
    while (nextToken.type == plus || nextToken.type == minus) {
         t = nextToken.type;
         nextToken = getNextToken();
         if (t == plus)
             r += Term();
         else /* t == minus */
             r -= Term();
    }
    return r;
}

int Term() {
    int r;
    
    r = Factor();
    while (nextToken.type == times) {
        nextToken = getNextToken();
        r *= Factor();
    }
    return r;
}

int Factor() {
    int r;

    if (nextToken.type == openpar) {  /* '(' */
        nextToken = getNextToken();
        r = Expression();
        if (nextToken.type == closepar)   /* ')' */
            nextToken = getNextToken();
        else exit(1);  /* error */
    }
    else if (nextToken.type == number) {
        r = nextToken.val.iv;
        nextToken = getNextToken();
    }
    else exit(1);  /* error */
    
    return r;
}

