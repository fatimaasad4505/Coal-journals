.model small

.data  
    num dw 9   


.code
main:
    mov ax, @data
    mov ds, ax

    
    mov cx, 9  
    MyLoop:
        mov ax, cx
        mov bl, 2  
        div bl
        cmp ah, 0
        je escape   ; even case
    
        mov dx, cx  ; odd case
        add dx, 48
        mov ah, 2
        int 21h
        
    escape:
    
    Loop MyLoop 
    
    mov ah, 4ch
    int 21h
    
    end main 
    
   
    
    
    