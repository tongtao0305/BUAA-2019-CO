ori $3, 12
ori $4, 4
ori $5, 8

addu $4,$4,$5
nop
nop
beq $4,$3,loop1
ori $6, 10

loop1:

ori $3, 0xffff
ori $4,$5,0xffff
nop
nop
beq $4,$3,loop2
ori $7, 10

loop2:
sw $3,0($5)
lw $4,0($5)
nop
nop
beq $4, $3, loop3
ori $8, 10

loop3:
lui $3, 0x0001
ori $3, 0x0007
addu $4,$4,$5
nop
beq $4,$3,loop4
ori $9,10

loop4:
ori $3, $0, 0xffff
ori $4,$5,0xffff
nop
beq $4,$3,loop5
ori $10, 10

loop5:
lui $3, 0x0001
ori $3, 0x0007
addu $4,$4,$5
nop
nop
beq $3,$4,loop6
ori $11, 10

loop6:
ori $3, $0, 0xffff
ori $4,$5,0xffff
nop
nop
beq $3,$4,loop7
nop
ori $12, 10

loop7:
ori $3, $0, 0xffff
lw $4,0($5)
nop
nop
beq $3,$4,loop8
nop
ori $13, 10

loop8:
addu $4,$4,$5
nop
beq $3,$4,loop9
nop
ori $14, 10

loop9:
ori $4,$5,0xffff
nop
beq $3,$4,loop10
nop
ori $15, 10

loop10:
ori $16, 10





