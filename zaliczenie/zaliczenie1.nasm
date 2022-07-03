%include "io64.inc"

section .data
    tab1	dq	8, 4, 3, 10, 9, 1, 6, 11, 2, 7 
    lpCnt dq 10
section .bss
    sum resq 1  
            
section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    mov rsi, 0
    mov qword[sum],0
    mov rcx, qword [lpCnt]
    
    
     ChkLoop:  
    mov rbx, qword[tab1 +rsi *8]
  
    cmp rbx,4
    jb skip1
    cmp rbx,9
    ja skip1
    
    
    add qword[sum],rbx
    
   
   
   skip1:
   inc rsi 
   
   dec rcx
   cmp rcx, 0
   
   jne ChkLoop
   

    
    
    
    ;write your code here
    xor rax, rax
    ret
    
_end:
    mov eax, 60
    mov rdi, 0
    syscall
    