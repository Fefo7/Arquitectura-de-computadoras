; todo el 4 , b ,c               
org 1000H
letra db 41h
nums db 30H
salto db 0Ah
org 2000h     

mov dx, 5Ah-40h


loop: 
mov bx, offset  letra
mov al, 1
int 7
mov bx, offset salto
mov al,1
int 7
inc letra
dec dx
jnz loop


impNum: mov dx, 10
loop2:mov bx, offset nums 
mov al, 1
int 7
mov bx, offset salto
mov al,1
int 7
inc nums
dec dx
jz fin
jmp loop2



fin: int 0
end