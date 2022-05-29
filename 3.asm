%include "io64.inc"

section .data
    arr dd 5,7,9,11,13
    
section .bss
    el resb 4
    


section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;write your code here
    mov rsi, 2
    mov eax, dword [arr+rsi*4]
    mov dword [el], eax
    
_end:
    mov eax, 60
    mov rdi, 0
    syscall