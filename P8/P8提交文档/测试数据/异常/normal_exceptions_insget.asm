# get Addr exceptions--4
ori $5, $0, 0x3015
jalr $6, $5
nop
nop
nop
nop
# unrecognized instruction exceptions--10
ori $6, 10
msub $5, $6


stop:
	j stop
	nop
	
.ktext 0x4180
mfc0 $10, $14
addi $10, $10, 4
mtc0 $10, $14
mfc0 $11, $13
addi $12, $12, 4
sw $11, 0($12)
eret
