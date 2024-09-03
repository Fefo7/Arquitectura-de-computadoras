;Escribir un programa que tenga dos valores de 8 bits A y B almacenados en su memoria y realice la
;multiplicación de A y B. El resultado se debe guardar en la variable RES de 16 bits, o sea que RES = A ⨯ B.
;Para hacerlo, implementar una subrutina MUL:
;A. Pasando los parámetros por valor desde el programa principal a través de los registros AL y
;AH, y devolviendo el resultado a través del registro AX por valor.

org 1000H
A db 3
B db 6
res dw 0

org 3000H
mul:
  dec al
loop: 
  add ah,  ah
  dec al
  jnz loop
ret



org 2000H
mov al, A
mov ah, B

call mul

int 0
end