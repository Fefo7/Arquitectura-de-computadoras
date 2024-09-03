;2) Verificación del bit busy ⭐
;El siguiente programa tiene como objetivo verificar el bit de busy a través del PIO e imprimir “Ocupada” si la
;impresora está ocupada y “Libre” de lo contrario.
;a) Complete el código para que el programa funcione correctamente.
;b) Modifique el código para que el programa no imprima “Ocupada”. En lugar de eso, el programa debe
;esperar a que el bit de busy sea 0 usando consulta de estado. Cuando eso suceda, imprimir “Libre” y
;terminar el programa.

PA EQU 30h
CA EQU 32h
ORG 1000h
si db "Ocupada"
no db "Libre"
ORG 2000H
mov al, 01h
out CA, al
in al, PA
and al, 01H
jnz ocupada
libre: mov bx,offset no
mov al, 5
int 7
jmp fin
ocupada: in al,PA
        and al, 01H
        jnz ocupada
        jz libre

fin: int 0
end