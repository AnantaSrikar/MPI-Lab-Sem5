# -*- MakeFile -*-

all : add5 mul3 series

add5: add5.o
	gcc add5.o -o add5 -no-pie

add5.o: add5.nasm
	nasm -felf64 add5.nasm -o add5.o

mul3: mul3.o
	gcc mul3.o -o mul3 -no-pie

mul3.o: mul3.nasm
	nasm -felf64 mul3.nasm -o mul3.o

series: series.o
	gcc series.o -o series -no-pie

series.o: series.nasm
	nasm -felf64 series.nasm -o series.o

clean-temp:
	rm -fr *.o

clean:
	rm -fr *.o add5 mul3 series