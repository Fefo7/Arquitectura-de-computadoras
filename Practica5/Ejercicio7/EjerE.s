#comparar: Recibe como parámetros las direcciones del comienzo de dos cadenas terminadas en cero y 
#retorna la posición en la que las dos cadenas difieren. En caso de que las dos cadenas sean idénticas, debe
#retornar -1.


.data
cadena1: .asciiz "hola"
cadena2: .asciiz "hlla"

.text
    daddi $a0, $0, cadena1
    daddi $a1, $0, cadena2
    jal comparar
halt

comparar:
    daddi $t2, $0, 0
    loop: lbu $t0, 0($a0)
          lbu $t1, 0($a1)
          bne $t0,$t1, diferentes
          beqz $t0, fin
          daddi $a0, $a0,1 
          daddi $a1, $a1,1
          daddi $t2, $t2, 1
          daddi $v0, $0 ,-1
          j loop
    diferentes: dadd $v0, $0,$t2
                j fin           
    fin: 
     jr $ra