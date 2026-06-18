.model small

.data

var1 db 2
var2 db 3
msg db "Addition of two numbers is: ", "$"

.code
main:

mov ax, @data
mov ds, ax
mov dx, offset msg 

mov ah, 9
int 21h 

mov al, var1
add al, var2

add al, 48

mov dl, al
mov ah, 2 
int 21h

mov ah, 4ch
int 21h    

end main



 