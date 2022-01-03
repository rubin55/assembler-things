; nasm -f macho64 hello.asm && ld -macosx_version_min 10.7.0 -lSystem -o hello hello.o && ./hello

global _start

section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg


section .text

_start:
    jmp hello1

hello1:
    mov     rax, 0x2000004 ; write
    mov     rdi, 1 ; stdout
    mov     rsi, msg
    mov     rdx, msg.len
    syscall

    mov     rax, 0x2000001 ; exit
    mov     rdi, 0
    syscall

hello2:
    mov     edx, msg.len    ; number of bytes to write
    mov     ecx, msg        ; move memory address of msg into ecx
    mov     ebx, 1          ; write to stdout file
    mov     eax, 4          ; invoke SYS_WRITE (kernel opcode 4)
    int     80h
