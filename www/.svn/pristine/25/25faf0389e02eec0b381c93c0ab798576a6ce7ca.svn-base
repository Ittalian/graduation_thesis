#include <stdio.h>
#define SIZE 10

int getstring(char[], int);
void outputRecursive();

void e06B1(){

	char s[SIZE];
	int ret;
	
	while(1){
		ret = getstring(s, SIZE);
		if (ret == EOF) {
			return;
		} else {
			printf(s);
			if (ret == '\n') {
				printf(" !!!line too long!!!");
			}
			printf("\n");
		}
	}
}

void e06C2(){
	outputRecursive();
}

void outputRecursive(){

	char s[SIZE];

	printf("ì¸óÕ: ");
	if (getstring(s, SIZE) == EOF) {
		return;
	} else {
		outputRecursive();
		printf("èoóÕ: %s\n", s);
	}
}

int getstring(char s[], int l){ 
	
	char c;
	int i = 0;
	
	while ( 1 ) {
		c  = getchar();
		if (c == EOF) return EOF;
		else if (c == '\n') break;
		else if (i < l-1){
			s[i] = c;
		}
		i++;
	}
	
	if (i < l-1) {
		s[i] = '\0';
		return 0;
	}
	s[l-1] = '\0';
	return '\n';
}

void main(){

//	e06B1();
	e06C2();

}