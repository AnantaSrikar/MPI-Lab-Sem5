; Program to add 5 numbers

section .data
	prompt_txt db "Enter number: "
	num_sum db 0

section .bss
	input resb 1
	; sum resb 1

section .text
	global _start
	extern printf

_start:
	
	call _printText
	call _getInput
	call _printInput

	call _addInput

	call _printText
	call _getInput
	call _printInput

	call _addInput

	call _checkFinal
	
	; Exit the program
	mov rax, 60
	mov rdi, 0
	syscall

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
	mov rax, 1
	mov rdi, 1
	mov r9, [num_sum]
	add r9, 48
	mov [num_sum], r9
	mov rsi, num_sum
	mov rdx, 2
	syscall

	ret