
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.data
A dw  10, 20, 30, 40, 50, 60, 70, 80, 90 ,100   
msg db 0ah,0dh,' the sum of values of array is $ '
v dw ?
.code
main proc
   mov ax , @data
   mov ds , ax
   
   mov ax , 0
   mov bx , 0
   mov cx ,10
   
  cont:
  add ax , A[bx]
  add bx ,2   
  loop cont                     
         
  mov v ,ax   
  
       
   mov cx, 0
   mov ax, v
    
pstack:
    inc cx
    mov dl, 10
    div dl
    
    mov dl, al                                              ; store quotient
    and ax, 0FF00h                                          ; clear quotient
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
    
    mov ax, 4Ch
    int 21h
        
    main endp   



ret




