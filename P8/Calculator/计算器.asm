start:
	lw $6,0x7f2c($0)	# 64位开关HI
	lw $7,0x7f30($0)	# 64位开关LO
	lw $8,0x7f40($0)	# 用户按键

	bne $8,1,label1	# 加法
	nop
	addu $9,$6,$7
	j end
	nop
	
label1:
bne $8,2,label2
nop
nor $9,$6,$7
j end
nop
label2:
bne $8,4,label3
nop
and $9,$6,$7
j end
label3:
nop
bne $8,8,label4
nop
sllv $9,$6,$7
j end
label4:
nop
bne $8,16,label5
nop
srav $9,$6,$7
j end
label5:
nop
bne $8,32,label6
nop
subu $9,$6,$7
j end
label6:
nop
bne $8,64,label7
nop
sltu $9,$6,$7
sltu 
j end
label7:
nop
bne $8,128,label8
nop
xor $9,$6,$7
j end
label8:
nop

end:
	sw $9,0x7f38($0)	#在数码管中显示

	j start
	nop
