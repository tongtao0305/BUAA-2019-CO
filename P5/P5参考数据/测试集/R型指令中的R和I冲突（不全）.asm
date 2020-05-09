ori $4, 4
ori $5, 4
nop
nop
nop
nop
addu $4,$4,$5
nop
nop
addu $4, $5,$4
nop
nop
nop
nop


ori $6, 4
ori $7, 4
nop
nop
nop
nop
ori $6,$7,0xffff
nop
nop
addu $6,$7,$6

ori $8, 4
ori $9, 4
nop
nop
nop
nop
addu $8,$8,$9
nop
addu $8,$8,$9
nop

ori $10, 4
ori $11, 4
nop
nop
nop
nop
ori $10,$11,0xffff
nop
addu $10,$10,$11
nop

ori $12, 4
ori $13, 4
nop
nop
nop
nop
addu $12,$12,$13
addu $12,$12,$13
nop

ori $14, 4
ori $15, 4
nop
nop
nop
nop
ori $14,$15,0xffff
addu $14,$14,$15
nop

ori $16, 4
ori $17, 4
nop
nop
nop
nop
addu $16,$16,$17
nop
addu $16, $17,$16
nop

ori $18, 4
ori $19, 4
nop
nop
nop
nop
ori $18,$19,0xffff
nop
addu $18,$19,$18
nop

ori $20, 4
ori $21, 4
nop
nop
nop
nop
addu $20,$20,$21
addu $20,$21,$20
nop

ori $22, 4
ori $23, 4
nop
nop
nop
nop
ori $22,$23,0xffff
addu $22,$23,$22
nop







