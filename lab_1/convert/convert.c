/*
	Code for all the conversions for lab_1

	Author: Ananta Srikar
*/

#include<stdio.h>
#include<math.h>

// Prints the bits of almost any given datatype
void printBits(const int size, void const * const ptr)
{
	// unsigned char occupies one byte, array of bytes
	unsigned char *b = (unsigned char*)ptr;

	// Printing each byte
	for(int i = size - 1; i >= 0; i--)
		for(int j = 7; j >= 0; j--)
			printf("%u", (b[i] >> j) & 1);
}

// Print BCD form of a decimal number
void decToBCD(int num)
{
	unsigned char b = num;
	
	// Printing only 4 bits because BCD
	for(int j = 3; j >= 0; j--)
		printf("%u", (b >> j) & 1);
	
	printf(" ");
}

// Print decimal form of BCD
void BCDtoDec(char *bin_str)
{
	int sum = 0;

	for(int i = 0; i < 4; i++)
		sum += pow(2, (3 - i)) * (bin_str[i] - '0');

	printf("%d", sum);
}

// Convert 32 bit / 4 byte binary to Integer
void binToInt(char *bin_str)
{
	int num = 0, power = pow(2, 30);
	
	for(int i = 0; i < 32; i++)
	{
		if(i == 0)
			if(bin_str[i] != '0')
				num = -1 * power;
			else
				continue;
		else
			num += power * (bin_str[i] - '0');
		
		power /= 2;
	}
	
	printf("%d", num);
}

// Convert 32 bit / 4 byte binary to Float using IEEE-754 Standards
/*
	0 : Sign
	1 - 8: Biased Exponent
	9 - 31: Fraction
*/
void binToFloat(char *bin_str)
{
	float num = 0;
	float power = 0.5;
	
	// First let's handle the Mantissa / Fraction
	for(int i = 9; i < 32; i++)
	{
		num += power * (bin_str[i] - '0');
		power /= 2;
	}

	// Now the exponent part
	// TODO: Fix Biased exponent thing
	for(int i = 1; i < 9; i++)
	{
		printf("Time to get this working: %c\n", bin_str[i]);
	}

	// Sign
	if(bin_str[0] == '1')
		num *= -1;
}

// Converts 64 bit / 8 byte to long
void binToLong(char *bin_str)
{
	long num = 0, power = pow(2, 62);
	
	for(int i = 0; i < 64; i++)
	{
		if(i == 0)
			if(bin_str[i] != '0')
				num = -1 * power;
			else
				continue;
		else
			num += power * (bin_str[i] - '0');
		
		power /= 2;
	}
	
	printf("%ld", num);
}

// Converts 64 bit / 8 byte binary to double using IEEE-754 Standards
/*
	0 : Sign
	1 - 11: Biased Exponent
	12 - 63: Fraction
*/
void binToDouble(char *bin_str)
{
	double num = 0;
	double power = 0.5;
	
	// First let's handle the Mantissa / Fraction
	for(int i = 12; i < 64; i++)
	{
		num += power * (bin_str[i] - '0');
		power /= 2;
	}

	// Now the exponent part
	// TODO: Fix Biased exponent thing
	for(int i = 1; i < 12; i++)
	{
		printf("Time to get this working: %c\n", bin_str[i]);
	}

	// Sign
	if(bin_str[0] == '1')
		num *= -1;

	printf("%lf", num);
}