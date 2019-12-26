
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.data  
msg1 dw 'hassan$'

.code
main proc
   mov ax , @data
   mov ds , ax
   
   mov si , offset msg1
   
   mov cx , 0
   loop1:
   mov ax , [si]
   cmp al , '$'
   je exit
    
    push [si]
   inc cx
   inc si  
   
   jmp loop1   
   
   
   
   
     
      exit:
 
   
   mov si , offset msg1
   rev: 
    cmp cx , 0  
    mov [si] , '$'
   je exit1
    
   pop dx    
   mov [si] , dx   
   inc si 
   dec cx
   jmp rev
   

   
   
   
     exit1:  
     lea dx , msg1
   mov ah ,9 
   int 21h    
     mov ax , 4ch
     int 21h
    
    main endp


ret




