section .bss
num1 resb 1
num2 resb 1
result resb 1
buffer1 resb 2
buffer2 resb 2

section .text
global _start

_start:
; read first number
mov eax, 0 
mov ebx, 0 
mov ecx, buffer1 
mov edx, 2 
syscall

; convert first number to integer
mov eax, [buffer1]  
sub eax, 48  
mov [num1], eax  

; read second number
mov eax, 0  
mov ebx, 0  
mov ecx, buffer2 
mov edx, 2  
syscall 

; convert second number to integer
mov eax, [buffer2]  
sub eax, 48
mov [num2], eax 

; add the two numbers
mov eax, [num1] 
add eax, [num2] 
mov [result], eax 

; write the result
mov eax, 1 
mov ebx, 1 
mov ecx, result 
mov edx, 1 
syscall

; exit the program
mov eax, 60 
xor ebx, ebx 
syscall
