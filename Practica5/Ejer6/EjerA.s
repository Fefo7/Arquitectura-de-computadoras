.data
result: .word 0

.text

daddi $a0, $0 ,4
jal  factorial
sd $v0, result($0)

halt

factorial: daddi $t0, $0, 1
    loop: beqz $a0, terminar
          dmul $t0, $t0, $a0
          daddi $a0, $a0, -1
          bnez $a0, loop
terminar: dadd $v0, $t0, $0
          jr $ra