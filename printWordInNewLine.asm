
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.data
msg db 'Enter three iniials :$ '
space db 0ah ,0dh , '$'
.code
main proc
      
      mov ax ,@data
      mov ds ,ax
      
      lea dx , msg
      mov ah ,9
      int 21h
      
      mov ah , 1
      int 21h
      mov bl ,al     
      int 21h
      mov bh ,al
      int 21h
      mov cl , al
      
      
      lea dx , space
      mov ah ,9
      int 21h
      
      mov ah ,2
      mov dl , bl
      int 21h    
      
      lea dx , space
      mov ah ,9
      int 21h
      
      mov ah ,2
      mov dl , bh
      int 21h
      
      lea dx , space
      mov ah ,9
      int 21h
      
      mov ah ,2  
      mov dl ,cl
      int 21h
      
    
    main endp


ret




