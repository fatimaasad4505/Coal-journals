.model small
.data
    str1 db "Enter 5 numbers: $"
    str2 db 10,13,"Array in reverse: $"
    nums db 5 dup(?)

.code
main:
    mov ax,@data
    mov ds,ax

    lea dx,str1
    mov ah,9
    int 21h

    mov si,0
    mov cx,5

readLoop:
    mov ah,1
    int 21h
    sub al,48

    mov nums[si],al
    inc si
    loop readLoop

    lea dx,str2
    mov ah,9
    int 21h

    mov si,4
    mov cx,5

printLoop:
    mov dl,nums[si]
    add dl,48
    mov ah,2
    int 21h

    dec si
    loop printLoop

    mov ah,4ch
    int 21h
    
end main