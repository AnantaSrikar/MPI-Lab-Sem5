; Program to check for hex numbers > 0, < 0, and = 0
; Author: Srikar

section .data
	prompt_txt db "Enter hex num%d: ", 0
	final_txt db "Less than 0 = %d", 10, "Equal to 0 = %d", 10, "Greater than 0 = %d", 10, 0

	formatd db "%x", 0

section .bss
	input resb 1

section .text
	global main
	extern printf
	extern scanf

main:

	; Setting our variables to 0
	mov rax, 0
	mov r12, rax	; Less than 0
	mov r13, rax	; Equal to 0
	mov r14, rax	; Greater than 0

	; sub rsp, 8; Weird issue caused by scanf. Fix from here: https://stackoverflow.com/questions/51070716/glibc-scanf-segmentation-faults-when-called-from-a-function-that-doesnt-align-r

	mov ebx, 0

	call _IOiteration

	call _printFinal

	; Safe termination of the process
	mov rax, 0
	ret

_IOiteration:
	add ebx, 1
	
	call _printPrompt
	call _getInput
	call _cmpZero

	loop_end:
	cmp ebx, 20	; Input 20 numbers
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

_cmpZero:
	mov al, [input]

	; Maybe this is nicer?
	; shr al	; shifts all bits right 1, lowest bit to carry flag

	cmp al, 0
	jl ltz
	jz ez
	jg gtz

	ltz:
	inc r12
	jmp end

	ez:
	inc r13
	jmp end

	gtz:
	inc r14
	jmp end

	end:

	call _printFinal
	ret

_printFinal:
	push rbp
	mov rdi, final_txt
	mov rsi, r12
	mov rdx, r13
	mov rcx, r14
	mov rax, 0
	call printf
	pop rbp
	ret