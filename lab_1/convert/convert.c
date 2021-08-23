/*
	Code for all the conversions for lab_1

	Author: Ananta Srikar
*/

#include<stdio.h>

void printBits(const int size, void const * const ptr)
{
	unsigned char *b = (unsigned char*) ptr;
	unsigned char byte;
	int i, j;
	
	for (i = size-1; i >= 0; i--)
	{
		for (j = 7; j >= 0; j--)
		{
			byte = (b[i] >> j) & 1;
			printf("%u", byte);
		}
	}
	puts(""); // TODO: Change something here?
}