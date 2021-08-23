/*
	Program to get all the command line arguments in any datatype needed.
	Useful in many programs.

	Author: Ananta Srikar
*/

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<ctype.h>

/*
	Dynamic return type according to requirements, when type is
	0 - char
	1 - int
	2 - float
	3 - double
*/
	
void *getCLargs(int type, int argc, char **argv)
{
	void *input_arr;

	switch(type)
	{
		case 0:
				input_arr = (char*)malloc((argc - 1) * sizeof(char));
				break;

		case 1:
				input_arr = (int*)malloc((argc - 1) * sizeof(int));
				break;
		
		case 2:
				input_arr = (float*)malloc((argc - 1) * sizeof(float));
				break;

		case 3:
				input_arr = (double*)malloc((argc - 1) * sizeof(double));
				break;

		default:
				printf("Invalid option entered for datatype! Try again.\n");
				exit(0);
	}

	for(int i = 1; i < argc; i++)
	{
		switch(type)
		{
			case 0:
					printf("Do the same thing for chars ez :)\n");
					break;

			case 1:
					int *temp_ptr = (int*)input_arr;
					for(int j = 0; j < strlen(argv[i]); j++)
						if(!isdigit(argv[i][j]) && argv[i][j] != '-')
						{
							printf("Please enter only numbers!\n");
							exit(0); // TODO: Change to exit(0)?
						}
					temp_ptr[i - 1] = atoi(argv[i]);
					break;

			case 2:
					printf("Do the same thing for float ez :)\n");
					break;

			case 3:
					printf("Do the same thing for double ez :)\n");
					break;

			default:
					printf("How did you even reach here?? Seriously!? Anyhow, invalid option entered for datatype, try again.\n");
					exit(0);
		}
	}
	return input_arr;
}