typedef enum ttype {
    /*ident,   /* identifier */
    number,  /* integer */
    times,   /* multiplication operator * */
    /*div,     /* division operator / */
    plus,    /* addition operator + */
    minus,   /* substraction operator - */
    /*...
    assign,  /* assignement operator = */
    /*...
    openbr,  /* opening bracket { */
    /*closebr, /* closing bracket { */
    /*...
    keyif,   /* keyword if */
    /*keyelse, /* keyword else */
    
    openpar, /* opening parentesis */
    closepar, /* closing parentesis */
    eof, /* end of file */
} ttype;

typedef struct token {
    ttype type;
    union {
        int    iv; /* for numbers */
        char*  cp; /* for identifiers */
    } val;
}
token;

void initScanner (void);
token getNextToken (void);
