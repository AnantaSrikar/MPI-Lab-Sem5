/*
	Code to print binary representation of any datatype

	Author: Srikar
*/
#include<stdio.h>

#include "cl-args/cl-args.h"
#include "convert/convert.h"

int main(int argc, char **argv)
{
	// Processing command line arguments
	int size = argc - 1;
	int *input_arr = (int*)getCLargs(1, argc, argv);
	// End of command line argument processing

	for(int i = 0; i < size; i++)
		printf("%d\n", input_arr[i]);

	// printBits(sizeof(i), &i);

	return(0);
}