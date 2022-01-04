; nasm -f macho64 hello.asm && ld -macosx_version_min 10.7.0 -lSystem -o hello hello.o && ./hello
; nasm -f elf_x86_64 hello.asm && ld  -o hello hello.o && ./hello

global _start


section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg


section .text

_start:
    mov     rax, 0x2000004 ; write
    mov     rdi, 1 ; stdout
    mov     rsi, msg
    mov     rdx, msg.len
    syscall

    mov     rax, 0x2000001 ; exit
    mov     rdi, 0
    syscall

