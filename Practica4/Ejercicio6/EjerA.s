.data
V: .word 5, 2, 6
S: .word 0

.text
dadd $t0, $t0, $0
ld $t1, 0($t2)
ld $t3, 8($t2)
ld $t4, 16($t2)

dadd $t0, $t1,$t3
dadd $t0, $t0, $t4

sd $t0, S($0)
halt