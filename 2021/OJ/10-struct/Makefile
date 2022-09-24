
.PHONY:clean all
#SRC=$(wildcard *.c)
SRC=linked-list.c stack-pour.c filesystem.c hash.c
EXF=$(SRC:%.c=%)
FLAG= gcc  -Wall
#
#
build:$(EXF)
$(EXF):%:%.c
	   $(FLAG) $^ -o $@
	
test:build
	for i in $(EXF); do	  bash test.sh $$i; 	done;