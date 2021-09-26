; Program to add 5 numbers

section .data
	prompt_txt db "Enter number: "
	final_txt db "Sum = %d"
	num_sum db 0

section .bss
	input resb 1
	; sum resb 1

section .text
	global main
	extern printf

main:
	
	call _printText
	call _getInput
	call _printInput

	call _addInput

	call _printText
	call _getInput
	call _printInput

	call _addInput

	call _checkFinal
	
	mov rax, 0
	ret

_getInput:
	mov rax, 0
	mov rdi, 0
	mov rsi, input
	mov rdx, 2
	syscall
	
	ret

_printInput:
	mov rax, 1
	mov rdi, 1
	mov rsi, input
	mov rdx, 2
	syscall

	ret

_printText:
	mov rax, 1
	mov rdi, 1
	mov rsi, prompt_txt
	mov rdx, 14
	syscall
	ret


_addInput:
	mov al, [input]
	sub al, 48
	add [num_sum], al
	ret

_checkFinal:
	push rbp
	mov rdi, final_txt
	mov rsi, [num_sum]
	mov rax, 0
	call printf
	pop rbp
	ret