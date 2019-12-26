
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.data
value dw 1004      
.code
main proc
    mov ax , @data
    mov ds , ax
    
    mov ax , value
    mov cx , 0
    
    pstack:
    inc cx
    mov dl ,10
    div dl
    
    mov dl , al
    and ax ,0ff00h   
    xchg al ,ah
    push ax
    mov al ,dl
    cmp al ,0
    jne pstack
    
    print:
    pop ax
    mov dl ,al
    add dl ,30h
    mov ah , 2
    int 21h
    loop print
    
    mov ah , 4ch
    int 21h
    
    
    main endp


ret




