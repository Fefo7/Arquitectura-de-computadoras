;Recibe un carácter mayúscula en AL y lo devuelve como minúscula
org 1000H
c db "D"
maxZ db 5Ah
maxzm db 7Ah
result dw 0

org 3000H
ParseMinus:
mov dl, maxZ
sub dl, al
mov dh, maxzm
sub dh, dl
mov al, dh
ret

org 2000h
mov al, c
call ParseMinus





hlt
end