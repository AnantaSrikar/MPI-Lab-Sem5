section .data
	prompt_txt_matrix db "Enter Matrix %c element (%d, %d): ", 0

	op_sl_txt db "0 ", 0
	op_nl_txt db 10

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


	mov rax, 0
	ret

_InputA:
	mov r12, 0	; This will be like i
	mov r13, 0	; This will be like j

	inputROW:
		mov r13, 0	; Setting var o run 3 times
		inputCOL:
			call _printINPpromtA
			call _getInput
			mov rcx, [num_input]
			mov [matrixA + 3*r12 + r13], rcx
		inc r13
		cmp r13, 3
		jl inputCOL
		
	inc r12
	cmp r12, 3
	jl inputROW
	ret

_printsl:
	push rbp
	mov rdi, op_sl_txt
	mov rax, 0
	call printf
	pop rbp
	ret

_printnl:
	push rbp
	mov rdi, op_nl_txt
	mov rax, 0
	call printf
	pop rbp
	ret

_printMatrix:
	mov r12, 0
	mov rbx, 0

	loop1:

		loop2:
			call _printsl
			inc rbx
		cmp rbx, 3
		jl loop2
	
	call _printnl

	inc r12
	cmp r12, 3
	mov rbx, 0
	jl loop1
	ret

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

_getInput:
	push rbp
	mov rdi, input_formatd
	mov rsi, num_input
	call scanf
	pop rbp

	ret