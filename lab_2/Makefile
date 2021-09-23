# -*- MakeFile -*-

all : add5

add5: add5.o
	ld add5.o -o add5

add5.o: add5.nasm
	nasm -felf64 add5.nasm -o add5.o

clean:
	rm -fr *.o add5