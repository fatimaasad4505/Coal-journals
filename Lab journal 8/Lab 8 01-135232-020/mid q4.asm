.model small
.data
    str1 db "Enter a number: $"
    str2 db 0Ah,0Dh,"Day is: $"
    str3 db "Monday$"
    str4 db "Tuesday$"
    str5 db "Wednesday$"
    str6 db "Thursday$"
    str7 db "Friday$"
    str8 db "Saturday$"
    str9 db "Sunday$"
    str10 db "Invalid Input$"

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

    lea dx,str2
    mov ah,9
    int 21h

    cmp bh,1
    je monday
    cmp bh,2
    je tuesday
    cmp bh,3
    je wednesday
    cmp bh,4
    je thursday
    cmp bh,5
    je friday
    cmp bh,6
    je saturday
    cmp bh,7
    je sunday
    jmp defaultCase

monday:
    lea dx,str3
    mov ah,9
    int 21h
    jmp exitProgram

tuesday:
    lea dx,str4
    mov ah,9
    int 21h
    jmp exitProgram

wednesday:
    lea dx,str5
    mov ah,9
    int 21h
    jmp exitProgram

thursday:
    lea dx,str6
    mov ah,9
    int 21h
    jmp exitProgram

friday:
    lea dx,str7
    mov ah,9
    int 21h
    jmp exitProgram

saturday:
    lea dx,str8
    mov ah,9
    int 21h
    jmp exitProgram

sunday:
    lea dx,str9
    mov ah,9
    int 21h
    jmp exitProgram

defaultCase:
    lea dx,str10
    mov ah,9
    int 21h

exitProgram:
    mov ah,4ch
    int 21h
    
end main
