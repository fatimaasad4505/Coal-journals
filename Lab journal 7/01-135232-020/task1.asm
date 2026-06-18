include emu8086.inc
org 100h

.code
 mov bl, '5'        
 mov dl, 5          
 mov dh, 0         

outer_loop:
 
cmp dh, 0
je spaces     
mov cl, dh         

space:
putc ' '
loop space

spaces:
mov al, bl         
sub al, '0'        
mov cl, al
add cl, al         
dec cl             

inner_loop:
putc bl            
loop inner_loop

printn ""          
dec bl             
inc dh             
dec dl
jnz outer_loop

