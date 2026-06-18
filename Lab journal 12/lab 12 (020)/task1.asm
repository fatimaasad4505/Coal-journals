org 100h
jmp main

arr1 dw 10,20,30,40,50
arr2 dw 99,88,77,66

buf1 dw 5 dup(0)
buf2 dw 4 dup(0)

notice db "arrays are copied. $"

transfer:
push bp
mov bp, sp

push si
push di
push cx

mov si, [bp+8]
mov di, [bp+6]
mov cx, [bp+4]

move_data:
mov ax, [si]
mov [di], ax

add si, 2
add di, 2

dec cx
jnz move_data

pop cx
pop di
pop si

pop bp
ret 6

main:
mov ax, arr1
push ax

mov ax, buf1
push ax

mov ax, 5
push ax

call transfer

mov ax, arr2
push ax

mov ax, buf2
push ax

mov ax, 4
push ax

call transfer

mov ah, 09h
mov dx, offset notice
int 21h

mov ax, 4C00h
int 21h