.data
str: .asciiz "AEIOUaeiou"
vocal: .ascii "x"
.text

daddi $sp, $0, 0x400


daddi $a0, $0, str
lbu $a1, vocal($0)
jal es_vocal

halt

es_vocal: daddi $sp,$sp, -8
         sd $ra, 0($sp)
         jal recibe
         beqz $v0, noEsvocal
         daddi $v0,$0,1
         j fin
noEsvocal: daddi $v0,$0,0
        j fin

fin: ld $ra, 0($sp)
     daddi $sp, $sp, 8
     jr $ra

recibe: 
loop: lbu $t0, 0($a0)
      beq $t0, $a1, encontre
      daddi $a0, $a0, 1
     bnez $t0, loop
     daddi $v0, $v0,0
     j fin
encontre: daddi $v0, $v0,1
            j fin
fin: jr $ra