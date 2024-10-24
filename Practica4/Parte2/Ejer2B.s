.data
Control: .word 0x10000
Data: .word 0x10008
cadena: .asciiz "Ingrese una clave de 4 caracteres"
clave: .asciiz "fede"
str: .asciiz " "



.text
ld $t0, Control($0)
ld $t1, Data($0)
#imprimir las cadena de texto
daddi $t2, $0, cadena
sd $t2, 0($t1)
daddi $t2, $0, 4
sd $t2, 0($t0)

intruso: daddi $t3, $0, 4 # iteraciones
daddi $t4, $0, 9 # code para leer char
daddi $t2, $0, 0 # desplazmiento para el vector de chars


loop: sd $t4, 0($t0)
      lbu $t5, 0($t1)
      sb $t5, str($t2)
      daddi $t2, $t2, 1
      daddi $t3, $t3, -1
      bnez $t3, loop

daddi $t2, $0, 0 # desplazmiento para el vector de str
daddi $t4, $0, 0 # desplazmiento para el vector clave
daddi $t3, $0, 4 
while: lbu $t5, str($t2)
       lbu $t6, clave($t4)
       bne $t5,$t6, intruso
       daddi $t2, $t2, 1
       daddi $t4, $t4, 1
       daddi $t3, $t3, -1
       beqz $t3, fin
       j while


fin: 
    halt