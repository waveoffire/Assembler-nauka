%include "io64.inc"

section .data
    arr dq 3,5,9
    

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    mov rsi, 0
    mov rbx, qword[arr +rsi *8]
    inc rsi
    mov rax, qword[arr +rsi *8]
    add rax, rbx
    push rax
    inc rsi
    mov rax, qword[arr +rsi *8]
    pop rbx
    add rax,rbx
    
    
_end:
    mov eax, 60
    mov rdi, 0
    syscall