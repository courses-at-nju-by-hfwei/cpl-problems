
.PHONY:clean all
#SRC=$(wildcard *.c)
SRC=git.c card-online.c chess-online.c billiards.c cube.c plane.c
EXF=$(SRC:%.c=%)
FLAG= gcc  -Wall
#
#
build:$(EXF)
$(EXF):%:%.c
	   $(FLAG) $^ -o $@
	
test:build
	for i in $(EXF); do	  bash test.sh $$i; 	done;