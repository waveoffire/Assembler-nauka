%include "io64.inc"

section .data
    q1 dq 4200
    q2 dq 680
    q3 dq 521
    ans dq 0
    
section .bss

section .text
    global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    mov rax, qword [q1]
    add rax, qword [q3]
    mov qword [ans], rax
    
    mov qword [ans], qword q2
    sub qword [ans], qword q3
    
    mov qword [ans], qword q3
    add qword [ans], qword q2
    
    mov qword [ans], qword q1
    sub qword [ans], qword q3
    
_end:
    mov eax, 60
    mov rdi, 7
    syscall