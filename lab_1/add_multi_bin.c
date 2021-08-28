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

// 32 Bits = 4 bytes = sizeof(int) | sizeof(float)
void add32Bit(char *bin_1, char *bin_2)
{
	char sum[32];
	int carry = 0;

	for(int i = 3; i >= 0; i--)
		for(int j = 7; j >= 0; j--)
		{
			int index = (8 * i) + j;

			if(!carry)
			{
				if(bin_1[index] == bin_2[index])
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
				if(bin_1[index] == bin_2[index])
				{
					if(bin_1[index] == '0')
						carry = 0;

					sum[index] = '1';
				}

				else
					sum[index] = '0';
			}
		}
	binToInt(sum);
	// binToFloat(sum);
}

// 32 Bits = 4 bytes = sizeof(int) | sizeof(float)
void multi32Bit(char *bin_1, char *bin_2)
{
	char prod[64];

	// Temporary testing
	strcpy(prod, bin_1);
	strcat(prod, bin_2);

	// for(int i = 31; i >= 0; i++)
		// Loop through the array, multiply and add off
	
	// printf("\nBinary: %s\nstrlen: %d\n", prod, strlen(prod));

	binToLong(prod);
	// binToDouble(prod);
}