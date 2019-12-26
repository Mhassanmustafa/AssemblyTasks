
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
   .stack 100h
   .data
   msg db 0ah , 0dh ,'the sum of $'
   msg1 db ' and $'
   msg2 db ' is $'
   .code
   main proc
   mov ax ,@data 
   mov ds ,ax
   
   mov dl , '?'
   mov ah , 2
   int 21h
   
   mov ah , 1
   int 21h
   mov bh , al
   int 21h
   mov bl , al
   
   lea dx , msg 
   mov ah , 9
   int 21h
   
   mov ah, 2
   mov dl , bh 
   int 21h     
   
   lea dx , msg1 
   mov ah , 9
   int 21h
   
   mov dl , bl            
   mov ah, 2
   
   int 21h
   
   lea dx , msg2
   mov ah ,9
   int 21h
   
   add bh  , bl   
   sub bh , 48
   
   mov ah, 2
   mov dl , bh 
   int 21h     
             
    
    
    main endp
   


ret




