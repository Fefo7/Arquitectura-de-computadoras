.data
result: .word 0

.text
daddi $sp, $0 , 0x400

daddi $a1, $0 ,2 # n
daddi $a2, $0 ,2 # m
jal  Combinatorio
sd $v0, result($0)

halt

Combinatorio: daddi $sp, $sp, -8
              sd $ra, 0($sp)
              dadd $a0, $0, $a1    
              jal factorial
              dadd $s0, $0, $v0  # !a1

              dadd $a0, $0, $a2  
              jal factorial
              dadd $s2, $0, $v0 # !a2
              
              dsub $t3, $a1, $a2 #n-m
              dadd $a0, $0, $t3  
              jal factorial
              dadd $s3, $0, $v0 # ! n-m
              
              dmul $v0, $s0, $s3
              ddiv $v0, $s2, $v0
              ld $ra, 0($sp)
              daddi $sp, $sp, 8
              jr $ra
               


factorial: daddi $t0, $0, 1
    loop: beqz $a0, terminar
          dmul $t0, $t0, $a0
          daddi $a0, $a0, -1
          bnez $a0, loop
terminar: dadd $v0, $t0, $0
          jr $ra