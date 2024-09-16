;Escribir un programa que imprime “UNIVERSIDAD NACIONAL DE LA PLATA” en la impresora a
;través del HAND-SHAKE. El envío de los caracteres se realiza por interrupciones emitidas desde el
;HAND-SHAKE cada vez que detecta que la impresora se desocupa

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
  ; descativo las INTERRUPCIONES
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
msj db "UNIVERSIDAD NACIONAL DE LA PLATA"
aux db ?
org 2000H
mov bx, offset msj
mov cl, offset aux - offset msj
call configurarPic
loop: jmp loop
int 0
end