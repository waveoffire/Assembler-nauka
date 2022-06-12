%include "io64.inc"

section .data
    one dq 10
    two dq 20
    three dq 30

section .text
    global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    
    
    
    mov rax,qword[one]
    cmp rax,qword[two]
    
    jg skip
    mov rax,qword[two]
    
    
    skip:
    cmp rax, qword[three]
    jg skip2
    mov rax,qword[three]
    skip2:
    
    
_end:
    mov rax,60
    mov rdi, 0
    syscall