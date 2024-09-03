;Recibe un carácter en el registro AL y retorna en AH el valor 0FFh si es
;mayúscula y 0 de lo contrario

org 1000H
c db 43h


org 3000h
isMayuscula: 
cmp al, 41h
jns comprobar 
js asig
asig: mov ah, 0H
jmp fin

comprobar: 
  cmp al,5Ah
  jns asig
  js isMayus

isMayus:
  mov ah, 0ffH
  jmp fin
  
fin: ret 

org 2000h
mov al, c
call isMayuscula
  

int 0
end