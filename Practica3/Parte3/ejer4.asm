;Escribir un programa que debe mostrar en pantalla el mensaje
;“PRESIONE F10 PARA COMENZAR” y una vez que el usuario presiona F10, leer de teclado un mensaje de
;10 caracteres. Este mensaje debe luego ser enviado a través de la pila a una subrutina para imprimirse en la
;impresora mediante el PIO. La configuración del PIO también debe hacerse en una subrutina aparte
EOI equ 20H
IMR equ 21h

INT0 equ 24h
id_F10 equ 4

PA equ 30H
PB equ 31H
CA equ 32h
CB equ 33H
org 16
  puntero dw AtenderF10

org 3000h
  configF10: push ax 
  cli
    mov al, 11111110b
    out IMR, al
    mov al, id_F10
    out INT0, al
  sti
  pop ax
  ret
  configImpresora: push ax
      mov al, 01h
      out CA, al
     mov al, 0
     out CB, al
     pop ax
    ret
    
  AtenderF10: push AX
        push bx
      mov cl, caracteres
     loop: int 6
      inc bx
      dec cl
      jnz loop
      jz fin
      fin:
      mov al, EOI
      out EOI, al
       pop bx
      pop AX
      mov al, 01H
     
  iret
  
  poll: in al,PA
        and al, 01H
        jnz poll
        ret
  flanco: 
        call flanco0
        call flanco1
        ret
  flanco0:in al, PA
  and al,0FdH ;1111 1101
  out PA, al
  ret
  flanco1:
  in al, PA
  or al,02H
  out PA, al
  ret

  Imprimir: 
    mov cl, caracteres
    mov bx, sp
    add bx, 2
    mov dx, [bx]
    mov bx, dx
   loop2:
     call poll
    mov al,[bx]
    out PB, al
    call flanco
    inc bx
    dec cl
    jnz loop2
    ret
    
  

org 1000h
  caracteres  db 10
  msj db ?
  

ORG 2000h
mov ax,0
mov bx, offset msj
call configImpresora
call configF10


lazo: and al, 01
      jz lazo
      jnz aca
aca: 
    push bx
    call Imprimir



INT 0
END