%include "io64.inc"
section .data
    file_name db "file.txt", 0
    msg db "To jest nowy plik tekstowy stworzony przez "
    len equ $-msg
    text1 db "Jak masz na imie?",0xA
    text1len equ $-text1
    
section .bss
    name resb 16
    fd_out resb 1
    fd_in resb 1
    text resb 64

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    call _printtext1
    call _getname
    call _createFile
    call _saveTextToFile
    call _closeFile
    call _openFile
    
    mov rax,0 ; sysread
    mov rdi, [fd_in]
    mov rsi,text
    mov rdx,64
    syscall
    
    mov rax,3
    mov rdi,[fd_in]
    syscall
    
    mov rax,1
    mov rdi,1
    mov rsi, text
    mov rdx, 64
    syscall
    


_end: 
    mov rax, 60
    mov rdi, 0
    syscall
    
_getname:
    mov rax,0
    mov rdi,0
    mov rsi, name
    mov rdx, 16
    syscall
    ret
_printtext1:
    mov rax,1
    mov rdi,1
    mov rsi, text1
    mov rdx, text1len
    syscall
    ret
    
 _createFile:
    

    mov rax, 2
    mov rdi, file_name
    mov rsi,65 ;64 - o_create i o_wronly -1
    mov rdx, 0644o ; uprawnienia
    syscall
    mov [fd_out],rax ; return funcji syscall jest w rax
    
_saveTextToFile:
    mov rax, 1
    mov rdi,[fd_out]
    mov rsi,msg
    mov rdx,len
    syscall
    
    mov rax, 1
    mov rdi,[fd_out]
    mov rsi,name
    mov rdx,16
    syscall
    
_closeFile:
    mov rax, 3
    mov rdi ,[fd_out]
    syscall
    
_openFile:
    mov rax, 2
    mov rdi, file_name
    mov rsi,0
    syscall
    mov [fd_in],rax