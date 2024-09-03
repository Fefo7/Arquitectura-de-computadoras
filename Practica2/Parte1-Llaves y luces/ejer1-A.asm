;Patrón de Luces Fijo Escribir un programa que encienda las luces con el patrón 11000011, o sea, solo
;las primeras y las últimas dos luces deben prenderse, y el resto deben apagarse.

PA equ 30h
PB equ 31H
CA equ 32H
CB equ 33H
org 1000h

  
org 2000h
  mov aL,  11000011b
  out PB,  al

  loop: jmp loop 

int 0
end