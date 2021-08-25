#include<stdio.h>

#include "convert/convert.h"

void printBCD(int);

int main()
{
	int i = 123;

	printBCD(i);

	return(0);
}

void printBCD(int num)
{
	if(num / 10 != 0)
		printBCD(num / 10);
	
	printBitBCD(num % 10);
}