.data
control: .word 0x10000
data: .word 0x10008


.text
ld $s0, control($0)
ld $s1, data($0)
daddi $s3, $0, 0
daddi $t0, $0, 8
 

daddi $a0, $0, 2
sd $t0, 0($s0) # pido el exponente
ld $s4, 0($s1)

dadd $a1, $0, $s4
jal potencia

dadd $s3, $s3, $v0


dadd $a1, $0, $s4
daddi $a0, $0, 3
jal potencia

dadd $s3, $s3, $v0


daddi $t0, $0, 1
sd $s3, 0($s1)
sd $t0, 0($s0)

halt

potencia: daddi $v0, $zero, 1
    lazo: beqz $a1, terminar
          daddi $a1, $a1, -1
          dmul $v0, $v0, $a0
          j lazo

terminar: jr $ra
