/*
	Program to print the BCD representation of a decimal number and vice-versa

	Author: Ananta Srikar
*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

// Function prototypes for conversion
#include "convert/convert.h"

// Funtion prototypes for printing
void printBCD(int);
void printDec(int, char**);

int main(int argc, char **argv)
{
	// Processing command line arguments
	int choice = atoi(argv[1]);

	if(choice != 0 && choice != 1)
	{
		printf("Invalid choice entered. Please go through README.md\n");
		return -1;
	}

	if(choice == 0 && argc != 3)
	{
		printf("Incorrect number of arguments! Please go through README.md\n");
		return -1;
	}

	// Doing the necessary according to user choice
	switch(choice)
	{
		case 0:
			{
				int num = atoi(argv[2]);
				printf("BCD: ");
				printBCD(num);
				break;
			}

		case 1:
			{
				printDec(argc, argv);
				break;
			}

		default:
				printf("Invalid option entered for conversion. Check and try again.");
	}

	return(0);
}

// Recursive function to print the BCD representation
void printBCD(int num)
{
	if(num / 10 != 0)
		printBCD(num / 10);
	
	decToBCD(num % 10);
}

// Funtions to print decimal from BCD
void printDec(int argc, char **argv)
{
	// Checking the format of strings
	for(int i = 2; i < argc; i++)
	{
		if(strlen(argv[i]) != 4)
		{
			printf("Invalid arguments! Please go through README.md"); // BCD has only 4 digits
			exit(0);
		}

		for(int j = 0; j < 4; j++)
		{
			if(argv[i][j] != '1' && argv[i][j] != '0')
			{
				printf("Invalid characters entered! Please go through README.md"); // Nothing other than 1 and 0
				exit(0);
			}
		}
	}

	printf("Decimal: ");
	
	// Converting 4 binary bits at a time, BCD style
	for(int i = 2; i < argc; i++)
		BCDtoDec(argv[i]);
}