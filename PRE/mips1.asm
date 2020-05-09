.data
	s1:.space 256
	s2:.space 256
.text
	li $s0, 10
	la $s1, s1
	la $s2, s2
	
	la $a0, s1
	li $a1, 100
	li $v0, 8
	syscall

	li $t1, 0	# i=0
	li $t2, 0	# m=0
loop:	add $t0, $t1, $s1
	lb $t0, 0($t0)
	beq $t0, $s0, end_loop
	
	add $t3, $s2, $t2
	add $t4, $s1, $t1
	lb $t4, 0($t4)
	sb $t4, 0($t3)
	addi $t2, $t2, 1
	
	add $t3, $s1, $t1
	addi $t4, $t3, 1
	addi $t5, $t3, 2
	lb $t3, 0($t3)
	lb $t4, 0($t4)
	lb $t5, 0($t5)
	
	if:	li $t6, 45
		bne $t4, $t6, else
		slt $t6, $t3, $t5
		beq $t6, $0, else
		
		move $t6, $t3
		addi $t6, $t6, 1		#c=$t6
		for:	slt $t0, $t6, $t5
			beq $t0, $0, for_end
			
			add $t7, $s2, $t2
			sb $t6, 0($t7)
			addi $t2, $t2, 1		
			
			addi $t6, $t6, 1
			j for
		for_end:
	
		addi $t1, $t1, 2
		j if_end
	else:
		addi $t1, $t1, 1
		j if_end
	if_end:	
	j loop
end_loop:

	add $t7, $s2, $t2
	li $t6, 0
	sb $t6, 0($t7)
	
	la $a0, s2
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall 
	