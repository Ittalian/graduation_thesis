#include <stdio.h>

char string[10] = "Example!";

int main (void)
{
    int numbers[5] = { 2, 3, 5, 7, 11 };
    int i;

    for (i=0; i<10; i++) {
        printf ("Address of string[%d]: %p\n", i, &string[i]);
        printf ("Value of  string + %d: %p\n", i, string + i);
    }
    for (i=0; i<5; i++) {
        printf ("Address of numbers[%d]: %p\n", i, &numbers[i]);
        printf ("Value of  numbers + %d: %p\n", i, numbers + i);
    }
}
