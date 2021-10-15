; Program to multiply two 3x3 matrices
; Author: Srikar

section .data
	prompt_txt_matrix db "Enter Matrix %c element (%d, %d): ", 0

	op_nl_txt db 10, 0	; New line character
	op_sl_element db "'%d' ", 0
	op_matrix_info db "Matrix %c:", 10, 0

	input_formatd db "%d"

section .bss
	matrixA resd 3*3
	matrixB resd 3*3
	matrixC resd 3*3

	num_input resd 1

section .text
	global main
	extern printf
	extern scanf

main:

	; Input the matrices
	call _InputA
	call _printnl
	call _printnl
	call _InputB

	; Add the matrices
	call _mulMatrices

	; Print the matrices
	call _printMatrixA
	call _printMatrixB

	call _printMatrixC

	mov rax, 0
	ret

; Subroutine to input A matrix
_InputA:
	mov r12, 0	; This will be like i
	mov r13, 0	; This will be like j

	inputROWA:
		mov r13, 0	; Setting var to run 3 times
		inputCOLA:
			call _printINPpromtA
			call _getInput
			mov rcx, [num_input]

			mov rax, 3
			mul r12
			mov r14, rax

			mov [matrixA + r14 + r13], rcx
		inc r13
		cmp r13, 3
		jl inputCOLA
		
	inc r12
	cmp r12, 3
	jl inputROWA
	ret

; Subroutine to print matrix A
_printMatrixA:
	mov r12, 0	; i
	mov r13, 0	; j

	mov r15, "A"
	call _printMatrixOP	; Info on OP

	loop1A:

		mov r13, 0

		loop2A:
			call _printMatrixACell
		inc r13
		cmp r13, 3
		jl loop2A
	
		call _printnl

	inc r12
	cmp r12, 3
	jl loop1A

	call _printnl

	ret

; Print a  given cell in matrix A
_printMatrixACell:
	mov rax, 3
	mul r12
	mov r14, rax	; NASM not allowing it during dereferencing

	movzx rcx, byte [matrixA + r14 + r13]

	push rbp
	mov rdi, op_sl_element
	mov rsi, rcx
	mov rax, 0
	call printf
	pop rbp
	ret

; Input prompt for A
_printINPpromtA:
	push rbp
	mov rdi, prompt_txt_matrix
	mov rsi, "A"
	mov rdx, r12	; i
	mov rcx, r13	; j
	mov rax, 0
	call printf
	pop rbp
	ret

; Subroutine to input B matrix
_InputB:
	mov r12, 0	; This will be like i
	mov r13, 0	; This will be like j

	inputROWB:
		mov r13, 0	; Setting var o run 3 times
		inputCOLB:
			call _printINPpromtB
			call _getInput
			mov rcx, [num_input]

			mov rax, 3
			mul r12
			mov r14, rax

			mov [matrixB + r14 + r13], rcx
		inc r13
		cmp r13, 3
		jl inputCOLB
		
	inc r12
	cmp r12, 3
	jl inputROWB
	ret

; Subroutine to print matrix B
_printMatrixB:
	mov r12, 0	; i
	mov r13, 0	; j

	mov r15, "B"
	call _printMatrixOP	; Info on OP

	loop1B:

		mov r13, 0

		loop2B:
			call _printMatrixBCell
		inc r13
		cmp r13, 3
		jl loop2B
	
		call _printnl

	inc r12
	cmp r12, 3
	jl loop1B

	call _printnl

	ret

; Print a  given cell in matrix B
_printMatrixBCell:
	mov rax, 3
	mul r12
	mov r14, rax	; NASM not allowing it during dereferencing

	movzx rcx, byte [matrixB + r14 + r13]

	push rbp
	mov rdi, op_sl_element
	mov rsi, rcx
	mov rax, 0
	call printf
	pop rbp
	ret

; Input prompt for B
_printINPpromtB:
	push rbp
	mov rdi, prompt_txt_matrix
	mov rsi, "B"
	mov rdx, r12	; i
	mov rcx, r13	; j
	mov rax, 0
	call printf
	pop rbp
	ret

; Subroutine to print matrix C
_printMatrixC:
	mov r12, 0	; i
	mov r13, 0	; j

	mov r15, "C"
	call _printMatrixOP	; Info on OP

	loop1C:

		mov r13, 0

		loop2C:
			call _printMatrixCCell
		inc r13
		cmp r13, 3
		jl loop2C
	
		call _printnl

	inc r12
	cmp r12, 3
	jl loop1C

	ret

; Print a  given cell in matrix C
_printMatrixCCell:
	mov rax, 3
	mul r12
	mov r14, rax	; NASM not allowing it during dereferencing

	movzx rcx, byte [matrixC + r14 + r13]

	push rbp
	mov rdi, op_sl_element
	mov rsi, rcx
	mov rax, 0
	call printf
	pop rbp
	ret

; To simple print a new line, nothing more :)
_printnl:
	push rbp
	mov rdi, op_nl_txt
	mov rax, 0
	call printf
	pop rbp
	ret

; Subroutine to copy user input into a variable
_getInput:
	push rbp
	mov rdi, input_formatd
	mov rsi, num_input
	call scanf
	pop rbp
	ret

; TODO: Initialize C to zero to prevent junk values

; Subroutine to multiply the matrices
_mulMatrices:
	mov r12, 0	; i
	mov r13, 0	; j
	mov r14, 0	; k

	call _printnl
	call _printnl

	loop1MUL:

		mov r13, 0

		loop2MUL:
			
			mov r14, 0

			loop3MUL:

				; For A[i][k]
				mov rax, 3
				mul r12
				mov r15, rax	; NASM not allowing it during dereferencing

				; For B[k][j]
				mov rax, 3
				mul r14
				mov r8, rax

				; Implementing C[i][j] = A[i][k] * B[k][j]

				movzx rax, byte [matrixA + r15 + r14]
				movzx rbx, byte [matrixB + r8 + r13]
				mul rbx	; Add the individual cells, simple matrix addition
				add [matrixC + r15 + r13], rax	; Add the prod to its respective cell

			inc r14
			cmp r14, 3
			jl loop3MUL

		inc r13
		cmp r13, 3
		jl loop2MUL

	inc r12
	cmp r12, 3
	jl loop1MUL

	ret

; Prints text for making output informative
_printMatrixOP:
	push rbp
	mov rdi, op_matrix_info
	mov rsi, r15
	mov rax, 0
	call printf
	pop rbp
	ret