
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.data
msg dw 0ah ,0dh , 'the Alphabet the alphabet you enter is incorrect $'
space dw 0ah , 0dh ,'$'

.code
main proc
    mov ax , @data
    mov ds ,ax
    
    mov ah , 2
    mov dl , '?'
    int 21h
    
    mov ah , 1
    int 21h
    mov bl , al
    
    cmp bl , 'A'
    jge condition1:
    jmp exit
    
    condition1:
    cmp bl , 'Z'
    jle con2:
    jmp exit
    
    con2:
    mov ah , 1
    int 21h
    mov bh , al 
    
    cmp bh , 'A'
    jge condition11:
    jmp exit
    
    condition11:
    cmp bh , 'Z'
    jle con22:
    jmp exit 
    
    con22:
    cmp bl ,bh
    jl greater
    jmp less
 
    
    greater:  
    lea dx ,  space
    mov ah , 9
    int 21h
    mov ah ,2
    mov dl , bl
    int 21h  
    mov ah , 2
    mov dl , bh
    int 21h 
    
   
    jmp hault
    
    less: 
    lea dx ,  space
    mov ah , 9
    int 21h
    mov ah , 2
    mov dl , bh
    int 21h  
     mov ah ,2
    mov dl , bl
    int 21h  
   
    jmp hault
    
    
    exit:
    lea dx , msg
    mov ah ,9
    int 21h
    jmp hault
    
    hault:
    mov ah , 4ch
    int 21h
    
    
    
    main endp

ret




