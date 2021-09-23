; Program to add 5 numbers

global _start

section .text

_start:
	mov rax, 10
	add rax, 5
	add rax, 15
	add rax, 21
	add rax, 25
	
	; End the program
	mov rax, 1
	int 0x80