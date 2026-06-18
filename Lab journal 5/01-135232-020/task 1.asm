org 100h

.data

streven db 10,13, "the number was even $"
strodd db 10,13, "the number was odd $"
A db ?
.code

mov ah, 1
int 21h
mov ah, 0
mov bl, 2
div bl
cmp ah,0
je even
mov ah, 9
LEA dx,strodd
int 21h
jmp e
even:
mov ah, 9
LEA dx,streven
int 21h 

e: