# -*- MakeFile -*-

all: int_rep bcd add_multi_bin

int_rep: int_rep.o convert.o
	gcc int_rep.o convert.o -o int_rep -lm

int_rep.o: int_rep.c convert/convert.h
	gcc -c int_rep.c

add_multi_bin: add_multi_bin.o convert.o
	gcc add_multi_bin.o convert.o -o add_multi_bin -lm

add_multi_bin.o: add_multi_bin.c convert/convert.h
	gcc -c add_multi_bin.c

bcd: bcd.o convert.o
	gcc bcd.o convert.o -o bcd -lm

bcd.o: bcd.c convert/convert.h
	gcc -c bcd.c

convert.o: convert/convert.c
	gcc -c convert/convert.c

cl-args.o: cl-args/cl-args.c
	gcc -c cl-args/cl-args.c

clean:
	rm -f *.o int_rep bcd add_multi_bin

clean-temp:
	rm -fr *.o