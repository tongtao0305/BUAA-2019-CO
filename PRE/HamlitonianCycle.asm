.data
	graph:.space 256
	visited:.space 32
.text
	li $v0, 5
	syscall
	move $s1, $v0		# $s1 = n
	li $v0, 5
	syscall
	move $s2, $v0		# $s2 = m
	li $s3, 0		# $s3 = sum
	li $s4, 0		# $s4 = count
	
	li $t1, 0
	for1_begin:
		slt $t0, $t1, $s1
		beq $t0, $0, for1_end
		nop
		
		# visited[i] = 0;
		move $t3, $t1
		sll $t3, $t3, 2
		la $t0, visited
		add $t3, $t3, $t0
		sw $0, 0($t3)
		
		li $t2, 0
		for11_begin:
			slt $t0, $t2, $s2
			beq $t0, $0, for11_end
			nop
			
			# graph[i][j] = 1;
			move $t3, $t1
			sll $t3, $t3, 3
			add $t3, $t3, $t2
			sll $t3, $t3, 2
			la $t0, graph
			add $t3, $t3, $t0
			li $t0, 1
			sw $t0, 0($t3)	
						
			addi $t2, $t2, 1
			j for11_begin		
			nop
		for11_end:
		
		addi $t1, $t1, 1
		j for1_begin
		nop
	for1_end:
	
	li $t1, 0
	for2_begin:
		slt $t0, $t1, $s2
		beq $t0, $0, for2_end
		nop
		
		# scanf("%d %d", &a, &b);
		li $v0, 5
		syscall
		move $t3, $v0
		addi $t3, $t3, -1
		li $v0, 5
		syscall
		move $t4, $v0	
		addi $t4, $t4, -1	
		
		# graph[a-1][b-1] = 0;
		move $t5, $t3
		sll $t5, $t5, 3
		add $t5, $t5, $t4
		sll $t5, $t5, 2
		la $t0, graph
		add $t5, $t5, $t0
		sw $0, 0($t5)

		# graph[a-1][b-1] = 0;
		move $t5, $t4
		sll $t5, $t5, 3
		add $t5, $t5, $t3
		sll $t5, $t5, 2
		la $t0, graph
		add $t5, $t5, $t0
		sw $0, 0($t5)
				
		addi $t1, $t1, 1
		j for2_begin
		nop
	for2_end:	
	
	# visited[start] = 0;	start = 0
	la $t0, visited
	li $t1, 1
	sw $t1, 0($t0)	
	
	li $a0, 0
	jal hamilton
	nop
	
	# printf("%d", count/2);
	divu $a0, $s4, 2
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall 

hamilton:
	if1_begin:
		# sum == n - 1
		addi $t0, $s1, -1
		bne $t0, $s3, if1_end 
		nop
		# graph[x0][start] == 0
		move $t0, $a0
		sll $t0, $t0, 5
		la $t1, graph
		add $t0, $t0, $t1
		lw $t0, 0($t0)	
		bne $t0, $0, if1_end
		nop
		# count++;
		addi $s4, $s4, 1
		# return;
		jr $ra
		nop
	if1_end:
	
	li $t1, 0
	for3_begin:
		slt $t0, $t1, $s1
		beq $t0, $0, for3_end
		nop		

		if2_begin:
		# graph[x0][i] == 0
		move $t2, $a0
		sll $t2, $t2, 3
		add $t2, $t2, $t1
		sll $t2, $t2, 2 
		la $t0, graph
		add $t2, $t2, $t0
		lw $t2, 0($t2)	
		bne $t2, $0, if2_end
		nop		
		# visited[i] == 0
		sll $t2, $t1, 2
		la $t0, visited
		add $t2, $t2, $t0		
		lw $t2, 0($t2)	
		bne $t2, $0, if2_end
		nop
		
		# sum++;	
		addi $s3, $s3, 1		
		# visited[i] = 1
		sll $t2, $t1, 2
		la $t0, visited
		add $t2, $t2, $t0
		li $t0, 1		
		sw $t0, 0($t2)	
		
		# hamilton(i);		
		addi $sp, $sp, -16
		sw $ra, 12($sp)
		sw $t1, 8($sp)
		sw $a0, 4($sp)
		move $a0, $t1
		jal hamilton
		nop
		lw $a0, 4($sp)
		lw $t1, 8($sp)
		lw $ra, 12($sp)
		addi $sp, $sp, 16
						
		# visited[i] = 0
		sll $t2, $t1, 2
		la $t0, visited
		add $t2, $t2, $t0	
		sw $0, 0($t2)								
		# sum--;						
		addi $s3, $s3, -1																
		if2_end:

		addi $t1, $t1, 1
		j for3_begin
		nop		
	for3_end:
	# return;
	jr $ra
	nop
