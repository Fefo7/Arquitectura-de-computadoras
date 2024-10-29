.data
tabla: .word  -5, 2,3,3,1
.text
daddi $sp, $0, 0x400
daddi $a2, $0, tabla
daddi $a1, $0, 5

jal suma

halt



suma: daddi $sp, $sp, -8
      sd $ra, 0($sp) 
      daddi $t2, $0,0
    loop: 
          ld $t0, 0($a2) # obtengo el valor
          daddi $a0, $t0, 0
          jal esPositivo
          bnez $v0, contar 
    sigo: daddi $a2, $a2, 8 # suma la direccion
          daddi $a1, $a1, -1
          bnez $a1, loop
   finS: ld $ra, 0($sp)
    daddi $sp, $sp, 8
    daddi $v0, $t2, 0
    jr $ra 

contar: daddi $t2, $t2, 1 # cuento los positivos
            j sigo

# positivo da 1 y si es negativo da 0
esPositivo: slti $t7,$a0,0   #si es negativo m1e da , si no 0
            beqz $t7, positivo
            daddi $v0, $0, 0
            j finE
    positivo: daddi $v0, $0, 1
 finE: jr $ra
