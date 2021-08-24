/*
	Code to print internal binary representation of data stored in primarydatatypes (int, float, and double).

	Author: Ananta Srikar
*/
#include<stdio.h>
#include<stdlib.h>

#include "convert/convert.h"

int main(int argc, char **argv)
{
	int datatype_sizes[3] = {sizeof(int), sizeof(float), sizeof(double)};
	// Processing command line arguments

	int choice = atoi(argv[1]);

	if(!(choice >= 0 || choice < 3))
	{
		printf("Invalid option entered for datatype, check and try again! \n");
		exit(0);
	}

	int size = datatype_sizes[choice];

	void *data = malloc(size);

	/*
		Tried optimising it and failed: https://stackoverflow.com/questions/2834139/declaring-a-data-type-dynamically-in-c
		P.S. - Rewriting the same code multiple times is a very bad practice
		Use Templates if C++ is being used
	*/

	switch(choice)
	{
		case 0:
			{
				int* temp_ptr = (int*)data;
				*temp_ptr = atoi(argv[2]);
				break;
			}

		case 1:
			{
				float* temp_ptr = (float*)data;
				*temp_ptr = atof(argv[2]);
				break;
			}

		case 2:
			{
				double* temp_ptr = (double*)data;
				*temp_ptr = atof(argv[2]);
				break;
			}

		default:
				printf("Invalid option entered for datatype, check and try again! \n");
				exit(0);
	}
	
	// End of command line argument processing

	printf("Internal representation:\n\n");
	printBits(size, data);

	return(0);
}