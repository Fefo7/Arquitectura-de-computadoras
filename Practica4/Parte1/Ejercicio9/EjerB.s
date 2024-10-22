.data
 cadena: .asciiz "adbdcdedfdgdhdid"
 car: .ascii "d"
 cant: .word 0 

.text
daddi $t0, $0, cadena 
daddi $t2, $0, car 
daddi $t3, $0,0     


loop: lbu $t1, 0($t0)
    lbu $t4,  0($t2)
    beqz $t1, fin
    beq $t1, $t4, incrementar
    daddi $t0, $t0, 1
    j loop
incrementar: 
        daddi $t3, $t3,1
        daddi $t0, $t0, 1
        j loop


fin: sd $t3, cant($0)
     halt
