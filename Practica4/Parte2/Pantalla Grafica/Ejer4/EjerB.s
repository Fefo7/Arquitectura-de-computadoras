.data
coorX: .byte 24 # coordenada X de un punto
coorY: .byte 24 # coordenada Y de un punto
color: .byte  0, 0, 0, 0 # color: máximo rojo + máximo azul => magenta
CONTROL: .word 0x10000
DATA: .word 0x10008


.text
.code
ld $t0, CONTROL($zero) 
ld $t1, DATA($zero) 

daddi $t3, $0, 256
daddi $t4, $0, 0
lbu $t2, coorX($zero) 
      sb $t2, 5($t1) 
      lbu $t2, coorY($zero) 
      sb $t2, 4($t1) 
loop: 
      lwu $t2, color($0) 
      sw $t2, 0($t1)    
      daddi $t2, $0, 5 
      sd $t2, 0($t0)
      daddi $t4, $t4, 1
      sd $t4, color($0)
      daddi $t3, $t3, -1
      bnez $t3, loop




halt
