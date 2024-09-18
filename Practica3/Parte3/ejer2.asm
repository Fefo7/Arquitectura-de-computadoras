;Escribir un programa que al presionar F10 encienda todas las luces, y al presionarlo
;nuevamente las apague. El programa nunca termina.

EOI equ 20h
IMR equ 21h

INT0 EQU  24h
id_int0 equ 4

PA equ 30H
PB equ 31h
CA equ 32H
CB equ 33H

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
  configLuces:
      mov al, 0ffH
      out CA, al
      mov al, 0
      out CB, al
      ret
    
AtenderF10: in al, PB
            and al, 11111111b
            jz Apagada
            jnz Encendida

            Apagada: mov al, 0ffH
                out PB, al
                jmp salir
            Encendida: mov al, 0
                out PB, al
                jmp salir
                
              
           salir: mov al, EOI
            out EOI,al
            iret

    

org 2000h
call configLuces
call configF10


loop:jmp loop
  



INT 0
END