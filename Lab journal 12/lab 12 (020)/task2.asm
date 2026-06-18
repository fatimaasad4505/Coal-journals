org 100h

jmp main

nums1 dw 5,2,5,7,5
nums2 dw 8,9,8,1,8

label1 db "Replacements in array 1: $"
label2 db 13,10,"Replacements in array 2: $"

scanReplace:

push bp
mov bp, sp

sub sp, 2

push si
push cx

mov word [bp-2], 0

mov si, [bp+8]
mov cx, [bp+6]
mov dx, [bp+4]

scan_loop:

mov ax, [si]

cmp ax, dx
jne no_match

mov word [si], 0

inc word [bp-2]

no_match:

add si, 2

dec cx
jnz scan_loop

mov ax, [bp-2]

pop cx
pop si

mov sp, bp
pop bp

ret 6

showDigit:

add al, 30h

mov dl, al
mov ah, 02h
int 21h

ret

main:

mov ax, nums1
push ax

mov ax, 5
push ax

mov ax, 5
push ax

call scanReplace

mov ah, 09h
mov dx, offset label1
int 21h

call showDigit

mov ax, nums2
push ax

mov ax, 5
push ax

mov ax, 8
push ax

call scanReplace

mov ah, 09h
mov dx, offset label2
int 21h

call showDigit

mov ax, 4C00h
int 21h