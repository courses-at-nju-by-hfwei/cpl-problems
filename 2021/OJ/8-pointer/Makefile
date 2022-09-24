
.PHONY:clean all
#SRC=$(wildcard *.c)
SRC=split.c interpreter.c substr.c tokenizer.c title.c stringcat.c
EXF=$(SRC:%.c=%)
FLAG= gcc  -Wall
#
#
build:$(EXF)
$(EXF):%:%.c
	   $(FLAG) $^ -o $@
	
test:build
	for i in $(EXF); do	  bash test.sh $$i; 	done;