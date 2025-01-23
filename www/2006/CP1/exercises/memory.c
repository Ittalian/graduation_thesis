#include <stdio.h>

typedef struct
    {
        char name[18];
        int age;
        char initial;
        double average;
    } Student;
    
Student Taro = { "Taro Reidai", 19, 'T', 66.66 };

int main (void)
{
    Student Hanako = { "Hanako Tatoe", 20, 'H', 77.77 };
     
    printf ("Taro's   name's    address: %p\n", &Taro.name);
    printf ("Taro's   age's     address: %p\n", &Taro.age);
    printf ("Taro's   initial's address: %p\n", &Taro.initial);
    printf ("Taro's   average's address: %p\n", &Taro.average);

    printf ("Hanako's name's    address: %p\n", &Hanako.name);
    printf ("Hanako's age's     address: %p\n", &Hanako.age);
    printf ("Hanako's initial's address: %p\n", &Hanako.initial);
    printf ("Hanako's average's address: %p\n", &Hanako.average);
    return 0;
}
