
.model small

.data 
msg db "*", 010,013, "**", 010,013, "***", 010,013, "****", 010,013, "*****", "$"

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
