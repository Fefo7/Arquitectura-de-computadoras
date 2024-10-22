.data
N: .word 4
F: .word 1 

.text
main:
    ld $t0, N($0)  
    daddi $t1, $0, 1  

loop:
    beqz $t0, end  
    dmul $t1, $t1, $t0  
    daddi $t0, $t0, -1  
    bnez $t0, loop 

end:
    sd $t1, F($0)  
    halt  
 