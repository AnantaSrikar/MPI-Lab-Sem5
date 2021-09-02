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

	if(strlen(argv[2]) != 32 || strlen(argv[3]) != 32)
	{
		printf("%d %d\n", strlen(argv[2]), strlen(argv[3]));
		printf("Invalid binary input length, check and try again!\n");
		exit(0);
	}

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

void addBin(char *sum, char *bin_1, char *bin_2, int size, int offset, int max)
{
	int carry = 0;

	for(int i = size - 1; i >= 0; i--)
	{
		int index = (max > size) ? (max - size - offset) + i : i;
		
		if(!carry)
		{
			if(bin_1[index] == bin_2[i])
			{
				if(bin_1[index] == '1')
					carry = 1;
				
				sum[index] = '0';
			}

			else
				sum[index] = '1';
		}

		else
		{
			if(bin_1[index] == bin_2[i])
			{
				if(bin_1[index] == '0')
					carry = 0;

				sum[index] = '1';
			}

			else
				sum[index] = '0';
		}

		printf("sum = %s\n", sum);
	}
}

// Sets the string of binary characters to 0
void setZero(char bin_str[], int size)
{
	for(int i = 0; i < size; i++)
		bin_str[i] = '0';
}

// 32 Bits = 4 bytes = sizeof(int) | sizeof(float)
void add32Bit(char *bin_1, char *bin_2)
{
	char sum[32];

	addBin(sum, bin_1, bin_2, 32, 0, 0);

	printf("\nSum = %s\n", sum);
	binToInt(sum);
	binToFloat(sum);
}

// 32 Bits = 4 bytes = sizeof(int) | sizeof(float)
void multi32Bit(char *bin_1, char *bin_2)
{
	char prod[64];

	// Initialising the product to 0
	setZero(prod, 64);

	// Standard binary multiplication
	for(int i = 31; i >= 0; i--)
		if(bin_2[i] == '1')
		{
			printf("\n\nGot 1 at %d\n", i);
			addBin(prod, prod, bin_1, 32, 31 - i, 64);
		}

	printf("\nPrd = %s\n", prod);
	binToLong(prod);
	binToDouble(prod);
}