/*
	Note to self: Change this once you're done programming
	Author: Ananta Srikar
*/

#include<stdio.h>
#include<stdlib.h>

#include "convert/convert.h"

void printBCD(int);
void printDec(int, char**);

int main(int argc, char **argv)
{
	// TODO: Add error handling
	int choice = atoi(argv[1]);

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
				printf("Invalid option entered for conversion");
	}

	return(0);
}

void printBCD(int num)
{
	if(num / 10 != 0)
		printBCD(num / 10);
	
	decToBCD(num % 10);
}

void printDec(int argc, char **argv)
{
	// TODO: Check correct format of argv
	for(int i = 2; i < argc; i++)
		BCDtoDec(argv[i]);
}