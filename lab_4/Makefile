# -*- MakeFile -*-

all : matrix-add

matrix-add: matrix-add.o
	gcc matrix-add.o -o matrix-add -no-pie

matrix-add.o: matrix-add.nasm
	nasm -felf64 matrix-add.nasm -o matrix-add.o

clean-temp:
	rm -fr *.o

clean:
	rm -fr *.o matrix-add