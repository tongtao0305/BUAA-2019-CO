ori $5, 4
ori $6, 8
jal loop
sw $31,0($5)
nop
nop
loop:
nop
lw $4,0($5)
sw $4,0($6)
nop
nop
nop
nop
ori $7, $5,0xffff
sw $7,8($5)
nop
nop

addu $8,$8,$5
sw $8,12($5)
nop
nop

jal loop2
nop
loop2:
sw $31, 16($5)
nop
nop
nop
nop
lw $9,16($5)
nop
sw $9,24($0)
nop
nop
nop
nop
ori $10,$5,0xffff
nop
sw $10,24($5)
nop

addu $11,$11,$5
nop
sw $11,28($5)
nop

lw $12,28($5)
nop
sw $5,0($12)
nop

ori $4,$5,0x0024
nop
sw $5,0($4)
nop

addu $4,$4,$5
nop
sw $5,0($4)
nop

jal loop3
nop
loop3:
nop

ori $4,$4,100
sw $5,4($4)
nop

addu $4,$4,$5
sw $5,0($4)
nop

jal loop4
nop
loop4:
nop
sw $31, 40($5)

lw $4,0($5)
nop
nop
sw $4,0($6)

ori $4,$5,44
nop
nop
sw $4,0($5)

addu $4,$4,$5
nop
nop
sw $4,48($5)

jal loop5
nop
loop5:
nop
nop

lw $4,0($5)
nop
nop
sw $5,0($4)

lw $4,40($5)
nop
nop
sw $5,20($4)

ori $4,$5,0x80
nop
nop
sw $5,0($4)

addu $4,$4,$5
nop
nop
sw $5,0($4)


















