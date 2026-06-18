include emu8086.inc
org 100h

jmp begin

arr db 5 dup(0)

begin:
    printn "Enter any five numbers:"

    mov cx, 5
    mov si, 0

input:
    call SCAN_NUM
    mov arr[si], cl
    inc si
    loop input

    call sortarray

    printn ""
    printn "Sorted Array:"

    mov cx, 5
    mov si, 0

output:
    mov al, arr[si]
    mov ah, 0
    call PRINT_NUM_UNS
    print " "
    inc si
    loop output

    mov ah, 4Ch
    int 21h


sortarray proc
    mov cx, 4

outer:
    mov si, 0
    mov bx, 4

inner:
    mov al, arr[si]
    mov dl, arr[si+1]

    cmp al, dl
    jbe skip

    call swap

skip:
    inc si
    dec bx
    jnz inner

    loop outer
    ret
sortarray endp


swap proc
    mov al, arr[si]
    mov dl, arr[si+1]
    mov arr[si], dl
    mov arr[si+1], al
    ret
swap endp


DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS