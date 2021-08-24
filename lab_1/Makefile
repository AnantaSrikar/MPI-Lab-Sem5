# -*- MakeFile -*-

all: int_rep

int_rep: int_rep.o convert.o
	gcc int_rep.o convert.o -o int_rep

int_rep.o: int_rep.c convert/convert.h
	gcc -c int_rep.c

convert.o: convert/convert.c
	gcc -c convert/convert.c

cl-args.o: cl-args/cl-args.c
	gcc -c cl-args/cl-args.c

clean:
	rm -f *.o int_rep

clean-temp:
	rm -fr *.o