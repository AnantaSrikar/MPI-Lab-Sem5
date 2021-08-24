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
	double *input_arr = (double*)getCLargs(3, argc, argv);
	// End of command line argument processing

	// printBits(sizeof(i), &i);

	return(0);
}