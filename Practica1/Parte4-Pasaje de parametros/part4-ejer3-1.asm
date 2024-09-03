org 1000H
mensaje db "Hola, Buenas Tardes"
cant db 0
;Recibe la dirección de comienzo de un string en BX, su longitud en AL, y el
;carácter a contar en AH. Retorna en CL la cantidad de veces que aparece el carácter
org 3000H
CONTAR_CAR:  
  cmp BYTE PTR[Bx], ah
  jz contar      
seguir: 
  inc Bx
  dec al
  jnz CONTAR_CAR
  jz fin
contar: 
   inc cl
   jmp seguir
fin: ret


org 2000h
mov Bx, offset mensaje
mov al, offset Cant - offset mensaje 
mov ah, 61h
mov cl,0
call CONTAR_CAR


int 0
end