CC=gcc

CFLAGS=-Wall -g

OFLAGS=-march=native -Ofast -fopt-info-all=dist.gcc.optrpt

all: genseq dist

dist: dist.c
	$(CC) $(CFLAGS) $(OFLAGS) $< -o $@

genseq: genseq.c
	$(CC) -march=native $(CFLAGS) -Ofast $< -o $@

clean:
	rm -Rf *~ genseq dist *.optrpt
