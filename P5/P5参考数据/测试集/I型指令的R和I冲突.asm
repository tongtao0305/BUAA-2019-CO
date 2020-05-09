ori $4, 100
ori $5, 200
nop
nop
nop
nop
addu $4,$4,$5
nop
nop
ori $4,$4,0xffff

ori $6, 100
ori $7, 200
nop
nop
nop
nop
ori $6,$7,0xffff
nop
nop
ori $6,$7,0x0000

ori $6, 100
ori $7, 200
nop
nop
nop
nop
addu $6,$6,$7
nop
ori $6,$6,0xffff
nop

ori $8, 100
ori $9, 200
nop
nop
nop
nop
ori $8,$9,0xffff
nop
ori $8,$9,0x0f0f
nop

ori $10, 100
ori $11, 200
nop
nop
nop
nop
addu $10,$10,$11
ori $10,$10,0xffff
nop

ori $12, 100
ori $13, 200
nop
nop
nop
nop
ori $12,$13,0xffff
ori $12,$12,0xf0f0
nop




