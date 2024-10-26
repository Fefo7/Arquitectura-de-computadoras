.data
control: .word 0x10000 
data: .word 0x10008
color: .byte  0,255,0,0
X: .byte 0
Y: .byte 0


.text
ld $s0, control($0)
ld $s1, data($0)
lwu $t0, color($0) # cargo el color
sw $t0, 0($s1)

lbu $s2, X($0)
lbu $s3, Y($0)  

daddi $t2, $0, 5 # para enviar en control
daddi $t4, $0, 50 #iteraciones X
#daddi $s2, $s2, 1
loop1: daddi $t3, $0, 50 #iteraciones de Y
       daddi $s3, $0, 0
       sb $s2, 5($s1)  #cargo X
loop2: 
      sb $s3, 4($s1)  #cargo Y
      sd $t2, 0($s0)  
      daddi $s3, $s3, 1
      daddi $t3, $t3, -1
      beqz $t3, IncrementarX
      j loop2

IncrementarX: daddi $s2, $s2,1
              daddi $t4, $t4, -1
              bnez $t4, loop1


halt