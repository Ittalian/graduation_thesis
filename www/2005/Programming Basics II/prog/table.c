/* program to produce tables of addition, multiplication,... */
/* Programming Basics II, 2005/12/19 */
/* Example by Martin J. Dürst */
#include <stdio.h>

int gcd (int a, int b);
int lcm (int a, int b);

int main (void) {
    int base[10] = {10, 11, 12, 13, 14, 15, 16, 17, 18, 19};
    int i, k;
    
    printf ("\nAddition:\n\t");
    for (i=0; i<10; i++) {
        printf (" %6d", base[i]);
    }
    printf ("\n");
    for (k=0; k<10; k++) {
        printf ("%6d\t", base[k]);
        for (i=0; i<10; i++) {
            printf (" %6d", base[i] + base[k]);
        }
        printf ("\n");
    }

    printf ("\nMultiplication:\n\t");
    for (i=0; i<10; i++) {
        printf (" %6d", base[i]);
    }
    printf ("\n");
    for (k=0; k<10; k++) {
        printf ("%6d\t", base[k]);
        for (i=0; i<10; i++) {
            printf (" %6d", base[i] * base[k]);
        }
        printf ("\n");
    }
    
    printf ("\nSubstraction:\n\t");
    for (i=0; i<10; i++) {
        printf (" %6d", base[i]);
    }
    printf ("\n");
    for (k=0; k<10; k++) {
        printf ("%6d\t", base[k]);
        for (i=0; i<10; i++) {
            printf (" %6d", base[i] - base[k]);
        }
        printf ("\n");
    }
    
    printf ("\nDivision:\n\t");
    for (i=0; i<10; i++) {
        printf (" %6d", base[i]);
    }
    printf ("\n");
    for (k=0; k<10; k++) {
        printf ("%6d\t", base[k]);
        for (i=0; i<10; i++) {
            printf (" %6d", base[i] / base[k]);
        }
        printf ("\n");
    }
    
    printf ("\nGreatest Common Divisor:\n\t");
    for (i=0; i<10; i++) {
        printf (" %6d", base[i]);
    }
    printf ("\n");
    for (k=0; k<10; k++) {
        printf ("%6d\t", base[k]);
        for (i=0; i<10; i++) {
            printf (" %6d", lcm(base[i], base[k]));
        }
        printf ("\n");
    }
}

int gcd (int a, int b)
{
    if (a == b) {
        return a;
    }
    else if (a > b) {
        return gcd (a-b, b);
    }
    else {
        return gcd (b, a);
    }
}

int lcm (int a, int b)
{
    return a * b / gcd (a, b);
}
