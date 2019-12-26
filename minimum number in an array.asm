
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.data
arr dw 78,24,45,87
N dw 4
minno dw ?
msg dw 'the minimum number in array = $ '
.code
main proc
        mov ax , @data
        mov ds , ax
        
        push N
        call min  
        
        lea dx , msg
        mov ah ,9
        int 21h
        
        mov cx , 0
        mov ax , minno 
        
        pstack:
        inc cx
        mov dl ,10
        div dl
        
        mov dl , al
        and ax, 0ff00h
      
        
          xchg al ,ah  
          push ax 
          mov al , dl
          cmp al , 0
          jne pstack
          
          
          print:
          pop ax
          mov dl , al
          add dl ,30h
          mov ah , 2
          int 21h
          loop print
        
        
        mov ah , 4ch
        int 21h
    main endp  

min proc
     push bp
     mov bp , sp
     
     cmp [bp+4] , 1
     jne else
     
     mov cx , arr[0]
     mov minno , cx
     jmp return
     
     else:
        dec N
        push N
        
        call min
        
        mov bx ,[bp+4]
        dec bx
        shl bx , 1
        
        mov cx , minno
        
        cmp  arr[bx] , cx
        jl less
        
        mov minno , cx 
        jmp return
        
        less:
        
        mov cx , arr[bx]
        mov minno ,cx
        jmp return
        
        
        return:
        pop bp
        ret 2
     
     
     
     
    min endp

ret




