.PHONY:clean all
#SRC=$(wildcard *.c)
SRC=binary.c insertion-sort.c josephus.c mines.c palindrome.c series.c sudoku.c
EXF=$(SRC:%.c=%)
FLAG= gcc  -Wall
#
#
build:$(EXF)
$(EXF):%:%.c
	   $(FLAG) $^ -o $@
	
test:build
	for i in $(EXF); do\
	  bash test.sh $$i; \
	done;\


