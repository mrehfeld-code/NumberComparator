%include "src/includes.asm"

section .data
    welcome_text:    db "Welcome!", 10, "The following program is going to ask you for two numbers. After you entered the numbers it's going to decide wich one is bigger or if they're equal.", 10, "Have fun!", 10, 10, 0
    goodbye_text:    db 10, "Copyright (c) 2023 by mrehfeld-code <m.rehfeld.web@gmx.net>", 10, "Bye!", 10, 0
    error_text:      db "There was an error!", 10, 0

    in_fmt1:         db "Please enter the first number:  ", 0
    in_fmt2:         db "Please enter the second number: ", 0

    out_fmt_less:    db "The first number (%d) is smaller than the second (%d).", 10, 0
    out_fmt_equal:   db "The first number (%d) is equal to the second (%d).", 10, 0
    out_fmt_greater: db "The first number (%d) is greater than the second (%d).", 10, 0

section .bss
    num1: resb 4
    num2: resb 4

section .text
    global main

main:
    push dword welcome_text
    call printf 

    push dword in_fmt1
    call printf
    push dword 63
    call read_int
    mov [num1], ax

    push dword in_fmt2
    call printf
    push dword 63
	call read_int
	mov [num2], ax

	mov ax, [num1]
	mov bx, [num2]

    cmp  ax, bx
    jl   is_less
    je   is_equal
    jg   is_greater

	is_less:
	    push dword [num2]
	    push dword [num1]
	    push dword out_fmt_less
	    call printf
	    jmp  done

	is_equal:
	    push dword [num2]
	    push dword [num1]
	    push dword out_fmt_equal
	    call printf
	    jmp  done

	is_greater:
	    push dword [num2]
	    push dword [num1]
	    push dword out_fmt_greater
	    call printf
	    jmp  done

	done:
	    push dword goodbye_text
	    call printf

	    push dword 0
	    call exit
	    ret

	error:
	    push dword error_text
	    call printf

	    push dword 1
	    call exit
	    ret
