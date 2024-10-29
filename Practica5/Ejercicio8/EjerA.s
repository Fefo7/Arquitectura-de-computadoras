.data
tabla: .word  5, 2,3,3,1
.text

daddi $a0, $0, tabla
daddi $a1, $0, 5

jal suma

halt



suma: 
    daddi $t2, $0,0
    loop: 
          ld $t0, 0($a0)
          dadd $t2, $t2,$t0
          daddi $a0, $a0, 8
          daddi $a1, $a1, -1
          bnez $a1, loop
    daddi $v0, $t2, 0       
    jr $ra 