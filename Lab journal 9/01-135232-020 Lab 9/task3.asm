.model small
.stack 100h

.data
max dw 0
count dw 0

msg1 db 'Enter a number (press enter to stop): $'
msg2 db 13,10,'MAX value is: $'

.code
main proc

    mov ax, @data
    mov ds, ax 
    mov ah, 09h
    lea dx, msg1
    int 21h

loop1:

    mov ah, 01h
    int 21h

    cmp al, 13         
    je loop2

    sub al, '0'       
    mov ah, 0

    push ax            
    inc count

    jmp loop1 

loop2:

    mov ah, 09h
    lea dx, msg2
    int 21h

    mov cx, count

loop3:
    pop bx

    cmp max, bx
    jge SKIP

    mov max, bx

SKIP:
    loop loop3
    mov ax, max
    add al, '0'
    mov dl, al

    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h

main endp
end main