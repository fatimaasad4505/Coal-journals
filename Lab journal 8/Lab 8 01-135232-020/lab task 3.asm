.model small

.data
    nums db 5 dup(?)                  
    abc1 db "Enter 5 number: $"
    abc2 db 0Dh,0Ah,"Nubers in desc order: $"

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, abc1
    int 21h

    mov cx, 5                       
    lea bx, nums                     

readLoop:
    mov ah, 01h
    int 21h
    sub al, '0'                             
    
    mov [bx], al                     
    inc bx                           
    loop readLoop                      

    mov cx, 5                        

outerLoop:
    dec cx                             
    jz finish                          

    lea bx, nums         
    mov di, cx          

innerLoop:
    mov al, [bx]
    mov dl, [bx+1]                    

    cmp al, dl
    jge skipSwap                       

    mov [bx], dl                     
    mov [bx+1], al

skipSwap:
    inc bx
    dec di             
    jnz innerLoop

    jmp outerLoop

finish:                                              
    mov ah, 09h                      
    lea dx, abc2
    int 21h

    mov cx, 5                        
    lea bx, nums         

printLoop:
    mov dl, [bx]
    add dl, '0'        
    mov ah, 02h
    int 21h

    mov dl, ' '        
    int 21h

    inc bx
    loop printLoop

    mov ah, 4Ch
    int 21h

main endp
end main
