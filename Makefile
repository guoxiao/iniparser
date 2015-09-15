iniparser: lex.yy.c ini.tab.c
	gcc lex.yy.c ini.tab.c -o iniparser

lex.yy.c: ini.l
	flex ini.l

ini.tab.c: ini.y
	bison -d ini.y


clean:
	rm -f lex.yy.c ini.tab.c iniparser

.PHONY: clean
