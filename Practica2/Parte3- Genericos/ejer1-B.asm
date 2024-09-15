PA equ 30H
PB equ 31H
CA equ 32H
CB equ 33H

org 1000h
send db 0
char db 0ffH



org 3000H
finish: mov AL, send
        out PB, al
        ret
listo:mov AL, char
        out PB, al
        ret
config: mov al, 0ffH
        out CA, al
        mov al, 0
        out CB , al
        ret

org 2000h
call config


loop:call listo
in al, PA
cmp al, 0
jnz loop
call finish

int 0
end