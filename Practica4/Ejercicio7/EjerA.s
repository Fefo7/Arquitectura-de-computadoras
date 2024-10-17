.data
V: .word  -1,2,-3,-4,5,6,7,-8,9,10
pos: .word 0
max: .word 0


.text
dadd $t1, $t1, $0
daddi $t2, $0, 10 ; es el cl
daddi $t5, $0, -1
ld $t4, pos($0)


loop: ld $t0, V($t1)  
      slt $t7, $t5, $t0
      bnez $t7, CambiarMaximo
     sigo: slti $t3, $t0, 0 ; si el valor es menor al inmediato
      bnez $t3, NoPositivo 
      daddi $t4, $t4, 1

NoPositivo: daddi $t2, $t2, -1
            beqz $t2, fin
            daddi $t1, $t1, 8
            j loop
CambiarMaximo: dadd $t5,$0,$t0

                j sigo

fin: sd $t4, pos($0)  
     sd $t5, max($0)
 halt