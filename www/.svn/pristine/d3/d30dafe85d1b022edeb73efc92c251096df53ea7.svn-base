/* program to to test integers from 1 to n for primality */
/* Programming Basics II, 2005/11/21 */
/* Example by Martin J. Dürst */
#include <stdio.h>

int main (void) {
    int end, div, test;
    
    printf ("Please input a number: ");
    scanf ("%d", &end);
    
    for (test=1; test<=end; test++) {
		div = 2; /* start trying to divide by 2 */
		while (test>div && test%div != 0) {
			div++;
		}
		if (test<2 || test>div) {
			printf ("%d is not prime.\n", test);
		}
		else {
			printf ("%d is prime.\n", test);
		}
    }
    return 0;
}
