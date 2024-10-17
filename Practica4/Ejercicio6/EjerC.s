.data
V: .word 5, 2, 6

.text
dadd $t4, $0, $0
daddi $t1, $0, V
daddi $t2, $0, 3 ; seria como el CL

loop: ld $t0, 0($t1) 
      dadd $t4, $t4, $t0
      daddi $t2, $t2, -1
      beqz $t2, fin
      daddi $t1, $t1, 8
      j loop

fin: halt