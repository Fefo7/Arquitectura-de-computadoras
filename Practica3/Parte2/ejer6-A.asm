;a) Conteo regresivo ⭐⭐: Escribir un programa que implemente un conteo regresivo a partir de un valor
;(de 1 a 9) ingresado desde el teclado. El conteo debe comenzar al presionarse la tecla F10. El tiempo
;transcurrido debe mostrarse en pantalla, actualizándose el valor cada segundo. Por ejemplo, si se
;ingresa el valor 7, cuando se apreta F10 debe mostrarse en pantalla “7 6 5 4 3 2 1 0” en los 7 segundos
;siguientes



EOI equ 20H
IMR EQU 21H
INT0 equ 24H
INT1 equ 25h
CONT equ 10H
COMP equ 11H

F10 equ 10
TIMER equ 20

org 40
  puntero dw  AtenderF10

org 80
 puntero2 dw  AtenderTimer

org 3000H
IngresoDatos: mov bx, offset msj
  mov al, offset valor - offset msj
  int 7
  mov bx, offset valor
  int 6
  ret
ConfigurarF10: 
  cli
    mov al, 11111110b
    out IMR , al
    mov al, F10
    out INT0, al
  sti
  ret

ConfigurarTimer: 
    cli
        ; pic para el timer
        in al,IMR 
        and al, 11111101b
        out IMR, al
        mov al, TIMER
        out INT1, al
        ; configurar el timer 
        mov al, 0
        out CONT, al
        mov al, 1
        out COMP, al
    sti
    ret
  
AtenderF10: 
  call ConfigurarTimer
  mov al, EOI
  out EOI ,al
  iret

AtenderTimer:
     
    mov al, 1
     loopAca: int 7
        dec  byte ptr[BX]
        cmp byte ptr [bx], 2Fh
        jnz loopAca
    mov al, EOI
    out EOI, al
    iret


  

org 1000H
  CodASCI db 30H
  msj db "ingrese un valor entre 1 y 9: "
  valor db ?
  

org 2000h
  call IngresoDatos
  call ConfigurarF10


loopP: jmp loopP

 

fin: int 0
end

