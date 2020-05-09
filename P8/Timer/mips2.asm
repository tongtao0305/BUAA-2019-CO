.text 
ori $3,11
ori $4,30000000
	ori $5,0xfc01
	mtc0 $5,$12
	sw $4,0x7f04($0)	#定义周期
	sw $3,0x7f00($0)	#定义模式
	nop
	lw $7,0x7f2c($0)
	lw $8,0x7f2c($0)
	lw $9,0x7f2c($0)
	addiu $9,$9,1
start:
nop
	lw $6,0x7f2c($0)
	beq $6,$7,label
	nop
	addu $7,$6,$0
label:
j start
nop

.ktext 0x4180
nop
beq $8,$7,label1
nop
addiu $9,$7,1
addu $8,$7,$0
label1:
beq $9,$0,label2
nop
addiu $9,$9,-1
label2:
sw $9,0x7f38($0)
eret
nop
nop
nop








