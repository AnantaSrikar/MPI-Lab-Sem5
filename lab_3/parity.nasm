; Program to check the parity of a given hex number
; Author: Srikar

section .data
	prompt_txt db "Enter hex num%d: ", 0
	
	op_par_txt db "00", 10, 10, 0
	op_nopar_txt db "01", 10, 10, 0

	formatd db "%x", 0

section .bss
	input resb 1

section .text
	global main
	extern printf
	extern scanf

main:

	mov ebx, 0

	call _IOiteration

	; Safe termination of the process
	mov rax, 0
	ret

_IOiteration:
	add ebx, 1
	
	call _printPrompt
	call _getInput
	call _testParity

	loop_end:
	cmp ebx, 16	; Input 16 numbers

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

_testParity:
	mov cl, 0
	mov al, [input]

	add cl, al	; This will set the flags

	jp par		; Parity bit is 1
	jnp nopar	; Parity bit is 0

	par:
	call _printPar
	jmp end

	nopar:
	call _printNoPar

	end:
	ret

; Print when parity bit is 1
_printPar:
	push rbp
	mov rdi, op_par_txt
	mov rax, 0
	call printf
	pop rbp
	ret

; Print when parity bit is 0
_printNoPar:
	push rbp
	mov rdi, op_nopar_txt
	mov rax, 0
	call printf
	pop rbp
	ret