;Calcular la suma de los 3 valores utilizando un lazo con la dirección base y un registro como desplazamiento. Pista:
;Idem anterior, pero ahora con una única instrucciones de lectura y $t2 se incrementa dentro de un loop

.data
V: .word 5, 2, 6

.text
dadd $t1, $t1, $0
daddi $t2, $t2, 3 ; seria como el CL

loop: ld $t0, V($t1) 
      dadd $t1, $t1, $t0
      daddi $t2, $t2, -1
      beqz $t2, fin
      daddi $t1, $t1, 8
      j loop

fin: halt