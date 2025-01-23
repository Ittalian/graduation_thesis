/* exercise 06B1 */
#include <stdio.h>

#define bufferSize 8

/* return type as enumeration */
typedef enum { end, over, okay } getstringReturn;

getstringReturn getstring (char buffer[], int bufferLength);

int main ()
{
	getstringReturn ret;
	char buff[bufferSize];

	while (1)
		switch (ret = getstring(buff, bufferSize))
		{
		case end:        /* end of file reached */
			return 0;    /* return instead of break */
		case okay:       /* line okay, not too long */
			printf("%s\n", buff);
			break;
		case over:       /* line too long */
			printf("%s !!! line too long !!!\n", buff);
			break;
		}
}

getstringReturn getstring (char buffer[], int bufferLength)
{
	int c;   /* character read in */
	int i=0;   /* index to next position in buffer */

	while (1) /* endless loop for state machine */
	{
		c = getchar();
		if (c==EOF || c=='\n')
		{
			if (i > bufferLength-1)
				return over;
			buffer[i] = '\0';
			if (i==0 && c==EOF)
				return end;
			else if (i == bufferLength-1)
				return over;
			else
				return okay;
		}
		else if (i < bufferLength-1)
			buffer[i++] = c;
		else if (i == bufferLength-1)
			buffer[i] = '\0';
	}
}
