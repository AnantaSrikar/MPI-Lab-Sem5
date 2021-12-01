# -*- MakeFile -*-

all : fact sel-sort

fact: fact.o
	gcc fact.o -o fact -no-pie

fact.o: fact.nasm
	nasm -felf64 fact.nasm -o fact.o

sel-sort: sel-sort.o
	gcc sel-sort.o -o sel-sort -no-pie

sel-sort.o: sel-sort.nasm
	nasm -felf64 sel-sort.nasm -o sel-sort.o

clean-temp:
	rm -fr *.o

clean:
	rm -fr *.o fact sel-sort