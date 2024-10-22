.data
cadena: .asciiz "ArquiTectuRa de ComPutaDoras"
cantMayus: .word 0

# “A” es 65 - “Z” es 90.
.text
daddi $t0, $0, 65 # A
daddi $t1, $0, 91 # uno mas que Z
daddi $t2, $0, cadena
daddi $t5, $0, 0

loop: lbu $t3, 0($t2)
      beqz $t3, fin
      slt $t4, $t3, $t0 # comparo si la letra es la letra es menor a la A = 1
      beqz $t4, ComprobarZ     
      daddi $t2, $t2, 1 
      j loop


ComprobarZ: slt $t4, $t3, $t1
            beqz $t4, vuelvoLoop
            daddi $t5, $t5, 1
vuelvoLoop: daddi $t2, $t2, 1
            j loop
    
fin: sd $t5, cantMayus($0) 
    halt