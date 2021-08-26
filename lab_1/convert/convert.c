/*
	Code for all the conversions for lab_1

	Author: Ananta Srikar
*/

#include<stdio.h>
#include<math.h>

// Prints the bits of almost any given datatype
void printBits(const int size, void const * const ptr)
{
	// unsigned char occupies one byte, array of bytes
	unsigned char *b = (unsigned char*)ptr;

	// Printing each byte
	for(int i = size - 1; i >= 0; i--)
		for(int j = 7; j >= 0; j--)
			printf("%u", (b[i] >> j) & 1);
}

// Print BCD form of a decimal number
void decToBCD(int num)
{
	unsigned char b = num;
	
	// Printing only 4 bits because BCD
	for(int j = 3; j >= 0; j--)
		printf("%u", (b >> j) & 1);
	
	printf(" ");
}

// Print deciman form of BCD
void BCDtoDec(char *bin_str)
{
	int sum = 0;

	for(int i = 0; i < 4; i++)
		sum += pow(2, (3 - i)) * (bin_str[i] - '0');

	printf("%d", sum);
}