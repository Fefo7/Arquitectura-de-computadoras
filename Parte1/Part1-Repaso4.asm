org 1000H
msj db "Hola, Buenas Tardes"
cantL db 0
maxZ dw 5Ah
maxzm dw 7Ah
result dw 0

org 2000h
mov cx, offset cantL - offset msj
mov bx, offset msj

loop:
  cmp byte ptr[bx], 41h   
  jns comprobar 
continuar: inc bx
  dec cx
  jz fin
  jnz loop

  comprobar: 
  cmp byte ptr[bx],5Ah
  jns continuar
  js buscarRango 
buscarRango:
  mov ax, maxZ
  sub al,byte ptr[bx]
  mov dx, maxzm
  sub dx, ax
  mov byte ptr[bx], dl
  jmp continuar
  
fin: hlt
end