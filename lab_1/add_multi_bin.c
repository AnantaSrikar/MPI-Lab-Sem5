/*
	Program to add or multiply two 32 bit binary numbers

	Author: Ananta Srikar
*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#include "convert/convert.h"

void add32Bit(char*, char*);
void multi32Bit(char*, char*);

int main(int argc, char **argv)
{
	// TODO: validate argv
	int choice = atoi(argv[1]);

	switch(choice)
	{
		case 0:
			{
				add32Bit(argv[2], argv[3]);
				break;
			}

		case 1:
			{
				multi32Bit(argv[2], argv[3]);
				break;
			}

		default:
				printf("Incorrect choice entered! Try again!");
				exit(0);
	}

	return(0);
}

void addBin(char *sum, char *bin_1, char *bin_2, int size, int offset)
{
	int carry = 0;

	for(int i = size - 1; i >= 0; i--)
	{
		printf("i = %d, carry = %d\n", i, carry);
		if(carry == 1)
		{
			if(bin_1[i + offset] == bin_2[i])
			{
				if(bin_1[i + offset] == '1')
					carry = 1;
				
				sum[i + offset] = '0';
			}

			else
				sum[i + offset] = '1';
		}

		else
		{
			if(bin_1[i + offset] == bin_2[i])
			{
				if(bin_1[i + offset] == '0')
					carry = 0;

				sum[i + offset] = '1';
			}

			else
				sum[i + offset] = '0';
		}

		printf("sum = %s\n", sum);
	}
}

// 32 Bits = 4 bytes = sizeof(int) | sizeof(float)
void add32Bit(char *bin_1, char *bin_2)
{
	char sum[32];

	addBin(sum, bin_1, bin_2, 32, 0);

	printf("\nSum = %s\n", sum);
	binToInt(sum);
	binToFloat(sum);
}

// Sets the string of binary characters to 0
void setZero(char *bin_str, int size)
{
	for(int i = 0; i < size; i++)
		bin_str[i] = '0';
}

// 32 Bits = 4 bytes = sizeof(int) | sizeof(float)
void multi32Bit(char *bin_1, char *bin_2)
{
	char prod[64];

	// Initialising the product to 0
	setZero(prod, 64);

	// Temporary testing
	// strcpy(prod, bin_1);
	// strcat(prod, bin_2);

	for(int i = 31; i >= 0; i--)
		if(bin_2[i] == '1')
		{
			printf("Got 1 at %d\n", i);
			addBin(prod, prod, bin_1, 32, 32 - i);
		}

	printf("\nProduct = %s\n", prod);
	binToLong(prod);
	binToDouble(prod);
}