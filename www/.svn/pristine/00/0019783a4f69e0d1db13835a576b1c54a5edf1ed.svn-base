#include <stdio.h>
#include "scanner.h"

int nextChar;   /* contains next character to look at */

void initScanner (void) {
    nextChar = getchar();
}

token num() {
    token t;
    long n = 0;
    
    t.type = number;
    do {
        n = n*10 + (nextChar-'0');
        nextChar = getchar();
    } while ('0' <= nextChar && nextChar <= '9');
    t.val.iv = n;
    return t;
}

/*token identOrKey () {*/
    /* buffering and symbol table,... */
/*    ...
}*/

token getNextToken (void) {
    token t;
    
    while (nextChar==' ' || nextChar=='\t' || nextChar=='\n') {
        nextChar = getchar();
        continue;
    }
    if ('0' <= nextChar && nextChar <= '9')
        return num();
    /* else if ('A' <= nextChar && nextChar <= 'Z'
             || 'a' <= nextChar && nextChar <= 'z')
        return identOrKey (); */
    switch (nextChar) {
      case EOF:
        t.type = eof;
        nextChar = getchar();
        break;
      case '+':
        t.type = plus;
        nextChar = getchar();
        break;
      case '-':
        t.type = minus;
        nextChar = getchar();
        break;
      case '*':
        t.type = times;
        nextChar = getchar();
        break;
      case '(':
        t.type = openpar;
        nextChar = getchar();
        break;
      case ')':
        t.type = closepar;
        nextChar = getchar();
        break;
      
    }
    return t;
}
