.data
V: .word  0,1



.text
dadd $t1, $t1, $0
daddi $t2, $0, 8 ; es el cl
daddi $t3, $0, 0
daddi $t4, $0, 8


loop: ld $t0, V($t1)  
      ld $t5, V($t4)  
      dadd $t3,$t0, $t5
      daddi $t1,$t1,8
      daddi $t4,$t4,8
      sd $t3, V($t4)
      daddi $t2, $t2, -1
      beqz $t2, fin
      j loop



 fin: halt