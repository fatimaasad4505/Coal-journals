include 'emu8086.inc'
org 100h

printRow MACRO
    LOCAL spaces, stars, done

    push cx

    mov cl, bl
    mov ch, 0

    cmp cl, 0
    je stars

spaces:
    PUTC ' '
    loop spaces

stars:
    mov cl, bh
    mov ch, 0

stars_loop:
    PUTC '*'
    loop stars_loop

    PRINTN ""

    pop cx
ENDM

    mov cx, 7
    mov bl, 6
    mov bh, 1

main_loop:
    push cx

    printRow

    dec bl
    add bh, 2

    pop cx
    loop main_loop

    mov ah, 4Ch
    int 21h