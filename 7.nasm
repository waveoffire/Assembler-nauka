%include "io64.inc"
section .data
text db "hello world",0xA

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    mov rax, 1 ;write
    mov rdi, 1; stdout
    mov rsi, text
    mov rdx, 12
    syscall
    
_end: 
    mov rax, 60
    mov rdi, 0
    syscall
