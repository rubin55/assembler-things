How to assemble, link and run:

    nasm -f elf64 hello.asm -o hello.o
    ld -s -o hello hello.o
    ./hello
