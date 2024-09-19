;Escribir un programa que debe leer el estado de las llaves y enviarlo a una subrutina.
;La subrutina debe llamarse LUCES12 y recibe el estado por referencia a través de la pila. Si el estado indica
;que la llave 7 (la de más a la izquierda) está prendida entonces debe encender todas las luces por 12
;segundos y luego apagar todas las luces. En caso contrario no debe hacer nada.
EOI equ 20h
IMR equ 21H

id_timer equ 2
INT1 equ 25h
CONT EQU 10H
COMP equ 11H


PA equ 30H
PB  equ 31H
CA equ 32H
CB equ 33H



org 8
  punter dw AtenderTimer
org 3000h
    configLlaves: 
          mov al,0ffh
          out CA,al
          mov al, 0
          out CB,al
          ret
    configTimer:
    cli
        mov al, 11111101b
        out IMR, al
        mov al, id_timer
        out INT1, al
    sti
    ret
    AtenderTimer: 
                MOv al, 0H
                out PB, al
                mov al, EOI
                out EOI, al
                iret
    
    LUCES12: push AX
            mov bx, sp
            add bx ,4
            mov ax, [bx]
            mov bx, ax
            and byte ptr [bx] , 10000000b
            jnz aca
            jz fin
            aca: mov al, 0ffh
                  out PB, al
                  mov al, 0
                  out cont, al
                  mov al, 12
                  out COMP, al
                  jmp fin
            fin: pop ax
            ret
        
          

org 1000h
 time db 12
 estado db ?
 
org 2000h
call configLlaves
call configTimer
  mov ax, 0
 out PA, al
 out PB, al

 loop: in al, PA
 and al, 10000000b
 jnz aca2
 jz loop
 aca2: mov estado, al
 mov bx, offset estado
 push bx
 call LUCES12
  
 
 lazo:jmp lazo
int 0
end