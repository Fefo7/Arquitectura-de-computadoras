EOI equ 20h
IMR equ 21H
INT0 equ 24h
id_int0 equ 4

Dato equ 40h
Estado equ 41h



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

AtenderF10: 
  mov bx, offset numero
  mov bx, [bx]
  push bx
  call Descender
  mov al, EOI
  out EOI,al
  pop bx
  iret

poll: push ax
      in al, Estado
      and al, 00000001b
      jnz poll
      pop ax
      ret

Descender: 
        mov bx, sp
        add bx, 2
        mov al, [bx]
     aca: call poll
      out Dato, al
      dec al
      cmp al, 2Fh
      jnz aca
      ret

Leer_digito: mov bx, offset texto
             mov al, offset numero  - offset texto  
            int 7
            mov bx, offset numero
            int 6

            cmp byte ptr [bx], 31h
            JNS sigo
            sigo: cmp byte ptr [bx], 39H
                  jns Leer_digito
ret




org 1000h
texto db "INGRESE UN NUMERO DEL 1 AL 9: "
numero db ?

org 2000h
call Leer_digito
call configF10




lazo: jmp lazo



int 0
end