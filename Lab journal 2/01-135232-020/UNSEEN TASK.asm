.model small

.data  
msg1 db "First number is: ", "$"
msg2 db "Second number is: ", "$"

no1 db ?
no2 db ?

newline db 10,13, "$" 

.code
main:
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov ah, 01h
int 21h
mov no1, al 
sub no1, 48 

mov ah, 09
mov dx, offset newline
int 21h

mov ah, 09h
mov dx, offset msg2
int 21h

mov ah, 01h
int 21h
mov no2, al
sub no2, 48 

mov ah, 09
mov dx, offset newline
int 21h  

mov dl, no1
add dl, no2
add dl, 48


mov ah, 02h
int 21h

mov ah, 09
mov dx, offset newline
int 21h
end main  







