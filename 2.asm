%include "io64.inc"

section .data
    a dq 64
section .bss

section .text
    global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    mov rax, 6
    mov rbx, a
    mov rcx, [a]
    
_add:
    add rax, qword [a]
    add qword [a], rcx
    
_end:
    mov eax, 60
    mov rdi, 7
    syscall