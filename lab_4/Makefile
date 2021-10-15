# -*- MakeFile -*-

all : matrix-add matrix-mul

matrix-add: matrix-add.o
	gcc matrix-add.o -o matrix-add -no-pie

matrix-add.o: matrix-add.nasm
	nasm -felf64 matrix-add.nasm -o matrix-add.o

matrix-mul: matrix-mul.o
	gcc matrix-mul.o -o matrix-mul -no-pie

matrix-mul.o: matrix-mul.nasm
	nasm -felf64 matrix-mul.nasm -o matrix-mul.o

clean-temp:
	rm -fr *.o

clean:
	rm -fr *.o matrix-add matrix-mul