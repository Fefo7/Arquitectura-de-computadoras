org 1000h
corte db 2Eh
intentos db 10h
letraUs db ?
contar db 0H
texto4 db "Ganaste "
texto3 db "Perdiste, el string era: "
texto2 db"Comenzá a adivinar!"
texto db "Ingresá la palabra a adivinar: "
input db ?


org 3000h
imprimir: 
mov bx,sp
add bx, 2
mov bx, [bx]
int 7
mov bx, 0Ah
mov al, 1
int 7
ret

org 2000h
mov dx, 0
mov dl, corte
mov cl, intentos

; mostrar texto
mov ax, offset texto
push ax
mov al, offset input - offset texto2
call imprimir
pop ax

mov bx, offset input
loop: int 6
inc contar
mov dh, [bx]
inc bx
cmp dh, dl
jnz loop

dec contar ;saco el .

; adivinar la palabra
mov ax, offset texto2
push ax
mov al, offset texto - offset texto2
call imprimir
pop ax


mov dx, offset input
loop2:
mov bx, offset  letraUs
int 6
mov ch, [bx]
mov bx, dx
cmp ch, [bx]
jz imprimir2
jnz Descontar


imprimir2:
mov bx, dx
inc dx
mov al, 1
int 7
dec contar
jz ganaste
dec cl
jmp loop2
 
Descontar:
  dec cl
  jz perdiste
  jnz loop2


perdiste: 
mov ax, offset texto3
push ax
mov al, offset texto2 - offset texto3
call imprimir
pop ax
mov ax, offset input
push ax
mov al, contar
call imprimir
pop ax
jmp fin
  
ganaste: 
  mov ax, offset texto4
push ax
mov al, offset texto3 - offset texto4
call imprimir
pop ax
jmp fin


fin: int 0
end