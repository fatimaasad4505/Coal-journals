.model small

.data
msg db "    *    ", 10,13,
    db "   ***   ", 10,13,
    db "  *****  ", 10,13,
    db " ******* ", 10,13,
    db "*********", 10,13,
    db " ******* ", 10,13,
    db "  *****  ", 10,13,
    db "   ***   ", 10,13,
    db "    *    ", 10,13, "$"  

.code
main:
     
mov ax, @data
mov ds,ax
mov dx, offset msg

mov ah,9
int 21h

mov ah,4ch
int 21h    

end main

