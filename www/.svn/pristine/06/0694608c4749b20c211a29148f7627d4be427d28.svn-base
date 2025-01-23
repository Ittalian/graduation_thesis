/* program to print today's garbage collection schedule */
/* Programming Basics II, 2005/11/14 */
/* Example by Martin J. Dürst */
#include <stdio.h>

int main (void) {
    int monthday; /* day of the month */
    char weekday[80];
    
    /* input */
    printf ("Enter day of the week (first two letters, i.e. ");
    printf ("Mo, Tu, We, Th, Fr, Sa, So): ");
    fgets (weekday, 80, stdin);
    weekday[2] = 0; /* cut off rest of input if longer */
    printf ("Enter day of the month: ");
    scanf ("%d", &monthday);
    
    if (strcmp(weekday,"Mo")==0 || strcmp(weekday,"We")==0
            || strcmp(weekday,"Fr")==0) {
        printf ("Burnable waste\n");
    }
    if (strcmp(weekday,"Tu")==0
            && ((monthday>0 && monthday<=7)
                 || (monthday>14 && monthday<=21))) {
        printf ("Cardboard\n");
    }
    if (strcmp(weekday,"Th")==0 && (monthday%2)==0) {
        printf ("Bottles and cans\n");
    }
    if (strcmp(weekday,"Sa")==0 && monthday>21 && monthday<=28) {
        printf ("Pet bottles\n");
    }
    return 0;
}

