/* examples of different output methods */
/* Martin J. Dürst, 2006/06/22 */

#include <stdio.h>

int main (void)
{
    FILE *text = fopen ("text.txt", "w");
    FILE *raw  = fopen ("raw.txt", "wb");
    
    int i = 99999999;
    char s[20] = "This is a test";

    /* text output */
    fprintf (text, "%d\n%s\n", i, s);
    fclose (text);

    /* binary (raw) output */
    fwrite (s, sizeof(s), 1, raw);
    fwrite (&i, sizeof(int), 1, raw);
    fclose (raw);

    return 1;
}
