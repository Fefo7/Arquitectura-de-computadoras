org 1000h
pass db ?
texto db "ingrese una clave 4 digitos:"
aux db ?
clave db "fede"
bloq db "Acceso bloqueado"
bloq2 db "Acceso denegado "
succes db "Acceso permitido"
a db 0
aux2 dw ?

org 2000h
; vista de usuario
mov bx, offset texto
mov al, offset aux - offset texto
int 7

mov dh, 4
mov cx, 5
; pedir 4 teclas
mov aux2, offset clave
loop: 
mov bx, offset aux
int 6
mov bx, aux2
mov dl, [bx]
cmp aux, dl
jz mach
jnz noMach


mach:
mov bx, aux2
inc bx
mov aux2, bx
dec dh
jz entra
jmp loop

noMach:
mov bx, offset bloq2
mov al, offset succes - offset bloq2
int 7
mov dh, 4
dec cx
mov aux2, offset clave
jz bloqueado
jnz loop

entra: 

mov bx, offset succes
mov al, offset a - offset succes
int 7
jmp fin

bloqueado:
mov bx, offset bloq
mov al, offset bloq2 - offset bloq
int 7

fin: int 0
end