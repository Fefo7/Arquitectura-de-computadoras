#a) longitud: Recibe en $a0 la dirección de un string y retorna su longitud en $v0a) 
.data 
str: .asciiz "fede"

.text
daddi $a0, $0, str
jal longitud
halt


longitud:
daddi $t0,$0, 0
loop: lbu $t1, 0($a0)
     beqz $t1, fin
 daddi $t0, $t0,1
     daddi $a0, $a0,1
     bnez $t1, loop
     
fin: daddi $v0, $t0,0
jr $ra