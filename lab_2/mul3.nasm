; Program to multiply 3 numbers
; Author: Srikar

section .data
	prompt_txt db "Enter num%d: ", 0
	final_txt db "Product = %d", 0
	formatd db "%d", 0

section .bss
	input resd 1
	num_prod resb 1

section .text
	global main
	extern printf
	extern scanf

main:

	; Set prod variable to 1
	mov rax, 1
	mov [num_prod], rax

	; sub rsp, 8; Weird issue caused by scanf. Fix from here: https://stackoverflow.com/questions/51070716/glibc-scanf-segmentation-faults-when-called-from-a-function-that-doesnt-align-r

	mov ebx, 0

	call _IOiteration

	call _printFinal

	mov rax, 0
	ret

_IOiteration:
	add ebx, 1
	
	call _printPrompt
	call _getInput
	call _mulToProd

	cmp ebx, 3
	jnz _IOiteration
	
	ret

_printPrompt:
	push rbp
	mov rdi, prompt_txt
	mov rsi, rbx
	mov rax, 0
	call printf
	pop rbp

	ret

_getInput:
	push rbp
	mov rdi, formatd
	mov rsi, input
	call scanf
	pop rbp

	ret

_mulToProd:
	mov rax, [input]
	mov rcx, [num_prod]
	mul rcx
	mov [num_prod], rax
	ret

_printFinal:
	push rbp
	mov rdi, final_txt
	mov rsi, [num_prod]
	mov rax, 0
	call printf
	pop rbp
	ret