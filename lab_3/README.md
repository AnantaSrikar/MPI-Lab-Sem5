# Lab_3
Consists of 3 files:
1. `even.nasm`: Program to count the number of
even numbers from a given series of 8-bit hexadecimal numbers.
2. `cmp.nasm`: Program to count the number of values > 0, < 0, and = 0.
3. `parity.nasm`: Program to find the parity of each entered number.

## Explanation

### Compiling
All the code was written for `x86-64` CPU architecture, using `NASM`.

`libc` function calls were used to make I/O easier.

All the programs can built using makefiles.

1. `make` will generate the all the needed executables.
2. `make clean-temp` will remove the temporary files (`.o`), to focus on the main files
3. `make clean` removes ALL the generated files.

### 1. `even.nasm`
#### Input and Execution
Run the generated executable like this: `./even`

Input will be promped on execution.


#### Output
```
Enter hex num1: 0x40
Enter hex num2: 0xff
Enter hex num3: 0x32
Enter hex num4: 0x00
Enter hex num5: 0x10
Enter hex num6: 0x11
Enter hex num7: 0x13
Enter hex num8: 0xab
Enter hex num9: 0xba
Enter hex num10: 0x1a
Even hex = 6
```


### 2. `cmp.nasm`
#### Input and Execution
Run the generated executable like this: `./cmp`

Input will be promped on execution.

#### Output
```
Enter hex num1: 0x40
Enter hex num2: 0xff
Enter hex num3: 0x32
Enter hex num4: 0x00
Enter hex num5: 0x10
Enter hex num6: 0x11
Enter hex num7: 0x13
Enter hex num8: 0xab
Enter hex num9: 0xba
Enter hex num10: 0x1a
Enter hex num11: 0x40
Enter hex num12: 0xff
Enter hex num13: 0x32
Enter hex num14: 0x00
Enter hex num15: 0x10
Enter hex num16: 0x11
Enter hex num17: 0x13
Enter hex num18: 0xab
Enter hex num19: 0xba
Enter hex num20: 0x1a
Less than 0 = 6
Equal to 0 = 2
Greater than 0 = 12
```


### 3. `parity.nasm`
#### Input and Execution
Run the generated executable like this: `./series`

Input will be promped on execution.

#### Output
```
Enter hex num1: 0xab
01

Enter hex num2: 0xff
00

Enter hex num3: 0x1a
01

Enter hex num4: 0x04
01

Enter hex num5: 0x03
00

Enter hex num6: 0x01
01

Enter hex num7: 0x02
01

Enter hex num8: 0xaa
00

Enter hex num9: 0x2a
01

Enter hex num10: 0xbc
01

Enter hex num11: 0xcd
01

Enter hex num12: 0xad
01

Enter hex num13: 0x9a
00

Enter hex num14: 0x5c
00

Enter hex num15: 0x6a
00

Enter hex num16: 0x5b
01
```

## Notes
Since `libc` is used, the I/O was very flexible. Problems such as not being able to print a number with two digits, or negative values (and inputting the same) was resloved instantly.