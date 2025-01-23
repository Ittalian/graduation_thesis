test : calc.exe test.in test.check
	./calc <test.in >test.out
	diff test.out test.check
calc.exe : calc.tab.o lex.yy.o
	cc -o calc.exe calc.tab.o lex.yy.o
calc.tab.o : calc.tab.c
	cc -c calc.tab.c
calc.tab.c : calc.y
	bison -d -v calc.y
lex.yy.o : lex.yy.c calc.tab.h
	cc -c lex.yy.c
lex.yy.c : calc.lex
	flex -I calc.lex
calc.tab.h : calc.y
	bison -d -v calc.y
