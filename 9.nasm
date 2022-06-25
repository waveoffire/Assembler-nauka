%include "io64.inc"
section .data
    file_name db "file.txt", 0
    msg db "To jest nowy plik",0xa
    len equ $-msg
    
section .bss
    fd_out resb 1
    fd_in resb 1
    text resb 32

section .text
global CMAIN
CMAIN:
    mov rax, 2
    mov rdi, file_name
    mov rsi,65 ;64 - o_create i o_wronly -1
    mov rdx, 0644o ; uprawnienia
    syscall
    
    mov [fd_out],rax ; return funcji syscall jest w rax
    mov rax, 1
    mov rdi,[fd_out]
    mov rsi,msg
    mov rdx,len
    syscall
    
    mov rax, 3
    mov rdi ,[fd_out]
    syscall
    
    mov rax, 2
    mov rdi, file_name
    mov rsi,0
    syscall
    mov [fd_in],rax
    
    mov rax,0 ; sysread
    mov rdi, [fd_in]
    mov rsi,text
    mov rdx,32
    syscall
    
    mov rax,3
    mov rdi,[fd_in]
    syscall
    
    mov rax,1
    mov rdi,1
    mov rsi, text
    mov rdx, 32
    syscall
    


_end: 
    mov rax, 60
    mov rdi, 0
    syscall