%include "io64.inc"

section .data
    arr1 dq 1,2,3,4,5
    arr2 dq 5,6,7,8,9
     
section .bss
    arr3 resq 5
    result resq 1

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
   mov rsi, 0
   
   mov rbx, qword[arr1 +rsi *8]
   mov rax, qword[arr2 +rsi *8]
   add rax,rbx
   mov qword[arr3 +rsi *8],rax
   push rax
   inc rsi 
   
   mov rbx, qword[arr1 +rsi *8]
   mov rax, qword[arr2 +rsi *8]
   add rax,rbx
   mov qword[arr3 +rsi *8],rax
   push rax
   inc rsi 
   
   mov rbx, qword[arr1 +rsi *8]
   mov rax, qword[arr2 +rsi *8]
   add rax,rbx
   mov qword[arr3 +rsi *8],rax
   push rax
   inc rsi 
   
   mov rbx, qword[arr1 +rsi *8]
   mov rax, qword[arr2 +rsi *8]
   add rax,rbx
   mov qword[arr3 +rsi *8],rax
   push rax
   inc rsi 
   
   mov rbx, qword[arr1 +rsi *8]
   mov rax, qword[arr2 +rsi *8]
   add rax,rbx
   mov qword[arr3 +rsi *8],rax
   push rax
   inc rsi 
   
   mov qword[result],0
   
   pop rbx
   add qword[result], rbx
   
   pop rbx
   add qword[result], rbx
   
   pop rbx
   add qword[result], rbx
   
   pop rbx
   add qword[result], rbx
   
   pop rbx
   add qword[result], rbx
   mov rax, [result]
_end:
    mov eax, 60
    mov rdi, 0
    syscall