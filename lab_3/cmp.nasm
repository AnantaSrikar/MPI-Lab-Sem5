; Program to check for hec numbers > 0, < 0, and = 0
; Author: Srikar

section .data
	prompt_txt db "Enter hex num%d: ", 0
	final_txt db "Even hex = %d", 0

	formatd db "%x", 0

section .bss
	input resb 1
	num_lz resb 1
	num_ez resb 1
	num_gz resb 1

section .text
	global main
	extern printf
	extern scanf

main:

	; Setting our variables to 0
	mov rax, 0
	mov [num_lz], rax
	mov [num_ez], rax
	mov [num_gz], rax

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
	call _cmpZero

	loop_end:
	cmp ebx, 10
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
	mov rax, [input]

	cmp rax, 0
	jl ltz
	jz ez
	jg gtz

	ltz:
	mov rax, [num_lz]
	inc rax
	mov [num_lz], rax
	jmp end

	ez:
	mov rax, [num_ez]
	inc rax
	mov [num_ez], rax
	jmp end

	gtz:
	mov rax, [num_gz]
	inc rax
	mov [num_gz], rax
	jmp end

	end:
	ret

_printFinal:
	push rbp
	mov rdi, final_txt
	mov rsi, [num_ez]
	mov rax, 0
	call printf
	pop rbp
	ret