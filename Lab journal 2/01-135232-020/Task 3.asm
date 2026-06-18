.model small

.data  
newline db 10,13, "$"
msg1 db "2 x 1 = ", "$"
res1 db 2  
msg2 db "2 x 2 = ", "$"
res2 db 4
msg3 db "2 x 3 = ", "$"
res3 db 6
msg4 db "2 x 4 = ", "$"
res4 db 8
msg5 db "2 x 5 = ", "$"
res5 db 1
res11 db 0
msg6 db "2 x 6 = ", "$"
res6 db 1
res12 db 2
msg7 db "2 x 7 = ", "$"
res7 db 1
res13 db 4
msg8 db "2 x 8 = ", "$"
res8 db 1
res14 db 6
msg9 db "2 x 9 = ", "$"
res9 db 1
res15 db 8
msg10 db "2 x 10 = ", "$"
res10 db 2
res16 db 0                           


.code
main:
mov ax, @data
mov ds, ax

mov dx, offset msg1
mov ah, 09h
int 21h

mov dl, res1
add dl, 48
mov ah , 02h
int 21h
mov dx , offset newline  

mov ah, 09h
int 21h 
                       
mov dx, offset msg2
mov ah, 09h
int 21h

mov dl, res2
add dl, 48
mov ah , 02h
int 21h
mov dx , offset newline 

mov ah, 09h
int 21h  

mov dx, offset msg3
mov ah, 09h
int 21h

mov dl, res3
add dl, 48
mov ah , 02h
int 21h
mov dx , offset newline

mov ah, 09h
int 21h 

mov dx, offset msg4
mov ah, 09h
int 21h

mov dl, res4
add dl, 48
mov ah , 02h
int 21h
mov dx , offset newline  

mov ah, 09h
int 21h 

mov dx, offset msg5
mov ah, 09h
int 21h

mov dl, res5
add dl, 48 
mov ah, 02h 
int 21h
mov dl, res11
add dl, 48
mov ah , 02h
int 21h
mov dx , offset newline  

mov ah, 09h
int 21h 

mov dx, offset msg6
mov ah, 09h
int 21h

mov dl, res6
add dl, 48
mov ah , 02h 
int 21h
mov dl, res12
add dl, 48
mov ah , 02h
int 21h
mov dx , offset newline  

mov ah, 09h
int 21h 

mov dx, offset msg7
mov ah, 09h
int 21h

mov dl, res7
add dl, 48
mov ah , 02h
int 21h
mov dl, res13
add dl, 48
mov ah , 02h
int 21h
mov dx , offset newline

mov ah, 09h
int 21h 

mov dx, offset msg8
mov ah, 09h
int 21h

mov dl, res8
add dl, 48
mov ah , 02h
int 21h
mov dl, res14
add dl, 48
mov ah , 02h
int 21h
mov dx , offset newline 

mov ah, 09h
int 21h 

mov dx, offset msg9
mov ah, 09h
int 21h

mov dl, res9
add dl, 48
mov ah , 02h
int 21h 
mov dl, res15
add dl, 48
mov ah , 02h
int 21h
mov dx , offset newline 

mov ah, 09h
int 21h 

mov dx, offset msg10
mov ah, 09h
int 21h

mov dl, res10
add dl, 48
mov ah , 02h  
int 21h
mov dl, res16
add dl, 48
mov ah , 02h
int 21h
mov dx , offset newline      

mov ah, 09h
int 21h 



end main