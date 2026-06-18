.model small

.data
msg db 10,13,"the highest number is: $"

.code
main:

mov ax,@data
mov ds,ax

mov bl,0
mov cx,10

MyLoop:
    mov ah,1
    int 21h
    
    cmp al,bl
    jg swap
    jmp skip

swap:
    mov bl,al

skip:
loop MyLoop

mov dx, offset msg
mov ah,09
int 21h

mov dl, bl
mov ah,02
int 21h

mov ah,4ch
int 21h

end main