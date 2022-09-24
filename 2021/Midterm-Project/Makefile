
.PHONY:clean all
#SRC=$(wildcard *.c)
SRC=snake.c chess.c mines.c 99in1.c calculator.c 2048.c
EXF=$(SRC:%.c=%)
FLAG= gcc  -Wall
#
#
build:$(EXF)
$(EXF):%:%.c
	   $(FLAG) $^ -o $@
	
test:build
	for i in $(EXF); do	  bash test.sh $$i; 	done;