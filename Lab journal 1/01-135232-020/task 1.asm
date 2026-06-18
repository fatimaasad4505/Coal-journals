.model small

.data 
msg db "Fatima Asad", 010,013, "01-135232-020", 010,013, "BS-IT", "$"

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
