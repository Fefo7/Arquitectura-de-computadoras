;5) Timer, tres usos: periódico infinito, periódico finito, y única vez ⭐⭐
;b) Modificar a) para que termine a los 10 segundos.
;c) Modificar a) para que solo imprima una vez, a los 10 segundos, y luego termine.
;d) Desafío: Modificar a) para que el primer mensaje se imprima luego de 1 segundo, el segundo luego de 2
;segundos, el tercero luego de 3, y así sucesivamente, hasta que se espere 255 en el último mensaje, y el
;programa termine,

EOI equ 20H
IMR EQU 21H
INT1 equ 25h

CONT equ 10H
COMP equ 11H

org 4
  puntero dw  subrutina

org 3000H

subrutina: mov al, 0
           out CONT,al
           mov bx, offset msj
           mov al, offset aux - offset msj
           int 7
           mov al, EOI
           out EOI, al 
           inc cl
          iret

org 1000H
  msj db "vamos las interrupciones!"
  aux db ?

org 2000h
cli
;configurar el pic
mov al, 11111101B
out IMR, al
mov al, 1
out INT1, al


;configurar el timer 
mov al, 0
out CONT, al
mov al, 2
out COMP, al
sti
mov cl, 0
loop: cmp cl, 10
jz fin
jnz loop







fin: int 0
end

