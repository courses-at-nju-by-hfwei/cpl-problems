
.PHONY:clean all
#SRC=$(wildcard *.c)
SRC=sum.c absolute-prime.c radix.c rotate.c next-permutation.c magic-square.c ternary-search.c lcp.c
EXF=$(SRC:%.c=%)
FLAG= gcc  -Wall
#
#
build:$(EXF)
$(EXF):%:%.c
	   $(FLAG) $^ -o $@
	
test:build
	for i in $(EXF); do	  bash test.sh $$i; 	done;