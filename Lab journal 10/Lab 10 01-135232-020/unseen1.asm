include 'emu8086.inc'
org 100h

printPattern MACRO rows
    LOCAL row_loop, col_loop

    push cx
    push bx

    mov bl, 1
    mov bh, rows

row_loop:
    push bx

    mov cl, bl
    mov ch, 0

col_loop:
    PUTC '*'
    loop col_loop

    PRINTN ""

    pop bx

    inc bl
    dec bh

    cmp bh, 0
    jne row_loop

    pop bx
    pop cx
ENDM


PRINT "Enter number of rows (1-9): "
mov ah, 1
int 21h
sub al, 48
mov dl, al

PRINTN ""

main_loop:
    printPattern dl

    PRINTN ""

    PRINT "Press Enter to stop or any key to print again: "
    mov ah, 1
    int 21h

    PRINTN ""

    cmp al, 13
    jne main_loop


mov ah, 4Ch
int 21h