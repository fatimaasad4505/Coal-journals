.model small
.data
    str1 db "Enter 10 numbers: $"
    str2 db 10,13,"No of even numbers: $"
    str3 db 10,13,"No of odd numbers: $"
    str4 db 10,13,"Even numbers are more$"
    str5 db 10,13,"Odd numbers are more$"
    str6 db 10,13,"Enen and Odd are equal$"
    nums db 10 dup(?)
    evenCount db 0
    oddCount db 0

.code
main:
    mov ax,@data
    mov ds,ax

    lea dx,str1
    mov ah,9
    int 21h

    mov si,0
    mov cx,10

readLoop:
    mov ah,1
    int 21h
    sub al,48

    mov nums[si],al
    inc si
    loop readLoop

    mov si,0
    mov cx,10

countLoop:
    mov al,nums[si]
    mov ah,0
    mov bl,2
    div bl

    cmp ah,0
    jne oddCase

    inc evenCount
    jmp nextStep

oddCase:
    inc oddCount

nextStep:
    inc si
    loop countLoop

    lea dx,str2
    mov ah,9
    int 21h

    mov dl,evenCount
    add dl,48
    mov ah,2
    int 21h

    lea dx,str3
    mov ah,9
    int 21h

    mov dl,oddCount
    add dl,48
    mov ah,2
    int 21h

    mov al,evenCount
    cmp al,oddCount
    jg moreEven
    jl moreOdd

    lea dx,str6
    mov ah,9
    int 21h
    jmp exitProgram

moreEven:
    lea dx,str4
    mov ah,9
    int 21h
    jmp exitProgram

moreOdd:
    lea dx,str5
    mov ah,9
    int 21h

exitProgram:
    mov ah,4ch
    int 21h