.model small

.data
    msg db 10,13, "Letters from Z-A $"   


.code
main:
    mov ax, @data
    mov ds, ax
    mov dx, offset msg  
    
    mov ah, 09
    int 21h
    
    mov cl, 26
    mov dl, 90 
    
    L1:
    mov ah, 02
    int 21h
    dec dl
    
    loop L1
    
    mov ah, 4ch
    int 21h
    
    end main
    
    
    
    