
.PHONY:clean all
#SRC=$(wildcard *.c)
SRC=sorted.c bsearch.c gobang.c lineup.c
EXF=$(SRC:%.c=%)
FLAG= gcc  -Wall
#
#
build:$(EXF)
$(EXF):%:%.c
	   $(FLAG) $^ -o $@
	
test:build
	for i in $(EXF); do	  bash test.sh $$i; 	done;