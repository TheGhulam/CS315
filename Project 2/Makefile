parser: y.tab.c lex.yy.c
	gcc -o parser lex.yy.c y.tab.c

y.tab.c: test.y
	yacc -d test.y	

lex.yy.c: test.l
	lex test.l

test:
	./parser < test.txt
