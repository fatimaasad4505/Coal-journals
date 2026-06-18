.model small
.data
    str1 db "Enter a single digit number: $"
    str2 db 0Ah,0Dh,"Number is less than 5$"
    str3 db 0Ah,0Dh,"Result: $"

.code
start:
    mov ax,@data
    mov ds,ax

    lea dx,str1
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    sub al,48

    mov bh,al
    cmp bh,5
    jl lessThan

    test bh,1
    jnz oddCase

evenCase:
    lea dx,str3
    mov ah,9
    int 21h

    mov al,bh
    shr al,1
    add al,48

    mov dl,al
    mov ah,2
    int 21h
    jmp finish

oddCase:
    mov al,bh
    mov ah,0
    mov cl,2
    mul cl

    mov bh,al

    lea dx,str3
    mov ah,9
    int 21h

    cmp bh,9
    jg doubleDigit

    mov dl,bh
    add dl,48
    mov ah,2
    int 21h
    jmp finish

doubleDigit:
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
    jmp finish

lessThan:
    lea dx,str2
    mov ah,9
    int 21h

finish:
    mov ah,4ch
    int 21h