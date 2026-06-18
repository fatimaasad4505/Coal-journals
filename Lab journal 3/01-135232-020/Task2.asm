.model small

.data
var1 db "Value of 1st number: ", "$"
var2 db  10,13,"Value of 2nd number: ", "$"
msg db 10,13,"Result:  ", "$"
num1 db ?
num2 db ?


.code
main:
mov ax,@data
mov ds,ax
mov dx,offset var1
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48
mov num1,al

mov dx,offset var2
mov ah,9
int 21h     

mov ah,1
int 21h
sub al,48
mov num2,al  

mov al,num1
mov bl,num2  
mul bl
mov bl,al 

mov dx,offset msg
mov ah,09h
int 21h 

mov dl,bl
add dl,48
mov ah,2
int 21h

         
mov ah, 4ch
int 21h    

end main