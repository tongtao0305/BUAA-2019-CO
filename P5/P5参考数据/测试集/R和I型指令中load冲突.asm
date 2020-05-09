lui $4, 0x1234
ori $4, 0x5678
sw $4, 0($0)
sw $4, 4($0)
sw $4, 8($0)
sw $4, 12($0)
sw $4, 16($0)
sw $4, 20($0)
sw $4, 24($0)
sw $4, 28($0)
sw $4, 32($0)
sw $4, 36($0)
sw $4, 40($0)
sw $4, 44($0)
ori $5, 4
nop
nop
nop
nop

lw $6,4($5)
nop
nop
addu $6,$5,$6
nop
nop
nop
nop

lw $7,4($5)
nop
addu $7,$7,$5
nop
nop
nop
nop
nop

lw $8,8($5)
nop
addu $8,$5,$8
nop
nop
nop
nop
nop

lw $9,8($5)
nop
nop
ori $9,$9,0xffff
nop
nop
nop
nop
nop

lw $10,12($5)
nop
ori $10,$11,0xffff
nop
nop
nop
nop
nop


nop
nop
nop
nop


nop
nop
nop
nop


nop
nop
nop
nop


nop
nop
nop
nop




