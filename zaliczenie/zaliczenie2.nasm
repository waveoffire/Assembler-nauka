
section .data
    file_name db "plik.txt", 0
    
section .bss
     fd_in resb 1
        text resb 64
section .text
global CMAIN


CMAIN:

    
    call _openFile

    
    mov rax,0 ; sysread
    mov rdi, [fd_in]
    mov rsi,text
    mov rdx,64
    syscall
    mov rax,1
    mov rdi,1
    mov rsi, text
    mov rdx, 64
    syscall

    xor rax, rax
    

    ret
    

_openFile:
    mov rax, 2
    mov rdi, file_name
    mov rsi,0
    syscall
    mov [fd_in],rax
    ret
    
    
_end:
    mov eax, 60
    mov rdi, 0
    syscall
    