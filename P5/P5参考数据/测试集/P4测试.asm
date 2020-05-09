# test ori
ori $t0, 100
ori $s0, 100
ori $s1, 200
ori $t1, 0
ori $t2, 0
# test $0
ori $0, 0xffff
# test addu 
addu $a0, $0, $t0
# test subu
subu $s1, $t0, $0
# test beq
loop_beq_1:
	addu $t1, $t1, $t0
	beq $t0, $s0, loop_beq_2
	nop
	
ori $t3, 100

loop_beq_2:
	addu $t2, $t2, $t0
	addu $t0, $t0, 100
	beq $t0, $s1, loop_beq_1
	nop
ori $t4, 0xffff
ori $t5, 0xffc
# test sw
sw $t4, 0($0)
sw $t4, 4($0)
sw $t4, -4($t5)
sw $t4, 0($t5)

# test lw
lw $t6, 0($0)
lw $t7, 4($0)
lw $t8, -4($t5)
lw $t9, 0($t5)

# test lui
lui $s2, 0
lui $s3, 0xffff
lui $s4, 100

ori $s0, 100
ori $s1, 1
# test jal, jr, nop
loop_jal_1:
	addu $s2, $s2, $s0
	nop
	jal loop_jal_2
	nop
	jal loop_jal_4
	nop


loop_jal_2:
	nop
	addu $s2, $s2, $s0 
	nop
	sw $ra, 0($s0)
	jal loop_jal_3
	nop
	lw $ra, 0($s0)
	
	jr $ra
	nop

loop_jal_3:
	addu $s5, $0, $s3
	nop
	jr $ra
	nop
	addu $s6, $s5, $0

end:
	addu $s4, $s4, $s1
	jr $ra
	nop
	
loop_jal_4:
	addu $s4, $s4, $s1
	jal end
	nop

addu $s5, $s5, 1


