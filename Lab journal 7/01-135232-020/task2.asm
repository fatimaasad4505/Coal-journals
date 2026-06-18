include emu8086.inc
org 100h

.code
mov bl, 1          
mov dh, 3          

outer:
cmp dh, 0
je skipspaces
mov cl, dh

spaceloop:
putc ' '
loop spaceloop

skipspaces:
mov al, bl        

descloop:
mov cl, al
add cl, '0'
putc cl            
dec al
jnz descloop

mov al, 2         

ascloop:
cmp al, bl
jg ascdone
mov cl, al
add cl, '0'
putc cl           
inc al
jmp ascloop

ascdone:
printn ""          
inc bl            
dec dh            
cmp bl, 5
jne outer
