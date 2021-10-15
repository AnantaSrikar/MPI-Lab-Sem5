# Lab_4
Consists of 3 files:
1. `matrix-add.nasm`: Program to add two 3x3 matrices.
2. `matrix-mul.nasm`: Program to multiply two 3x3 matrices.

## Explanation

### Compiling
All the code was written for `x86-64` CPU architecture, using `NASM`.

`libc` function calls were used to make I/O easier.

All the programs can built using makefiles.

1. `make` will generate the all the needed executables.
2. `make clean-temp` will remove the temporary files (`.o`), to focus on the main files
3. `make clean` removes ALL the generated files.

### 1. `matrix-add.nasm`
#### Input and Execution
Run the generated executable like this: `./matrix-add`

Input will be promped on execution.


#### Output
```
Enter Matrix A element (0, 0): 4
Enter Matrix A element (0, 1): 5
Enter Matrix A element (0, 2): 6
Enter Matrix A element (1, 0): 1
Enter Matrix A element (1, 1): 2
Enter Matrix A element (1, 2): 3
Enter Matrix A element (2, 0): 9
Enter Matrix A element (2, 1): 8
Enter Matrix A element (2, 2): 7


Enter Matrix B element (0, 0): 3
Enter Matrix B element (0, 1): 2
Enter Matrix B element (0, 2): 1
Enter Matrix B element (1, 0): 7
Enter Matrix B element (1, 1): 8
Enter Matrix B element (1, 2): 9
Enter Matrix B element (2, 0): 6
Enter Matrix B element (2, 1): 7
Enter Matrix B element (2, 2): 5


Matrix A:
'4' '5' '6' 
'1' '2' '3' 
'9' '8' '7' 

Matrix B:
'3' '2' '1' 
'7' '8' '9' 
'6' '7' '5' 

Matrix C:
'7' '7' '7' 
'8' '10' '12' 
'15' '15' '12' 
```


### 2. `matrix-mul.nasm`
#### Input and Execution
Run the generated executable like this: `./matrix-mul`

Input will be promped on execution.


#### Output
```
Enter Matrix A element (0, 0): 4
Enter Matrix A element (0, 1): 5
Enter Matrix A element (0, 2): 6
Enter Matrix A element (1, 0): 1
Enter Matrix A element (1, 1): 2
Enter Matrix A element (1, 2): 3
Enter Matrix A element (2, 0): 9
Enter Matrix A element (2, 1): 8
Enter Matrix A element (2, 2): 7


Enter Matrix B element (0, 0): 3
Enter Matrix B element (0, 1): 2
Enter Matrix B element (0, 2): 1
Enter Matrix B element (1, 0): 7
Enter Matrix B element (1, 1): 8
Enter Matrix B element (1, 2): 9
Enter Matrix B element (2, 0): 6
Enter Matrix B element (2, 1): 7
Enter Matrix B element (2, 2): 5


Matrix A:
'4' '5' '6' 
'1' '2' '3' 
'9' '8' '7' 

Matrix B:
'3' '2' '1' 
'7' '8' '9' 
'6' '7' '5' 

Matrix C:
'83' '90' '79' 
'35' '39' '34' 
'125' '131' '116'
```

## Notes
Since `libc` is used, the I/O was very flexible. Problems such as not being able to print a number with two digits, or negative values (and inputting the same) was resloved instantly.