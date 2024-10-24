.data
control: .word 0x10000
data: .word 0x10008
superficie: .word 0


.text
ld $t0, control($0)
ld $t1, data($0)

# obtener los dos datos para la superficie
daddi $t2, $0,8
sd $t2, 0($t0)
ld $t3, 0($t1)

sd $t2, 0($t0)
ld $t4, 0($t1)

daddi $t6, $0, 2

dmul $t5, $t3,$t4
ddiv $t5, $t5, $t6

sd $t5, superficie($0)

halt