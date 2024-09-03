;Verificar Llave Escribir un programa que verifique si la llave de más a la izquierda está prendida. Si es
;así, mostrar en pantalla el mensaje “Llave prendida”, y de lo contrario mostrar “Llave apagada”. Solo
;importa el valor de la llave de más a la izquierda (bit más significativo). Recordar que las llaves se
;manejan con las teclas 0-7.

PA equ 30h
PB equ 31H
CA equ 32H
CB equ 33H
org 1000h
 msj db "Llave prendida"
 msj2 db "Llave apagada"
  aux db ?
org 2000h
;configurar bits de CA y CB
  mov AL, 0FFH
  out CA, AL
  mov al, 0
  out PA, al

  
  in al, PA
  and al,10000000b
  jz Apagada

  mov bx, offset msj
  mov al, offset msj2 - offset msj
  int 7
  jmp fin

  Apagada: 
    mov bx, offset msj2
    mov al, offset aux - offset msj2
    int 7
    jmp fin
    
  
  

  loop: jmp loop 

fin: int 0
end