ori $4, 100
jal loop1
nop

loop1:
	nop
	addu $4,$4,$31
nop
nop
nop
nop

ori $5, 100
jal loop2
nop
loop2:
	addu $5,$31,$5
nop
nop
nop
nop

ori $t6, 100
jal loop3
addu $6,$31,$6
loop3:
	nop
nop
nop
nop
nop

ori $t7, 100
jal loop4
nop
loop4:
	addu $7, $7, $31
	nop
nop
nop
nop
nop	

ori $8, 100
jal loop5
addu $8, $8, $31
loop5: 
	nop
	

