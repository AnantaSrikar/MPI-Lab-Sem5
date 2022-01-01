; Program to sort an array of numbers using selection sort algorithm
; Author: Srikar

section .data
	prompt_txt_num_elements db "Enter the number of elements: ", 0
	prompt_txt_element db "Enter arr[%d]: ", 0

	op_arr_info db 10, "Sorted elements:", 10, 0
	op_arr_ele db "%d ", 0

	input_format db "%d"

section .bss
	input resd 1	; To store user input temporarily
	arr_size resd 1	; To store array size
	arr resq 1		; To store array pointer


section .text
	global main
	extern printf
	extern scanf
	extern malloc

main:

	; Input the array size
	call _getInputArrSizePrompt

	call _allocateArrMem

	; For testing, give numbers 0 - n
	call _getInputArray

	; Sort the array using selection sort
	call _selSort

	; Print the array
	call _printArray

	mov rax, 0
	ret

; Subroutine to accept user input for array size
_getInputArrSizePrompt:
	call _printIPprompt
	call _getInputArrSize
	ret
	
_getInputArrSize:
	push rbp
	mov rdi, input_format
	mov rsi, arr_size
	call scanf
	pop rbp

	ret

_allocateArrMem:
	movzx r12, byte [arr_size]
	mov rax, r12
	mov r12, 4	; Size of int is 4 bytes
	mul r12
	mov r12, rax
	
	push rbp
	mov rdi, r12
	call malloc
	mov [arr], rax
	pop rbp

	ret

_printElementPromt:
	push rbp
	mov rdi, prompt_txt_element
	mov rsi, r12
	mov rax, 0
	call printf
	pop rbp
	ret
	

_getArrayElement:
	push rbp
	mov rdi, input_format
	mov rsi, input
	call scanf
	pop rbp
	ret

_getInputArray:
	mov r12, 0
	movzx r13, byte [arr_size]

	inp_loop:
		call _printElementPromt
		call _getArrayElement
		movzx rax, byte [input]
		mov [arr + 4 * r12], rax
	inc r12
	cmp r12, r13
	jl inp_loop

	ret

; Subroutine to execute the selection sort
_selSort:
	mov r12, 0	; This will be i
	mov r13, 0	; This will be j
	mov r14, 0	; This will be min_idx
	movzx r15, byte [arr_size]	; To store the array size
	dec r15

	sort1:

		; Finding the minimum element
		mov r14, r12
		mov r13, r12
		inc r13

		sort2:
			mov eax, DWORD [arr + r13 * 4]
			mov ebx, DWORD [arr + r14 * 4]
			cmp eax, ebx
			jge s2end
			mov r14, r13
			s2end:
		inc r13
		cmp r13, r15
		jl sort2

		; Swap the min element with first element
		mov eax, DWORD [arr + r14 * 4]
		mov ebx, DWORD [arr + r12 * 4]

		mov ecx, eax
		mov eax, ebx
		mov ebx, ecx

		mov DWORD [arr + r14 * 4], eax
		mov DWORD [arr + r12 * 4], ebx

	inc r12
	cmp r12, r15
	jl sort1

	ret

_printIPprompt:
	push rbp
	mov rdi, prompt_txt_num_elements
	mov rax, 0
	call printf
	pop rbp
	ret

_printOPprompt:
	push rbp
	mov rdi, op_arr_info
	mov rax, 0
	call printf
	pop rbp
	ret


_printArrayElement:
	movzx rcx, byte [arr + 4 * r12]

	push rbp
	mov rdi, op_arr_ele
	mov rsi, rcx
	mov rax, 0
	call printf
	pop rbp
	ret

_printArrayElements:
	mov r12, 0
	movzx r13, byte [arr_size]

	op_loop:
		call _printArrayElement
		inc r12
	cmp r12, r13
	jl op_loop

	ret

_printArray:
	call _printOPprompt
	call _printArrayElements
	ret