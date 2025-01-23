/* program to compare two strings */
/* Programming Basics II, 2005/11/14 */
/* Example by Martin J. Dürst */
#include <stdio.h>
#include <string.h>

int main (void) {
    char string1[80], string2[80];
    int comp;
    
    /* input */
    printf ("Enter a first string: ");
    fgets (string1, 80, stdin);
    printf ("Enter a second string: ");
    fgets (string2, 80, stdin);
    
    /* calculation */
    comp = strcmp (string1, string2);
    
    /* output */
    if (comp == 0) {
        printf ("The two strings are equal.\n");
    }
    else if (comp < 0) {
        printf ("The first string is smaller.\n");
    }
    else {
        printf ("The first string is bigger.\n");
    }
    return 0;
}
