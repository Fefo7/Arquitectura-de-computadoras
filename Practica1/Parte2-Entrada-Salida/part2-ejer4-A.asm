; todo el 4 , b ,c               
org 1000H
letra db 41h
nums db 30H

org 2000h     

mov dx, 5Ah-40h
mov bx, offset  letra

loop: 

mov al, 1
int 7
inc letra
dec dx
jnz loop


impNum: mov dx, 10
loop2:mov bx, offset nums 
mov al, 1
int 7

inc nums
dec dx
jz fin
jmp loop2



fin: int 0
end