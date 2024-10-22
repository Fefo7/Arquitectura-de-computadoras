.data
N: .word 64
L: .word 0


.text
ld $t0, N($0) # esto es 8
daddi $t3, $t3, 0 #inicializo el contador del log
daddi $t1, $t1, 2 #  para dividir

loop: daddi $t3, $t3, 1 
      beq $t0, $t1, end
      ddiv $t0, $t0,$t1
      j loop

end:
    #almacenar dato

    sd $t3, L($0)
    halt


