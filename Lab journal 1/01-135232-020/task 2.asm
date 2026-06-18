.model small

.data 
msg db "This", 0AH, "is", 0AH, "my", 0AH, ""name"", "$"

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
