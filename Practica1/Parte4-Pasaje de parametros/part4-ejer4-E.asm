;Escribir un programa que tenga dos valores de 8 bits A y B almacenados en su memoria y realice la
;multiplicación de A y B. El resultado se debe guardar en la variable RES de 16 bits, o sea que RES = A ⨯ B.
;Para hacerlo, implementar una subrutina MUL:
;E.Pasando los parámetros por referencia desde el programa principal a través de la pila, y
;devolviendo el resultado a través de un registro por valor.


org 1000H
A dw 3
B dw 2
res dw 0

org 3000H
mul:  
  mov bx, sp ; salvo el sp y hago push a la direccion vuelta
  ; obtengo los parametros
  add bx, 2
  
  mov cx, [bx]
  add bx, 2
  mov dx, [bx]
  
  mov bx, cx
  mov cx, [bx]
  mov bx, dx
  mov dx, [bx]

  dec cl
loop: 
  add dl,  dl
  dec cl
  jnz loop
  mov cx,dx 
ret



org 2000H
mov ax, 0
mov ax, offset A
push ax
mov ax, offset B
push ax
call mul
pop ax
pop ax

int 0
end