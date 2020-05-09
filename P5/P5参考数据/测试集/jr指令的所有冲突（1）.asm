ori $4, 4
ori $5, 0x301c
addu $4,$4,$5
nop
nop
jr $4
nop
ori $6, 100

ori $7, 4
ori $8, 0x3040
ori $7,$8,0x3040
nop
nop
jr $7
nop
ori $9, 100

ori $10, 4
ori $11, 0x3064
sw $11, 0($10)
lw $12, 0($10)
nop
nop
jr $12
nop
ori $13, 100
nop






