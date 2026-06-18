.model small
.stack 100h

.data
arr dw 10 dup(?)
count dw 0

msg1 db 'Enter 10 numbers: $'
msg2 db 13,10,'Even numbers are: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset msg1
    mov ah, 09h
    int 21h

    mov cx, 10
    mov si, 0
    mov count, 0

loop1:
    mov ah, 01h
    int 21h

    sub al, '0'
    mov ah, 0

    mov arr[si], ax

    mov ax, arr[si]
    mov bl, 2
    div bl

    cmp ah, 0
    jne loop2

    mov ax, arr[si]
    push ax
    inc count

loop2:
    add si, 2
    loop loop1

    mov dx, offset msg2
    mov ah, 09h
    int 21h

    mov cx, count

loop3:
    pop ax

    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    mov dl, ' '
    mov ah, 02h
    int 21h

    loop loop3

    mov ah, 4Ch
    int 21h

main endp
end main