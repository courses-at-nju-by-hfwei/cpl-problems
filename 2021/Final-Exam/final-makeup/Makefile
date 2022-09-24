
.PHONY:clean all
#SRC=$(wildcard *.c)
SRC=sum.c sorting.c cuboid.c buddy.c
EXF=$(SRC:%.c=%)
FLAG= gcc  -Wall
#
#
build:$(EXF)
$(EXF):%:%.c
	   $(FLAG) $^ -o $@
	
test:build
	for i in $(EXF); do	  bash test.sh $$i; 	done;