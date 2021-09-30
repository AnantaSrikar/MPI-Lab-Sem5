# -*- MakeFile -*-

all : even

even: even.o
	gcc even.o -o even -no-pie

even.o: even.nasm
	nasm -felf64 even.nasm -o even.o

clean-temp:
	rm -fr *.o

clean:
	rm -fr *.o even