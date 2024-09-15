PA equ 30H
PB equ 31H
CA equ 32H
CB equ 33H

org 1000h
msj db "UNLP"
send db 0
char db 0ffH



org 3000H
signal: mov AL, send
        out PB, al
        ret
finish:mov AL, char
        out PB, al
        ret


org 2000h
; configuracion 
mov al, 0
out CB , al
mov cl, offset send - offset msj
mov BX, offset msj
loop: call signal
      Mov al, [bx]
      out PB, al
      inc bx
      dec cl
      jnz loop
call signal

int 0
end