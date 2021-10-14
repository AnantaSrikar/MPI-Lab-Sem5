section .data
	prompt_txt_matrix db "Enter Matrix %c element (%d, %d): ", 0

	op_sl_txt db "0 ", 0
	op_nl_txt db 10, 0

	op_sl_element db "'%d' ", 0

	debug_R14_txt db 10, "R14 = %d", 10, 0

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

	call _InputA
	
	call _printMatrixA

	call _InputB

	call _printMatrixB

	mov rax, 0
	ret

; Subroutine to input A matrix
_InputA:
	mov r12, 0	; This will be like i
	mov r13, 0	; This will be like j

	inputROWA:
		mov r13, 0	; Setting var o run 3 times
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
	mov r12, 0
	mov r13, 0

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
	mov r12, 0
	mov r13, 0

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