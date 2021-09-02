# -*- MakeFile -*-

all: int_rep bcd add_multi_bin

int_rep: int_rep.o convert.o
	gcc int_rep.o convert.o -o int_rep -lm

int_rep.o: int_rep.s convert/convert.h
	as int_rep.s -o int_rep.o

int_rep.s: int_rep.i
	gcc -S int_rep.i int_rep.s

int_rep.i: int_rep.c
	gcc -E int_rep.c > int_rep.i

add_multi_bin: add_multi_bin.o convert.o
	gcc add_multi_bin.o convert.o -o add_multi_bin -lm

add_multi_bin.o: add_multi_bin.s convert/convert.h
	as add_multi_bin.s -o add_multi_bin.o

add_multi_bin.s: add_multi_bin.i
	gcc -S add_multi_bin.i add_multi_bin.s

add_multi_bin.i: add_multi_bin.c
	gcc -E add_multi_bin.c > add_multi_bin.i

bcd: bcd.o convert.o
	gcc bcd.o convert.o -o bcd -lm

bcd.o: bcd.s convert/convert.h
	as bcd.s -o bcd.o

bcd.s: bcd.i
	gcc -S bcd.i bcd.s

bcd.i: bcd.c
	gcc -E bcd.c > bcd.i

convert.o: convert.s
	as convert.s -o convert.o

convert.s: convert.i
	gcc -S convert.i convert.s

convert.i: convert/convert.c
	gcc -E convert/convert.c > convert.i

cl-args.o: cl-args/cl-args.c
	gcc -c cl-args/cl-args.c

clean:
	rm -f *.o *.i *.s int_rep bcd add_multi_bin

clean-temp:
	rm -fr *.o *.i