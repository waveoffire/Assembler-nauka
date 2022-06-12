%include "io64.inc"
section .data
    lpCnt   dq  15
    sum     dq  0

section .text
    global CMAIN

CMAIN:
    mov rcx, qword [lpCnt]
    mov rax, 1
  sumLoop:
    add qword [sum], rax
    add rax, 2
    dec rcx
    cmp rcx, 0
    jne sumLoop

_end:
    mov rax, 60
    mov rdi, 0
    syscall