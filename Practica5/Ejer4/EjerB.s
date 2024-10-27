.data
base: .word 4
exponente: .word 5
result: .word 0

.text
daddi $sp, $0, 0x400
daddi $sp, $sp, -16

ld $t0, base($0)
ld $t1, exponente($0)

sd $t0, 0($sp)
sd $t1, 8($sp)


jal potencia
sd $v0, result($zero)

halt


potencia: daddi $v0, $zero, 1
          ld $t0, 0($sp) # base
          ld $t1, 8($sp) # exponente
    lazo: beqz $t1, terminar
          daddi $t1, $t1, -1
          dmul $v0, $v0, $t0
          j lazo

terminar: jr $ra
