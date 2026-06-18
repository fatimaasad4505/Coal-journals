include emu8086.inc
org 100h

jmp begin

a dw 2
b dw 7

begin:
    printn "Numbers before swapping:"

    mov ax, a
    call PRINT_NUM
    print " "

    mov ax, b
    call PRINT_NUM

    call swap_proc

    printn ""
    printn "Numbers after swapping:"

    mov ax, a
    call PRINT_NUM
    print " "

    mov ax, b
    call PRINT_NUM

    mov ah, 4ch
    int 21h

swap_proc proc
    mov ax, a
    mov bx, b

    mov cx, ax
    mov ax, bx
    mov bx, cx

    mov a, ax
    mov b, bx

    ret
swap_proc endp

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS