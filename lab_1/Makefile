# -*- MakeFile -*-

all: int_rep bcd

int_rep: int_rep.o convert.o
	gcc int_rep.o convert.o -o int_rep

int_rep.o: int_rep.c convert/convert.h
	gcc -c int_rep.c

bcd: bcd.o convert.o
	gcc bcd.o convert.o -o bcd

bcd.o: bcd.c convert/convert.h
	gcc -c bcd.c

convert.o: convert/convert.c
	gcc -c convert/convert.c

cl-args.o: cl-args/cl-args.c
	gcc -c cl-args/cl-args.c

clean:
	rm -f *.o int_rep bcd

clean-temp:
	rm -fr *.o