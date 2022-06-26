%include "io64.inc"

section .data
    tab1  dq  40, 871, 181, 157, 268, 790, 310, 211
    lpCnt dq 8
    file_name db "1.txt", 0
section .bss
    tab2 resq 8
    tabw resb 6
    fd_in resb 1
    fd_out resb 1
section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    mov rsi, 0
    mov rcx, qword [lpCnt]
    
   stackLoop:  
   mov rbx, qword[tab1 +rsi *8]
   sub rbx, 10
   push rbx
   inc rsi 
   
   dec rcx
   cmp rcx, 0
   jne stackLoop
   
   
   
   
   mov rsi, 0
   mov rcx, qword [lpCnt]
   stackLoop2:  
   pop rax
    push rcx
    mov rdx, 0  
    mov rcx, 3    
    div rcx
    
   mov qword[tab2 +rsi *8],rax
   pop rcx
   inc rsi 
   
   dec rcx
   cmp rcx, 0
   jne stackLoop2
 
    
    
    
    mov rsi, 0
    mov rcx, qword [lpCnt]
    mov rdx,0
   stackLoop3:  
   mov rbx, qword[tab2 +rsi *8]
   cmp rbx, 255
   jae skip
     mov dword [tabw +rdx *4],ebx
     inc rdx
   skip:
   dec rcx
   inc rsi 
   cmp rcx, 0
   jne stackLoop3
 

    mov rax, 2
    mov rdi, file_name
    mov rsi,65 ;64 - o_create i o_wronly -1
    mov rdx, 0644o ; uprawnienia
    syscall
    mov r10,rax ; return funcji syscall jest w rax
        mov rax, 1
    mov rdi,r10
    mov rsi,tabw
    mov rdx, 24
    syscall
        mov rax, 3
    mov rdi ,r10
    syscall
 
_end:
    mov eax, 60
    mov rdi, 0
    syscall
    
    

