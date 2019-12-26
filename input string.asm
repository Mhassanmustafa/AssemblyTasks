
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.data
Arr dw 100 dup('$')  
line dw 0ah , 0dh ,'$'
.code
main proc
    mov ax , @data
    mov ds, ax
    
    mov si , offset Arr
    mov cx , 0
   
    
    input:   
     mov ah , 1
    int 21h 
    inc cx
    
    cmp al ,0dh
    je exit
    
    mov [si] , al
    inc si
    jmp input
    
    exit:  
    
    lea dx , line
    mov ah , 9
    int 21h
    lea dx , Arr
    mov ah , 9
    int 21h   
    
      lea dx , line
    mov ah , 9
    int 21h  
    
   
   


 mov si , offset Arr
   
   mov cx , 0
   loop1:
   mov ax , [si]
   cmp al , '$'
   je exit1
    
    push [si]
   inc cx
   inc si  
   
   jmp loop1   
   
   
   
   
     
      exit1:
 
   
   mov si , offset Arr
   rev: 
    cmp cx , 0  
    mov [si] , '$'
   je exit11
    
   pop dx    
   mov [si] , dx   
   inc si 
   dec cx
   jmp rev
   

   
   
   
     exit11:  
     lea dx , Arr
   mov ah ,9 
   int 21h    
     mov ax , 4ch
     int 21h   
    
    main endp

ret




