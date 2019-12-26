
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.data
.code
main proc  
    ;first question
 ;   mov ax , -1
;    mov bx ,0
;    cmp ax , 0
;    jl less
;    jmp exit
;    
;    less:
;    mov bx, -1
;    jmp exit
;    
;    exit:
;    mov ah ,4ch
;    int 21h 

;second questions
;
;mov dl , 'a'
;cmp dl ,'A'
;jge condition1
;jmp exit   
;
;condition1:
;cmp dl , 'Z'
;jle condition2:
;jmp exit
;
;condition2:
;mov ah , 2
;int 21h     
;jmp exit    


; sixith question
mov ax , 5
mov bx , 3 
mov cx ,5
cmp ax , bx
jl con1
jmp con2

con1:
mov ax , 0
jmp exit
con2:
cmp bx , cx
jl con3
jmp con4

con3:
mov bx , 0
jmp exit

con4:
mov cx , 0
jmp exit
        exit:
   mov ah ,4ch
   int 21h 
    main endp


ret




