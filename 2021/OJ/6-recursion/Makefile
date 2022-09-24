
.PHONY:clean all
#SRC=$(wildcard *.c)
SRC=triangle.c plagiarize.c yanghui.c tile.c max.c decomposition.c integration.c
EXF=$(SRC:%.c=%)
FLAG= gcc  -Wall
#
#
build:$(EXF)
$(EXF):%:%.c
	   $(FLAG) $^ -o $@
	
test:build
	for i in $(EXF); do	  bash test.sh $$i; 	done;