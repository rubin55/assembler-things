global _start


section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg


section .text

_start:
    mov     edx, msg.len    ; number of bytes to write
    mov     ecx, msg        ; move the mem address of our message into ecx
    mov     ebx, 1          ; We want to write to stdout
    mov     eax, 4          ; invoke SYS_WRITE (kernel opcode 4)
    int     80h             ; request an interrupt on libc

    mov     ebx, 0          ; return 0 status on exit - 'No Errors'
    mov     eax, 1          ; invoke SYS_EXIT (kernel opcode 1)
    int     80h             ; request an interrupt on libc
