jal loop1
nop
loop1:
	ori $3, 0x3008
	beq $31,$3,loop2
	nop
	ori $4, 10
loop2:

jal loop3
nop
loop3:
	beq $31,$3,loop4
	nop
	ori $5, 10

loop4:

jal loop5
nop
loop5:
	ori $3, $0, 0x3034
	beq $3,$31,loop6
	nop
	ori $6, 10
loop6:

jal loop7
nop
loop7:
	beq $3,$31,loop8
	nop
	ori $7, 10

loop8:


