;Imprimir mensaje leído Escribir un programa que solicita el ingreso de cinco caracteres por teclado y
;los envía de a uno por vez a la impresora a través de la PIO a medida que se van ingresando. No es
;necesario mostrar los caracteres en la pantalla. Utilizar la subrutina imprimir_caracter del inciso
;anterior.


PA equ 30h
PB equ 31H
CA equ 32H
CB equ 33H
ORG 1000h
aux db ?
dato db ?

org 3000H
ini_pio: 
    ;Configuro impresora
  mov al, 01h
  out CA, al
  mov al, 00H
  out CB, al
  RET
poll:  in al,PA
        and al, 01H
        jnz poll
        ret
flanco0:in al, PA
  and al,0FdH
  out PA, al
  ret

flanco1:
  in al, PA
  or al,02H
  out PA, al
  ret
flanco_ascendente: 
  ;genero flanco ascendente
  call flanco1
  call flanco0

imprimir_caracter: 
  ; guardo el dato en pb
  out PB, al
  ret
ORG 2000H
call ini_pio
mov cl, 5
mov bx, offset dato
loop2: int  6
      inc bx
      dec cl
      jnz loop2


mov cl, 5
mov bx, offset dato
loop: 
call poll
mov al, [bx]
call imprimir_caracter 
call flanco_ascendente
inc bx
dec cl
jnz loop
jz fin



fin: int 0
end