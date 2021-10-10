# -*- MakeFile -*-

all : even cmp

even: even.o
	gcc even.o -o even -no-pie

even.o: even.nasm
	nasm -felf64 even.nasm -o even.o

cmp: cmp.o
	gcc cmp.o -o cmp -no-pie

cmp.o: cmp.nasm
	nasm -felf64 cmp.nasm -o cmp.o

parity: parity.o
	gcc parity.o -o parity -no-pie

parity.o: parity.nasm
	nasm -felf64 parity.nasm -o parity.o

clean-temp:
	rm -fr *.o

clean:
	rm -fr *.o even cmp parity