/* program to produce tables of addition, multiplication,... */
/* Programming Basics II, 2005/12/19 */
/* Example by Martin J. Dürst */
#include <stdio.h>

void table (char text[], int fun(int a, int b), int base[]);
int gcd (int a, int b);
int lcm (int a, int b);
int add (int a, int b) { return a + b; }
int mul (int a, int b) { return a * b; }
int sub (int a, int b) { return a - b; }
int div (int a, int b) { return a / b; }

int main (void) {
    int base[10] = {10, 11, 12, 13, 14, 15, 16, 17, 18, 19};
    int i, k;
    
    table ("Addition", add, base);
    table ("Multiplication", mul, base);
    table ("Subtraction", sub, base);
    table ("Division", mul, base);
    table ("Greatest Common Divisor", gcd, base);
    table ("Lowest Common Multiple", lcm, base);
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

void table (char text[], int fun(int a, int b), int base[])
{
    int i, k;
    
    printf ("\n%s:\n\t", text);
    for (i=0; i<10; i++) {
        printf (" %6d", base[i]);
    }
    printf ("\n");
    for (k=0; k<10; k++) {
        printf ("%6d\t", base[k]);
        for (i=0; i<10; i++) {
            printf (" %6d", fun(base[i], base[k]));
        }
        printf ("\n");
    }
}

