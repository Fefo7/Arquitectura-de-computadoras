;3) Subrutina para el envío del carácter y la señal de Strobe ⭐⭐
;El envío de la señal de strobe se puede modularizar en una subrutina para ser reutilizado en distintas
;ocasiones. Implementar una subrutina 📄flanco_ascendente que envía el flanco ascendente (un 0 y luego
;un 1) a través del strobe. Asumir que el PIO ya está configurado correctamente para comunicarse con la
;impresora
PA equ 30h
PB equ 31H
CA equ 32H
CB equ 33H
ORG 1000h
dato db "a"


org 3000H
flanco_ascendente: 
  ;genero flanco ascendente
  in al, PA
  or al,02H
  out PA, al

  in al, PA
  and al,0FdH
  out PA, al
  ret

ORG 2000H
;Configuro impresora
  mov al, 01h
  out CA, al
  mov al, 00H
  out CB, al
  
  

  ; guardo el dato en pb
  mov al, 1
  out PA, al
  mov al, dato
  out PB, al

  call flanco_ascendente
  

fin: int 0
end