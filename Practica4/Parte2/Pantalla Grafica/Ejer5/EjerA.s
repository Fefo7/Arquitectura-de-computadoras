.data
X: .byte 45
Y: .byte 0
color: .byte 255, 0, 0, 0
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.text
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)

lwu $t0, color($0) # cargo el color
sw $t0, 0($s1)
lbu $t1, Y($0)
lbu $t2, X($zero)
daddi $t4, $zero, 50
daddi $t5, $zero, 5

loop: 
    sb $t1, 4($s1) # le pone lo que hay en T1 a la Y
    sb $t2, 5($s1)
    daddi $t3, $zero, 5
    sd $t3, 0($s0)
    daddi $t2, $t2, 1
    bne $t4, $t2, loop

    daddi $t1, $t1, 1
    daddi $t2, $zero, 45 # reinicia X a 45 para la siguiente fila
    bne $t5, $t1, loop

halt