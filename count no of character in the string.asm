
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.data  
msg dw 'thiss k $' 
msg1 dw 'the length of string = $'
no dw ?
.code
main proc
   mov ax , @data
   mov ds , ax
   
   mov si, offset msg
   
   mov cx , 0 
   loop1:
   mov ax ,[si]
   cmp al , '$'
   je exit
   
   push [si]
   inc cx
   inc si
   jmp loop1


    
   exit:   
   
   lea dx , msg1
   mov ah , 9
   int 21h 
   
   mov no , cx
   
   mov ax , no
   mov cx ,0
   
   pstack:
   inc cx
   mov dl , 10
   div dl
   
   mov dl , al
   and ax , 0ff00h
   xchg al, ah                                             ; remainder in al
    push ax
    mov al, dl                                              ; restore quotient
    cmp al, 0
    jne pstack    
                                              ; repeat while quotient is non - zero
    
print:
    pop ax
    mov dl, al
    add dl, 30h
    mov ah, 2
    int 21h
    loop print
   
   
   mov ax ,4ch
   int 21h
          
    main endp

ret




