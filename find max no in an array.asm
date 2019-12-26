
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.data 
arr dw 75,65,88,95
N dw 4
maxno dw ?
msg dw 'the max no in array = $'
.code
main proc
    
       mov ax , @data
       mov ds , ax
       
       push N
       call max
       
       lea dx , msg
       mov ah ,9
       int 21h
       
       mov cx ,0
       mov ax , maxno
       
       pstack:
       inc cx
       mov dl ,10
       div dl
       
       mov dl , al
       and ax ,0ff00h
       xchg al , ah
       push ax
       mov al ,dl
       cmp al ,0 
       jne pstack
       
       print:
       pop ax
       mov dl ,al
       add dl , 30h
       mov ah , 2
       int 21h
       loop print
       
       
       mov ax , 4ch
       int 21h
    
    main endp



max proc
    
    push bp 
    mov bp , sp
    
    cmp [bp+4] , 1
    jne else
    
    mov cx , arr[0]
    mov maxno , cx
    jmp exit
    
    else:
    dec N
    push N
    
    call max
  
       mov bx , [bp+4]
       dec bx
       shl bx ,1
   
    mov cx , maxno
    
    cmp arr[bx] , cx
    jg then
    mov maxno , cx
    jmp exit
    
    
    then:
    mov cx , arr[bx]
    mov maxno , cx     
        
    exit:
    pop bp
    ret 2                                                              
    max endp

ret




