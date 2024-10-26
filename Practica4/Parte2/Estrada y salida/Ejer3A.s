.data
control: .word 0x10000
data: .word 0x10008

.text
ld $t0, control($0)
ld $t1, data($0)

daddi $t2, $0, 8
sd $t2, 0($t0)
ld $t3, 0($t1)

sd $t2, 0($t0)
ld $t4, 0($t1)

dadd $t5, $t3, $t4

sd $t5, 0($t1)
daddi $t2, $0, 1
sd $t2, 0($t0)


halt