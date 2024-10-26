.data
control: .word 0x10000
data: .word 0x10008
operacion: .asciiz "+-*/"
.text


ld $t0, control($0)
ld $t1, data($0)

daddi $t2, $0, 8
sd $t2, 0($t0)
ld $t3, 0($t1)

sd $t2, 0($t0)
ld $t4, 0($t1)

daddi $t2, $0, 9
sd $t2, 0($t0)
lbu $t5, 0($t1) # aca me guardo el signo de la operacion

daddi $t7, $0, 0

buscar_operacion:
    lbu $t6, operacion($t7)
    beq $t5, $t6, realizar_operacion
    daddi $t7, $t7, 1
    j buscar_operacion

realizar_operacion:
    # Realizar la operación correspondiente usando índices
    daddi $t5, $0, 0 # '+'
    beq $t7, $t5, suma
    daddi $t5, $0, 1 # '-'
    beq $t7, $t5, resta
    daddi $t5, $0, 2 #  '*'
    beq $t7, $t5, multi
    daddi $t5, $0, 3 # '/'
    beq $t7, $t5, division

 

# suma dos numeros y depues los muestra
suma: dadd $t7, $t3, $t4
      j fin
resta: dsub $t7, $t3, $t4
      j fin
multi: dmul $t7, $t3, $t4
      j fin
division: ddiv $t7, $t3, $t4
      j fin

fin: sd $t7, 0($t1)
     daddi $t2, $0, 1
     sd $t2, 0($t0)
     halt
