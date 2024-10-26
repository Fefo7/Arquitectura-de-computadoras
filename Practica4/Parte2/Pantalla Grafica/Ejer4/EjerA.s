.data
coorX: .byte 24 # coordenada X de un punto
coorY: .byte 24 # coordenada Y de un punto
color: .byte 255, 255, 0, 0 # color: máximo rojo + máximo azul => magenta
CONTROL: .word 0x10000
DATA: .word 0x10008


.text
ld $t0, CONTROL($zero) #$t0 = dirección de CONTROL
ld $t1, DATA($zero)    # $t1 = dirección de DATA

daddi $t3, $0, 8
sd $t3, 0($t0)
ld $t4, 0($t1)

sd $t3, 0($t0)
ld $t5, 0($t1)



lwu $t2, color($zero)  # $t2 = valor de color a pintar (4 bytes)
sw $t2, 0($t1)         # DATA recibe el valor del color a pintar
# $t4 = valor de coordenada X
sb $t4, 5($t1)         # DATA+5 recibe el valor de coordenada X
# $t5 = valor de coordenada Y
sb $t5, 4($t1)         # DATA+4 recibe el valor de coordenada Y
daddi $t2, $zero, 5    # $t2 = 5 -> función 5: salida gráfica
sd $t2, 0($t0)         # CONTROL recibe 5 y produce el dibujo del punto
halt
