.model small
.stack 100h

.data
arr dw 1,2,3,4,5,6,7,8,9,10

.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    mov cx, 10
    mov bx, 0
    
loop1:
    mov ax, arr[bx]
    push ax
    add bx, 2
    loop loop1 
    
    mov cx, 10
    mov bx, 0
    
loop2:
    pop ax
    mov arr[bx],ax
    add bx,2
    loop loop2
    
mov ah, 4ch
int 21h

main endp
end main
    
    
    
    
    
    
    
    
    
    
    
