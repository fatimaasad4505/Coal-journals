.model small

.data

dividend db 6
divisor db -2
dividend2 db -6
divisor2 db -2

.code 

main:

mov ax,@data
mov ds,ax 
mov ax,0
mov al,dividend2 
                
CBW    

IDIV divisor2
mov bl,al  
mov al,dividend  

CBW

IDIV divisor  
mov bl,al  

end main
