org 100h

jmp begin

include emu8086.inc

num dw 0

begin:
    PRINT "Enter a positive number: "
    CALL SCAN_NUM        
    mov [num], cx
    
    PRINTN ""  


    cmp cx, 1
    jle is_not_prime     
    cmp cx, 2
    je  is_prime       

   
    mov bx, 2          

check_loop:

    mov ax, [num]
    xor dx, dx          
    div bx               
    
    cmp dx, 0
    je is_not_prime      

 
    inc bx
    mov ax, bx
    mul bx               
    
    cmp ax, [num]
    jbe check_loop       
  
    jmp is_prime

is_not_prime:
    PRINT "This is not a prime number"
    jmp exit

is_prime:
    PRINT "This is a prime number"

exit:
    RET


DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

END