section .data
    input db 0
    prime db "The number is prime.", 0
    notPrime db "The number is not prime.", 0

section .bss
    counter resq 1

section .text
    global _start

_start:
    ; read the input number
    mov rax, 0       
    mov rdi, 0      
    mov rsi, input  
    mov rdx, 1      
    syscall

    ; convert the input number to integer
    mov rax, [input]
    sub rax, 48     
    mov [counter], rax

    ; loop through the numbers from 2 to input-1 to check for divisibility
    mov rbx, 2      ; start from 2
loop:
    cmp rbx, [counter]   ; compare the counter with input number
    jge endloop          ; exit the loop if counter is equal or greater than input number

    mov rax, [counter]
    cqo                 ; zero out rdx
    div rbx             ; divide the input number by counter
    cmp rdx, 0          ; check if there is any remainder
    je notPrimeLabel    ; if there is a remainder, the number is not prime

    ; increment the counter
    add rbx, 1
    jmp loop

notPrimeLabel:
    ; print "The number is not prime."
    mov rax, 1      
    mov rdi, 1      
    mov rsi, notPrime   
    mov rdx, 23     
    syscall
    jmp exit

endloop:
; print "The number is prime."
mov rax, 1 
mov rdi, 1 
mov rsi, prime 
mov rdx, 19 
syscall
jmp exit

exit:
    ; exit the program
    mov rax, 60     
    xor rdi, rdi    
    syscall

