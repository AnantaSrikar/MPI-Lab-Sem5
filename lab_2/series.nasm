; Program to find the sum of the series 1 + x + x^2 + ... + x^n
; Author: Srikar

section .data
	prompt_txt1 db "Enter x: ", 0
	prompt_txt2 db "Enter n: ", 0

	promt_txt_err db "Values don't fit in range!", 10

	final_txt db "Sum of series = %d", 10, 0

	debug_rbx_txt db "RBX = %d", 10, 0
	debug_r12_txt db "R12 = %d", 10, 0
	debug_exp_txt db "EXP = %d", 10, 0
	
	formatd db "%d", 0

section .bss
	x resd 1
	n resd 1
	exp resd 1
	prod_sum resd 1

section .text
	global main
	extern printf
	extern scanf

main:
	; TODO: Check for x and n > 0

	; Set prod_sum variable to 0
	mov rax, 0
	mov [prod_sum], rax

	sub rsp, 8; Weird issue caused by scanf. Fix from here: https://stackoverflow.com/questions/51070716/glibc-scanf-segmentation-faults-when-called-from-a-function-that-doesnt-align-r

	; Asking for x and n values
	call _printPrompt1
	call _getX

	call _printPrompt2
	call _getN
	
	add rsp, 8 ; Restoring the stack pointer

	; run a loop for N + 1 times
	mov ebx, 0

	call _addLoop

	call _printFinal

	mov rax, 0
	ret

; Loop to run n + 1 number of times
_addLoop:
	inc ebx

	mov rax, 1
	mov [exp], rax

	mov r12, 0
	call _calcExp

	call _printRBX
	call _printEXP

	mov rax, [exp]
	add [prod_sum], rax


	cmp ebx, [n]
	jnz _addLoop
	
	ret

_printPrompt1:
	push rbp
	mov rdi, prompt_txt1
	mov rsi, rbx
	mov rax, 0
	call printf
	pop rbp

	ret

_printPrompt2:
	push rbp
	mov rdi, prompt_txt2
	mov rsi, rbx
	mov rax, 0
	call printf
	pop rbp

	ret

_getX:
	push rbp
	mov rdi, formatd
	mov rsi, x
	call scanf
	pop rbp

	ret

_getN:
	push rbp
	mov rdi, formatd
	mov rsi, n
	call scanf
	pop rbp

	ret

; Using r12 to prevent interfering with outer loop
_calcExp:

	add r12, 1

	mov rax, [exp]
	mov rcx, [x]
	mul rcx
	mov [exp], rax

	cmp r12, rbx
	jnz _calcExp

	ret

_printFinal:
	push rbp
	mov rdi, final_txt
	mov rsi, [prod_sum]
	mov rax, 0
	call printf
	pop rbp
	ret

_printRBX:
	push rbp
	mov rdi, debug_rbx_txt
	mov rsi, rbx
	mov rax, 0
	call printf
	pop rbp
	ret


_printR12:
	push rbp
	mov rdi, debug_r12_txt
	mov rsi, r12
	mov rax, 0
	call printf
	pop rbp
	ret

_printEXP:
	push rbp
	mov rdi, debug_exp_txt
	mov rsi, [exp]
	mov rax, 0
	call printf
	pop rbp
	ret