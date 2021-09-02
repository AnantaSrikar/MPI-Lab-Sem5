# Lab_1
Consists of 3 files and 1 directory:
1. `int_rep.c`: Program to print internal binary representation of data stored in primary datatypes (int, float, and double).
2. `add_multi_bin.c`: Program to add or multiply two 32 bit binary numbers.
3. `bcd.c`: Program to print the BCD representation of a decimal number and vice-versa
4. `convert\`: Directory containing `convert.c` for converting from one form to another. `convert.h` containing the prototypes for the functions declared in `convert.c`.

## Explanation

### Compiling
All the programs are built and compiled using makefiles.

1. `make` will generate the all the needed executables and assembly codes (`.s`).
2. `make clean-temp` will remove the temporary files (`.i` and `.o`), to focus on the main files
3. `make clean` removes ALL the generated files.

### 1. `int_rep.c`
#### Input and Execution
`./int_rep <choice> <number>`

`choice` can range from `0` - `2`, which maps as below:
1. Integer (32 bits or 4 bytes)
2. Float   (32 bits or 4 bytes)
3. Double  (64 bits or 8 bytes)

For example to see the integer representation of `-42069`, the command should be

`./int_rep 0 -42069`

#### Output
Output of the binary representation is printed on the screen.
```
Internal representation: 32 bits

11111111111111110101101110101011
```

#### Logic
` void printBits(int, void*)` (in `convert/conver.c`) is the main function here. The funtion converts each byte at a time and displays the output of all the bytes at a time.


### 2. `add_multi_bin.c`
#### Input and Execution
`./add_multi_bin <choice> <bin_1> <bin2>`
`choice` can be either:
1. `0` - adding the 32 bit numbers
2. `1` - Multipliying the 32 bit numbers

Example: `./add_multi_bin 0 00000000000000000000000001000000 01000001001000000000000000000000`

#### Output
Sum or product of the binary number, along with the decimal and floating point representation is printed.
```
Sum = 01000001001000000000000001000000
Integer: 1092616256
Float: 10.0000610
```
#### Logic
Main functions:
1. `void addBin(char*, char*, char*, int, int, int)`: Adds two given binary strings with offset and max length (modified for being used in binary multiplication)
`void add32Bit(char*, char*)`: To add two 32 bit binary strings. Outputs a 32 bit binary string. Uses `addBin()` for addition.
2. `void multi32Bit(char*, char*)`: To multiply two 32 bit binary strings. Outputs a 64 bit binary string. Uses `addBin()` repetitively (since multiplication is repeated addition).
3. `int`, `float`, `long` and `double` conversion from `convert/convert.c`.


### 3. `bcd.c`
#### Input and Execution
`./bcd <choice> <number>`

`choice` can be either
1. `0` - Decimal to BCD
2. `1` - BCD to decimal

Example: `./bcd 1 0010 0100 0110`

#### Output
The repective convesion would be the output
```
Decimal: 246
```

#### Logic
Functions mainly used:
1. `void printBCD(int)`: Recursive function to print the BCD representation of a decimal number.
2. `void decToBCD(int)`: Function from `convert/convert.c`. Prints BCD representation of a single digit.
3. `void printDec(int, char**)`: Prints the BCD to decimal representation.
4. `BCDtoDec(char*)`: Converts 4 bits of BCD to a decimal number.

### 4. `convert\`

This has no `main()` command. Contains a set of helper commands for converting from other forms to binary and vice-versa.

Set of functions include:

### int_rep.c
1. `void printBits(int, void*)`: Converts any simple data type to its respective binary representation. Converts one byte at a time for extracting the bits.

### add_multi_bin.c
2. `void binToInt(char*)`: Converts binary string of length 32 to `int` representation.
3.`void binToFloat(char*)`: Converts binary string of length 32 to `float` representation.
4.`void binToLong(char*)`: Converts binary string of length 64 to `long` representation.
5.`void binToDouble(char*)`: Converts binary string of length 64 to `double` representation.

### bcd.c
6.`void decToBCD(int)`: Converts a given digit of a decimal number to BCD.
7.`void BCDtoDec(char*)`: Converts a given digit of a BCD to decimal.