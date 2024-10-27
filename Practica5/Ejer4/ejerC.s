.data
base: .word 4
exponente: .word 5
result: .word 0

.text
daddi $sp, $0, 0x400
daddi $sp, $sp, -16


daddi $t0, $0, base
daddi $t1, $0, exponente

sd $t0, 0($sp)
sd $t1, 8($sp)


jal potencia
sd $v0, result($zero)

halt


potencia: daddi $v0, $zero, 1
          ld $t3, 0($sp) # base
          ld $t0, 0($t3)
          ld $t4, 8($sp) # exponente
          ld $t1, 0($t4)
    lazo: beqz $t1, terminar
          daddi $t1, $t1, -1
          dmul $v0, $v0, $t0
          j lazo

terminar: jr $ra
