EOI equ 20H
IMR equ 21h
INT0 equ 24H
id_INT0 equ 4

PA equ 30H
PB equ 31h
CA equ 32h
CB equ 33h

org 16
  puntero dw AtenderF10

org 3000h
configF10: 
cli
    mov al, 11111110b
    out IMR, al
    mov al, id_INT0
    out INT0,al
sti
ret

AtenderF10:
mov bx, offset msj
loop: call poll
mov al, [bx]
call imprimir_caracter 
call flanco_ascendente
inc bx
dec cl
jnz loop
jz chau
chau: mov al, EOI
out EOI, al
Iret

ini_pio: 
  ;Configuro impresora
  mov al, 01h
  out CA, al
  mov al, 00H
  out CB, al
  RET
  
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
poll:  in al,PA
        and al, 01H
        jnz poll
        ret


org 1000h
msj db ?




org 2000h
call configF10
call ini_pio
mov cl, 0
mov bx, offset msj
aca: int 6 
    inc bx
    inc cl
jmp aca


int 0
end

