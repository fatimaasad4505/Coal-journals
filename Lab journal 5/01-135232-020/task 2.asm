.model small

.data

str1 db "Grade = A ",10,13,"$"
str2 db "Grade = B ",10,13,"$"
str3 db "Grade = C ",10,13,"$"
str4 db "Grade = F ",10,13,"$"
str5 db "Marks Are Not valid",10,13,"$"

msg1 db 101

.code

main:

mov ax, @data
mov ds, ax

cmp msg1, 100
JG notValid
cmp msg1, 0
JL notValid

cmp msg1, 90
JGE a 

cmp msg1, 80
JGE b 

cmp msg1, 50
JGE c  

lea dx, str4
mov ah, 09
int 21h
JMP exit

notValid:
lea dx, str5
mov ah, 09
int 21h  
JMP exit 

a:
lea dx, str1
mov ah, 09
int 21h 
JMP exit

b:
lea dx, str2
mov ah, 09
int 21h 
JMP exit

c:
lea dx, str3
mov ah, 09
int 21h  

exit:

mov ah, 4ch
int 21h
 
end main