org 1000H
mensaje db "Hola, Buenas Tardes"
cant db 0

org 2000h
mov Cx, offset Cant - offset mensaje 
mov Bx, offset mensaje
loop: 
  cmp BYTE PTR[Bx], 61h
  jz contar      
seguir: 
  inc Bx
  dec Cx
  jnz loop
  jz fin
contar: 
   inc cant
   jmp seguir
fin: 
  hlt
end