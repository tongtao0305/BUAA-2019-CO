ori $3,0xfc01
mtc0 $3,$12

start:
	nop
	j start
	nop

.ktext 0x4180
	lw $4,0x7f10($0)
	sw $4,0x7f10($0)
	eret
