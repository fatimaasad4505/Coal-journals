include 'emu8086.inc'
org 100h

product MACRO
    LOCAL two_digit, done

    mov al, bl
    mul cl         

    mov ah, 0
    cmp al, 9
    jg two_digit

    mov dl, al
    add dl, 48
    mov ah, 2
    int 21h
    jmp done

two_digit:
    mov ah, 0
    mov bl, 10
    div bl

    mov bh, ah

    mov dl, al
    add dl, 48
    mov ah, 2
    int 21h

    mov dl, bh
    add dl, 48
    mov ah, 2
    int 21h

done:
ENDM

start:

    PRINT "Enter first number: "
    mov ah, 1
    int 21h
    sub al, 48
    mov bl, al

    PRINTN ""

    PRINT "Enter second number: "
    mov ah, 1
    int 21h
    sub al, 48
    mov cl, al

    PRINTN ""

    cmp bl, 0
    jne continue_prog

    cmp cl, 0
    je exit_program

continue_prog:
    PRINT "Product: "
    product

    PRINTN ""
    PRINTN ""

    jmp start

exit_program:
    mov ah, 4Ch
    int 21h