.model small

.data
msg db "Print the character: ", "$"   

.code
main:
     
mov ax, @data
mov ds, ax 
  
mov ah, 02h
mov dl, 'F'
int 21h
   
mov ah, 02h  
mov dx, 10
int 21h

mov ah, 9 
mov dx, offset msg 
int 21h   

 
mov ah, 1
int 21h  
              
mov ah, 2

int 21h   
       
mov ah, 4ch
int 21h

end main
