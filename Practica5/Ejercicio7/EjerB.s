#contiene: Recibe en $a0 la dirección de un string y en $a1 un carácter (código ascii) y devuelve en $v0 1 si
#el string contiene el carácter $a1 y 0 de lo contrario.
.data
str: .asciiz "fede"
char: .ascii "x"
.text
daddi $a0, $0, str
lbu $a1, char($0)
jal recibe
halt

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