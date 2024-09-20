PB equ 31h
CB equ 33h ; salida 0

EOI equ 20H
IMR equ 21h
INT0 equ  24h
INT1 equ  25h
id_int1 equ 2
id_int0 equ 4

CONT equ 10h
COMP equ 11h

org 8
  puntero1 dw AtenderTimer
org 16
  puntero2 dw AtenderF10


org 3000h
AtenderF10:
        mov al, 0ffh
        out IMR, al
        mov al, EOI
        out EOI, al
iret

AtenderTimer:   
    mov al, byte ptr[BX]
    out PB, al
    inc bx
    in al, COMP
    add al , 5
    out COMP,al
    dec cl
 mov al, EOI
 out EOI, al
iret

configF10:
          cli
          in al , IMR
            and al, 11111110b
            out IMR, al
            mov al, id_int0
            out INT0, al
            sti
            ret
configTimer: 
      cli
      in al , IMR
      and al, 11111101b
      out IMR, al
      mov al, id_int1
      out INT1, al
      mov al, 0
      out CONT, al
      mov al, 5
      out COMP, al
      sti
ret




org 1000h
cadena db "Hola!"
aux db ?
org 2000h

; configuro PB
mov  al, 0
out CB, al
mov cl, offset aux - offset cadena
mov bx, offset cadena
call configF10
call configTimer

loop: cmp cl, offset aux - offset cadena
jz fin
jnz loop

fin: 
mov al, 0
out PB, al
int 0
end