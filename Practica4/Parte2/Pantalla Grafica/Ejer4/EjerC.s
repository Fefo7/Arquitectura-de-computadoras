.data
coorX: .byte 0 
coorY: .byte 0 
color: .byte 0, 0, 255, 0 
CONTROL: .word 0x10000
DATA: .word 0x10008



.code
ld $t0, CONTROL($zero) 
ld $t1, DATA($zero)    

lwu $t2, color($0)
sw $t2, 0($t1)
lbu $t3, coorX($0) 
lbu $t2, coorY($zero) 
sb $t2, 4($t1) 
daddi $t4, $0, 49
loop:
    sb $t3, 5($t1) 
    daddi $t2, $0, 5 
    sd $t2, 0($t0) 
    daddi $t3, $t3, 1
    daddi $t4, $t4, -1
    bnez $t4, loop

halt
