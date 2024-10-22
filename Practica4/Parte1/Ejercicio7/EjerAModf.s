.data
V: .word  -1,2,-3,-4,5,6,7,-8,9,10



.text
dadd $t1, $t1, $0
daddi $t2, $0, 10 ; es el cl
daddi $t3, $0, 2 



loop: ld $t0, V($t1)  
      dmul $t4, $t0, $t3
      sd $t4, V($t1)
      daddi $t2, $t2, -1
      beqz $t2, fin
      daddi $t1, $t1, 8
      j loop



 fin: halt