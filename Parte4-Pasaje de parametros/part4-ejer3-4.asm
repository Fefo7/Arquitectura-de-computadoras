;Recibe la dirección de comienzo de un string en BX, su longitud en
;AL. Recorre el string, cambiando a minúscula las letras que sean mayúsculas. No retorna nada, sino
;que modifica el string directamente en la memoria

org 1000H
msj db "Hola, Buenas Tardes"
cantL db 0
maxZ db 5Ah
maxzm db 7Ah
result dw 0

org 3000H
ParseMinus:
mov dl, maxZ
sub dl, ah
mov dh, maxzm
sub dh, dl
mov al, dh
ret


ChangeToMinus:
  cmp byte ptr[bx], 41h   
  jns comprobar 
continuar: inc bx
  dec al
  jz fin
  jnz ChangeToMinus

  comprobar: 
  cmp byte ptr[bx],5Ah
  jns continuar
  js buscarRango 
buscarRango:
   mov ah, [bx]
   call ParseMinus
  mov byte ptr[bx], al
  jmp continuar
fin:ret

org 2000h
mov al, offset cantL - offset msj
mov bx, offset msj

call ChangeToMinus

  
int 0
end