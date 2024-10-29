#cant_vocales Usando la subrutina escrita en el ejercicio anterior, cant_vocales recibe una cadena
#terminada en cero y devuelve la cantidad de vocales que tiene esa cadena.
.data
str: .asciiz "AEIOUaeiou"
texto: .asciiz "Hola MUndo"
.text

daddi $sp, $0, 0x400
daddi $a2, $0, texto
jal cant_vocales
halt

cant_vocales: daddi $t1, $0, 0 #contador de vocales
              daddi $sp,$sp, -8
              sd $ra, 0($sp)
       loopC: 
             lbu $a1, 0($a2)
             beqz $a1, fin
             jal es_vocal
             bnez $v0, contar
             daddi $a2, $a2, 1
             j loopC

    contar: daddi $t1,$t1,1
            daddi $a2, $a2, 1
            j loopC
       fin: ld $ra, 0($sp)
            daddi $sp, $sp, 8  
            dadd $v1, $0, $t1
            jr $ra
  

es_vocal: 
         daddi $sp,$sp, -8
         sd $ra, 0($sp)
         daddi $a0, $0, str 
         jal recibe
         beqz $v0, noEsvocal
         daddi $v0,$0,1
         j finV
noEsvocal: daddi $v0,$0,0
        j finV

finV: ld $ra, 0($sp)
     daddi $sp, $sp, 8
     jr $ra

recibe: 
loopR: lbu $t0, 0($a0)
      beq $t0, $a1, encontre
      daddi $a0, $a0, 1
     bnez $t0, loopR
     daddi $v0, $0,0
     j finE
encontre: daddi $v0, $0,1
            j finE
finE: jr $ra