.model small

.data
str1 db "Enter number : $"
str2 db 0Ah,0Dh,"Invalid number : ",10,13,"$"
str3 db 0Ah,0Dh,"Grade is F ",10,13,"$"
str4 db 0Ah,0Dh,"Grade is C ",10,13,"$"
str5 db 0Ah,0Dh,"Grade is B ",10,13,"$"
str6 db 0Ah,0Dh,"Grade is A ",10,13,"$"
str7 db 0Ah,0Dh,"You pressed Enter key ",10,13,"$"
num db ?

.code
main:
    mov ax,@data
    mov ds,ax

loopStart:

    mov ah,09h
    lea dx,str1
    int 21h

    mov ah,01h
    int 21h

    cmp al,13
    je exitLoop

    sub al,48

    cmp al,0
    jl invalidCase

    cmp al,10
    ja invalidCase

    cmp al,3
    jl gradeF

    cmp al,4
    jle gradeC

    cmp al,7
    jle gradeB

    mov ah,09h
    lea dx,str6
    int 21h
    jmp continueLoop

gradeB:
    mov ah,09h
    lea dx,str5
    int 21h
    jmp continueLoop

gradeC:
    mov ah,09h
    lea dx,str4
    int 21h
    jmp continueLoop

gradeF:
    mov ah,09h
    lea dx,str3
    int 21h
    jmp continueLoop

invalidCase:
    mov ah,09h
    lea dx,str2
    int 21h

continueLoop:
    jmp loopStart

exitLoop:
    mov ah,09h
    lea dx,str7
    int 21h

    mov ah,4Ch
    int 21h
end main