; Imprimir letra fija Escribir un programa para imprimir la letra “A” utilizando la impresora a través de
;la PIO. Recordar que el programa deberá esperar hasta que el bit de busy esté apagado, luego enviar el
;carácter, y luego enviar el flanco ascendente a través de la señal de strobe. Modularizar el programa en
;4 subrutinas:

;📄 imprimir_caracter: Recibe un carácter a imprimir en AL, y utilizando poll y flanco_ascendente,
;realiza todos los pasos necesarios para enviar a la impresora el carácter

PA equ 30h
PB equ 31H
CA equ 32H
CB equ 33H
ORG 1000h
dato db "a"


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
call poll
mov al, dato
call imprimir_caracter 
call flanco_ascendente

  

fin: int 0
end