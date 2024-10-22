.data
A: .word  8
B: .word  2
S: .word 0
P: .word 0
D: .word 0


.text
ld $t0, A($0)
ld $t1, B($0)
dadd $t2, $t0,$t1
dmul  $t3, $t0,$t1
ddiv $t4, $t0,$t1
sd $t2, S($0)
sd $t3, P($0)
sd $t4, D($0)
