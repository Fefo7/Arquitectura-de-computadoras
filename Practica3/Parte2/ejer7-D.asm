;Modificar b) de modo que cuando se presione F10 se cancele la impresión. En tal caso, deben
;desactivarse las interrupciones del HANDSHAKE para evitar que se envíen más caracteres a imprimir

EOI equ 20H
IMR equ 21h
INT2 equ 26H
INT0 equ 24h
ID_int2 equ 4
ID_int0 equ 2
ESTADO equ 41h
DATO equ 40H

org 8
 puntero1 dw AtenderF10
org 16
  puntero dw Atender

org 3000H
configurarPic: 
cli
  mov al, 11111010b
  out IMR, al
  mov al, ID_int2
  out INT2, al
  mov al, ID_int0
   out INT0, al
  in al, ESTADO
  or al, 80H
  out ESTADO, al
sti
ret
Atender:
  mov al, [bx]
  out DATO, al
  inc bx
  dec cl
  jnz fin
   mov al, 0FFH
  out IMR,al
fin: mov al, EOI
out EOI, al
iret

AtenderF10: 
 mov al, 0FFH
  out IMR,al
  mov al, EOI
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
loop: 
  jnz loop
int 0
end