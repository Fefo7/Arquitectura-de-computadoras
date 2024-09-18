;Ruleta, F10 y azar ⭐⭐ Escribir un programa que permita seleccionar un dígito al azar para jugar a la
;ruleta. Para eso, el programa principal debe iterar continuamente, cambiando un valor de un registro desde
;el ‘0’ hasta el ‘9’ (y volviendo al ‘0’ luego del ‘9’). Cuando se presiona F10, la letra queda “seleccionada” en
;base al valor del registro, y debe mostrarse de inmediato en la pantalla. Luego el programa termina

EOI equ 20H
IMR equ 21H

INT0 equ 24h
id_int0 equ 4

org 16
  puntero dw AtenderF10
org 3000h
configF10: 
      cli
      mov al, 11111110b
      out IMR, al
      mov al, id_int0
      out INT0, al
      sti
      ret

AtenderF10: 
      mov dl, 00000001B ; simulo el IRR 
      mov al, 1
      int 7
       
  mov al, EOI
  out EOI, al
  iret
  


org 1000h
num db 30H



org 2000h
call configF10

NoHay: 
  mov cl, 9
  mov bx, offset num
Loop: inc byte ptr[bx]
  and dl, 11111111b
  jnz fin
dec cl 
jnz loop
jz NoHay






fin: int 0
end

