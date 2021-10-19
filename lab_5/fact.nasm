; Program to find the factorial of a number
; Author: Srikar

section .data
	ip_n_txt db "Enter the value of n: ", 0

	op_Nfact_txt db "%d! = %lu", 10, 0

	input_formatd db "%d"

section .bss

	num_input resd 1	; Variable to store user input

section .text
	global main
	extern printf
	extern scanf

main:

	; Input n
	call _printINPpromt

	; calculate the factorial
	call _findNfact

	; Print the output
	call _printOP

	mov rax, 0
	ret

; Input prompt for n
_printINPpromt:
	push rbp
	mov rdi, ip_n_txt
	mov rax, 0
	call printf
	pop rbp

	call _getInput

	ret

; Subroutine to copy user input into a variable
_getInput:
	push rbp
	mov rdi, input_formatd
	mov rsi, num_input
	call scanf
	pop rbp
	ret

; Subroutine to find the factorial of n
_findNfact:
	mov rax, 1	; This will store N!
	movzx r12, byte [num_input]

	loop:
		mul r12
	dec r12
	cmp r12, 0
	jg loop

	mov r13, rax	; This will store the value of N1 factorial since rax will be clearted across functions

	ret

; Prints output
_printOP:
	push rbp
	mov rdi, op_Nfact_txt
	mov rsi, [num_input]	; N
	mov rdx, r13			; N!
	mov rax, 0
	call printf
	pop rbp
	ret