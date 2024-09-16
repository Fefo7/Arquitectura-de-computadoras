;Modificar a) de modo que el string a imprimir se lea desde teclado. El string a leer tiene una longitud
;fija de 10 caracteres, y se lee de forma completa antes de comenzar la impresión. Tener en cuenta
;entonces que las interrupciones deben esperar a que se ingrese todo el string

EOI equ 20H
IMR equ 21h
INT2 equ 26H
ID_int2 equ 4
ESTADO equ 41h
DATO equ 40H

org 16
  puntero dw Atender

org 3000H
configurarPic: 
cli
  mov al, 0FBH
  out IMR, al
  mov al, ID_int2
  out INT2, al
  in al, ESTADO
  or al, 80H
  out ESTADO, al
sti
ret

Atender:
  mov al, [bx]
  out DATO, al
  ; desactivo las INTERRUPCIONES
  mov al, 0FFH
  out IMR,al
  inc bx
  dec cl
  jnz Atender
  jz fin
fin: mov al, EOI
out EOI, al
iret

org 1000H

msj db ?

org 2000H
mov cl, 10
mov bx, offset msj
aca: int 6
inc bx
dec cl
jnz aca

mov cl, 10
mov bx, offset msj

call configurarPic
loop: jmp loop
int 0
end