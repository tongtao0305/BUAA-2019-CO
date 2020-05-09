.data 
	map:.space 256
	visited:.space 256
.text
main:
	# la $sp, stack
	# addi $sp, $sp, 100
	
	li $s0, 0			# $s0 = count
	# 读取迷宫的行数，即n
	li $v0, 5
	syscall
	move $s1, $v0			# $s1 = n
	# 读取迷宫的列数，即m
	li $v0, 5
	syscall
	move $s2, $v0			# $s2 = m
		
	li $t1, 0
	for1_begin:
		slt $t0, $t1, $s1  
		beq $t0, $0, for1_end 
		nop
		
		li $t2, 0
		for11_begin:
			slt $t0, $t2, $s2  
			beq $t0, $0, for11_end
			nop
			
			# 计算[i][j]的地址偏移量, (i << 3 + j) << 2
			sll $t0, $t1, 3
			add $t0, $t0, $t2
			sll $t0, $t0, 2
			# visited[i][j] = 0;
			la $t3, visited
			add $t3, $t3, $t0
			sw $0, 0($t3)
			# scanf("%d", &map[i][j]);
			la $t3, map
			add $t3, $t3, $t0
			li $v0, 5
			syscall
			sw $v0, 0($t3)
			
			addi $t2, $t2, 1
			j for11_begin 
			nop
		for11_end:
		
		addi $t1, $t1, 1
		j for1_begin
		nop
	for1_end: 
	
	# 读取迷宫的起点，即startx, starty
	li $v0, 5
	syscall
	move $s5, $v0			# $s5 = startx
	addi $s5, $s5, -1
	li $v0, 5
	syscall
	move $s6, $v0			# $s6 = starty	
	addi $s6, $s6, -1
	# 读取迷宫的终点，即endx, endy
	li $v0, 5
	syscall
	move $s3, $v0			# $s3 = endx
	addi $s3, $s3, -1
	li $v0, 5
	syscall
	move $s4, $v0			# $s4 = endy	
	addi $s4, $s4, -1
	
	# visited[startx][starty] = 1;
	sll $t0, $s5, 3
	add $t0, $t0, $s6
	sll $t0, $t0, 2
	la $t3, visited
	add $t3, $t3, $t0
	li $t0, 1
	sw $t0, 0($t3)
	
	# maze(startx, starty);
	addi $sp, $sp, -12
	sw $ra, 8($sp)
	move $a1, $s5
	move $a2, $s6
	jal maze
	nop
	addi $sp ,$sp, 12
	
	# printf("%d", count);
	move $a0, $s0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall 
	
