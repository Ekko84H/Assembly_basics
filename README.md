# Assembly basics
Assembly language is the closest a programmer can come to the processor. We use instructions with mainly 8 general purpose registers. 


# Compiling 

To compile the assembly code, we are using the NASM  compiler. Type the following commands in our terminal:

nasm -f elf64 -o [output_file].o [input_file].asm
this will generate an object file.

Next, we will be using the linker to link the object file and generate an executable:

ld -s -o [executable_file] [output_file ].o

then just run the executable using ./[executable_file]

# Errors faced and sol:

## syscalls

In our code , we are using "syscall' syntax instead of int  0x80 for syscall, so the syscall id and file descriptor  will also correspondingly change. Incorrect syscall id or file descriptor  will not give the desired output.

## Registers and its purpose
Initially had used the wrong registers for certain instructions resulting in wrong output. 
Make sure to understand the purpose of each register.
