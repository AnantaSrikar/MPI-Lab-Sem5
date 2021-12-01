; Testing malloc
; Author: Ananta Srikar

section .data
	ip_n_txt db "Enter the value of n: ", 0

	op_Nfact_txt db "%d! = %lu", 10, 0

	op_test db "%d", 10, 0

section .bss
	arr resq 1	; Pointer to the memory location

section .text
	global main
	extern printf
	extern malloc
	extern free

main:
	

	mov rdi, 40	; Allocates 20 bytes
	call malloc

	mov [arr], rax

	mov rbx, 0
	loop:
		mov [arr + 4*rbx], rbx
		inc rbx
		cmp rbx, 10
		jl loop

	mov rbx, 0
	loop2:
		movzx rcx, byte [arr + 4*rbx]
		call _printOP
		inc rbx
		cmp rbx, 10
		jl loop2

	; Safe exit the process
	mov rax, 0
	ret

; Prints output
_printOP:
	push rbp
	mov rdi, op_test
	mov rsi, rcx
	mov rax, 0
	call printf
	pop rbp
	ret