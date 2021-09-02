/*
	Program to print the BCD representation of a decimal number and vice-versa

	Author: Ananta Srikar
*/

#include<stdio.h>
#include<stdlib.h>

// Function prototypes for conversion
#include "convert/convert.h"

// Funtion prototypes for printing
void printBCD(int);
void printDec(int, char**);

int main(int argc, char **argv)
{
	// TODO: Add error handling
	// Processing command line arguments
	int choice = atoi(argv[1]);

	// Doing the necessary according to user choice
	switch(choice)
	{
		case 0:
			{
				int num = atoi(argv[2]);
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
	// TODO: Check correct format of argv
	for(int i = 2; i < argc; i++)
		BCDtoDec(argv[i]);
}