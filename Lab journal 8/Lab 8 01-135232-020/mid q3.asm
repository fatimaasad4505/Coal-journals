.model small
.data
    str1 db "Enter first number: $"
    str2 db 0Ah,0Dh,"Enter second number: $"
    str3 db 0Ah,0Dh,"Sum of two numbers: $"
    str4 db 0Ah,0Dh,"Multiplication of two numbers: $"

.code
main:
    mov ax,@data
    mov ds,ax

    lea dx,str1
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    sub al,48
    mov bh,al

    test bh,1
    jnz oddCase

evenCase:
    lea dx,str2
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    sub al,48

    add al,bh
    mov bh,al

    lea dx,str3
    mov ah,9
    int 21h

    cmp bh,9
    jg twoDigitSum

    mov dl,bh
    add dl,48
    mov ah,2
    int 21h
    jmp exitProgram

twoDigitSum:
    mov al,bh
    mov ah,0
    mov cl,10
    div cl

    mov bl,ah

    mov dl,al
    add dl,48
    mov ah,2
    int 21h

    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    jmp exitProgram

oddCase:
    mov al,bh
    mov ah,0
    mov cl,2
    mul cl

    mov bh,al

    lea dx,str4
    mov ah,9
    int 21h

    cmp bh,9
    jg twoDigitMul

    mov dl,bh
    add dl,48
    mov ah,2
    int 21h
    jmp exitProgram

twoDigitMul:
    mov al,bh
    mov ah,0
    mov cl,10
    div cl

    mov bl,ah

    mov dl,al
    add dl,48
    mov ah,2
    int 21h

    mov dl,bl
    add dl,48
    mov ah,2
    int 21h

exitProgram:
    mov ah,4ch
    int 21h
    
end main
