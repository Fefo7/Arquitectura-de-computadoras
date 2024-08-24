;Escribir un programa que tenga dos valores de 8 bits A y B almacenados en su memoria y realice la
;multiplicación de A y B. El resultado se debe guardar en la variable RES de 16 bits, o sea que RES = A ⨯ B.
;Para hacerlo, implementar una subrutina MUL:
;B.Pasando los parámetros por referencia desde el programa principal a través de registros, y
;devolviendo el resultado a través de un registro por valor.

org 1000H
A db 3
B db 6
res dw 0

org 3000H
mul:
  mov dx, 0; inicializo el registro
  mov cl, byte ptr[bx]
  mov bx, ax  
  mov dh, [bx]
  dec cl
loop: 
  add dh, [bx]
  dec cl
  jnz loop
  ;dx queda con el valor en exadecimal en este caso 12 => es 18 en H
ret

org 2000H
mov ax, offset A
mov bx, offset B

call mul

int 0
end