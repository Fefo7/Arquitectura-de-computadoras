.data
A: .word 8
B: .word 0 # 1 si es impar y 0 si es par


.text
ld $t0, A($0)
daddi $t1,$t1, 1
daddi $t3,$t3, 2

loop: beqz $t0, esPar  
      andi $t2, $t0, 1 # Verificar si $t0 es impar
      beq  $t2, $t1, esImpar
      ddiv $t0, $t0 ,$t3 
      j loop
esPar:
    dadd $t4,$t4,$0
    sd $t4, B($0)
    j fin

esImpar:
    daddi $t4,$t4,1
    sd $t4, B($0)
    j fin

fin:
    halt