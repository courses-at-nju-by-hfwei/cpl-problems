.PHONY:clean all
#SRC=$(wildcard *.c)
SRC=ascii.c change.c equation.c gray.c inverse.c pi.c plank.c time.c weekday.c
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


