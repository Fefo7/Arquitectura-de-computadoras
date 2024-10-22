.data
cadena: .asciiz "ArquiTectuRa de ComPutaDoras"
LONGITUD: .word 0

.text
daddi $t0, $0,0
daddi $t1, $0,0
daddi $t2, $0,0
daddi $t0, $0, cadena

loop: lbu $t1, 0($t0)
    beq $t1, $0 , fin
    daddi $t2, $t2,1
    daddi $t0, $t0, 1
    j loop

fin: sd $t2, LONGITUD($0)
     halt
