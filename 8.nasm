%include "io64.inc"
section .data
text1 db "jak masz na imie?",0xA
text1len equ $-text1
text2 db "czesc "
text2len equ $-text2
section .bss
name resb 16

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    call _printtext1
    call _getname
    call _printText2
    call _printname
    
_end: 
    mov rax, 60
    mov rdi, 0
    syscall

_printtext1:

    mov rax,1
    mov rdi,1
    mov rsi, text1
    mov rdx, text1len
    syscall
    ret
_getname:
    mov rax,0
    mov rdi,0
    mov rsi, name
    mov rdx, 16
    syscall
    ret
_printText2:
    mov rax,1
    mov rdi,1
    mov rsi, text2
    mov rdx, text2len
    syscall
    ret
_printname:
    mov rax,1
    mov rdi,1
    mov rsi, name
    mov rdx, 16
    syscall
    ret