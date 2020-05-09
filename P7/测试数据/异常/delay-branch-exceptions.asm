.ktext 0x4180
mfc0 $10, $14
addi $10, $10, 8
mtc0 $10, $14
mfc0 $11, $13
addi $12, $12, 4
sw $11, 0($12)
eret

.text
# exceptions in b-delay-branch
lui $4, 0x7fff
beq $4, $4, loop1
add $5, $4, $4
ori $6, 10

loop1:
	addi $7, $7, 10
	
# exceptions in j-delay-branch
j loop2
add $5, $4, $4
ori $6, 10

loop2:
	addi $7, $7, 10
	
# exceptions in jal-delay-branch
jal loop3
add $5, $4, $4
ori $6, 10

loop3:
	addi $7, $7, 10

# exceptions in jalr-delay-branch
ori $9, 0x3044
jalr $6, $9
add $5, $4, $4
ori $6, 10

loop4:
	addi $7, $7, 10

# exceptions in jr-delay-branch
ori $9, 0x3058
jr $9
add $5, $4, $4
ori $6, 10

loop5:
	addi $7, $7, 10
	
stop:
	j stop
	nop
	

