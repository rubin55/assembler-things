.globl _start


.data

msg:
    .ascii "Hello, world!\n"
    .len = . - msg


.text

_start:
    mov     x0, #1      /* fd := STDOUT_FILENO */
    ldr     x1, =msg    /* buf := msg */
    ldr     x2, =.len    /* count := .len */
    mov     w8, #64     /* write is syscall #64 */
    svc     #0          /* invoke syscall */

    mov     x0, #0      /* status := 0 */
    mov     w8, #93     /* exit is syscall #93 */
    svc     #0          /* invoke syscall */
