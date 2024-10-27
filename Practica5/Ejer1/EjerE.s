.data
control: .word 0x10000
data: .word 0x10008


.text
ld $s0, control($0)
ld $s1, data($0)
daddi $t0, $0, 8

sd $t0, 0($s0)  # pido la base
ld $a0, 0($s1)
sd $t0, 0($s0) # pido el exponente
ld $a1, 0($s1)
jal potencia

daddi $t0, $0, 1
sd $v0, 0($s1)
sd $t0, 0($s0)

halt

potencia: daddi $v0, $zero, 1
    lazo: beqz $a1, terminar
          daddi $a1, $a1, -1
          dmul $v0, $v0, $a0
          j lazo

terminar: jr $ra
