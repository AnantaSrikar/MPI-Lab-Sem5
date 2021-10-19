# -*- MakeFile -*-

all : fact

fact: fact.o
	gcc fact.o -o fact -no-pie

fact.o: fact.nasm
	nasm -felf64 fact.nasm -o fact.o

clean-temp:
	rm -fr *.o

clean:
	rm -fr *.o fact