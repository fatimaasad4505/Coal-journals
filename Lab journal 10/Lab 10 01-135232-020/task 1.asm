include 'emu8086.inc'
org 100h

sumMacro MACRO p1,p2,p3,p4,p5
    LOCAL print_one, print_two, finish

    mov al,p1
    add al,p2
    add al,p3
    add al,p4
    add al,p5

    mov ah,0
    cmp al,9
    jg print_two

print_one:
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    jmp finish

print_two:
    mov cl,10
    div cl
    mov bh,ah

    mov dl,al
    add dl,48
    mov ah,2
    int 21h

    mov dl,bh
    add dl,48
    mov ah,2
    int 21h

finish:
ENDM

    mov cx,5
    mov bl,1

main_loop:
    push cx
    PRINT "Sum: "

    cmp bl,1
    je case1
    cmp bl,2
    je case2
    cmp bl,3
    je case3
    cmp bl,4
    je case4
    cmp bl,5
    je case5

case1:
    sumMacro 1,2,3,4,5
    jmp after_case

case2:
    sumMacro 1,9,3,4,5
    jmp after_case

case3:
    sumMacro 1,2,8,4,5
    jmp after_case

case4:
    sumMacro 1,2,3,7,5
    jmp after_case

case5:
    sumMacro 1,2,3,4,6

after_case:
    PRINTN ""
    inc bl
    pop cx
    loop main_loop

    mov ah,4ch
    int 21h