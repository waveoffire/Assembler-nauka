%include "io64.inc"

section .data
    lpCnt dq 30
    sum dq 0

section .text
    global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
     mov rcx, qword [lpCnt]
     mov rbx, 2
     mov r8,1
     
     sumLoop:
        mov rax,r8
        xor rdx,rdx
        div rbx
        cmp rdx,1
        jne skip 
        add qword [sum],r8
        
        skip:
        inc r8
        
         loop sumLoop
     
     
     
    
_end:
    mov rax,60
    mov rdi, 0
    syscall