;Escribir un programa que imprime “INGENIERIA E INFORMATICA” en la impresora a través del
;HAND-SHAKE. La comunicación se establece por consulta de estado (polling). Para ello, implementar
;la subrutina imprimir_caracter_hand que funcione de forma análoga a imprimir_caracter pero con el
;handshake en lugar del PIO





dato equ 40h
estado equ 41H

ORG 1000h
dato1 db "INGENIERIA E INFORMATICA"
aux db ?

org 3000H
poll:  in al,estado
        and al, 01H
        jnz poll
        ret
imprimir_caracter_hand: 
  out dato, al
  ret
  
ORG 2000H
mov cl, offset aux - offset dato1
mov bx, offset dato1

loop: 
call poll
mov al, [bx]
call imprimir_caracter_hand
inc bx
dec cl
jnz loop
jz fin

  

fin: int 0
end