maze:
	move $t1, $a1		# x0
	move $t2, $a2		# y0
	# if (x0 == endx && y0 == endy) { count++; return; }
	if1_begin:
		bne $t1, $s3, if1_end
		nop
		bne $t2, $s4, if1_end
		nop
		addi $s0, $s0, 1
		jr $ra
		nop
	if1_end:
	
	#得到[x0][y0]的地址偏移量
	sll $t3, $t1, 3
	add $t3, $t3, $t2
	sll $t3, $t3, 2	
	
	#上边节点
	if2_begin:
		# if x0 > 0
		slt $t0, $0, $t1
		beq $t0, $0, if2_end
		nop
		#得到[x0-1][y0]的地址偏移量
		addi $t0, $t3, -32
		# if visited[x0 - 1][y0] == 0
		la $t4, visited
		add $t4, $t4, $t0
		lw $t4, 0($t4)
		bne $t4, $0, if2_end
		nop
		# if map[x0-1][y0]==0
		la $t4, map
		add $t4, $t4, $t0
		lw $t4, 0($t4)
		bne $t4, $0, if2_end
		nop
		# visited[x0 - 1][y0] == 1
		la $t4, visited
		add $t4, $t4, $t0
		li $t5, 1
		sw $t5, 0($t4)
		
		# maze(x0 - 1, y0);
		addi $sp, $sp, -36
		sw $t3, 32($sp)
		sw $t2, 28($sp)
		sw $t1, 24($sp)
		sw $ra, 20($sp)
		addi $a1, $a1, -1
		jal maze
		nop
		addi $a1, $a1, 1
		lw $ra, 20($sp)
		lw $t1, 24($sp)
		lw $t2, 28($sp)
		lw $t3, 32($sp)
		addi $sp, $sp, 36
		
		# visited[x0 - 1][y0] == 0
		addi $t0, $t3, -32
		la $t4, visited
		add $t4, $t4, $t0
		sw $0, 0($t4)
	if2_end:
	
	#左边节点
	if3_begin:
		# if y0 > 0
		slt $t0, $0, $t2
		beq $t0, $0, if3_end
		nop
		#得到[x0][y0-1]的地址偏移量
		addi $t0, $t3, -4
		# if visited[x0][y0-1] == 0
		la $t4, visited
		add $t4, $t4, $t0
		lw $t4, 0($t4)
		bne $t4, $0, if3_end
		nop
		# if map[x0][y0-1]==0
		la $t4, map
		add $t4, $t4, $t0
		lw $t4, 0($t4)
		bne $t4, $0, if3_end
		nop

		# visited[x0][y0-1] == 1
		la $t4, visited
		add $t4, $t4, $t0
		li $t5, 1
		sw $t5, 0($t4)
		# maze(x0, y0-1);
		addi $sp, $sp, -36
		sw $t3, 32($sp)
		sw $t2, 28($sp)
		sw $t1, 24($sp)
		sw $ra, 20($sp)
		addi $a2, $a2, -1
		jal maze
		nop
		addi $a2, $a2, 1
		lw $ra, 20($sp)
		lw $t1, 24($sp)
		lw $t2, 28($sp)
		lw $t3, 32($sp)
		addi $sp, $sp, 36
		# visited[x0][y0-1] == 0
		addi $t0, $t3, -4
		la $t4, visited
		add $t4, $t4, $t0
		sw $0, 0($t4)
	if3_end:
		
	#下边节点
	if4_begin:
		# if x0 < n-1
		addi $t4, $s1, -1
		slt $t0, $t1, $t4
		beq $t0, $0, if4_end
		nop
		#得到[x0+1][y0]的地址偏移量
		addi $t0, $t3, 32
		# if visited[x0 + 1][y0] == 0
		la $t4, visited
		add $t4, $t4, $t0
		lw $t4, 0($t4)
		bne $t4, $0, if4_end
		nop
		# if map[x0+1][y0]==0
		la $t4, map
		add $t4, $t4, $t0
		lw $t4, 0($t4)
		bne $t4, $0, if4_end
		nop
		
		# visited[x0+1][y0] == 1
		la $t4, visited
		add $t4, $t4, $t0
		li $t5, 1
		sw $t5, 0($t4)
		
		# maze(x0+1, y0);
		addi $sp, $sp, -36
		sw $t3, 32($sp)
		sw $t2, 28($sp)
		sw $t1, 24($sp)
		sw $ra, 20($sp)
		addi $a1, $a1, 1
		jal maze
		nop
		addi $a1, $a1, -1
		lw $ra, 20($sp)
		lw $t1, 24($sp)
		lw $t2, 28($sp)
		lw $t3, 32($sp)
		addi $sp, $sp, 36
		
		# visited[x0+1][y0] == 0
		addi $t0, $t3, 32
		la $t4, visited
		add $t4, $t4, $t0
		sw $0, 0($t4)
	if4_end:	
		
	#右边节点
	if5_begin:
		# if y0 < m-1
		addi $t4, $s2, -1
		slt $t0, $t2, $t4
		beq $t0, $0, if5_end
		nop
		#得到[x0][y0+1]的地址偏移量
		addi $t0, $t3, 4
		# if visited[x01][y0+1] == 0
		la $t4, visited
		add $t4, $t4, $t0
		lw $t4, 0($t4)
		bne $t4, $0, if5_end
		nop
		# if map[x0][y0+1]==0
		la $t4, map
		add $t4, $t4, $t0
		lw $t4, 0($t4)
		bne $t4, $0, if5_end
		nop
		
		# visited[x0][y0+1] == 1
		la $t4, visited
		add $t4, $t4, $t0
		li $t5, 1
		sw $t5, 0($t4)
		
		# maze(x0, y0+1);
		addi $sp, $sp, -36
		sw $t3, 32($sp)
		sw $t2, 28($sp)
		sw $t1, 24($sp)
		sw $ra, 20($sp)
		addi $a2, $a2, 1
		jal maze
		nop
		addi $a2, $a2, -1
		lw $ra, 20($sp)
		lw $t1, 24($sp)
		lw $t2, 28($sp)
		lw $t3, 32($sp)
		addi $sp, $sp, 36
		
		# visited[x0][y0+1] == 0
		addi $t0, $t3, 4
		la $t4, visited
		add $t4, $t4, $t0
		sw $0, 0($t4)
	if5_end:
						
	jr $ra	
	nop
	
	
	