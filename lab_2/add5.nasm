; Program to add 5 numbers
; Author: Srikar

section .data
	prompt_txt db "Enter num%d: ", 0
	final_txt db "Sum = %d", 0
	formatd db "%d", 0

section .bss
	input resd 1
	num_sum resb 1

section .text
	global main
	extern printf
	extern scanf

main:

	; Set sum variable to 0
	mov rax, 0 
	mov [num_sum], rax

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
	call _addToSum

	cmp ebx, 5
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

_addToSum:
	mov rax, [input]
	add [num_sum], rax
	ret

_printFinal:
	push rbp
	mov rdi, final_txt
	mov rsi, [num_sum]
	mov rax, 0
	call printf
	pop rbp
	ret