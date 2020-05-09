ori $4, 100
jal loop1
nop

loop1:
	nop
	ori $4,$31,0xffff
nop
nop
nop
nop

ori $5, 100
jal loop2
nop
loop2:
	ori $5,$31,0xffff
nop
nop
nop
nop

ori $t6, 100
jal loop3
ori $6,$31,0xfff0
loop3:
	nop
nop
nop
nop
nop
