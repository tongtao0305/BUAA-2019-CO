ori $4, 4
jal jal_forward_test
addu $4, $31, $4
addu $5, $5, 4

beq $5, $6, beq_0_test
ori $7, 8
beq_0_test:
	ori $8, 12
	j j_test
	ori $9, 1
	ori $10, 1
	
jal_forward_test:
	sw $31, 0($0)
	ori $6, 4
	
	jr $ra
	nop

jal_backward_test:
	sw $31, 8($0)
	beq $10, $9, end
	nop
	jal jal_0_test
	nop
	jal_0_test:
		sw $31, 12($0)
		ori $11, 100
		j end
		nop

j_test:
	sw $31, 4($0)
	jal jal_backward_test
	nop

end:
	sw $31, 16($0)