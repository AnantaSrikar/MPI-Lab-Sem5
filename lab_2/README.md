# Lab_2
Consists of 3 files:
1. `add5.nasm`: Program to add 5 given numbers.
2. `mul3.nasm`: Program to multiply 3 given numbers.
3. `series.nasm`: Program to find the sum of series 1 + x + x<sup>2</sup> + x<sup>3</sup> + ... + x<sup>n</sup>

## Explanation

### Compiling
All the code was written for `x86-64` CPU architecture, using `NASM`.

`libc` function calls were used to make I/O easier.

All the programs can built using makefiles.

1. `make` will generate the all the needed executables.
2. `make clean-temp` will remove the temporary files (`.o`), to focus on the main files
3. `make clean` removes ALL the generated files.

### 1. `add5.nasm`
#### Input and Execution
Run the generated executable like this: `./add5`

Input will be promped on execution.


#### Output
```
Enter num1: 4
Enter num2: 10
Enter num3: -11
Enter num4: 93
Enter num5: 69
Sum = 165 
```


### 2. `mul3.nasm`
#### Input and Execution
Run the generated executable like this: `./mul3`

Input will be promped on execution.

#### Output
```
Enter num1: 3
Enter num2: -2
Enter num3: 10
Product = -60 
```


### 3. `series.nasm`
#### Input and Execution
Run the generated executable like this: `./series`

Input will be promped on execution.

#### Output
```
Enter x: 2
Enter n: 3
Sum of series = 15
```

## Notes
Since `libc` is used, the I/O was very flexible. Problems such as not being able to print a number with two digits, or negative values (and inputting the same) was resloved instantly
