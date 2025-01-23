bison -v calc.y
gcc calc.tab.c
a.exe <test.in >test.res
diff test.out test.res
